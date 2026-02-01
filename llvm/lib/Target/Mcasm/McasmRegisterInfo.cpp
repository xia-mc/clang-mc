//===-- McasmRegisterInfo.cpp - Mcasm Register Information ----------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file contains the Mcasm implementation of the TargetRegisterInfo class.
//
// MCASM NOTE: This is a minimal rewrite for the mcasm backend, which is a
// simplified 32-bit integer-only architecture. The key responsibility here
// is eliminateFrameIndex, which converts BYTE offsets to mcasm UNITS.
//
//===----------------------------------------------------------------------===//

#include "McasmRegisterInfo.h"
#include "Mcasm.h"
#include "McasmFrameLowering.h"
#include "McasmSubtarget.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/Support/ErrorHandling.h"

using namespace llvm;

#define GET_REGINFO_TARGET_DESC
#include "McasmGenRegisterInfo.inc"

McasmRegisterInfo::McasmRegisterInfo(const Triple &TT)
    : McasmGenRegisterInfo(Mcasm::rax) {}

const TargetRegisterClass *
McasmRegisterInfo::getPointerRegClass(const MachineFunction &MF,
                                      unsigned Kind) const {
  // mcasm uses 32-bit pointers (GR32)
  return &Mcasm::GR32RegClass;
}

const MCPhysReg *
McasmRegisterInfo::getCalleeSavedRegs(const MachineFunction *MF) const {
  // Callee-saved registers: x0-x15 (defined in McasmCallingConv.td)
  // This is handled by CSR_Mcasm_32 in TableGen
  return CSR_Mcasm_32_SaveList;
}

BitVector
McasmRegisterInfo::getReservedRegs(const MachineFunction &MF) const {
  BitVector Reserved(getNumRegs());

  // Reserve stack pointer
  Reserved.set(Mcasm::rsp);

  // Reserve compiler-reserved registers s0-s4
  Reserved.set(Mcasm::s0);
  Reserved.set(Mcasm::s1);
  Reserved.set(Mcasm::s2);
  Reserved.set(Mcasm::s3);
  Reserved.set(Mcasm::s4);

  return Reserved;
}

bool McasmRegisterInfo::eliminateFrameIndex(MachineBasicBlock::iterator II,
                                            int SPAdj, unsigned FIOperandNum,
                                            RegScavenger *RS) const {
  MachineInstr &MI = *II;
  MachineFunction &MF = *MI.getParent()->getParent();
  const MachineFrameInfo &MFI = MF.getFrameInfo();
  const McasmFrameLowering *TFI = static_cast<const McasmFrameLowering *>(
      MF.getSubtarget().getFrameLowering());

  int FrameIndex = MI.getOperand(FIOperandNum).getIndex();

  // Get the frame index reference (in mcasm units)
  Register FrameReg;
  StackOffset Offset = TFI->getFrameIndexReference(MF, FrameIndex, FrameReg);

  // CRITICAL: Offset is already in mcasm units from getFrameIndexReference
  // mcasm uses 4-byte units: [rsp+1] means 4 bytes offset
  int64_t McasmOffset = Offset.getFixed();

  // Replace FrameIndex with FrameReg + McasmOffset
  // The instruction format is: [BaseReg + Scale*IndexReg + Disp + Segment]
  // For mcasm: [rsp + 0*0 + McasmOffset + 0]
  MI.getOperand(FIOperandNum).ChangeToRegister(FrameReg, false);
  MI.getOperand(FIOperandNum + 1).ChangeToImmediate(1);           // Scale = 1
  MI.getOperand(FIOperandNum + 2).ChangeToRegister(0, false);     // IndexReg = 0
  MI.getOperand(FIOperandNum + 3).ChangeToImmediate(McasmOffset); // Displacement
  MI.getOperand(FIOperandNum + 4).ChangeToRegister(0, false);     // Segment = 0

  return false;
}

Register
McasmRegisterInfo::getFrameRegister(const MachineFunction &MF) const {
  // mcasm always uses rsp (no frame pointer)
  return Mcasm::rsp;
}
