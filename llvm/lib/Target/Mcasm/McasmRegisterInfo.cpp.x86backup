//===-- McasmRegisterInfo.cpp - Mcasm Register Information --------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file contains the Mcasm implementation of the TargetRegisterInfo class.
// This file is responsible for the frame pointer elimination optimization
// on Mcasm.
//
//===----------------------------------------------------------------------===//

#include "McasmRegisterInfo.h"
#include "McasmFrameLowering.h"
#include "McasmMachineFunctionInfo.h"
#include "McasmSubtarget.h"
#include "llvm/ADT/BitVector.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/ADT/SmallSet.h"
#include "llvm/CodeGen/LiveRegMatrix.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/CodeGen/RegisterScavenging.h"
#include "llvm/CodeGen/TargetFrameLowering.h"
#include "llvm/CodeGen/TargetInstrInfo.h"
#include "llvm/CodeGen/TileShapeInfo.h"
#include "llvm/CodeGen/VirtRegMap.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Type.h"
#include "llvm/MC/MCContext.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Target/TargetMachine.h"
#include "llvm/Target/TargetOptions.h"

using namespace llvm;

#define GET_REGINFO_TARGET_DESC
#include "McasmGenRegisterInfo.inc"

static cl::opt<bool>
EnableBasePointer("x86-use-base-pointer", cl::Hidden, cl::init(true),
          cl::desc("Enable use of a base pointer for complex stack frames"));

static cl::opt<bool>
    DisableRegAllocNDDHints("x86-disable-regalloc-hints-for-ndd", cl::Hidden,
                            cl::init(false),
                            cl::desc("Disable two address hints for register "
                                     "allocation"));

extern cl::opt<bool> McasmEnableAPXForRelocation;

McasmRegisterInfo::McasmRegisterInfo(const Triple &TT)
    : McasmGenRegisterInfo((TT.isMcasm_64() ? Mcasm::RIP : Mcasm::EIP),
                         Mcasm_MC::getDwarfRegFlavour(TT, false),
                         Mcasm_MC::getDwarfRegFlavour(TT, true),
                         (TT.isMcasm_64() ? Mcasm::RIP : Mcasm::EIP)) {
  Mcasm_MC::initLLVMToSEHAndCVRegMapping(this);

  // Cache some information.
  Is64Bit = TT.isMcasm_64();
  IsTarget64BitLP64 = Is64Bit && !TT.isX32();
  IsWin64 = Is64Bit && TT.isOSWindows();
  IsUEFI64 = Is64Bit && TT.isUEFI();

  // Use a callee-saved register as the base pointer.  These registers must
  // not conflict with any ABI requirements.  For example, in 32-bit mode PIC
  // requires GOT in the EBX register before function calls via PLT GOT pointer.
  if (Is64Bit) {
    SlotSize = 8;
    // This matches the simplified 32-bit pointer code in the data layout
    // computation.
    // FIXME: Should use the data layout?
    bool Use64BitReg = !TT.isX32();
    StackPtr = Use64BitReg ? Mcasm::RSP : Mcasm::ESP;
    FramePtr = Use64BitReg ? Mcasm::RBP : Mcasm::EBP;
    BasePtr = Use64BitReg ? Mcasm::RBX : Mcasm::EBX;
  } else {
    SlotSize = 4;
    StackPtr = Mcasm::ESP;
    FramePtr = Mcasm::EBP;
    BasePtr = Mcasm::ESI;
  }
}

const TargetRegisterClass *
McasmRegisterInfo::getSubClassWithSubReg(const TargetRegisterClass *RC,
                                       unsigned Idx) const {
  // The sub_8bit sub-register index is more constrained in 32-bit mode.
  // It behaves just like the sub_8bit_hi index.
  if (!Is64Bit && Idx == Mcasm::sub_8bit)
    Idx = Mcasm::sub_8bit_hi;

  // Forward to TableGen's default version.
  return McasmGenRegisterInfo::getSubClassWithSubReg(RC, Idx);
}

const TargetRegisterClass *
McasmRegisterInfo::getMatchingSuperRegClass(const TargetRegisterClass *A,
                                          const TargetRegisterClass *B,
                                          unsigned SubIdx) const {
  // The sub_8bit sub-register index is more constrained in 32-bit mode.
  if (!Is64Bit && SubIdx == Mcasm::sub_8bit) {
    A = McasmGenRegisterInfo::getSubClassWithSubReg(A, Mcasm::sub_8bit_hi);
    if (!A)
      return nullptr;
  }
  return McasmGenRegisterInfo::getMatchingSuperRegClass(A, B, SubIdx);
}

const TargetRegisterClass *
McasmRegisterInfo::getLargestLegalSuperClass(const TargetRegisterClass *RC,
                                           const MachineFunction &MF) const {
  // Don't allow super-classes of GR8_NOREX.  This class is only used after
  // extracting sub_8bit_hi sub-registers.  The H sub-registers cannot be copied
  // to the full GR8 register class in 64-bit mode, so we cannot allow the
  // reigster class inflation.
  //
  // The GR8_NOREX class is always used in a way that won't be constrained to a
  // sub-class, so sub-classes like GR8_ABCD_L are allowed to expand to the
  // full GR8 class.
  if (RC == &Mcasm::GR8_NOREXRegClass)
    return RC;

  // Keep using non-rex2 register class when APX feature (EGPR/NDD/NF) is not
  // enabled for relocation.
  if (!McasmEnableAPXForRelocation && isNonRex2RegClass(RC))
    return RC;

  const McasmSubtarget &Subtarget = MF.getSubtarget<McasmSubtarget>();

  const TargetRegisterClass *Super = RC;
  auto I = RC->superclasses().begin();
  auto E = RC->superclasses().end();
  do {
    switch (Super->getID()) {
    case Mcasm::FR32RegClassID:
    case Mcasm::FR64RegClassID:
      // If AVX-512 isn't supported we should only inflate to these classes.
      if (!Subtarget.hasAVX512() &&
          getRegSizeInBits(*Super) == getRegSizeInBits(*RC))
        return Super;
      break;
    case Mcasm::VR128RegClassID:
    case Mcasm::VR256RegClassID:
      // If VLX isn't supported we should only inflate to these classes.
      if (!Subtarget.hasVLX() &&
          getRegSizeInBits(*Super) == getRegSizeInBits(*RC))
        return Super;
      break;
    case Mcasm::VR128XRegClassID:
    case Mcasm::VR256XRegClassID:
      // If VLX isn't support we shouldn't inflate to these classes.
      if (Subtarget.hasVLX() &&
          getRegSizeInBits(*Super) == getRegSizeInBits(*RC))
        return Super;
      break;
    case Mcasm::FR32XRegClassID:
    case Mcasm::FR64XRegClassID:
      // If AVX-512 isn't support we shouldn't inflate to these classes.
      if (Subtarget.hasAVX512() &&
          getRegSizeInBits(*Super) == getRegSizeInBits(*RC))
        return Super;
      break;
    case Mcasm::GR8RegClassID:
    case Mcasm::GR16RegClassID:
    case Mcasm::GR32RegClassID:
    case Mcasm::GR64RegClassID:
    case Mcasm::GR8_NOREX2RegClassID:
    case Mcasm::GR16_NOREX2RegClassID:
    case Mcasm::GR32_NOREX2RegClassID:
    case Mcasm::GR64_NOREX2RegClassID:
    case Mcasm::RFP32RegClassID:
    case Mcasm::RFP64RegClassID:
    case Mcasm::RFP80RegClassID:
    case Mcasm::VR512_0_15RegClassID:
    case Mcasm::VR512RegClassID:
      // Don't return a super-class that would shrink the spill size.
      // That can happen with the vector and float classes.
      if (getRegSizeInBits(*Super) == getRegSizeInBits(*RC))
        return Super;
    }
    if (I != E) {
      Super = getRegClass(*I);
      ++I;
    } else {
      Super = nullptr;
    }
  } while (Super);
  return RC;
}

const TargetRegisterClass *
McasmRegisterInfo::getPointerRegClass(unsigned Kind) const {
  assert(Kind == 0 && "this should only be used for default cases");
  if (IsTarget64BitLP64)
    return &Mcasm::GR64RegClass;
  // If the target is 64bit but we have been told to use 32bit addresses,
  // we can still use 64-bit register as long as we know the high bits
  // are zeros.
  // Reflect that in the returned register class.
  return Is64Bit ? &Mcasm::LOW32_ADDR_ACCESSRegClass : &Mcasm::GR32RegClass;
}

const TargetRegisterClass *
McasmRegisterInfo::getCrossCopyRegClass(const TargetRegisterClass *RC) const {
  if (RC == &Mcasm::CCRRegClass) {
    if (Is64Bit)
      return &Mcasm::GR64RegClass;
    else
      return &Mcasm::GR32RegClass;
  }
  return RC;
}

unsigned
McasmRegisterInfo::getRegPressureLimit(const TargetRegisterClass *RC,
                                     MachineFunction &MF) const {
  const McasmFrameLowering *TFI = getFrameLowering(MF);

  unsigned FPDiff = TFI->hasFP(MF) ? 1 : 0;
  switch (RC->getID()) {
  default:
    return 0;
  case Mcasm::GR32RegClassID:
    return 4 - FPDiff;
  case Mcasm::GR64RegClassID:
    return 12 - FPDiff;
  case Mcasm::VR128RegClassID:
    return Is64Bit ? 10 : 4;
  case Mcasm::VR64RegClassID:
    return 4;
  }
}

const MCPhysReg *
McasmRegisterInfo::getCalleeSavedRegs(const MachineFunction *MF) const {
  assert(MF && "MachineFunction required");

  const McasmSubtarget &Subtarget = MF->getSubtarget<McasmSubtarget>();
  const Function &F = MF->getFunction();
  bool HasSSE = Subtarget.hasSSE1();
  bool HasAVX = Subtarget.hasAVX();
  bool HasAVX512 = Subtarget.hasAVX512();
  bool CallsEHReturn = MF->callsEHReturn();

  CallingConv::ID CC = F.getCallingConv();

  // If attribute NoCallerSavedRegisters exists then we set Mcasm_INTR calling
  // convention because it has the CSR list.
  if (MF->getFunction().hasFnAttribute("no_caller_saved_registers"))
    CC = CallingConv::Mcasm_INTR;

  // If atribute specified, override the CSRs normally specified by the
  // calling convention and use the empty set instead.
  if (MF->getFunction().hasFnAttribute("no_callee_saved_registers"))
    return CSR_NoRegs_SaveList;

  switch (CC) {
  case CallingConv::GHC:
  case CallingConv::HiPE:
    return CSR_NoRegs_SaveList;
  case CallingConv::AnyReg:
    if (HasAVX)
      return CSR_64_AllRegs_AVX_SaveList;
    return CSR_64_AllRegs_SaveList;
  case CallingConv::PreserveMost:
    return IsWin64 ? CSR_Win64_RT_MostRegs_SaveList
                   : CSR_64_RT_MostRegs_SaveList;
  case CallingConv::PreserveAll:
    if (HasAVX)
      return CSR_64_RT_AllRegs_AVX_SaveList;
    return CSR_64_RT_AllRegs_SaveList;
  case CallingConv::PreserveNone:
    return CSR_64_NoneRegs_SaveList;
  case CallingConv::CXX_FAST_TLS:
    if (Is64Bit)
      return MF->getInfo<McasmMachineFunctionInfo>()->isSplitCSR() ?
             CSR_64_CXX_TLS_Darwin_PE_SaveList : CSR_64_TLS_Darwin_SaveList;
    break;
  case CallingConv::Intel_OCL_BI: {
    if (HasAVX512 && IsWin64)
      return CSR_Win64_Intel_OCL_BI_AVX512_SaveList;
    if (HasAVX512 && Is64Bit)
      return CSR_64_Intel_OCL_BI_AVX512_SaveList;
    if (HasAVX && IsWin64)
      return CSR_Win64_Intel_OCL_BI_AVX_SaveList;
    if (HasAVX && Is64Bit)
      return CSR_64_Intel_OCL_BI_AVX_SaveList;
    if (!HasAVX && !IsWin64 && Is64Bit)
      return CSR_64_Intel_OCL_BI_SaveList;
    break;
  }
  case CallingConv::Mcasm_RegCall:
    if (Is64Bit) {
      if (IsWin64) {
        return (HasSSE ? CSR_Win64_RegCall_SaveList :
                         CSR_Win64_RegCall_NoSSE_SaveList);
      } else {
        return (HasSSE ? CSR_SysV64_RegCall_SaveList :
                         CSR_SysV64_RegCall_NoSSE_SaveList);
      }
    } else {
      return (HasSSE ? CSR_32_RegCall_SaveList :
                       CSR_32_RegCall_NoSSE_SaveList);
    }
  case CallingConv::CFGuard_Check:
    assert(!Is64Bit && "CFGuard check mechanism only used on 32-bit Mcasm");
    return (HasSSE ? CSR_Win32_CFGuard_Check_SaveList
                   : CSR_Win32_CFGuard_Check_NoSSE_SaveList);
  case CallingConv::Cold:
    if (Is64Bit)
      return CSR_64_MostRegs_SaveList;
    break;
  case CallingConv::Win64:
    if (!HasSSE)
      return CSR_Win64_NoSSE_SaveList;
    return CSR_Win64_SaveList;
  case CallingConv::SwiftTail:
    if (!Is64Bit)
      return CSR_32_SaveList;
    return IsWin64 ? CSR_Win64_SwiftTail_SaveList : CSR_64_SwiftTail_SaveList;
  case CallingConv::Mcasm_64_SysV:
    if (CallsEHReturn)
      return CSR_64EHRet_SaveList;
    return CSR_64_SaveList;
  case CallingConv::Mcasm_INTR:
    if (Is64Bit) {
      if (HasAVX512)
        return CSR_64_AllRegs_AVX512_SaveList;
      if (HasAVX)
        return CSR_64_AllRegs_AVX_SaveList;
      if (HasSSE)
        return CSR_64_AllRegs_SaveList;
      return CSR_64_AllRegs_NoSSE_SaveList;
    } else {
      if (HasAVX512)
        return CSR_32_AllRegs_AVX512_SaveList;
      if (HasAVX)
        return CSR_32_AllRegs_AVX_SaveList;
      if (HasSSE)
        return CSR_32_AllRegs_SSE_SaveList;
      return CSR_32_AllRegs_SaveList;
    }
  default:
    break;
  }

  if (Is64Bit) {
    bool IsSwiftCC = Subtarget.getTargetLowering()->supportSwiftError() &&
                     F.getAttributes().hasAttrSomewhere(Attribute::SwiftError);
    if (IsSwiftCC)
      return IsWin64 ? CSR_Win64_SwiftError_SaveList
                     : CSR_64_SwiftError_SaveList;

    if (IsWin64 || IsUEFI64)
      return HasSSE ? CSR_Win64_SaveList : CSR_Win64_NoSSE_SaveList;
    if (CallsEHReturn)
      return CSR_64EHRet_SaveList;
    return CSR_64_SaveList;
  }

  return CallsEHReturn ? CSR_32EHRet_SaveList : CSR_32_SaveList;
}

const MCPhysReg *
McasmRegisterInfo::getIPRACSRegs(const MachineFunction *MF) const {
  return Is64Bit ? CSR_IPRA_64_SaveList : CSR_IPRA_32_SaveList;
}

const MCPhysReg *McasmRegisterInfo::getCalleeSavedRegsViaCopy(
    const MachineFunction *MF) const {
  assert(MF && "Invalid MachineFunction pointer.");
  if (MF->getFunction().getCallingConv() == CallingConv::CXX_FAST_TLS &&
      MF->getInfo<McasmMachineFunctionInfo>()->isSplitCSR())
    return CSR_64_CXX_TLS_Darwin_ViaCopy_SaveList;
  return nullptr;
}

const uint32_t *
McasmRegisterInfo::getCallPreservedMask(const MachineFunction &MF,
                                      CallingConv::ID CC) const {
  const McasmSubtarget &Subtarget = MF.getSubtarget<McasmSubtarget>();
  bool HasSSE = Subtarget.hasSSE1();
  bool HasAVX = Subtarget.hasAVX();
  bool HasAVX512 = Subtarget.hasAVX512();

  switch (CC) {
  case CallingConv::GHC:
  case CallingConv::HiPE:
    return CSR_NoRegs_RegMask;
  case CallingConv::AnyReg:
    if (HasAVX)
      return CSR_64_AllRegs_AVX_RegMask;
    return CSR_64_AllRegs_RegMask;
  case CallingConv::PreserveMost:
    return IsWin64 ? CSR_Win64_RT_MostRegs_RegMask : CSR_64_RT_MostRegs_RegMask;
  case CallingConv::PreserveAll:
    if (HasAVX)
      return CSR_64_RT_AllRegs_AVX_RegMask;
    return CSR_64_RT_AllRegs_RegMask;
  case CallingConv::PreserveNone:
    return CSR_64_NoneRegs_RegMask;
  case CallingConv::CXX_FAST_TLS:
    if (Is64Bit)
      return CSR_64_TLS_Darwin_RegMask;
    break;
  case CallingConv::Intel_OCL_BI: {
    if (HasAVX512 && IsWin64)
      return CSR_Win64_Intel_OCL_BI_AVX512_RegMask;
    if (HasAVX512 && Is64Bit)
      return CSR_64_Intel_OCL_BI_AVX512_RegMask;
    if (HasAVX && IsWin64)
      return CSR_Win64_Intel_OCL_BI_AVX_RegMask;
    if (HasAVX && Is64Bit)
      return CSR_64_Intel_OCL_BI_AVX_RegMask;
    if (!HasAVX && !IsWin64 && Is64Bit)
      return CSR_64_Intel_OCL_BI_RegMask;
    break;
  }
  case CallingConv::Mcasm_RegCall:
    if (Is64Bit) {
      if (IsWin64) {
        return (HasSSE ? CSR_Win64_RegCall_RegMask :
                         CSR_Win64_RegCall_NoSSE_RegMask);
      } else {
        return (HasSSE ? CSR_SysV64_RegCall_RegMask :
                         CSR_SysV64_RegCall_NoSSE_RegMask);
      }
    } else {
      return (HasSSE ? CSR_32_RegCall_RegMask :
                       CSR_32_RegCall_NoSSE_RegMask);
    }
  case CallingConv::CFGuard_Check:
    assert(!Is64Bit && "CFGuard check mechanism only used on 32-bit Mcasm");
    return (HasSSE ? CSR_Win32_CFGuard_Check_RegMask
                   : CSR_Win32_CFGuard_Check_NoSSE_RegMask);
  case CallingConv::Cold:
    if (Is64Bit)
      return CSR_64_MostRegs_RegMask;
    break;
  case CallingConv::Win64:
    return CSR_Win64_RegMask;
  case CallingConv::SwiftTail:
    if (!Is64Bit)
      return CSR_32_RegMask;
    return IsWin64 ? CSR_Win64_SwiftTail_RegMask : CSR_64_SwiftTail_RegMask;
  case CallingConv::Mcasm_64_SysV:
    return CSR_64_RegMask;
  case CallingConv::Mcasm_INTR:
    if (Is64Bit) {
      if (HasAVX512)
        return CSR_64_AllRegs_AVX512_RegMask;
      if (HasAVX)
        return CSR_64_AllRegs_AVX_RegMask;
      if (HasSSE)
        return CSR_64_AllRegs_RegMask;
      return CSR_64_AllRegs_NoSSE_RegMask;
    } else {
      if (HasAVX512)
        return CSR_32_AllRegs_AVX512_RegMask;
      if (HasAVX)
        return CSR_32_AllRegs_AVX_RegMask;
      if (HasSSE)
        return CSR_32_AllRegs_SSE_RegMask;
      return CSR_32_AllRegs_RegMask;
    }
  default:
    break;
  }

  // Unlike getCalleeSavedRegs(), we don't have MMI so we can't check
  // callsEHReturn().
  if (Is64Bit) {
    const Function &F = MF.getFunction();
    bool IsSwiftCC = Subtarget.getTargetLowering()->supportSwiftError() &&
                     F.getAttributes().hasAttrSomewhere(Attribute::SwiftError);
    if (IsSwiftCC)
      return IsWin64 ? CSR_Win64_SwiftError_RegMask : CSR_64_SwiftError_RegMask;

    return (IsWin64 || IsUEFI64) ? CSR_Win64_RegMask : CSR_64_RegMask;
  }

  return CSR_32_RegMask;
}

const uint32_t*
McasmRegisterInfo::getNoPreservedMask() const {
  return CSR_NoRegs_RegMask;
}

const uint32_t *McasmRegisterInfo::getDarwinTLSCallPreservedMask() const {
  return CSR_64_TLS_Darwin_RegMask;
}

BitVector McasmRegisterInfo::getReservedRegs(const MachineFunction &MF) const {
  BitVector Reserved(getNumRegs());
  const McasmFrameLowering *TFI = getFrameLowering(MF);

  // Set the floating point control register as reserved.
  Reserved.set(Mcasm::FPCW);

  // Set the floating point status register as reserved.
  Reserved.set(Mcasm::FPSW);

  // Set the SIMD floating point control register as reserved.
  Reserved.set(Mcasm::MXCSR);

  // Set the stack-pointer register and its aliases as reserved.
  for (const MCPhysReg &SubReg : subregs_inclusive(Mcasm::RSP))
    Reserved.set(SubReg);

  // Set the Shadow Stack Pointer as reserved.
  Reserved.set(Mcasm::SSP);

  // Set the instruction pointer register and its aliases as reserved.
  for (const MCPhysReg &SubReg : subregs_inclusive(Mcasm::RIP))
    Reserved.set(SubReg);

  // Set the frame-pointer register and its aliases as reserved if needed.
  if (TFI->hasFP(MF) || MF.getTarget().Options.FramePointerIsReserved(MF)) {
    if (MF.getInfo<McasmMachineFunctionInfo>()->getFPClobberedByInvoke())
      MF.getContext().reportError(
          SMLoc(),
          "Frame pointer clobbered by function invoke is not supported.");

    for (const MCPhysReg &SubReg : subregs_inclusive(Mcasm::RBP))
      Reserved.set(SubReg);
  }

  // Set the base-pointer register and its aliases as reserved if needed.
  if (hasBasePointer(MF)) {
    if (MF.getInfo<McasmMachineFunctionInfo>()->getBPClobberedByInvoke())
      MF.getContext().reportError(SMLoc(),
                                  "Stack realignment in presence of dynamic "
                                  "allocas is not supported with "
                                  "this calling convention.");

    Register BasePtr = getMcasmSubSuperRegister(getBaseRegister(), 64);
    for (const MCPhysReg &SubReg : subregs_inclusive(BasePtr))
      Reserved.set(SubReg);
  }

  // Mark the segment registers as reserved.
  Reserved.set(Mcasm::CS);
  Reserved.set(Mcasm::SS);
  Reserved.set(Mcasm::DS);
  Reserved.set(Mcasm::ES);
  Reserved.set(Mcasm::FS);
  Reserved.set(Mcasm::GS);

  // Mark the floating point stack registers as reserved.
  for (unsigned n = 0; n != 8; ++n)
    Reserved.set(Mcasm::ST0 + n);

  // Reserve the registers that only exist in 64-bit mode.
  if (!Is64Bit) {
    // These 8-bit registers are part of the x86-64 extension even though their
    // super-registers are old 32-bits.
    Reserved.set(Mcasm::SIL);
    Reserved.set(Mcasm::DIL);
    Reserved.set(Mcasm::BPL);
    Reserved.set(Mcasm::SPL);
    Reserved.set(Mcasm::SIH);
    Reserved.set(Mcasm::DIH);
    Reserved.set(Mcasm::BPH);
    Reserved.set(Mcasm::SPH);

    for (unsigned n = 0; n != 8; ++n) {
      // R8, R9, ...
      for (MCRegAliasIterator AI(Mcasm::R8 + n, this, true); AI.isValid(); ++AI)
        Reserved.set(*AI);

      // XMM8, XMM9, ...
      for (MCRegAliasIterator AI(Mcasm::XMM8 + n, this, true); AI.isValid(); ++AI)
        Reserved.set(*AI);
    }
  }
  if (!Is64Bit || !MF.getSubtarget<McasmSubtarget>().hasAVX512()) {
    for (unsigned n = 0; n != 16; ++n) {
      for (MCRegAliasIterator AI(Mcasm::XMM16 + n, this, true); AI.isValid();
           ++AI)
        Reserved.set(*AI);
    }
  }

  // Reserve the extended general purpose registers.
  if (!Is64Bit || !MF.getSubtarget<McasmSubtarget>().hasEGPR())
    Reserved.set(Mcasm::R16, Mcasm::R31WH + 1);

  if (MF.getFunction().getCallingConv() == CallingConv::GRAAL) {
    for (MCRegAliasIterator AI(Mcasm::R14, this, true); AI.isValid(); ++AI)
      Reserved.set(*AI);
    for (MCRegAliasIterator AI(Mcasm::R15, this, true); AI.isValid(); ++AI)
      Reserved.set(*AI);
  }

  assert(checkAllSuperRegsMarked(Reserved,
                                 {Mcasm::SIL, Mcasm::DIL, Mcasm::BPL, Mcasm::SPL,
                                  Mcasm::SIH, Mcasm::DIH, Mcasm::BPH, Mcasm::SPH}));
  return Reserved;
}

unsigned McasmRegisterInfo::getNumSupportedRegs(const MachineFunction &MF) const {
  // All existing Intel CPUs that support AMX support AVX512 and all existing
  // Intel CPUs that support APX support AMX. AVX512 implies AVX.
  //
  // We enumerate the registers in McasmGenRegisterInfo.inc in this order:
  //
  // Registers before AVX512,
  // AVX512 registers (X/YMM16-31, ZMM0-31, K registers)
  // AMX registers (TMM)
  // APX registers (R16-R31)
  //
  // and try to return the minimum number of registers supported by the target.
  static_assert((Mcasm::R15WH + 1 == Mcasm::YMM0) && (Mcasm::YMM15 + 1 == Mcasm::K0) &&
                    (Mcasm::K6_K7 + 1 == Mcasm::TMMCFG) &&
                    (Mcasm::TMM7 + 1 == Mcasm::R16) &&
                    (Mcasm::R31WH + 1 == Mcasm::NUM_TARGET_REGS),
                "Register number may be incorrect");

  const McasmSubtarget &ST = MF.getSubtarget<McasmSubtarget>();
  if (ST.hasEGPR())
    return Mcasm::NUM_TARGET_REGS;
  if (ST.hasAMXTILE())
    return Mcasm::TMM7 + 1;
  if (ST.hasAVX512())
    return Mcasm::K6_K7 + 1;
  if (ST.hasAVX())
    return Mcasm::YMM15 + 1;
  return Mcasm::R15WH + 1;
}

bool McasmRegisterInfo::isArgumentRegister(const MachineFunction &MF,
                                         MCRegister Reg) const {
  const McasmSubtarget &ST = MF.getSubtarget<McasmSubtarget>();
  const TargetRegisterInfo &TRI = *ST.getRegisterInfo();
  auto IsSubReg = [&](MCRegister RegA, MCRegister RegB) {
    return TRI.isSuperOrSubRegisterEq(RegA, RegB);
  };

  if (!ST.is64Bit())
    return llvm::any_of(
               SmallVector<MCRegister>{Mcasm::EAX, Mcasm::ECX, Mcasm::EDX},
               [&](MCRegister &RegA) { return IsSubReg(RegA, Reg); }) ||
           (ST.hasMMX() && Mcasm::VR64RegClass.contains(Reg));

  CallingConv::ID CC = MF.getFunction().getCallingConv();

  if (CC == CallingConv::Mcasm_64_SysV && IsSubReg(Mcasm::RAX, Reg))
    return true;

  if (llvm::any_of(
          SmallVector<MCRegister>{Mcasm::RDX, Mcasm::RCX, Mcasm::R8, Mcasm::R9},
          [&](MCRegister &RegA) { return IsSubReg(RegA, Reg); }))
    return true;

  if (CC != CallingConv::Win64 &&
      llvm::any_of(SmallVector<MCRegister>{Mcasm::RDI, Mcasm::RSI},
                   [&](MCRegister &RegA) { return IsSubReg(RegA, Reg); }))
    return true;

  if (ST.hasSSE1() &&
      llvm::any_of(SmallVector<MCRegister>{Mcasm::XMM0, Mcasm::XMM1, Mcasm::XMM2,
                                           Mcasm::XMM3, Mcasm::XMM4, Mcasm::XMM5,
                                           Mcasm::XMM6, Mcasm::XMM7},
                   [&](MCRegister &RegA) { return IsSubReg(RegA, Reg); }))
    return true;

  return McasmGenRegisterInfo::isArgumentRegister(MF, Reg);
}

bool McasmRegisterInfo::isFixedRegister(const MachineFunction &MF,
                                      MCRegister PhysReg) const {
  const McasmSubtarget &ST = MF.getSubtarget<McasmSubtarget>();
  const TargetRegisterInfo &TRI = *ST.getRegisterInfo();

  // Stack pointer.
  if (TRI.isSuperOrSubRegisterEq(Mcasm::RSP, PhysReg))
    return true;

  // Don't use the frame pointer if it's being used.
  const McasmFrameLowering &TFI = *getFrameLowering(MF);
  if (TFI.hasFP(MF) && TRI.isSuperOrSubRegisterEq(Mcasm::RBP, PhysReg))
    return true;

  return McasmGenRegisterInfo::isFixedRegister(MF, PhysReg);
}

bool McasmRegisterInfo::isTileRegisterClass(const TargetRegisterClass *RC) const {
  return RC->getID() == Mcasm::TILERegClassID;
}

void McasmRegisterInfo::adjustStackMapLiveOutMask(uint32_t *Mask) const {
  // Check if the EFLAGS register is marked as live-out. This shouldn't happen,
  // because the calling convention defines the EFLAGS register as NOT
  // preserved.
  //
  // Unfortunatelly the EFLAGS show up as live-out after branch folding. Adding
  // an assert to track this and clear the register afterwards to avoid
  // unnecessary crashes during release builds.
  assert(!(Mask[Mcasm::EFLAGS / 32] & (1U << (Mcasm::EFLAGS % 32))) &&
         "EFLAGS are not live-out from a patchpoint.");

  // Also clean other registers that don't need preserving (IP).
  for (auto Reg : {Mcasm::EFLAGS, Mcasm::RIP, Mcasm::EIP, Mcasm::IP})
    Mask[Reg / 32] &= ~(1U << (Reg % 32));
}

//===----------------------------------------------------------------------===//
// Stack Frame Processing methods
//===----------------------------------------------------------------------===//

static bool CantUseSP(const MachineFrameInfo &MFI) {
  return MFI.hasVarSizedObjects() || MFI.hasOpaqueSPAdjustment();
}

bool McasmRegisterInfo::hasBasePointer(const MachineFunction &MF) const {
  const McasmMachineFunctionInfo *McasmFI = MF.getInfo<McasmMachineFunctionInfo>();
  // We have a virtual register to reference argument, and don't need base
  // pointer.
  if (McasmFI->getStackPtrSaveMI() != nullptr)
    return false;

  if (McasmFI->hasPreallocatedCall())
    return true;

  const MachineFrameInfo &MFI = MF.getFrameInfo();

  if (!EnableBasePointer)
    return false;

  // When we need stack realignment, we can't address the stack from the frame
  // pointer.  When we have dynamic allocas or stack-adjusting inline asm, we
  // can't address variables from the stack pointer.  MS inline asm can
  // reference locals while also adjusting the stack pointer.  When we can't
  // use both the SP and the FP, we need a separate base pointer register.
  bool CantUseFP = hasStackRealignment(MF);
  return CantUseFP && CantUseSP(MFI);
}

bool McasmRegisterInfo::canRealignStack(const MachineFunction &MF) const {
  if (!TargetRegisterInfo::canRealignStack(MF))
    return false;

  const MachineFrameInfo &MFI = MF.getFrameInfo();
  const MachineRegisterInfo *MRI = &MF.getRegInfo();

  // Stack realignment requires a frame pointer.  If we already started
  // register allocation with frame pointer elimination, it is too late now.
  if (!MRI->canReserveReg(FramePtr))
    return false;

  // If a base pointer is necessary.  Check that it isn't too late to reserve
  // it.
  if (CantUseSP(MFI))
    return MRI->canReserveReg(BasePtr);
  return true;
}

bool McasmRegisterInfo::shouldRealignStack(const MachineFunction &MF) const {
  if (TargetRegisterInfo::shouldRealignStack(MF))
    return true;

  return !Is64Bit && MF.getFunction().getCallingConv() == CallingConv::Mcasm_INTR;
}

// tryOptimizeLEAtoMOV - helper function that tries to replace a LEA instruction
// of the form 'lea (%esp), %ebx' --> 'mov %esp, %ebx'.
// TODO: In this case we should be really trying first to entirely eliminate
// this instruction which is a plain copy.
static bool tryOptimizeLEAtoMOV(MachineBasicBlock::iterator II) {
  MachineInstr &MI = *II;
  unsigned Opc = II->getOpcode();
  // Check if this is a LEA of the form 'lea (%esp), %ebx'
  if ((Opc != Mcasm::LEA32r && Opc != Mcasm::LEA64r && Opc != Mcasm::LEA64_32r) ||
      MI.getOperand(2).getImm() != 1 ||
      MI.getOperand(3).getReg() != Mcasm::NoRegister ||
      MI.getOperand(4).getImm() != 0 ||
      MI.getOperand(5).getReg() != Mcasm::NoRegister)
    return false;
  Register BasePtr = MI.getOperand(1).getReg();
  // In X32 mode, ensure the base-pointer is a 32-bit operand, so the LEA will
  // be replaced with a 32-bit operand MOV which will zero extend the upper
  // 32-bits of the super register.
  if (Opc == Mcasm::LEA64_32r)
    BasePtr = getMcasmSubSuperRegister(BasePtr, 32);
  Register NewDestReg = MI.getOperand(0).getReg();
  const McasmInstrInfo *TII =
      MI.getParent()->getParent()->getSubtarget<McasmSubtarget>().getInstrInfo();
  TII->copyPhysReg(*MI.getParent(), II, MI.getDebugLoc(), NewDestReg, BasePtr,
                   MI.getOperand(1).isKill());
  MI.eraseFromParent();
  return true;
}

static bool isFuncletReturnInstr(MachineInstr &MI) {
  switch (MI.getOpcode()) {
  case Mcasm::CATCHRET:
  case Mcasm::CLEANUPRET:
    return true;
  default:
    return false;
  }
  llvm_unreachable("impossible");
}

void McasmRegisterInfo::eliminateFrameIndex(MachineBasicBlock::iterator II,
                                          unsigned FIOperandNum,
                                          Register BaseReg,
                                          int FIOffset) const {
  MachineInstr &MI = *II;
  unsigned Opc = MI.getOpcode();
  if (Opc == TargetOpcode::LOCAL_ESCAPE) {
    MachineOperand &FI = MI.getOperand(FIOperandNum);
    FI.ChangeToImmediate(FIOffset);
    return;
  }

  MI.getOperand(FIOperandNum).ChangeToRegister(BaseReg, false);

  // The frame index format for stackmaps and patchpoints is different from the
  // Mcasm format. It only has a FI and an offset.
  if (Opc == TargetOpcode::STACKMAP || Opc == TargetOpcode::PATCHPOINT) {
    assert(BasePtr == FramePtr && "Expected the FP as base register");
    int64_t Offset = MI.getOperand(FIOperandNum + 1).getImm() + FIOffset;
    MI.getOperand(FIOperandNum + 1).ChangeToImmediate(Offset);
    return;
  }

  if (MI.getOperand(FIOperandNum + 3).isImm()) {
    // Offset is a 32-bit integer.
    int Imm = (int)(MI.getOperand(FIOperandNum + 3).getImm());
    int Offset = FIOffset + Imm;
    assert((!Is64Bit || isInt<32>((long long)FIOffset + Imm)) &&
           "Requesting 64-bit offset in 32-bit immediate!");
    if (Offset != 0)
      MI.getOperand(FIOperandNum + 3).ChangeToImmediate(Offset);
  } else {
    // Offset is symbolic. This is extremely rare.
    uint64_t Offset =
        FIOffset + (uint64_t)MI.getOperand(FIOperandNum + 3).getOffset();
    MI.getOperand(FIOperandNum + 3).setOffset(Offset);
  }
}

bool
McasmRegisterInfo::eliminateFrameIndex(MachineBasicBlock::iterator II,
                                     int SPAdj, unsigned FIOperandNum,
                                     RegScavenger *RS) const {
  MachineInstr &MI = *II;
  MachineBasicBlock &MBB = *MI.getParent();
  MachineFunction &MF = *MBB.getParent();
  MachineBasicBlock::iterator MBBI = MBB.getFirstTerminator();
  bool IsEHFuncletEpilogue = MBBI == MBB.end() ? false
                                               : isFuncletReturnInstr(*MBBI);
  const McasmFrameLowering *TFI = getFrameLowering(MF);
  int FrameIndex = MI.getOperand(FIOperandNum).getIndex();

  // Determine base register and offset.
  int64_t FIOffset;
  Register BasePtr;
  if (MI.isReturn()) {
    assert((!hasStackRealignment(MF) ||
            MF.getFrameInfo().isFixedObjectIndex(FrameIndex)) &&
           "Return instruction can only reference SP relative frame objects");
    FIOffset =
        TFI->getFrameIndexReferenceSP(MF, FrameIndex, BasePtr, 0).getFixed();
  } else if (TFI->Is64Bit && (MBB.isEHFuncletEntry() || IsEHFuncletEpilogue)) {
    FIOffset = TFI->getWin64EHFrameIndexRef(MF, FrameIndex, BasePtr);
  } else {
    FIOffset = TFI->getFrameIndexReference(MF, FrameIndex, BasePtr).getFixed();
  }

  // LOCAL_ESCAPE uses a single offset, with no register. It only works in the
  // simple FP case, and doesn't work with stack realignment. On 32-bit, the
  // offset is from the traditional base pointer location.  On 64-bit, the
  // offset is from the SP at the end of the prologue, not the FP location. This
  // matches the behavior of llvm.frameaddress.
  unsigned Opc = MI.getOpcode();
  if (Opc == TargetOpcode::LOCAL_ESCAPE) {
    MachineOperand &FI = MI.getOperand(FIOperandNum);
    FI.ChangeToImmediate(FIOffset);
    return false;
  }

  // For LEA64_32r when BasePtr is 32-bits (X32) we can use full-size 64-bit
  // register as source operand, semantic is the same and destination is
  // 32-bits. It saves one byte per lea in code since 0x67 prefix is avoided.
  // Don't change BasePtr since it is used later for stack adjustment.
  Register MachineBasePtr = BasePtr;
  if (Opc == Mcasm::LEA64_32r && Mcasm::GR32RegClass.contains(BasePtr))
    MachineBasePtr = getMcasmSubSuperRegister(BasePtr, 64);

  // This must be part of a four operand memory reference.  Replace the
  // FrameIndex with base register.  Add an offset to the offset.
  MI.getOperand(FIOperandNum).ChangeToRegister(MachineBasePtr, false);

  if (BasePtr == StackPtr)
    FIOffset += SPAdj;

  // The frame index format for stackmaps and patchpoints is different from the
  // Mcasm format. It only has a FI and an offset.
  if (Opc == TargetOpcode::STACKMAP || Opc == TargetOpcode::PATCHPOINT) {
    assert(BasePtr == FramePtr && "Expected the FP as base register");
    int64_t Offset = MI.getOperand(FIOperandNum + 1).getImm() + FIOffset;
    MI.getOperand(FIOperandNum + 1).ChangeToImmediate(Offset);
    return false;
  }

  if (MI.getOperand(FIOperandNum+3).isImm()) {
    const McasmInstrInfo *TII = MF.getSubtarget<McasmSubtarget>().getInstrInfo();
    const DebugLoc &DL = MI.getDebugLoc();
    int64_t Imm = MI.getOperand(FIOperandNum + 3).getImm();
    int64_t Offset = FIOffset + Imm;
    bool FitsIn32Bits = isInt<32>(Offset);
    // If the offset will not fit in a 32-bit displacement, then for 64-bit
    // targets, scavenge a register to hold it. Otherwise...
    if (Is64Bit && !FitsIn32Bits) {
      assert(RS && "RegisterScavenger was NULL");

      RS->enterBasicBlockEnd(MBB);
      RS->backward(std::next(II));

      Register ScratchReg = RS->scavengeRegisterBackwards(
          Mcasm::GR64RegClass, II, /*RestoreAfter=*/false, /*SPAdj=*/0,
          /*AllowSpill=*/true);
      assert(ScratchReg != 0 && "scratch reg was 0");
      RS->setRegUsed(ScratchReg);

      BuildMI(MBB, II, DL, TII->get(Mcasm::MOV64ri), ScratchReg).addImm(Offset);

      MI.getOperand(FIOperandNum + 3).setImm(0);
      MI.getOperand(FIOperandNum + 2).setReg(ScratchReg);

      return false;
    }

    // ... for 32-bit targets, this is a bug!
    if (!Is64Bit && !FitsIn32Bits) {
      MI.emitGenericError("64-bit offset calculated but target is 32-bit");
      // Trap so that the instruction verification pass does not fail if run.
      BuildMI(MBB, MBBI, DL, TII->get(Mcasm::TRAP));
      return false;
    }

    if (Offset != 0 || !tryOptimizeLEAtoMOV(II))
      MI.getOperand(FIOperandNum + 3).ChangeToImmediate(Offset);
  } else {
    // Offset is symbolic. This is extremely rare.
    uint64_t Offset = FIOffset +
      (uint64_t)MI.getOperand(FIOperandNum+3).getOffset();
    MI.getOperand(FIOperandNum + 3).setOffset(Offset);
  }
  return false;
}

unsigned McasmRegisterInfo::findDeadCallerSavedReg(
    MachineBasicBlock &MBB, MachineBasicBlock::iterator &MBBI) const {
  const MachineFunction *MF = MBB.getParent();
  const MachineRegisterInfo &MRI = MF->getRegInfo();
  if (MF->callsEHReturn())
    return 0;

  if (MBBI == MBB.end())
    return 0;

  switch (MBBI->getOpcode()) {
  default:
    return 0;
  case TargetOpcode::PATCHABLE_RET:
  case Mcasm::RET:
  case Mcasm::RET32:
  case Mcasm::RET64:
  case Mcasm::RETI32:
  case Mcasm::RETI64:
  case Mcasm::TCRETURNdi:
  case Mcasm::TCRETURNri:
  case Mcasm::TCRETURN_WIN64ri:
  case Mcasm::TCRETURN_HIPE32ri:
  case Mcasm::TCRETURNmi:
  case Mcasm::TCRETURNdi64:
  case Mcasm::TCRETURNri64:
  case Mcasm::TCRETURNri64_ImpCall:
  case Mcasm::TCRETURNmi64:
  case Mcasm::TCRETURN_WINmi64:
  case Mcasm::EH_RETURN:
  case Mcasm::EH_RETURN64: {
    LiveRegUnits LRU(*this);
    LRU.addLiveOuts(MBB);
    LRU.stepBackward(*MBBI);

    const TargetRegisterClass &RC =
        Is64Bit ? Mcasm::GR64_NOSPRegClass : Mcasm::GR32_NOSPRegClass;
    for (MCRegister Reg : RC) {
      if (LRU.available(Reg) && !MRI.isReserved(Reg))
        return Reg;
    }
  }
  }

  return 0;
}

Register McasmRegisterInfo::getFrameRegister(const MachineFunction &MF) const {
  const McasmFrameLowering *TFI = getFrameLowering(MF);
  return TFI->hasFP(MF) ? FramePtr : StackPtr;
}

Register
McasmRegisterInfo::getPtrSizedFrameRegister(const MachineFunction &MF) const {
  const McasmSubtarget &Subtarget = MF.getSubtarget<McasmSubtarget>();
  Register FrameReg = getFrameRegister(MF);
  if (Subtarget.isTarget64BitILP32())
    FrameReg = getMcasmSubSuperRegister(FrameReg, 32);
  return FrameReg;
}

Register
McasmRegisterInfo::getPtrSizedStackRegister(const MachineFunction &MF) const {
  const McasmSubtarget &Subtarget = MF.getSubtarget<McasmSubtarget>();
  Register StackReg = getStackRegister();
  if (Subtarget.isTarget64BitILP32())
    StackReg = getMcasmSubSuperRegister(StackReg, 32);
  return StackReg;
}

static ShapeT getTileShape(Register VirtReg, VirtRegMap *VRM,
                           const MachineRegisterInfo *MRI) {
  if (VRM->hasShape(VirtReg))
    return VRM->getShape(VirtReg);

  const MachineOperand &Def = *MRI->def_begin(VirtReg);
  MachineInstr *MI = const_cast<MachineInstr *>(Def.getParent());
  unsigned OpCode = MI->getOpcode();
  switch (OpCode) {
  default:
    llvm_unreachable("Unexpected machine instruction on tile register!");
    break;
  case Mcasm::COPY: {
    Register SrcReg = MI->getOperand(1).getReg();
    ShapeT Shape = getTileShape(SrcReg, VRM, MRI);
    VRM->assignVirt2Shape(VirtReg, Shape);
    return Shape;
  }
  // We only collect the tile shape that is defined.
  case Mcasm::PTILELOADDV:
  case Mcasm::PTILELOADDT1V:
  case Mcasm::PTDPBSSDV:
  case Mcasm::PTDPBSUDV:
  case Mcasm::PTDPBUSDV:
  case Mcasm::PTDPBUUDV:
  case Mcasm::PTILEZEROV:
  case Mcasm::PTDPBF16PSV:
  case Mcasm::PTDPFP16PSV:
  case Mcasm::PTCMMIMFP16PSV:
  case Mcasm::PTCMMRLFP16PSV:
  case Mcasm::PTILELOADDRSV:
  case Mcasm::PTILELOADDRST1V:
  case Mcasm::PTMMULTF32PSV:
  case Mcasm::PTDPBF8PSV:
  case Mcasm::PTDPBHF8PSV:
  case Mcasm::PTDPHBF8PSV:
  case Mcasm::PTDPHF8PSV: {
    MachineOperand &MO1 = MI->getOperand(1);
    MachineOperand &MO2 = MI->getOperand(2);
    ShapeT Shape(&MO1, &MO2, MRI);
    VRM->assignVirt2Shape(VirtReg, Shape);
    return Shape;
  }
  }
}

bool McasmRegisterInfo::getRegAllocationHints(Register VirtReg,
                                            ArrayRef<MCPhysReg> Order,
                                            SmallVectorImpl<MCPhysReg> &Hints,
                                            const MachineFunction &MF,
                                            const VirtRegMap *VRM,
                                            const LiveRegMatrix *Matrix) const {
  const MachineRegisterInfo *MRI = &MF.getRegInfo();
  const TargetRegisterClass &RC = *MRI->getRegClass(VirtReg);
  bool BaseImplRetVal = TargetRegisterInfo::getRegAllocationHints(
      VirtReg, Order, Hints, MF, VRM, Matrix);
  const McasmSubtarget &ST = MF.getSubtarget<McasmSubtarget>();
  const TargetRegisterInfo &TRI = *ST.getRegisterInfo();

  unsigned ID = RC.getID();

  if (!VRM)
    return BaseImplRetVal;

  if (ID != Mcasm::TILERegClassID) {
    if (DisableRegAllocNDDHints || !ST.hasNDD() ||
        !TRI.isGeneralPurposeRegisterClass(&RC))
      return BaseImplRetVal;

    // Add any two address hints after any copy hints.
    SmallSet<unsigned, 4> TwoAddrHints;

    auto TryAddNDDHint = [&](const MachineOperand &MO) {
      Register Reg = MO.getReg();
      Register PhysReg = Reg.isPhysical() ? Reg : Register(VRM->getPhys(Reg));
      if (PhysReg && !MRI->isReserved(PhysReg) && !is_contained(Hints, PhysReg))
        TwoAddrHints.insert(PhysReg);
    };

    // NDD instructions is compressible when Op0 is allocated to the same
    // physic register as Op1 (or Op2 if it's commutable).
    for (auto &MO : MRI->reg_nodbg_operands(VirtReg)) {
      const MachineInstr &MI = *MO.getParent();
      if (!Mcasm::getNonNDVariant(MI.getOpcode()))
        continue;
      unsigned OpIdx = MI.getOperandNo(&MO);
      if (OpIdx == 0) {
        assert(MI.getOperand(1).isReg());
        TryAddNDDHint(MI.getOperand(1));
        if (MI.isCommutable()) {
          assert(MI.getOperand(2).isReg());
          TryAddNDDHint(MI.getOperand(2));
        }
      } else if (OpIdx == 1) {
        TryAddNDDHint(MI.getOperand(0));
      } else if (MI.isCommutable() && OpIdx == 2) {
        TryAddNDDHint(MI.getOperand(0));
      }
    }

    for (MCPhysReg OrderReg : Order)
      if (TwoAddrHints.count(OrderReg))
        Hints.push_back(OrderReg);

    return BaseImplRetVal;
  }

  ShapeT VirtShape = getTileShape(VirtReg, const_cast<VirtRegMap *>(VRM), MRI);
  auto AddHint = [&](MCPhysReg PhysReg) {
    Register VReg = Matrix->getOneVReg(PhysReg);
    if (VReg == MCRegister::NoRegister) { // Not allocated yet
      Hints.push_back(PhysReg);
      return;
    }
    ShapeT PhysShape = getTileShape(VReg, const_cast<VirtRegMap *>(VRM), MRI);
    if (PhysShape == VirtShape)
      Hints.push_back(PhysReg);
  };

  SmallSet<MCPhysReg, 4> CopyHints(llvm::from_range, Hints);
  Hints.clear();
  for (auto Hint : CopyHints) {
    if (RC.contains(Hint) && !MRI->isReserved(Hint))
      AddHint(Hint);
  }
  for (MCPhysReg PhysReg : Order) {
    if (!CopyHints.count(PhysReg) && RC.contains(PhysReg) &&
        !MRI->isReserved(PhysReg))
      AddHint(PhysReg);
  }

#define DEBUG_TYPE "tile-hint"
  LLVM_DEBUG({
    dbgs() << "Hints for virtual register " << format_hex(VirtReg, 8) << "\n";
    for (auto Hint : Hints) {
      dbgs() << "tmm" << Hint << ",";
    }
    dbgs() << "\n";
  });
#undef DEBUG_TYPE

  return true;
}

const TargetRegisterClass *McasmRegisterInfo::constrainRegClassToNonRex2(
    const TargetRegisterClass *RC) const {
  switch (RC->getID()) {
  default:
    return RC;
  case Mcasm::GR8RegClassID:
    return &Mcasm::GR8_NOREX2RegClass;
  case Mcasm::GR16RegClassID:
    return &Mcasm::GR16_NOREX2RegClass;
  case Mcasm::GR32RegClassID:
    return &Mcasm::GR32_NOREX2RegClass;
  case Mcasm::GR64RegClassID:
    return &Mcasm::GR64_NOREX2RegClass;
  case Mcasm::GR32_NOSPRegClassID:
    return &Mcasm::GR32_NOREX2_NOSPRegClass;
  case Mcasm::GR64_NOSPRegClassID:
    return &Mcasm::GR64_NOREX2_NOSPRegClass;
  }
}

bool McasmRegisterInfo::isNonRex2RegClass(const TargetRegisterClass *RC) const {
  switch (RC->getID()) {
  default:
    return false;
  case Mcasm::GR8_NOREX2RegClassID:
  case Mcasm::GR16_NOREX2RegClassID:
  case Mcasm::GR32_NOREX2RegClassID:
  case Mcasm::GR64_NOREX2RegClassID:
  case Mcasm::GR32_NOREX2_NOSPRegClassID:
  case Mcasm::GR64_NOREX2_NOSPRegClassID:
  case Mcasm::GR64_with_sub_16bit_in_GR16_NOREX2RegClassID:
    return true;
  }
}
