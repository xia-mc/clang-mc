//===-- McasmInstrInfo.cpp - Mcasm Instruction Information ----------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file contains the Mcasm implementation of the TargetInstrInfo class.
//
// MCASM NOTE: This is a minimal rewrite for the mcasm backend, which is a
// simplified 32-bit integer-only architecture. Only essential instruction
// operations are implemented.
//
//===----------------------------------------------------------------------===//

#include "McasmInstrInfo.h"
#include "Mcasm.h"
#include "McasmInstrBuilder.h"
#include "McasmSubtarget.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"

using namespace llvm;

#define GET_INSTRINFO_CTOR_DTOR
#include "McasmGenInstrInfo.inc"

McasmInstrInfo::McasmInstrInfo(const McasmSubtarget &STI)
    : McasmGenInstrInfo(Mcasm::ADJCALLSTACKDOWN32, Mcasm::ADJCALLSTACKUP32),
      RI(STI.getRegisterInfo()) {}

void McasmInstrInfo::copyPhysReg(MachineBasicBlock &MBB,
                                 MachineBasicBlock::iterator MI,
                                 const DebugLoc &DL, MCRegister DestReg,
                                 MCRegister SrcReg, bool KillSrc) const {
  // mcasm only has 32-bit registers, use MOV32rr
  assert(Mcasm::GR32RegClass.contains(DestReg, SrcReg) &&
         "Invalid register for mcasm copyPhysReg");

  BuildMI(MBB, MI, DL, get(Mcasm::MOV32rr), DestReg)
      .addReg(SrcReg, getKillRegState(KillSrc));
}

void McasmInstrInfo::storeRegToStackSlot(MachineBasicBlock &MBB,
                                         MachineBasicBlock::iterator MI,
                                         Register SrcReg, bool isKill,
                                         int FrameIndex,
                                         const TargetRegisterClass *RC,
                                         const TargetRegisterInfo *TRI,
                                         Register VReg) const {
  const DebugLoc &DL = MBB.findDebugLoc(MI);

  // mcasm only supports 32-bit registers
  assert(RC == &Mcasm::GR32RegClass && "Unsupported register class for mcasm");

  // Generate: MOV [FI], SrcReg
  // Note: FrameIndex will be resolved to rsp+offset later by FrameLowering
  addFrameReference(BuildMI(MBB, MI, DL, get(Mcasm::MOV32mr)), FrameIndex)
      .addReg(SrcReg, getKillRegState(isKill));
}

void McasmInstrInfo::loadRegFromStackSlot(MachineBasicBlock &MBB,
                                          MachineBasicBlock::iterator MI,
                                          Register DestReg, int FrameIndex,
                                          const TargetRegisterClass *RC,
                                          const TargetRegisterInfo *TRI,
                                          Register VReg) const {
  const DebugLoc &DL = MBB.findDebugLoc(MI);

  // mcasm only supports 32-bit registers
  assert(RC == &Mcasm::GR32RegClass && "Unsupported register class for mcasm");

  // Generate: MOV DestReg, [FI]
  // Note: FrameIndex will be resolved to rsp+offset later by FrameLowering
  addFrameReference(BuildMI(MBB, MI, DL, get(Mcasm::MOV32rm), DestReg),
                    FrameIndex);
}
