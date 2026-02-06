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
// MCASM NOTE: Minimal stub implementation for mcasm backend.
//
//===----------------------------------------------------------------------===//

#include "McasmInstrInfo.h"
#include "Mcasm.h"
#include "McasmSubtarget.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/Support/ErrorHandling.h"

using namespace llvm;

#define GET_REGINFO_ENUM
#include "McasmGenRegisterInfo.inc"

#define GET_INSTRINFO_ENUM
#include "McasmGenInstrInfo.inc"

#define GET_INSTRINFO_CTOR_DTOR
#include "McasmGenInstrInfo.inc"

// Forward declaration
static MachineInstrBuilder &addFrameReference(MachineInstrBuilder &MIB,
                                                int FI, int Offset = 0);

McasmInstrInfo::McasmInstrInfo(const McasmSubtarget &STI)
    : McasmGenInstrInfo(STI, *STI.getRegisterInfo(), -1, -1, -1, -1),
      RI(*STI.getRegisterInfo()) {}

void McasmInstrInfo::copyPhysReg(MachineBasicBlock &MBB,
                                 MachineBasicBlock::iterator MI,
                                 const DebugLoc &DL, Register DestReg,
                                 Register SrcReg, bool KillSrc,
                                 bool RenamableDest, bool RenamableSrc) const {
  // Use MOV32rr for 32-bit register copies
  BuildMI(MBB, MI, DL, get(Mcasm::MOV32rr), DestReg)
      .addReg(SrcReg, getKillRegState(KillSrc));
}

void McasmInstrInfo::storeRegToStackSlot(MachineBasicBlock &MBB,
                                         MachineBasicBlock::iterator MI,
                                         Register SrcReg, bool isKill,
                                         int FrameIndex,
                                         const TargetRegisterClass *RC,
                                         Register VReg,
                                         MachineInstr::MIFlag Flags) const {
  DebugLoc DL;
  if (MI != MBB.end()) DL = MI->getDebugLoc();

  // Use MOV32mr to store register to stack
  MachineInstrBuilder MIB = BuildMI(MBB, MI, DL, get(Mcasm::MOV32mr))
                                .setMIFlag(Flags);
  addFrameReference(MIB, FrameIndex)
      .addReg(SrcReg, getKillRegState(isKill));
}

void McasmInstrInfo::loadRegFromStackSlot(MachineBasicBlock &MBB,
                                          MachineBasicBlock::iterator MI,
                                          Register DestReg, int FrameIndex,
                                          const TargetRegisterClass *RC,
                                          Register VReg, unsigned SubReg,
                                          MachineInstr::MIFlag Flags) const {
  DebugLoc DL;
  if (MI != MBB.end()) DL = MI->getDebugLoc();

  // Use MOV32rm to load from stack to register
  MachineInstrBuilder MIB = BuildMI(MBB, MI, DL, get(Mcasm::MOV32rm), DestReg)
                                .setMIFlag(Flags);
  addFrameReference(MIB, FrameIndex);
}

// Helper function to add frame index operands
static MachineInstrBuilder &addFrameReference(MachineInstrBuilder &MIB,
                                                int FI, int Offset) {
  // Add frame reference in X86 addressing mode format:
  // BaseReg + ScaleReg*Scale + Offset + SegmentReg
  MIB.addFrameIndex(FI)  // BaseReg
      .addImm(1)          // Scale
      .addReg(0)          // IndexReg
      .addImm(Offset)     // Displacement
      .addReg(0);         // SegmentReg
  return MIB;
}
