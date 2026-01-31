//===-- McasmFixupVectorConstants.cpp - optimize constant generation  -------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file examines all full size vector constant pool loads and attempts to
// replace them with smaller constant pool entries, including:
// * Converting AVX512 memory-fold instructions to their broadcast-fold form.
// * Using vzload scalar loads.
// * Broadcasting of full width loads.
// * Sign/Zero extension of full width loads.
//
//===----------------------------------------------------------------------===//

#include "Mcasm.h"
#include "McasmInstrFoldTables.h"
#include "McasmInstrInfo.h"
#include "McasmSubtarget.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/CodeGen/MachineConstantPool.h"

using namespace llvm;

#define DEBUG_TYPE "x86-fixup-vector-constants"

STATISTIC(NumInstChanges, "Number of instructions changes");

namespace {
class McasmFixupVectorConstantsImpl {
public:
  bool runOnMachineFunction(MachineFunction &MF);

private:
  bool processInstruction(MachineFunction &MF, MachineBasicBlock &MBB,
                          MachineInstr &MI);

  const McasmInstrInfo *TII = nullptr;
  const McasmSubtarget *ST = nullptr;
  const MCSchedModel *SM = nullptr;
};

class McasmFixupVectorConstantsLegacy : public MachineFunctionPass {
public:
  static char ID;

  McasmFixupVectorConstantsLegacy() : MachineFunctionPass(ID) {}

  StringRef getPassName() const override {
    return "Mcasm Fixup Vector Constants";
  }

  bool runOnMachineFunction(MachineFunction &MF) override;

  // This pass runs after regalloc and doesn't support VReg operands.
  MachineFunctionProperties getRequiredProperties() const override {
    return MachineFunctionProperties().setNoVRegs();
  }
};
} // end anonymous namespace

char McasmFixupVectorConstantsLegacy::ID = 0;

INITIALIZE_PASS(McasmFixupVectorConstantsLegacy, DEBUG_TYPE, DEBUG_TYPE, false,
                false)

FunctionPass *llvm::createMcasmFixupVectorConstantsLegacyPass() {
  return new McasmFixupVectorConstantsLegacy();
}

/// Normally, we only allow poison in vector splats. However, as this is part
/// of the backend, and working with the DAG representation, which currently
/// only natively represents undef values, we need to accept undefs here.
static Constant *getSplatValueAllowUndef(const ConstantVector *C) {
  Constant *Res = nullptr;
  for (Value *Op : C->operands()) {
    Constant *OpC = cast<Constant>(Op);
    if (isa<UndefValue>(OpC))
      continue;
    if (!Res)
      Res = OpC;
    else if (Res != OpC)
      return nullptr;
  }
  return Res;
}

// Attempt to extract the full width of bits data from the constant.
static std::optional<APInt> extractConstantBits(const Constant *C) {
  unsigned NumBits = C->getType()->getPrimitiveSizeInBits();

  if (isa<UndefValue>(C))
    return APInt::getZero(NumBits);

  if (auto *CInt = dyn_cast<ConstantInt>(C)) {
    if (isa<VectorType>(CInt->getType()))
      return APInt::getSplat(NumBits, CInt->getValue());

    return CInt->getValue();
  }

  if (auto *CFP = dyn_cast<ConstantFP>(C)) {
    if (isa<VectorType>(CFP->getType()))
      return APInt::getSplat(NumBits, CFP->getValue().bitcastToAPInt());

    return CFP->getValue().bitcastToAPInt();
  }

  if (auto *CV = dyn_cast<ConstantVector>(C)) {
    if (auto *CVSplat = getSplatValueAllowUndef(CV)) {
      if (std::optional<APInt> Bits = extractConstantBits(CVSplat)) {
        assert((NumBits % Bits->getBitWidth()) == 0 && "Illegal splat");
        return APInt::getSplat(NumBits, *Bits);
      }
    }

    APInt Bits = APInt::getZero(NumBits);
    for (unsigned I = 0, E = CV->getNumOperands(); I != E; ++I) {
      Constant *Elt = CV->getOperand(I);
      std::optional<APInt> SubBits = extractConstantBits(Elt);
      if (!SubBits)
        return std::nullopt;
      assert(NumBits == (E * SubBits->getBitWidth()) &&
             "Illegal vector element size");
      Bits.insertBits(*SubBits, I * SubBits->getBitWidth());
    }
    return Bits;
  }

  if (auto *CDS = dyn_cast<ConstantDataSequential>(C)) {
    bool IsInteger = CDS->getElementType()->isIntegerTy();
    bool IsFloat = CDS->getElementType()->isHalfTy() ||
                   CDS->getElementType()->isBFloatTy() ||
                   CDS->getElementType()->isFloatTy() ||
                   CDS->getElementType()->isDoubleTy();
    if (IsInteger || IsFloat) {
      APInt Bits = APInt::getZero(NumBits);
      unsigned EltBits = CDS->getElementType()->getPrimitiveSizeInBits();
      for (unsigned I = 0, E = CDS->getNumElements(); I != E; ++I) {
        if (IsInteger)
          Bits.insertBits(CDS->getElementAsAPInt(I), I * EltBits);
        else
          Bits.insertBits(CDS->getElementAsAPFloat(I).bitcastToAPInt(),
                          I * EltBits);
      }
      return Bits;
    }
  }

  return std::nullopt;
}

static std::optional<APInt> extractConstantBits(const Constant *C,
                                                unsigned NumBits) {
  if (std::optional<APInt> Bits = extractConstantBits(C))
    return Bits->zextOrTrunc(NumBits);
  return std::nullopt;
}

// Attempt to compute the splat width of bits data by normalizing the splat to
// remove undefs.
static std::optional<APInt> getSplatableConstant(const Constant *C,
                                                 unsigned SplatBitWidth) {
  const Type *Ty = C->getType();
  assert((Ty->getPrimitiveSizeInBits() % SplatBitWidth) == 0 &&
         "Illegal splat width");

  if (std::optional<APInt> Bits = extractConstantBits(C))
    if (Bits->isSplat(SplatBitWidth))
      return Bits->trunc(SplatBitWidth);

  // Detect general splats with undefs.
  // TODO: Do we need to handle NumEltsBits > SplatBitWidth splitting?
  if (auto *CV = dyn_cast<ConstantVector>(C)) {
    unsigned NumOps = CV->getNumOperands();
    unsigned NumEltsBits = Ty->getScalarSizeInBits();
    unsigned NumScaleOps = SplatBitWidth / NumEltsBits;
    if ((SplatBitWidth % NumEltsBits) == 0) {
      // Collect the elements and ensure that within the repeated splat sequence
      // they either match or are undef.
      SmallVector<Constant *, 16> Sequence(NumScaleOps, nullptr);
      for (unsigned Idx = 0; Idx != NumOps; ++Idx) {
        if (Constant *Elt = CV->getAggregateElement(Idx)) {
          if (isa<UndefValue>(Elt))
            continue;
          unsigned SplatIdx = Idx % NumScaleOps;
          if (!Sequence[SplatIdx] || Sequence[SplatIdx] == Elt) {
            Sequence[SplatIdx] = Elt;
            continue;
          }
        }
        return std::nullopt;
      }
      // Extract the constant bits forming the splat and insert into the bits
      // data, leave undef as zero.
      APInt SplatBits = APInt::getZero(SplatBitWidth);
      for (unsigned I = 0; I != NumScaleOps; ++I) {
        if (!Sequence[I])
          continue;
        if (std::optional<APInt> Bits = extractConstantBits(Sequence[I])) {
          SplatBits.insertBits(*Bits, I * Bits->getBitWidth());
          continue;
        }
        return std::nullopt;
      }
      return SplatBits;
    }
  }

  return std::nullopt;
}

// Split raw bits into a constant vector of elements of a specific bit width.
// NOTE: We don't always bother converting to scalars if the vector length is 1.
static Constant *rebuildConstant(LLVMContext &Ctx, Type *SclTy,
                                 const APInt &Bits, unsigned NumSclBits) {
  unsigned BitWidth = Bits.getBitWidth();

  if (NumSclBits == 8) {
    SmallVector<uint8_t> RawBits;
    for (unsigned I = 0; I != BitWidth; I += 8)
      RawBits.push_back(Bits.extractBits(8, I).getZExtValue());
    return ConstantDataVector::get(Ctx, RawBits);
  }

  if (NumSclBits == 16) {
    SmallVector<uint16_t> RawBits;
    for (unsigned I = 0; I != BitWidth; I += 16)
      RawBits.push_back(Bits.extractBits(16, I).getZExtValue());
    if (SclTy->is16bitFPTy())
      return ConstantDataVector::getFP(SclTy, RawBits);
    return ConstantDataVector::get(Ctx, RawBits);
  }

  if (NumSclBits == 32) {
    SmallVector<uint32_t> RawBits;
    for (unsigned I = 0; I != BitWidth; I += 32)
      RawBits.push_back(Bits.extractBits(32, I).getZExtValue());
    if (SclTy->isFloatTy())
      return ConstantDataVector::getFP(SclTy, RawBits);
    return ConstantDataVector::get(Ctx, RawBits);
  }

  assert(NumSclBits == 64 && "Unhandled vector element width");

  SmallVector<uint64_t> RawBits;
  for (unsigned I = 0; I != BitWidth; I += 64)
    RawBits.push_back(Bits.extractBits(64, I).getZExtValue());
  if (SclTy->isDoubleTy())
    return ConstantDataVector::getFP(SclTy, RawBits);
  return ConstantDataVector::get(Ctx, RawBits);
}

// Attempt to rebuild a normalized splat vector constant of the requested splat
// width, built up of potentially smaller scalar values.
static Constant *rebuildSplatCst(const Constant *C, unsigned /*NumBits*/,
                                 unsigned /*NumElts*/, unsigned SplatBitWidth) {
  // TODO: Truncate to NumBits once ConvertToBroadcastAVX512 support this.
  std::optional<APInt> Splat = getSplatableConstant(C, SplatBitWidth);
  if (!Splat)
    return nullptr;

  // Determine scalar size to use for the constant splat vector, clamping as we
  // might have found a splat smaller than the original constant data.
  Type *SclTy = C->getType()->getScalarType();
  unsigned NumSclBits = SclTy->getPrimitiveSizeInBits();
  NumSclBits = std::min<unsigned>(NumSclBits, SplatBitWidth);

  // Fallback to i64 / double.
  NumSclBits = (NumSclBits == 8 || NumSclBits == 16 || NumSclBits == 32)
                   ? NumSclBits
                   : 64;

  // Extract per-element bits.
  return rebuildConstant(C->getContext(), SclTy, *Splat, NumSclBits);
}

static Constant *rebuildZeroUpperCst(const Constant *C, unsigned NumBits,
                                     unsigned /*NumElts*/,
                                     unsigned ScalarBitWidth) {
  Type *SclTy = C->getType()->getScalarType();
  unsigned NumSclBits = SclTy->getPrimitiveSizeInBits();
  LLVMContext &Ctx = C->getContext();

  if (NumBits > ScalarBitWidth) {
    // Determine if the upper bits are all zero.
    if (std::optional<APInt> Bits = extractConstantBits(C, NumBits)) {
      if (Bits->countLeadingZeros() >= (NumBits - ScalarBitWidth)) {
        // If the original constant was made of smaller elements, try to retain
        // those types.
        if (ScalarBitWidth > NumSclBits && (ScalarBitWidth % NumSclBits) == 0)
          return rebuildConstant(Ctx, SclTy, *Bits, NumSclBits);

        // Fallback to raw integer bits.
        APInt RawBits = Bits->zextOrTrunc(ScalarBitWidth);
        return ConstantInt::get(Ctx, RawBits);
      }
    }
  }

  return nullptr;
}

static Constant *rebuildExtCst(const Constant *C, bool IsSExt,
                               unsigned NumBits, unsigned NumElts,
                               unsigned SrcEltBitWidth) {
  unsigned DstEltBitWidth = NumBits / NumElts;
  assert((NumBits % NumElts) == 0 && (NumBits % SrcEltBitWidth) == 0 &&
         (DstEltBitWidth % SrcEltBitWidth) == 0 &&
         (DstEltBitWidth > SrcEltBitWidth) && "Illegal extension width");

  if (std::optional<APInt> Bits = extractConstantBits(C, NumBits)) {
    assert((Bits->getBitWidth() / DstEltBitWidth) == NumElts &&
           (Bits->getBitWidth() % DstEltBitWidth) == 0 &&
           "Unexpected constant extension");

    // Ensure every vector element can be represented by the src bitwidth.
    APInt TruncBits = APInt::getZero(NumElts * SrcEltBitWidth);
    for (unsigned I = 0; I != NumElts; ++I) {
      APInt Elt = Bits->extractBits(DstEltBitWidth, I * DstEltBitWidth);
      if ((IsSExt && Elt.getSignificantBits() > SrcEltBitWidth) ||
          (!IsSExt && Elt.getActiveBits() > SrcEltBitWidth))
        return nullptr;
      TruncBits.insertBits(Elt.trunc(SrcEltBitWidth), I * SrcEltBitWidth);
    }

    Type *Ty = C->getType();
    return rebuildConstant(Ty->getContext(), Ty->getScalarType(), TruncBits,
                           SrcEltBitWidth);
  }

  return nullptr;
}
static Constant *rebuildSExtCst(const Constant *C, unsigned NumBits,
                                unsigned NumElts, unsigned SrcEltBitWidth) {
  return rebuildExtCst(C, true, NumBits, NumElts, SrcEltBitWidth);
}
static Constant *rebuildZExtCst(const Constant *C, unsigned NumBits,
                                unsigned NumElts, unsigned SrcEltBitWidth) {
  return rebuildExtCst(C, false, NumBits, NumElts, SrcEltBitWidth);
}

bool McasmFixupVectorConstantsImpl::processInstruction(MachineFunction &MF,
                                                     MachineBasicBlock &MBB,
                                                     MachineInstr &MI) {
  unsigned Opc = MI.getOpcode();
  MachineConstantPool *CP = MI.getParent()->getParent()->getConstantPool();
  bool HasSSE2 = ST->hasSSE2();
  bool HasSSE41 = ST->hasSSE41();
  bool HasAVX2 = ST->hasAVX2();
  bool HasDQI = ST->hasDQI();
  bool HasBWI = ST->hasBWI();
  bool HasVLX = ST->hasVLX();
  bool MultiDomain = ST->hasAVX512() || ST->hasNoDomainDelayMov();
  bool OptSize = MF.getFunction().hasOptSize();

  struct FixupEntry {
    int Op;
    int NumCstElts;
    int MemBitWidth;
    std::function<Constant *(const Constant *, unsigned, unsigned, unsigned)>
        RebuildConstant;
  };

  auto NewOpcPreferable = [&](const FixupEntry &Fixup,
                              unsigned RegBitWidth) -> bool {
    if (SM->hasInstrSchedModel()) {
      unsigned NewOpc = Fixup.Op;
      auto *OldDesc = SM->getSchedClassDesc(TII->get(Opc).getSchedClass());
      auto *NewDesc = SM->getSchedClassDesc(TII->get(NewOpc).getSchedClass());
      unsigned BitsSaved = RegBitWidth - (Fixup.NumCstElts * Fixup.MemBitWidth);

      // Compare tput/lat - avoid any regressions, but allow extra cycle of
      // latency in exchange for each 128-bit (or less) constant pool reduction
      // (this is a very simple cost:benefit estimate - there will probably be
      // better ways to calculate this).
      double OldTput = MCSchedModel::getReciprocalThroughput(*ST, *OldDesc);
      double NewTput = MCSchedModel::getReciprocalThroughput(*ST, *NewDesc);
      if (OldTput != NewTput)
        return NewTput < OldTput;

      int LatTol = (BitsSaved + 127) / 128;
      int OldLat = MCSchedModel::computeInstrLatency(*ST, *OldDesc);
      int NewLat = MCSchedModel::computeInstrLatency(*ST, *NewDesc);
      if (OldLat != NewLat)
        return NewLat < (OldLat + LatTol);
    }

    // We either were unable to get tput/lat or all values were equal.
    // Prefer the new opcode for reduced constant pool size.
    return true;
  };

  auto FixupConstant = [&](ArrayRef<FixupEntry> Fixups, unsigned RegBitWidth,
                           unsigned OperandNo) {
#ifdef EXPENSIVE_CHECKS
    assert(llvm::is_sorted(Fixups,
                           [](const FixupEntry &A, const FixupEntry &B) {
                             return (A.NumCstElts * A.MemBitWidth) <
                                    (B.NumCstElts * B.MemBitWidth);
                           }) &&
           "Constant fixup table not sorted in ascending constant size");
#endif
    assert(MI.getNumOperands() >= (OperandNo + Mcasm::AddrNumOperands) &&
           "Unexpected number of operands!");
    if (auto *C = Mcasm::getConstantFromPool(MI, OperandNo)) {
      unsigned CstBitWidth = C->getType()->getPrimitiveSizeInBits();
      RegBitWidth = RegBitWidth ? RegBitWidth : CstBitWidth;
      for (const FixupEntry &Fixup : Fixups) {
        // Always uses the smallest possible constant load with opt/minsize,
        // otherwise use the smallest instruction that doesn't affect
        // performance.
        // TODO: If constant has been hoisted from loop, use smallest constant.
        if (Fixup.Op && (OptSize || NewOpcPreferable(Fixup, RegBitWidth))) {
          // Construct a suitable constant and adjust the MI to use the new
          // constant pool entry.
          if (Constant *NewCst = Fixup.RebuildConstant(
                  C, RegBitWidth, Fixup.NumCstElts, Fixup.MemBitWidth)) {
            unsigned NewCPI =
                CP->getConstantPoolIndex(NewCst, Align(Fixup.MemBitWidth / 8));
            MI.setDesc(TII->get(Fixup.Op));
            MI.getOperand(OperandNo + Mcasm::AddrDisp).setIndex(NewCPI);
            return true;
          }
        }
      }
    }
    return false;
  };

  // Attempt to detect a suitable vzload/broadcast/vextload from increasing
  // constant bitwidths. Prefer vzload/broadcast/vextload for same bitwidth:
  // - vzload shouldn't ever need a shuffle port to zero the upper elements and
  // the fp/int domain versions are equally available so we don't introduce a
  // domain crossing penalty.
  // - broadcast sometimes need a shuffle port (especially for 8/16-bit
  // variants), AVX1 only has fp domain broadcasts but AVX2+ have good fp/int
  // domain equivalents.
  // - vextload always needs a shuffle port and is only ever int domain.
  switch (Opc) {
  /* FP Loads */
  case Mcasm::MOVAPDrm:
  case Mcasm::MOVAPSrm:
  case Mcasm::MOVUPDrm:
  case Mcasm::MOVUPSrm: {
    // TODO: SSE3 MOVDDUP Handling
    FixupEntry Fixups[] = {
        {Mcasm::MOVSSrm, 1, 32, rebuildZeroUpperCst},
        {HasSSE2 ? Mcasm::MOVSDrm : 0, 1, 64, rebuildZeroUpperCst}};
    return FixupConstant(Fixups, 128, 1);
  }
  case Mcasm::VMOVAPDrm:
  case Mcasm::VMOVAPSrm:
  case Mcasm::VMOVUPDrm:
  case Mcasm::VMOVUPSrm: {
    FixupEntry Fixups[] = {
        {MultiDomain ? Mcasm::VPMOVSXBQrm : 0, 2, 8, rebuildSExtCst},
        {MultiDomain ? Mcasm::VPMOVZXBQrm : 0, 2, 8, rebuildZExtCst},
        {Mcasm::VMOVSSrm, 1, 32, rebuildZeroUpperCst},
        {Mcasm::VBROADCASTSSrm, 1, 32, rebuildSplatCst},
        {MultiDomain ? Mcasm::VPMOVSXBDrm : 0, 4, 8, rebuildSExtCst},
        {MultiDomain ? Mcasm::VPMOVZXBDrm : 0, 4, 8, rebuildZExtCst},
        {MultiDomain ? Mcasm::VPMOVSXWQrm : 0, 2, 16, rebuildSExtCst},
        {MultiDomain ? Mcasm::VPMOVZXWQrm : 0, 2, 16, rebuildZExtCst},
        {Mcasm::VMOVSDrm, 1, 64, rebuildZeroUpperCst},
        {Mcasm::VMOVDDUPrm, 1, 64, rebuildSplatCst},
        {MultiDomain ? Mcasm::VPMOVSXWDrm : 0, 4, 16, rebuildSExtCst},
        {MultiDomain ? Mcasm::VPMOVZXWDrm : 0, 4, 16, rebuildZExtCst},
        {MultiDomain ? Mcasm::VPMOVSXDQrm : 0, 2, 32, rebuildSExtCst},
        {MultiDomain ? Mcasm::VPMOVZXDQrm : 0, 2, 32, rebuildZExtCst}};
    return FixupConstant(Fixups, 128, 1);
  }
  case Mcasm::VMOVAPDYrm:
  case Mcasm::VMOVAPSYrm:
  case Mcasm::VMOVUPDYrm:
  case Mcasm::VMOVUPSYrm: {
    FixupEntry Fixups[] = {
        {Mcasm::VBROADCASTSSYrm, 1, 32, rebuildSplatCst},
        {HasAVX2 && MultiDomain ? Mcasm::VPMOVSXBQYrm : 0, 4, 8, rebuildSExtCst},
        {HasAVX2 && MultiDomain ? Mcasm::VPMOVZXBQYrm : 0, 4, 8, rebuildZExtCst},
        {Mcasm::VBROADCASTSDYrm, 1, 64, rebuildSplatCst},
        {HasAVX2 && MultiDomain ? Mcasm::VPMOVSXBDYrm : 0, 8, 8, rebuildSExtCst},
        {HasAVX2 && MultiDomain ? Mcasm::VPMOVZXBDYrm : 0, 8, 8, rebuildZExtCst},
        {HasAVX2 && MultiDomain ? Mcasm::VPMOVSXWQYrm : 0, 4, 16, rebuildSExtCst},
        {HasAVX2 && MultiDomain ? Mcasm::VPMOVZXWQYrm : 0, 4, 16, rebuildZExtCst},
        {Mcasm::VBROADCASTF128rm, 1, 128, rebuildSplatCst},
        {HasAVX2 && MultiDomain ? Mcasm::VPMOVSXWDYrm : 0, 8, 16, rebuildSExtCst},
        {HasAVX2 && MultiDomain ? Mcasm::VPMOVZXWDYrm : 0, 8, 16, rebuildZExtCst},
        {HasAVX2 && MultiDomain ? Mcasm::VPMOVSXDQYrm : 0, 4, 32, rebuildSExtCst},
        {HasAVX2 && MultiDomain ? Mcasm::VPMOVZXDQYrm : 0, 4, 32,
         rebuildZExtCst}};
    return FixupConstant(Fixups, 256, 1);
  }
  case Mcasm::VMOVAPDZ128rm:
  case Mcasm::VMOVAPSZ128rm:
  case Mcasm::VMOVUPDZ128rm:
  case Mcasm::VMOVUPSZ128rm: {
    FixupEntry Fixups[] = {
        {MultiDomain ? Mcasm::VPMOVSXBQZ128rm : 0, 2, 8, rebuildSExtCst},
        {MultiDomain ? Mcasm::VPMOVZXBQZ128rm : 0, 2, 8, rebuildZExtCst},
        {Mcasm::VMOVSSZrm, 1, 32, rebuildZeroUpperCst},
        {Mcasm::VBROADCASTSSZ128rm, 1, 32, rebuildSplatCst},
        {MultiDomain ? Mcasm::VPMOVSXBDZ128rm : 0, 4, 8, rebuildSExtCst},
        {MultiDomain ? Mcasm::VPMOVZXBDZ128rm : 0, 4, 8, rebuildZExtCst},
        {MultiDomain ? Mcasm::VPMOVSXWQZ128rm : 0, 2, 16, rebuildSExtCst},
        {MultiDomain ? Mcasm::VPMOVZXWQZ128rm : 0, 2, 16, rebuildZExtCst},
        {Mcasm::VMOVSDZrm, 1, 64, rebuildZeroUpperCst},
        {Mcasm::VMOVDDUPZ128rm, 1, 64, rebuildSplatCst},
        {MultiDomain ? Mcasm::VPMOVSXWDZ128rm : 0, 4, 16, rebuildSExtCst},
        {MultiDomain ? Mcasm::VPMOVZXWDZ128rm : 0, 4, 16, rebuildZExtCst},
        {MultiDomain ? Mcasm::VPMOVSXDQZ128rm : 0, 2, 32, rebuildSExtCst},
        {MultiDomain ? Mcasm::VPMOVZXDQZ128rm : 0, 2, 32, rebuildZExtCst}};
    return FixupConstant(Fixups, 128, 1);
  }
  case Mcasm::VMOVAPDZ256rm:
  case Mcasm::VMOVAPSZ256rm:
  case Mcasm::VMOVUPDZ256rm:
  case Mcasm::VMOVUPSZ256rm: {
    FixupEntry Fixups[] = {
        {Mcasm::VBROADCASTSSZ256rm, 1, 32, rebuildSplatCst},
        {MultiDomain ? Mcasm::VPMOVSXBQZ256rm : 0, 4, 8, rebuildSExtCst},
        {MultiDomain ? Mcasm::VPMOVZXBQZ256rm : 0, 4, 8, rebuildZExtCst},
        {Mcasm::VBROADCASTSDZ256rm, 1, 64, rebuildSplatCst},
        {MultiDomain ? Mcasm::VPMOVSXBDZ256rm : 0, 8, 8, rebuildSExtCst},
        {MultiDomain ? Mcasm::VPMOVZXBDZ256rm : 0, 8, 8, rebuildZExtCst},
        {MultiDomain ? Mcasm::VPMOVSXWQZ256rm : 0, 4, 16, rebuildSExtCst},
        {MultiDomain ? Mcasm::VPMOVZXWQZ256rm : 0, 4, 16, rebuildZExtCst},
        {Mcasm::VBROADCASTF32X4Z256rm, 1, 128, rebuildSplatCst},
        {MultiDomain ? Mcasm::VPMOVSXWDZ256rm : 0, 8, 16, rebuildSExtCst},
        {MultiDomain ? Mcasm::VPMOVZXWDZ256rm : 0, 8, 16, rebuildZExtCst},
        {MultiDomain ? Mcasm::VPMOVSXDQZ256rm : 0, 4, 32, rebuildSExtCst},
        {MultiDomain ? Mcasm::VPMOVZXDQZ256rm : 0, 4, 32, rebuildZExtCst}};
    return FixupConstant(Fixups, 256, 1);
  }
  case Mcasm::VMOVAPDZrm:
  case Mcasm::VMOVAPSZrm:
  case Mcasm::VMOVUPDZrm:
  case Mcasm::VMOVUPSZrm: {
    FixupEntry Fixups[] = {
        {Mcasm::VBROADCASTSSZrm, 1, 32, rebuildSplatCst},
        {Mcasm::VBROADCASTSDZrm, 1, 64, rebuildSplatCst},
        {MultiDomain ? Mcasm::VPMOVSXBQZrm : 0, 8, 8, rebuildSExtCst},
        {MultiDomain ? Mcasm::VPMOVZXBQZrm : 0, 8, 8, rebuildZExtCst},
        {Mcasm::VBROADCASTF32X4Zrm, 1, 128, rebuildSplatCst},
        {MultiDomain ? Mcasm::VPMOVSXBDZrm : 0, 16, 8, rebuildSExtCst},
        {MultiDomain ? Mcasm::VPMOVZXBDZrm : 0, 16, 8, rebuildZExtCst},
        {MultiDomain ? Mcasm::VPMOVSXWQZrm : 0, 8, 16, rebuildSExtCst},
        {MultiDomain ? Mcasm::VPMOVZXWQZrm : 0, 8, 16, rebuildZExtCst},
        {Mcasm::VBROADCASTF64X4Zrm, 1, 256, rebuildSplatCst},
        {MultiDomain ? Mcasm::VPMOVSXWDZrm : 0, 16, 16, rebuildSExtCst},
        {MultiDomain ? Mcasm::VPMOVZXWDZrm : 0, 16, 16, rebuildZExtCst},
        {MultiDomain ? Mcasm::VPMOVSXDQZrm : 0, 8, 32, rebuildSExtCst},
        {MultiDomain ? Mcasm::VPMOVZXDQZrm : 0, 8, 32, rebuildZExtCst}};
    return FixupConstant(Fixups, 512, 1);
  }
    /* Integer Loads */
  case Mcasm::MOVDQArm:
  case Mcasm::MOVDQUrm: {
    FixupEntry Fixups[] = {
        {HasSSE41 ? Mcasm::PMOVSXBQrm : 0, 2, 8, rebuildSExtCst},
        {HasSSE41 ? Mcasm::PMOVZXBQrm : 0, 2, 8, rebuildZExtCst},
        {Mcasm::MOVDI2PDIrm, 1, 32, rebuildZeroUpperCst},
        {HasSSE41 ? Mcasm::PMOVSXBDrm : 0, 4, 8, rebuildSExtCst},
        {HasSSE41 ? Mcasm::PMOVZXBDrm : 0, 4, 8, rebuildZExtCst},
        {HasSSE41 ? Mcasm::PMOVSXWQrm : 0, 2, 16, rebuildSExtCst},
        {HasSSE41 ? Mcasm::PMOVZXWQrm : 0, 2, 16, rebuildZExtCst},
        {Mcasm::MOVQI2PQIrm, 1, 64, rebuildZeroUpperCst},
        {HasSSE41 ? Mcasm::PMOVSXBWrm : 0, 8, 8, rebuildSExtCst},
        {HasSSE41 ? Mcasm::PMOVZXBWrm : 0, 8, 8, rebuildZExtCst},
        {HasSSE41 ? Mcasm::PMOVSXWDrm : 0, 4, 16, rebuildSExtCst},
        {HasSSE41 ? Mcasm::PMOVZXWDrm : 0, 4, 16, rebuildZExtCst},
        {HasSSE41 ? Mcasm::PMOVSXDQrm : 0, 2, 32, rebuildSExtCst},
        {HasSSE41 ? Mcasm::PMOVZXDQrm : 0, 2, 32, rebuildZExtCst}};
    return FixupConstant(Fixups, 128, 1);
  }
  case Mcasm::VMOVDQArm:
  case Mcasm::VMOVDQUrm: {
    FixupEntry Fixups[] = {
        {HasAVX2 ? Mcasm::VPBROADCASTBrm : 0, 1, 8, rebuildSplatCst},
        {HasAVX2 ? Mcasm::VPBROADCASTWrm : 0, 1, 16, rebuildSplatCst},
        {Mcasm::VPMOVSXBQrm, 2, 8, rebuildSExtCst},
        {Mcasm::VPMOVZXBQrm, 2, 8, rebuildZExtCst},
        {Mcasm::VMOVDI2PDIrm, 1, 32, rebuildZeroUpperCst},
        {HasAVX2 ? Mcasm::VPBROADCASTDrm : Mcasm::VBROADCASTSSrm, 1, 32,
         rebuildSplatCst},
        {Mcasm::VPMOVSXBDrm, 4, 8, rebuildSExtCst},
        {Mcasm::VPMOVZXBDrm, 4, 8, rebuildZExtCst},
        {Mcasm::VPMOVSXWQrm, 2, 16, rebuildSExtCst},
        {Mcasm::VPMOVZXWQrm, 2, 16, rebuildZExtCst},
        {Mcasm::VMOVQI2PQIrm, 1, 64, rebuildZeroUpperCst},
        {HasAVX2 ? Mcasm::VPBROADCASTQrm : Mcasm::VMOVDDUPrm, 1, 64,
         rebuildSplatCst},
        {Mcasm::VPMOVSXBWrm, 8, 8, rebuildSExtCst},
        {Mcasm::VPMOVZXBWrm, 8, 8, rebuildZExtCst},
        {Mcasm::VPMOVSXWDrm, 4, 16, rebuildSExtCst},
        {Mcasm::VPMOVZXWDrm, 4, 16, rebuildZExtCst},
        {Mcasm::VPMOVSXDQrm, 2, 32, rebuildSExtCst},
        {Mcasm::VPMOVZXDQrm, 2, 32, rebuildZExtCst}};
    return FixupConstant(Fixups, 128, 1);
  }
  case Mcasm::VMOVDQAYrm:
  case Mcasm::VMOVDQUYrm: {
    FixupEntry Fixups[] = {
        {HasAVX2 ? Mcasm::VPBROADCASTBYrm : 0, 1, 8, rebuildSplatCst},
        {HasAVX2 ? Mcasm::VPBROADCASTWYrm : 0, 1, 16, rebuildSplatCst},
        {HasAVX2 ? Mcasm::VPBROADCASTDYrm : Mcasm::VBROADCASTSSYrm, 1, 32,
         rebuildSplatCst},
        {HasAVX2 ? Mcasm::VPMOVSXBQYrm : 0, 4, 8, rebuildSExtCst},
        {HasAVX2 ? Mcasm::VPMOVZXBQYrm : 0, 4, 8, rebuildZExtCst},
        {HasAVX2 ? Mcasm::VPBROADCASTQYrm : Mcasm::VBROADCASTSDYrm, 1, 64,
         rebuildSplatCst},
        {HasAVX2 ? Mcasm::VPMOVSXBDYrm : 0, 8, 8, rebuildSExtCst},
        {HasAVX2 ? Mcasm::VPMOVZXBDYrm : 0, 8, 8, rebuildZExtCst},
        {HasAVX2 ? Mcasm::VPMOVSXWQYrm : 0, 4, 16, rebuildSExtCst},
        {HasAVX2 ? Mcasm::VPMOVZXWQYrm : 0, 4, 16, rebuildZExtCst},
        {HasAVX2 ? Mcasm::VBROADCASTI128rm : Mcasm::VBROADCASTF128rm, 1, 128,
         rebuildSplatCst},
        {HasAVX2 ? Mcasm::VPMOVSXBWYrm : 0, 16, 8, rebuildSExtCst},
        {HasAVX2 ? Mcasm::VPMOVZXBWYrm : 0, 16, 8, rebuildZExtCst},
        {HasAVX2 ? Mcasm::VPMOVSXWDYrm : 0, 8, 16, rebuildSExtCst},
        {HasAVX2 ? Mcasm::VPMOVZXWDYrm : 0, 8, 16, rebuildZExtCst},
        {HasAVX2 ? Mcasm::VPMOVSXDQYrm : 0, 4, 32, rebuildSExtCst},
        {HasAVX2 ? Mcasm::VPMOVZXDQYrm : 0, 4, 32, rebuildZExtCst}};
    return FixupConstant(Fixups, 256, 1);
  }
  case Mcasm::VMOVDQA32Z128rm:
  case Mcasm::VMOVDQA64Z128rm:
  case Mcasm::VMOVDQU32Z128rm:
  case Mcasm::VMOVDQU64Z128rm: {
    FixupEntry Fixups[] = {
        {HasBWI ? Mcasm::VPBROADCASTBZ128rm : 0, 1, 8, rebuildSplatCst},
        {HasBWI ? Mcasm::VPBROADCASTWZ128rm : 0, 1, 16, rebuildSplatCst},
        {Mcasm::VPMOVSXBQZ128rm, 2, 8, rebuildSExtCst},
        {Mcasm::VPMOVZXBQZ128rm, 2, 8, rebuildZExtCst},
        {Mcasm::VMOVDI2PDIZrm, 1, 32, rebuildZeroUpperCst},
        {Mcasm::VPBROADCASTDZ128rm, 1, 32, rebuildSplatCst},
        {Mcasm::VPMOVSXBDZ128rm, 4, 8, rebuildSExtCst},
        {Mcasm::VPMOVZXBDZ128rm, 4, 8, rebuildZExtCst},
        {Mcasm::VPMOVSXWQZ128rm, 2, 16, rebuildSExtCst},
        {Mcasm::VPMOVZXWQZ128rm, 2, 16, rebuildZExtCst},
        {Mcasm::VMOVQI2PQIZrm, 1, 64, rebuildZeroUpperCst},
        {Mcasm::VPBROADCASTQZ128rm, 1, 64, rebuildSplatCst},
        {HasBWI ? Mcasm::VPMOVSXBWZ128rm : 0, 8, 8, rebuildSExtCst},
        {HasBWI ? Mcasm::VPMOVZXBWZ128rm : 0, 8, 8, rebuildZExtCst},
        {Mcasm::VPMOVSXWDZ128rm, 4, 16, rebuildSExtCst},
        {Mcasm::VPMOVZXWDZ128rm, 4, 16, rebuildZExtCst},
        {Mcasm::VPMOVSXDQZ128rm, 2, 32, rebuildSExtCst},
        {Mcasm::VPMOVZXDQZ128rm, 2, 32, rebuildZExtCst}};
    return FixupConstant(Fixups, 128, 1);
  }
  case Mcasm::VMOVDQA32Z256rm:
  case Mcasm::VMOVDQA64Z256rm:
  case Mcasm::VMOVDQU32Z256rm:
  case Mcasm::VMOVDQU64Z256rm: {
    FixupEntry Fixups[] = {
        {HasBWI ? Mcasm::VPBROADCASTBZ256rm : 0, 1, 8, rebuildSplatCst},
        {HasBWI ? Mcasm::VPBROADCASTWZ256rm : 0, 1, 16, rebuildSplatCst},
        {Mcasm::VPBROADCASTDZ256rm, 1, 32, rebuildSplatCst},
        {Mcasm::VPMOVSXBQZ256rm, 4, 8, rebuildSExtCst},
        {Mcasm::VPMOVZXBQZ256rm, 4, 8, rebuildZExtCst},
        {Mcasm::VPBROADCASTQZ256rm, 1, 64, rebuildSplatCst},
        {Mcasm::VPMOVSXBDZ256rm, 8, 8, rebuildSExtCst},
        {Mcasm::VPMOVZXBDZ256rm, 8, 8, rebuildZExtCst},
        {Mcasm::VPMOVSXWQZ256rm, 4, 16, rebuildSExtCst},
        {Mcasm::VPMOVZXWQZ256rm, 4, 16, rebuildZExtCst},
        {Mcasm::VBROADCASTI32X4Z256rm, 1, 128, rebuildSplatCst},
        {HasBWI ? Mcasm::VPMOVSXBWZ256rm : 0, 16, 8, rebuildSExtCst},
        {HasBWI ? Mcasm::VPMOVZXBWZ256rm : 0, 16, 8, rebuildZExtCst},
        {Mcasm::VPMOVSXWDZ256rm, 8, 16, rebuildSExtCst},
        {Mcasm::VPMOVZXWDZ256rm, 8, 16, rebuildZExtCst},
        {Mcasm::VPMOVSXDQZ256rm, 4, 32, rebuildSExtCst},
        {Mcasm::VPMOVZXDQZ256rm, 4, 32, rebuildZExtCst}};
    return FixupConstant(Fixups, 256, 1);
  }
  case Mcasm::VMOVDQA32Zrm:
  case Mcasm::VMOVDQA64Zrm:
  case Mcasm::VMOVDQU32Zrm:
  case Mcasm::VMOVDQU64Zrm: {
    FixupEntry Fixups[] = {
        {HasBWI ? Mcasm::VPBROADCASTBZrm : 0, 1, 8, rebuildSplatCst},
        {HasBWI ? Mcasm::VPBROADCASTWZrm : 0, 1, 16, rebuildSplatCst},
        {Mcasm::VPBROADCASTDZrm, 1, 32, rebuildSplatCst},
        {Mcasm::VPBROADCASTQZrm, 1, 64, rebuildSplatCst},
        {Mcasm::VPMOVSXBQZrm, 8, 8, rebuildSExtCst},
        {Mcasm::VPMOVZXBQZrm, 8, 8, rebuildZExtCst},
        {Mcasm::VBROADCASTI32X4Zrm, 1, 128, rebuildSplatCst},
        {Mcasm::VPMOVSXBDZrm, 16, 8, rebuildSExtCst},
        {Mcasm::VPMOVZXBDZrm, 16, 8, rebuildZExtCst},
        {Mcasm::VPMOVSXWQZrm, 8, 16, rebuildSExtCst},
        {Mcasm::VPMOVZXWQZrm, 8, 16, rebuildZExtCst},
        {Mcasm::VBROADCASTI64X4Zrm, 1, 256, rebuildSplatCst},
        {HasBWI ? Mcasm::VPMOVSXBWZrm : 0, 32, 8, rebuildSExtCst},
        {HasBWI ? Mcasm::VPMOVZXBWZrm : 0, 32, 8, rebuildZExtCst},
        {Mcasm::VPMOVSXWDZrm, 16, 16, rebuildSExtCst},
        {Mcasm::VPMOVZXWDZrm, 16, 16, rebuildZExtCst},
        {Mcasm::VPMOVSXDQZrm, 8, 32, rebuildSExtCst},
        {Mcasm::VPMOVZXDQZrm, 8, 32, rebuildZExtCst}};
    return FixupConstant(Fixups, 512, 1);
  }
  }

  auto ConvertToBroadcast = [&](unsigned OpSrc, int BW) {
    if (OpSrc) {
      if (const McasmFoldTableEntry *Mem2Bcst =
              llvm::lookupBroadcastFoldTableBySize(OpSrc, BW)) {
        unsigned OpBcst = Mem2Bcst->DstOp;
        unsigned OpNoBcst = Mem2Bcst->Flags & TB_INDEX_MASK;
        FixupEntry Fixups[] = {{(int)OpBcst, 1, BW, rebuildSplatCst}};
        // TODO: Add support for RegBitWidth, but currently rebuildSplatCst
        // doesn't require it (defaults to Constant::getPrimitiveSizeInBits).
        return FixupConstant(Fixups, 0, OpNoBcst);
      }
    }
    return false;
  };

  // Attempt to find a AVX512 mapping from a full width memory-fold instruction
  // to a broadcast-fold instruction variant.
  if ((MI.getDesc().TSFlags & McasmII::EncodingMask) == McasmII::EVEX)
    return ConvertToBroadcast(Opc, 32) || ConvertToBroadcast(Opc, 64);

  // Reverse the McasmInstrInfo::setExecutionDomainCustom EVEX->VEX logic
  // conversion to see if we can convert to a broadcasted (integer) logic op.
  if (HasVLX && !HasDQI) {
    unsigned OpSrc32 = 0, OpSrc64 = 0;
    switch (Opc) {
    case Mcasm::VANDPDrm:
    case Mcasm::VANDPSrm:
    case Mcasm::VPANDrm:
      OpSrc32 = Mcasm ::VPANDDZ128rm;
      OpSrc64 = Mcasm ::VPANDQZ128rm;
      break;
    case Mcasm::VANDPDYrm:
    case Mcasm::VANDPSYrm:
    case Mcasm::VPANDYrm:
      OpSrc32 = Mcasm ::VPANDDZ256rm;
      OpSrc64 = Mcasm ::VPANDQZ256rm;
      break;
    case Mcasm::VANDNPDrm:
    case Mcasm::VANDNPSrm:
    case Mcasm::VPANDNrm:
      OpSrc32 = Mcasm ::VPANDNDZ128rm;
      OpSrc64 = Mcasm ::VPANDNQZ128rm;
      break;
    case Mcasm::VANDNPDYrm:
    case Mcasm::VANDNPSYrm:
    case Mcasm::VPANDNYrm:
      OpSrc32 = Mcasm ::VPANDNDZ256rm;
      OpSrc64 = Mcasm ::VPANDNQZ256rm;
      break;
    case Mcasm::VORPDrm:
    case Mcasm::VORPSrm:
    case Mcasm::VPORrm:
      OpSrc32 = Mcasm ::VPORDZ128rm;
      OpSrc64 = Mcasm ::VPORQZ128rm;
      break;
    case Mcasm::VORPDYrm:
    case Mcasm::VORPSYrm:
    case Mcasm::VPORYrm:
      OpSrc32 = Mcasm ::VPORDZ256rm;
      OpSrc64 = Mcasm ::VPORQZ256rm;
      break;
    case Mcasm::VXORPDrm:
    case Mcasm::VXORPSrm:
    case Mcasm::VPXORrm:
      OpSrc32 = Mcasm ::VPXORDZ128rm;
      OpSrc64 = Mcasm ::VPXORQZ128rm;
      break;
    case Mcasm::VXORPDYrm:
    case Mcasm::VXORPSYrm:
    case Mcasm::VPXORYrm:
      OpSrc32 = Mcasm ::VPXORDZ256rm;
      OpSrc64 = Mcasm ::VPXORQZ256rm;
      break;
    }
    if (OpSrc32 || OpSrc64)
      return ConvertToBroadcast(OpSrc32, 32) || ConvertToBroadcast(OpSrc64, 64);
  }

  return false;
}

bool McasmFixupVectorConstantsImpl::runOnMachineFunction(MachineFunction &MF) {
  LLVM_DEBUG(dbgs() << "Start McasmFixupVectorConstants\n";);
  bool Changed = false;
  ST = &MF.getSubtarget<McasmSubtarget>();
  TII = ST->getInstrInfo();
  SM = &ST->getSchedModel();

  for (MachineBasicBlock &MBB : MF) {
    for (MachineInstr &MI : MBB) {
      if (processInstruction(MF, MBB, MI)) {
        ++NumInstChanges;
        Changed = true;
      }
    }
  }
  LLVM_DEBUG(dbgs() << "End McasmFixupVectorConstants\n";);
  return Changed;
}

bool McasmFixupVectorConstantsLegacy::runOnMachineFunction(MachineFunction &MF) {
  McasmFixupVectorConstantsImpl Impl;
  return Impl.runOnMachineFunction(MF);
}

PreservedAnalyses
McasmFixupVectorConstantsPass::run(MachineFunction &MF,
                                 MachineFunctionAnalysisManager &MFAM) {
  McasmFixupVectorConstantsImpl Impl;
  return Impl.runOnMachineFunction(MF)
             ? getMachineFunctionPassPreservedAnalyses()
                   .preserveSet<CFGAnalyses>()
             : PreservedAnalyses::all();
}
