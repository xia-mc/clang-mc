//===-- McasmFrameLowering.h - Mcasm Frame Lowering ------------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file defines the interfaces that Mcasm uses for frame lowering.
//
// MCASM NOTE: This is a minimal rewrite for the mcasm backend, which is a
// simplified 32-bit integer-only architecture. Most x86-specific frame
// handling features have been removed.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_MCASM_MCASMFRAMELOWERING_H
#define LLVM_LIB_TARGET_MCASM_MCASMFRAMELOWERING_H

#include "llvm/CodeGen/TargetFrameLowering.h"

namespace llvm {

class MachineFunction;
class McasmInstrInfo;
class McasmRegisterInfo;
class McasmSubtarget;

class McasmFrameLowering : public TargetFrameLowering {
public:
  explicit McasmFrameLowering(const McasmSubtarget &STI);

  /// emitProlog/emitEpilog - Insert prolog/epilog code into the function.
  void emitPrologue(MachineFunction &MF, MachineBasicBlock &MBB) const override;
  void emitEpilogue(MachineFunction &MF, MachineBasicBlock &MBB) const override;

  /// Get frame index reference for accessing stack objects.
  /// CRITICAL: This function converts BYTE offsets from FrameInfo to
  /// mcasm UNITS (divide by 4) when returning references.
  StackOffset getFrameIndexReference(const MachineFunction &MF, int FI,
                                     Register &FrameReg) const override;

  /// Eliminate call frame pseudo instructions.
  MachineBasicBlock::iterator
  eliminateCallFramePseudoInstr(MachineFunction &MF, MachineBasicBlock &MBB,
                                MachineBasicBlock::iterator MI) const override;

  /// Determine which callee-saved registers need to be saved.
  void determineCalleeSaves(MachineFunction &MF, BitVector &SavedRegs,
                            RegScavenger *RS = nullptr) const override;

  /// Spill callee-saved registers (x0-x15).
  bool spillCalleeSavedRegisters(MachineBasicBlock &MBB,
                                 MachineBasicBlock::iterator MI,
                                 ArrayRef<CalleeSavedInfo> CSI,
                                 const TargetRegisterInfo *TRI) const override;

  /// Restore callee-saved registers (x0-x15).
  bool restoreCalleeSavedRegisters(MachineBasicBlock &MBB,
                                   MachineBasicBlock::iterator MI,
                                   MutableArrayRef<CalleeSavedInfo> CSI,
                                   const TargetRegisterInfo *TRI) const override;

  bool hasReservedCallFrame(const MachineFunction &MF) const override;
  bool canSimplifyCallFramePseudos(const MachineFunction &MF) const override;
  bool needsFrameIndexResolution(const MachineFunction &MF) const override;

protected:
  bool hasFPImpl(const MachineFunction &MF) const override;

private:
  const McasmSubtarget &Subtarget;
  const McasmInstrInfo &TII;
  const McasmRegisterInfo *TRI;
};

} // namespace llvm

#endif
