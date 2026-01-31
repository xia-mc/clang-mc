//===- McasmAvoidStoreForwardingBlocks.cpp - Avoid HW Store Forward Block ---===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// If a load follows a store and reloads data that the store has written to
// memory, Intel microarchitectures can in many cases forward the data directly
// from the store to the load, This "store forwarding" saves cycles by enabling
// the load to directly obtain the data instead of accessing the data from
// cache or memory.
// A "store forward block" occurs in cases that a store cannot be forwarded to
// the load. The most typical case of store forward block on Intel Core
// microarchitecture that a small store cannot be forwarded to a large load.
// The estimated penalty for a store forward block is ~13 cycles.
//
// This pass tries to recognize and handle cases where "store forward block"
// is created by the compiler when lowering memcpy calls to a sequence
// of a load and a store.
//
// The pass currently only handles cases where memcpy is lowered to
// XMM/YMM registers, it tries to break the memcpy into smaller copies.
// breaking the memcpy should be possible since there is no atomicity
// guarantee for loads and stores to XMM/YMM.
//
// It could be better for performance to solve the problem by loading
// to XMM/YMM then inserting the partial store before storing back from XMM/YMM
// to memory, but this will result in a more conservative optimization since it
// requires we prove that all memory accesses between the blocking store and the
// load must alias/don't alias before we can move the store, whereas the
// transformation done here is correct regardless to other memory accesses.
//===----------------------------------------------------------------------===//

#include "Mcasm.h"
#include "McasmInstrInfo.h"
#include "McasmSubtarget.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/CodeGen/MachineBasicBlock.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineInstr.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineOperand.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/IR/DebugLoc.h"
#include "llvm/IR/Function.h"
#include "llvm/InitializePasses.h"
#include "llvm/MC/MCInstrDesc.h"

using namespace llvm;

#define DEBUG_TYPE "x86-avoid-sfb"

static cl::opt<bool> DisableMcasmAvoidStoreForwardBlocks(
    "x86-disable-avoid-SFB", cl::Hidden,
    cl::desc("Mcasm: Disable Store Forwarding Blocks fixup."), cl::init(false));

static cl::opt<unsigned> McasmAvoidSFBInspectionLimit(
    "x86-sfb-inspection-limit",
    cl::desc("Mcasm: Number of instructions backward to "
             "inspect for store forwarding blocks."),
    cl::init(20), cl::Hidden);

namespace {

using DisplacementSizeMap = std::map<int64_t, unsigned>;

class McasmAvoidSFBImpl {
public:
  McasmAvoidSFBImpl(AliasAnalysis *AA) : AA(AA) {};
  bool runOnMachineFunction(MachineFunction &MF);

private:
  MachineRegisterInfo *MRI = nullptr;
  const McasmInstrInfo *TII = nullptr;
  const McasmRegisterInfo *TRI = nullptr;
  SmallVector<std::pair<MachineInstr *, MachineInstr *>, 2>
      BlockedLoadsStoresPairs;
  SmallVector<MachineInstr *, 2> ForRemoval;
  AliasAnalysis *AA = nullptr;

  /// Returns couples of Load then Store to memory which look
  ///  like a memcpy.
  void findPotentiallylBlockedCopies(MachineFunction &MF);
  /// Break the memcpy's load and store into smaller copies
  /// such that each memory load that was blocked by a smaller store
  /// would now be copied separately.
  void breakBlockedCopies(MachineInstr *LoadInst, MachineInstr *StoreInst,
                          const DisplacementSizeMap &BlockingStoresDispSizeMap);
  /// Break a copy of size Size to smaller copies.
  void buildCopies(int Size, MachineInstr *LoadInst, int64_t LdDispImm,
                   MachineInstr *StoreInst, int64_t StDispImm,
                   int64_t LMMOffset, int64_t SMMOffset);

  void buildCopy(MachineInstr *LoadInst, unsigned NLoadOpcode, int64_t LoadDisp,
                 MachineInstr *StoreInst, unsigned NStoreOpcode,
                 int64_t StoreDisp, unsigned Size, int64_t LMMOffset,
                 int64_t SMMOffset);

  bool alias(const MachineMemOperand &Op1, const MachineMemOperand &Op2) const;

  unsigned getRegSizeInBytes(MachineInstr *Inst);
};

class McasmAvoidSFBLegacy : public MachineFunctionPass {
public:
  static char ID;
  McasmAvoidSFBLegacy() : MachineFunctionPass(ID) {}

  StringRef getPassName() const override {
    return "Mcasm Avoid Store Forwarding Blocks";
  }

  bool runOnMachineFunction(MachineFunction &MF) override;

  void getAnalysisUsage(AnalysisUsage &AU) const override {
    MachineFunctionPass::getAnalysisUsage(AU);
    AU.addRequired<AAResultsWrapperPass>();
  }
};

} // end anonymous namespace

char McasmAvoidSFBLegacy::ID = 0;

INITIALIZE_PASS_BEGIN(McasmAvoidSFBLegacy, DEBUG_TYPE, "Machine code sinking",
                      false, false)
INITIALIZE_PASS_DEPENDENCY(AAResultsWrapperPass)
INITIALIZE_PASS_END(McasmAvoidSFBLegacy, DEBUG_TYPE, "Machine code sinking",
                    false, false)

FunctionPass *llvm::createMcasmAvoidStoreForwardingBlocksLegacyPass() {
  return new McasmAvoidSFBLegacy();
}

static bool isXMMLoadOpcode(unsigned Opcode) {
  return Opcode == Mcasm::MOVUPSrm || Opcode == Mcasm::MOVAPSrm ||
         Opcode == Mcasm::VMOVUPSrm || Opcode == Mcasm::VMOVAPSrm ||
         Opcode == Mcasm::VMOVUPDrm || Opcode == Mcasm::VMOVAPDrm ||
         Opcode == Mcasm::VMOVDQUrm || Opcode == Mcasm::VMOVDQArm ||
         Opcode == Mcasm::VMOVUPSZ128rm || Opcode == Mcasm::VMOVAPSZ128rm ||
         Opcode == Mcasm::VMOVUPDZ128rm || Opcode == Mcasm::VMOVAPDZ128rm ||
         Opcode == Mcasm::VMOVDQU64Z128rm || Opcode == Mcasm::VMOVDQA64Z128rm ||
         Opcode == Mcasm::VMOVDQU32Z128rm || Opcode == Mcasm::VMOVDQA32Z128rm;
}
static bool isYMMLoadOpcode(unsigned Opcode) {
  return Opcode == Mcasm::VMOVUPSYrm || Opcode == Mcasm::VMOVAPSYrm ||
         Opcode == Mcasm::VMOVUPDYrm || Opcode == Mcasm::VMOVAPDYrm ||
         Opcode == Mcasm::VMOVDQUYrm || Opcode == Mcasm::VMOVDQAYrm ||
         Opcode == Mcasm::VMOVUPSZ256rm || Opcode == Mcasm::VMOVAPSZ256rm ||
         Opcode == Mcasm::VMOVUPDZ256rm || Opcode == Mcasm::VMOVAPDZ256rm ||
         Opcode == Mcasm::VMOVDQU64Z256rm || Opcode == Mcasm::VMOVDQA64Z256rm ||
         Opcode == Mcasm::VMOVDQU32Z256rm || Opcode == Mcasm::VMOVDQA32Z256rm;
}

static bool isPotentialBlockedMemCpyLd(unsigned Opcode) {
  return isXMMLoadOpcode(Opcode) || isYMMLoadOpcode(Opcode);
}

static bool isPotentialBlockedMemCpyPair(unsigned LdOpcode, unsigned StOpcode) {
  switch (LdOpcode) {
  case Mcasm::MOVUPSrm:
  case Mcasm::MOVAPSrm:
    return StOpcode == Mcasm::MOVUPSmr || StOpcode == Mcasm::MOVAPSmr;
  case Mcasm::VMOVUPSrm:
  case Mcasm::VMOVAPSrm:
    return StOpcode == Mcasm::VMOVUPSmr || StOpcode == Mcasm::VMOVAPSmr;
  case Mcasm::VMOVUPDrm:
  case Mcasm::VMOVAPDrm:
    return StOpcode == Mcasm::VMOVUPDmr || StOpcode == Mcasm::VMOVAPDmr;
  case Mcasm::VMOVDQUrm:
  case Mcasm::VMOVDQArm:
    return StOpcode == Mcasm::VMOVDQUmr || StOpcode == Mcasm::VMOVDQAmr;
  case Mcasm::VMOVUPSZ128rm:
  case Mcasm::VMOVAPSZ128rm:
    return StOpcode == Mcasm::VMOVUPSZ128mr || StOpcode == Mcasm::VMOVAPSZ128mr;
  case Mcasm::VMOVUPDZ128rm:
  case Mcasm::VMOVAPDZ128rm:
    return StOpcode == Mcasm::VMOVUPDZ128mr || StOpcode == Mcasm::VMOVAPDZ128mr;
  case Mcasm::VMOVUPSYrm:
  case Mcasm::VMOVAPSYrm:
    return StOpcode == Mcasm::VMOVUPSYmr || StOpcode == Mcasm::VMOVAPSYmr;
  case Mcasm::VMOVUPDYrm:
  case Mcasm::VMOVAPDYrm:
    return StOpcode == Mcasm::VMOVUPDYmr || StOpcode == Mcasm::VMOVAPDYmr;
  case Mcasm::VMOVDQUYrm:
  case Mcasm::VMOVDQAYrm:
    return StOpcode == Mcasm::VMOVDQUYmr || StOpcode == Mcasm::VMOVDQAYmr;
  case Mcasm::VMOVUPSZ256rm:
  case Mcasm::VMOVAPSZ256rm:
    return StOpcode == Mcasm::VMOVUPSZ256mr || StOpcode == Mcasm::VMOVAPSZ256mr;
  case Mcasm::VMOVUPDZ256rm:
  case Mcasm::VMOVAPDZ256rm:
    return StOpcode == Mcasm::VMOVUPDZ256mr || StOpcode == Mcasm::VMOVAPDZ256mr;
  case Mcasm::VMOVDQU64Z128rm:
  case Mcasm::VMOVDQA64Z128rm:
    return StOpcode == Mcasm::VMOVDQU64Z128mr || StOpcode == Mcasm::VMOVDQA64Z128mr;
  case Mcasm::VMOVDQU32Z128rm:
  case Mcasm::VMOVDQA32Z128rm:
    return StOpcode == Mcasm::VMOVDQU32Z128mr || StOpcode == Mcasm::VMOVDQA32Z128mr;
  case Mcasm::VMOVDQU64Z256rm:
  case Mcasm::VMOVDQA64Z256rm:
    return StOpcode == Mcasm::VMOVDQU64Z256mr || StOpcode == Mcasm::VMOVDQA64Z256mr;
  case Mcasm::VMOVDQU32Z256rm:
  case Mcasm::VMOVDQA32Z256rm:
    return StOpcode == Mcasm::VMOVDQU32Z256mr || StOpcode == Mcasm::VMOVDQA32Z256mr;
  default:
    return false;
  }
}

static bool isPotentialBlockingStoreInst(unsigned Opcode, unsigned LoadOpcode) {
  bool PBlock = false;
  PBlock |= Opcode == Mcasm::MOV64mr || Opcode == Mcasm::MOV64mi32 ||
            Opcode == Mcasm::MOV32mr || Opcode == Mcasm::MOV32mi ||
            Opcode == Mcasm::MOV16mr || Opcode == Mcasm::MOV16mi ||
            Opcode == Mcasm::MOV8mr || Opcode == Mcasm::MOV8mi;
  if (isYMMLoadOpcode(LoadOpcode))
    PBlock |= Opcode == Mcasm::VMOVUPSmr || Opcode == Mcasm::VMOVAPSmr ||
              Opcode == Mcasm::VMOVUPDmr || Opcode == Mcasm::VMOVAPDmr ||
              Opcode == Mcasm::VMOVDQUmr || Opcode == Mcasm::VMOVDQAmr ||
              Opcode == Mcasm::VMOVUPSZ128mr || Opcode == Mcasm::VMOVAPSZ128mr ||
              Opcode == Mcasm::VMOVUPDZ128mr || Opcode == Mcasm::VMOVAPDZ128mr ||
              Opcode == Mcasm::VMOVDQU64Z128mr ||
              Opcode == Mcasm::VMOVDQA64Z128mr ||
              Opcode == Mcasm::VMOVDQU32Z128mr || Opcode == Mcasm::VMOVDQA32Z128mr;
  return PBlock;
}

static const int MOV128SZ = 16;
static const int MOV64SZ = 8;
static const int MOV32SZ = 4;
static const int MOV16SZ = 2;
static const int MOV8SZ = 1;

static unsigned getYMMtoXMMLoadOpcode(unsigned LoadOpcode) {
  switch (LoadOpcode) {
  case Mcasm::VMOVUPSYrm:
  case Mcasm::VMOVAPSYrm:
    return Mcasm::VMOVUPSrm;
  case Mcasm::VMOVUPDYrm:
  case Mcasm::VMOVAPDYrm:
    return Mcasm::VMOVUPDrm;
  case Mcasm::VMOVDQUYrm:
  case Mcasm::VMOVDQAYrm:
    return Mcasm::VMOVDQUrm;
  case Mcasm::VMOVUPSZ256rm:
  case Mcasm::VMOVAPSZ256rm:
    return Mcasm::VMOVUPSZ128rm;
  case Mcasm::VMOVUPDZ256rm:
  case Mcasm::VMOVAPDZ256rm:
    return Mcasm::VMOVUPDZ128rm;
  case Mcasm::VMOVDQU64Z256rm:
  case Mcasm::VMOVDQA64Z256rm:
    return Mcasm::VMOVDQU64Z128rm;
  case Mcasm::VMOVDQU32Z256rm:
  case Mcasm::VMOVDQA32Z256rm:
    return Mcasm::VMOVDQU32Z128rm;
  default:
    llvm_unreachable("Unexpected Load Instruction Opcode");
  }
  return 0;
}

static unsigned getYMMtoXMMStoreOpcode(unsigned StoreOpcode) {
  switch (StoreOpcode) {
  case Mcasm::VMOVUPSYmr:
  case Mcasm::VMOVAPSYmr:
    return Mcasm::VMOVUPSmr;
  case Mcasm::VMOVUPDYmr:
  case Mcasm::VMOVAPDYmr:
    return Mcasm::VMOVUPDmr;
  case Mcasm::VMOVDQUYmr:
  case Mcasm::VMOVDQAYmr:
    return Mcasm::VMOVDQUmr;
  case Mcasm::VMOVUPSZ256mr:
  case Mcasm::VMOVAPSZ256mr:
    return Mcasm::VMOVUPSZ128mr;
  case Mcasm::VMOVUPDZ256mr:
  case Mcasm::VMOVAPDZ256mr:
    return Mcasm::VMOVUPDZ128mr;
  case Mcasm::VMOVDQU64Z256mr:
  case Mcasm::VMOVDQA64Z256mr:
    return Mcasm::VMOVDQU64Z128mr;
  case Mcasm::VMOVDQU32Z256mr:
  case Mcasm::VMOVDQA32Z256mr:
    return Mcasm::VMOVDQU32Z128mr;
  default:
    llvm_unreachable("Unexpected Load Instruction Opcode");
  }
  return 0;
}

static int getAddrOffset(const MachineInstr *MI) {
  const MCInstrDesc &Descl = MI->getDesc();
  int AddrOffset = McasmII::getMemoryOperandNo(Descl.TSFlags);
  assert(AddrOffset != -1 && "Expected Memory Operand");
  AddrOffset += McasmII::getOperandBias(Descl);
  return AddrOffset;
}

static MachineOperand &getBaseOperand(MachineInstr *MI) {
  int AddrOffset = getAddrOffset(MI);
  return MI->getOperand(AddrOffset + Mcasm::AddrBaseReg);
}

static MachineOperand &getDispOperand(MachineInstr *MI) {
  int AddrOffset = getAddrOffset(MI);
  return MI->getOperand(AddrOffset + Mcasm::AddrDisp);
}

// Relevant addressing modes contain only base register and immediate
// displacement or frameindex and immediate displacement.
// TODO: Consider expanding to other addressing modes in the future
static bool isRelevantAddressingMode(MachineInstr *MI) {
  int AddrOffset = getAddrOffset(MI);
  const MachineOperand &Base = getBaseOperand(MI);
  const MachineOperand &Disp = getDispOperand(MI);
  const MachineOperand &Scale = MI->getOperand(AddrOffset + Mcasm::AddrScaleAmt);
  const MachineOperand &Index = MI->getOperand(AddrOffset + Mcasm::AddrIndexReg);
  const MachineOperand &Segment = MI->getOperand(AddrOffset + Mcasm::AddrSegmentReg);

  if (!((Base.isReg() && Base.getReg() != Mcasm::NoRegister) || Base.isFI()))
    return false;
  if (!Disp.isImm())
    return false;
  if (Scale.getImm() != 1)
    return false;
  if (!(Index.isReg() && Index.getReg() == Mcasm::NoRegister))
    return false;
  if (!(Segment.isReg() && Segment.getReg() == Mcasm::NoRegister))
    return false;
  return true;
}

// Collect potentially blocking stores.
// Limit the number of instructions backwards we want to inspect
// since the effect of store block won't be visible if the store
// and load instructions have enough instructions in between to
// keep the core busy.
static SmallVector<MachineInstr *, 2>
findPotentialBlockers(MachineInstr *LoadInst) {
  SmallVector<MachineInstr *, 2> PotentialBlockers;
  unsigned BlockCount = 0;
  const unsigned InspectionLimit = McasmAvoidSFBInspectionLimit;
  for (auto PBInst = std::next(MachineBasicBlock::reverse_iterator(LoadInst)),
            E = LoadInst->getParent()->rend();
       PBInst != E; ++PBInst) {
    if (PBInst->isMetaInstruction())
      continue;
    BlockCount++;
    if (BlockCount >= InspectionLimit)
      break;
    MachineInstr &MI = *PBInst;
    if (MI.getDesc().isCall())
      return PotentialBlockers;
    PotentialBlockers.push_back(&MI);
  }
  // If we didn't get to the instructions limit try predecessing blocks.
  // Ideally we should traverse the predecessor blocks in depth with some
  // coloring algorithm, but for now let's just look at the first order
  // predecessors.
  if (BlockCount < InspectionLimit) {
    MachineBasicBlock *MBB = LoadInst->getParent();
    int LimitLeft = InspectionLimit - BlockCount;
    for (MachineBasicBlock *PMBB : MBB->predecessors()) {
      int PredCount = 0;
      for (MachineInstr &PBInst : llvm::reverse(*PMBB)) {
        if (PBInst.isMetaInstruction())
          continue;
        PredCount++;
        if (PredCount >= LimitLeft)
          break;
        if (PBInst.getDesc().isCall())
          break;
        PotentialBlockers.push_back(&PBInst);
      }
    }
  }
  return PotentialBlockers;
}

void McasmAvoidSFBImpl::buildCopy(MachineInstr *LoadInst, unsigned NLoadOpcode,
                                int64_t LoadDisp, MachineInstr *StoreInst,
                                unsigned NStoreOpcode, int64_t StoreDisp,
                                unsigned Size, int64_t LMMOffset,
                                int64_t SMMOffset) {
  MachineOperand &LoadBase = getBaseOperand(LoadInst);
  MachineOperand &StoreBase = getBaseOperand(StoreInst);
  MachineBasicBlock *MBB = LoadInst->getParent();
  MachineMemOperand *LMMO = *LoadInst->memoperands_begin();
  MachineMemOperand *SMMO = *StoreInst->memoperands_begin();

  Register Reg1 =
      MRI->createVirtualRegister(TII->getRegClass(TII->get(NLoadOpcode), 0));
  MachineInstr *NewLoad =
      BuildMI(*MBB, LoadInst, LoadInst->getDebugLoc(), TII->get(NLoadOpcode),
              Reg1)
          .add(LoadBase)
          .addImm(1)
          .addReg(Mcasm::NoRegister)
          .addImm(LoadDisp)
          .addReg(Mcasm::NoRegister)
          .addMemOperand(
              MBB->getParent()->getMachineMemOperand(LMMO, LMMOffset, Size));
  if (LoadBase.isReg())
    getBaseOperand(NewLoad).setIsKill(false);
  LLVM_DEBUG(NewLoad->dump());
  // If the load and store are consecutive, use the loadInst location to
  // reduce register pressure.
  MachineInstr *StInst = StoreInst;
  auto PrevInstrIt = prev_nodbg(MachineBasicBlock::instr_iterator(StoreInst),
                                MBB->instr_begin());
  if (PrevInstrIt.getNodePtr() == LoadInst)
    StInst = LoadInst;
  MachineInstr *NewStore =
      BuildMI(*MBB, StInst, StInst->getDebugLoc(), TII->get(NStoreOpcode))
          .add(StoreBase)
          .addImm(1)
          .addReg(Mcasm::NoRegister)
          .addImm(StoreDisp)
          .addReg(Mcasm::NoRegister)
          .addReg(Reg1)
          .addMemOperand(
              MBB->getParent()->getMachineMemOperand(SMMO, SMMOffset, Size));
  if (StoreBase.isReg())
    getBaseOperand(NewStore).setIsKill(false);
  MachineOperand &StoreSrcVReg = StoreInst->getOperand(Mcasm::AddrNumOperands);
  assert(StoreSrcVReg.isReg() && "Expected virtual register");
  NewStore->getOperand(Mcasm::AddrNumOperands).setIsKill(StoreSrcVReg.isKill());
  LLVM_DEBUG(NewStore->dump());
}

void McasmAvoidSFBImpl::buildCopies(int Size, MachineInstr *LoadInst,
                                  int64_t LdDispImm, MachineInstr *StoreInst,
                                  int64_t StDispImm, int64_t LMMOffset,
                                  int64_t SMMOffset) {
  int LdDisp = LdDispImm;
  int StDisp = StDispImm;
  while (Size > 0) {
    if ((Size - MOV128SZ >= 0) && isYMMLoadOpcode(LoadInst->getOpcode())) {
      Size = Size - MOV128SZ;
      buildCopy(LoadInst, getYMMtoXMMLoadOpcode(LoadInst->getOpcode()), LdDisp,
                StoreInst, getYMMtoXMMStoreOpcode(StoreInst->getOpcode()),
                StDisp, MOV128SZ, LMMOffset, SMMOffset);
      LdDisp += MOV128SZ;
      StDisp += MOV128SZ;
      LMMOffset += MOV128SZ;
      SMMOffset += MOV128SZ;
      continue;
    }
    if (Size - MOV64SZ >= 0) {
      Size = Size - MOV64SZ;
      buildCopy(LoadInst, Mcasm::MOV64rm, LdDisp, StoreInst, Mcasm::MOV64mr, StDisp,
                MOV64SZ, LMMOffset, SMMOffset);
      LdDisp += MOV64SZ;
      StDisp += MOV64SZ;
      LMMOffset += MOV64SZ;
      SMMOffset += MOV64SZ;
      continue;
    }
    if (Size - MOV32SZ >= 0) {
      Size = Size - MOV32SZ;
      buildCopy(LoadInst, Mcasm::MOV32rm, LdDisp, StoreInst, Mcasm::MOV32mr, StDisp,
                MOV32SZ, LMMOffset, SMMOffset);
      LdDisp += MOV32SZ;
      StDisp += MOV32SZ;
      LMMOffset += MOV32SZ;
      SMMOffset += MOV32SZ;
      continue;
    }
    if (Size - MOV16SZ >= 0) {
      Size = Size - MOV16SZ;
      buildCopy(LoadInst, Mcasm::MOV16rm, LdDisp, StoreInst, Mcasm::MOV16mr, StDisp,
                MOV16SZ, LMMOffset, SMMOffset);
      LdDisp += MOV16SZ;
      StDisp += MOV16SZ;
      LMMOffset += MOV16SZ;
      SMMOffset += MOV16SZ;
      continue;
    }
    if (Size - MOV8SZ >= 0) {
      Size = Size - MOV8SZ;
      buildCopy(LoadInst, Mcasm::MOV8rm, LdDisp, StoreInst, Mcasm::MOV8mr, StDisp,
                MOV8SZ, LMMOffset, SMMOffset);
      LdDisp += MOV8SZ;
      StDisp += MOV8SZ;
      LMMOffset += MOV8SZ;
      SMMOffset += MOV8SZ;
      continue;
    }
  }
  assert(Size == 0 && "Wrong size division");
}

static void updateKillStatus(MachineInstr *LoadInst, MachineInstr *StoreInst) {
  MachineOperand &LoadBase = getBaseOperand(LoadInst);
  MachineOperand &StoreBase = getBaseOperand(StoreInst);
  auto *StorePrevNonDbgInstr =
      prev_nodbg(MachineBasicBlock::instr_iterator(StoreInst),
                 LoadInst->getParent()->instr_begin())
          .getNodePtr();
  if (LoadBase.isReg()) {
    MachineInstr *LastLoad = LoadInst->getPrevNode();
    // If the original load and store to xmm/ymm were consecutive
    // then the partial copies were also created in
    // a consecutive order to reduce register pressure,
    // and the location of the last load is before the last store.
    if (StorePrevNonDbgInstr == LoadInst)
      LastLoad = LoadInst->getPrevNode()->getPrevNode();
    getBaseOperand(LastLoad).setIsKill(LoadBase.isKill());
  }
  if (StoreBase.isReg()) {
    MachineInstr *StInst = StoreInst;
    if (StorePrevNonDbgInstr == LoadInst)
      StInst = LoadInst;
    getBaseOperand(StInst->getPrevNode()).setIsKill(StoreBase.isKill());
  }
}

bool McasmAvoidSFBImpl::alias(const MachineMemOperand &Op1,
                            const MachineMemOperand &Op2) const {
  if (!Op1.getValue() || !Op2.getValue())
    return true;

  int64_t MinOffset = std::min(Op1.getOffset(), Op2.getOffset());
  int64_t Overlapa = Op1.getSize().getValue() + Op1.getOffset() - MinOffset;
  int64_t Overlapb = Op2.getSize().getValue() + Op2.getOffset() - MinOffset;

  return !AA->isNoAlias(
      MemoryLocation(Op1.getValue(), Overlapa, Op1.getAAInfo()),
      MemoryLocation(Op2.getValue(), Overlapb, Op2.getAAInfo()));
}

void McasmAvoidSFBImpl::findPotentiallylBlockedCopies(MachineFunction &MF) {
  for (auto &MBB : MF)
    for (auto &MI : MBB) {
      if (!isPotentialBlockedMemCpyLd(MI.getOpcode()))
        continue;
      Register DefVR = MI.getOperand(0).getReg();
      if (!MRI->hasOneNonDBGUse(DefVR))
        continue;
      for (MachineOperand &StoreMO :
           llvm::make_early_inc_range(MRI->use_nodbg_operands(DefVR))) {
        MachineInstr &StoreMI = *StoreMO.getParent();
        // Skip cases where the memcpy may overlap.
        if (StoreMI.getParent() == MI.getParent() &&
            isPotentialBlockedMemCpyPair(MI.getOpcode(), StoreMI.getOpcode()) &&
            isRelevantAddressingMode(&MI) &&
            isRelevantAddressingMode(&StoreMI) &&
            MI.hasOneMemOperand() && StoreMI.hasOneMemOperand()) {
          if (!alias(**MI.memoperands_begin(), **StoreMI.memoperands_begin()))
            BlockedLoadsStoresPairs.push_back(std::make_pair(&MI, &StoreMI));
        }
      }
    }
}

unsigned McasmAvoidSFBImpl::getRegSizeInBytes(MachineInstr *LoadInst) {
  const auto *TRC = TII->getRegClass(TII->get(LoadInst->getOpcode()), 0);
  return TRI->getRegSizeInBits(*TRC) / 8;
}

void McasmAvoidSFBImpl::breakBlockedCopies(
    MachineInstr *LoadInst, MachineInstr *StoreInst,
    const DisplacementSizeMap &BlockingStoresDispSizeMap) {
  int64_t LdDispImm = getDispOperand(LoadInst).getImm();
  int64_t StDispImm = getDispOperand(StoreInst).getImm();
  int64_t LMMOffset = 0;
  int64_t SMMOffset = 0;

  int64_t LdDisp1 = LdDispImm;
  int64_t LdDisp2 = 0;
  int64_t StDisp1 = StDispImm;
  int64_t StDisp2 = 0;
  unsigned Size1 = 0;
  unsigned Size2 = 0;
  int64_t LdStDelta = StDispImm - LdDispImm;

  for (auto DispSizePair : BlockingStoresDispSizeMap) {
    LdDisp2 = DispSizePair.first;
    StDisp2 = DispSizePair.first + LdStDelta;
    Size2 = DispSizePair.second;
    // Avoid copying overlapping areas.
    if (LdDisp2 < LdDisp1) {
      int OverlapDelta = LdDisp1 - LdDisp2;
      LdDisp2 += OverlapDelta;
      StDisp2 += OverlapDelta;
      Size2 -= OverlapDelta;
    }
    Size1 = LdDisp2 - LdDisp1;

    // Build a copy for the point until the current blocking store's
    // displacement.
    buildCopies(Size1, LoadInst, LdDisp1, StoreInst, StDisp1, LMMOffset,
                SMMOffset);
    // Build a copy for the current blocking store.
    buildCopies(Size2, LoadInst, LdDisp2, StoreInst, StDisp2, LMMOffset + Size1,
                SMMOffset + Size1);
    LdDisp1 = LdDisp2 + Size2;
    StDisp1 = StDisp2 + Size2;
    LMMOffset += Size1 + Size2;
    SMMOffset += Size1 + Size2;
  }
  unsigned Size3 = (LdDispImm + getRegSizeInBytes(LoadInst)) - LdDisp1;
  buildCopies(Size3, LoadInst, LdDisp1, StoreInst, StDisp1, LMMOffset,
              LMMOffset);
}

static bool hasSameBaseOpValue(MachineInstr *LoadInst,
                               MachineInstr *StoreInst) {
  const MachineOperand &LoadBase = getBaseOperand(LoadInst);
  const MachineOperand &StoreBase = getBaseOperand(StoreInst);
  if (LoadBase.isReg() != StoreBase.isReg())
    return false;
  if (LoadBase.isReg())
    return LoadBase.getReg() == StoreBase.getReg();
  return LoadBase.getIndex() == StoreBase.getIndex();
}

static bool isBlockingStore(int64_t LoadDispImm, unsigned LoadSize,
                            int64_t StoreDispImm, unsigned StoreSize) {
  return ((StoreDispImm >= LoadDispImm) &&
          (StoreDispImm <= LoadDispImm + (LoadSize - StoreSize)));
}

// Keep track of all stores blocking a load
static void
updateBlockingStoresDispSizeMap(DisplacementSizeMap &BlockingStoresDispSizeMap,
                                int64_t DispImm, unsigned Size) {
  auto [It, Inserted] = BlockingStoresDispSizeMap.try_emplace(DispImm, Size);
  // Choose the smallest blocking store starting at this displacement.
  if (!Inserted && It->second > Size)
    It->second = Size;
}

// Remove blocking stores contained in each other.
static void
removeRedundantBlockingStores(DisplacementSizeMap &BlockingStoresDispSizeMap) {
  if (BlockingStoresDispSizeMap.size() <= 1)
    return;

  SmallVector<std::pair<int64_t, unsigned>, 0> DispSizeStack;
  for (auto DispSizePair : BlockingStoresDispSizeMap) {
    int64_t CurrDisp = DispSizePair.first;
    unsigned CurrSize = DispSizePair.second;
    while (DispSizeStack.size()) {
      int64_t PrevDisp = DispSizeStack.back().first;
      unsigned PrevSize = DispSizeStack.back().second;
      if (CurrDisp + CurrSize > PrevDisp + PrevSize)
        break;
      DispSizeStack.pop_back();
    }
    DispSizeStack.push_back(DispSizePair);
  }
  BlockingStoresDispSizeMap.clear();
  for (auto Disp : DispSizeStack)
    BlockingStoresDispSizeMap.insert(Disp);
}

bool McasmAvoidSFBImpl::runOnMachineFunction(MachineFunction &MF) {
  bool Changed = false;

  if (DisableMcasmAvoidStoreForwardBlocks ||
      !MF.getSubtarget<McasmSubtarget>().is64Bit())
    return false;

  MRI = &MF.getRegInfo();
  assert(MRI->isSSA() && "Expected MIR to be in SSA form");
  TII = MF.getSubtarget<McasmSubtarget>().getInstrInfo();
  TRI = MF.getSubtarget<McasmSubtarget>().getRegisterInfo();
  LLVM_DEBUG(dbgs() << "Start McasmAvoidStoreForwardBlocks\n";);
  // Look for a load then a store to XMM/YMM which look like a memcpy
  findPotentiallylBlockedCopies(MF);

  for (auto LoadStoreInstPair : BlockedLoadsStoresPairs) {
    MachineInstr *LoadInst = LoadStoreInstPair.first;
    int64_t LdDispImm = getDispOperand(LoadInst).getImm();
    DisplacementSizeMap BlockingStoresDispSizeMap;

    SmallVector<MachineInstr *, 2> PotentialBlockers =
        findPotentialBlockers(LoadInst);
    for (auto *PBInst : PotentialBlockers) {
      if (!isPotentialBlockingStoreInst(PBInst->getOpcode(),
                                        LoadInst->getOpcode()) ||
          !isRelevantAddressingMode(PBInst) || !PBInst->hasOneMemOperand())
        continue;
      int64_t PBstDispImm = getDispOperand(PBInst).getImm();
      unsigned PBstSize = (*PBInst->memoperands_begin())->getSize().getValue();
      // This check doesn't cover all cases, but it will suffice for now.
      // TODO: take branch probability into consideration, if the blocking
      // store is in an unreached block, breaking the memcopy could lose
      // performance.
      if (hasSameBaseOpValue(LoadInst, PBInst) &&
          isBlockingStore(LdDispImm, getRegSizeInBytes(LoadInst), PBstDispImm,
                          PBstSize))
        updateBlockingStoresDispSizeMap(BlockingStoresDispSizeMap, PBstDispImm,
                                        PBstSize);
    }

    if (BlockingStoresDispSizeMap.empty())
      continue;

    // We found a store forward block, break the memcpy's load and store
    // into smaller copies such that each smaller store that was causing
    // a store block would now be copied separately.
    MachineInstr *StoreInst = LoadStoreInstPair.second;
    LLVM_DEBUG(dbgs() << "Blocked load and store instructions: \n");
    LLVM_DEBUG(LoadInst->dump());
    LLVM_DEBUG(StoreInst->dump());
    LLVM_DEBUG(dbgs() << "Replaced with:\n");
    removeRedundantBlockingStores(BlockingStoresDispSizeMap);
    breakBlockedCopies(LoadInst, StoreInst, BlockingStoresDispSizeMap);
    updateKillStatus(LoadInst, StoreInst);
    ForRemoval.push_back(LoadInst);
    ForRemoval.push_back(StoreInst);
  }
  for (auto *RemovedInst : ForRemoval) {
    RemovedInst->eraseFromParent();
  }
  ForRemoval.clear();
  BlockedLoadsStoresPairs.clear();
  LLVM_DEBUG(dbgs() << "End McasmAvoidStoreForwardBlocks\n";);

  return Changed;
}

bool McasmAvoidSFBLegacy::runOnMachineFunction(MachineFunction &MF) {
  if (skipFunction(MF.getFunction()))
    return false;
  AliasAnalysis *AA = &getAnalysis<AAResultsWrapperPass>().getAAResults();
  McasmAvoidSFBImpl Impl(AA);
  return Impl.runOnMachineFunction(MF);
}

PreservedAnalyses
McasmAvoidStoreForwardingBlocksPass::run(MachineFunction &MF,
                                       MachineFunctionAnalysisManager &MFAM) {
  AliasAnalysis *AA =
      &MFAM.getResult<FunctionAnalysisManagerMachineFunctionProxy>(MF)
           .getManager()
           .getResult<AAManager>(MF.getFunction());
  McasmAvoidSFBImpl Impl(AA);
  bool Changed = Impl.runOnMachineFunction(MF);
  return Changed ? getMachineFunctionPassPreservedAnalyses()
                 : PreservedAnalyses::all();
}
