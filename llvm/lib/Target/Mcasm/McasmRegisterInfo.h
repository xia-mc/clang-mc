//===-- McasmRegisterInfo.h - Mcasm Register Information --------*- C++ -*-===//
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
// simplified 32-bit integer-only architecture. Most x86-specific register
// features have been removed.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_MCASM_MCASMREGISTERINFO_H
#define LLVM_LIB_TARGET_MCASM_MCASMREGISTERINFO_H

#include "llvm/CodeGen/TargetRegisterInfo.h"

#define GET_REGINFO_HEADER
#include "McasmGenRegisterInfo.inc"

namespace llvm {

class Triple;

class McasmRegisterInfo final : public McasmGenRegisterInfo {
public:
  explicit McasmRegisterInfo(const Triple &TT);

  /// getPointerRegClass - Returns a TargetRegisterClass used for pointer values.
  const TargetRegisterClass *
  getPointerRegClass(unsigned Kind = 0) const override;

  /// getCalleeSavedRegs - Return callee-saved registers (x0-x15).
  const MCPhysReg *
  getCalleeSavedRegs(const MachineFunction *MF) const override;

  /// getReservedRegs - Return reserved registers (rsp, s0-s4).
  BitVector getReservedRegs(const MachineFunction &MF) const override;

  /// eliminateFrameIndex - Replace FrameIndex with rsp+offset.
  /// CRITICAL: This is where byte offsets are converted to mcasm units.
  bool eliminateFrameIndex(MachineBasicBlock::iterator MI, int SPAdj,
                           unsigned FIOperandNum,
                           RegScavenger *RS = nullptr) const override;

  /// getFrameRegister - Return the frame register (rsp for mcasm).
  Register getFrameRegister(const MachineFunction &MF) const override;

  /// getStackRegister - Return the stack register (rsp).
  unsigned getStackRegister() const;
};

} // namespace llvm

#endif
