//===-- McasmFrameLowering.cpp - Mcasm Frame Lowering --------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file contains the Mcasm implementation of TargetFrameLowering.
//
// MCASM NOTE: Minimal stub implementation for mcasm backend.
//
//===----------------------------------------------------------------------===//

#include "McasmFrameLowering.h"
#include "McasmSubtarget.h"
#include "McasmInstrInfo.h"
#include "McasmRegisterInfo.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/RegisterScavenging.h"

#define GET_REGINFO_ENUM
#include "McasmGenRegisterInfo.inc"

using namespace llvm;

McasmFrameLowering::McasmFrameLowering(const McasmSubtarget &STI)
    : TargetFrameLowering(TargetFrameLowering::StackGrowsDown, Align(4), 0),
      Subtarget(STI), TII(*STI.getInstrInfo()), TRI(STI.getRegisterInfo()) {}

void McasmFrameLowering::emitPrologue(MachineFunction &MF,
                                      MachineBasicBlock &MBB) const {
  // TODO: Implement when we have basic instructions defined
}

void McasmFrameLowering::emitEpilogue(MachineFunction &MF,
                                      MachineBasicBlock &MBB) const {
  // TODO: Implement when we have basic instructions defined
}

bool McasmFrameLowering::needsFrameIndexResolution(const MachineFunction &MF) const {
  return true;  // We need frame index resolution for stack slots
}

bool McasmFrameLowering::hasFPImpl(const MachineFunction &MF) const {
  return false;  // Mcasm doesn't use frame pointer for now
}

StackOffset McasmFrameLowering::getFrameIndexReference(
    const MachineFunction &MF, int FI, Register &FrameReg) const {
  // TODO: Implement when we have basic instructions defined
  // For now, return stack pointer as frame register
  FrameReg = Mcasm::rsp;
  const MachineFrameInfo &MFI = MF.getFrameInfo();
  int64_t ByteOffset = MFI.getObjectOffset(FI);
  // Convert byte offset to mcasm units (divide by 4)
  return StackOffset::getFixed(ByteOffset / 4);
}

MachineBasicBlock::iterator McasmFrameLowering::eliminateCallFramePseudoInstr(
    MachineFunction &MF, MachineBasicBlock &MBB,
    MachineBasicBlock::iterator MI) const {
  // TODO: Implement when we have ADJCALLSTACKDOWN/UP instructions defined
  // For now, just erase the pseudo instruction
  return MBB.erase(MI);
}

void McasmFrameLowering::determineCalleeSaves(MachineFunction &MF,
                                              BitVector &SavedRegs,
                                              RegScavenger *RS) const {
  // TODO: Implement when we have callee-saved register support
  // For now, use parent class default implementation
  TargetFrameLowering::determineCalleeSaves(MF, SavedRegs, RS);
}

bool McasmFrameLowering::spillCalleeSavedRegisters(
    MachineBasicBlock &MBB, MachineBasicBlock::iterator MI,
    ArrayRef<CalleeSavedInfo> CSI, const TargetRegisterInfo *TRI) const {
  // TODO: Implement when we have MOV and stack instructions
  // For now, return false (use default spilling)
  return false;
}

bool McasmFrameLowering::restoreCalleeSavedRegisters(
    MachineBasicBlock &MBB, MachineBasicBlock::iterator MI,
    MutableArrayRef<CalleeSavedInfo> CSI,
    const TargetRegisterInfo *TRI) const {
  // TODO: Implement when we have MOV and stack instructions
  // For now, return false (use default restoring)
  return false;
}

bool McasmFrameLowering::hasReservedCallFrame(const MachineFunction &MF) const {
  // Return true if we always reserve space for the call frame
  return !MF.getFrameInfo().hasVarSizedObjects();
}

bool McasmFrameLowering::canSimplifyCallFramePseudos(
    const MachineFunction &MF) const {
  // We can simplify call frame pseudos if we have a reserved call frame
  return hasReservedCallFrame(MF);
}
