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
