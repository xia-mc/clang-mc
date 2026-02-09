//===-- McasmFrameLowering.cpp - Mcasm Frame Lowering --------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file contains the Mcasm implementation of TargetFrameLowering class.
//
// MCASM NOTE: This is a minimal rewrite for the mcasm backend, which is a
// simplified 32-bit integer-only architecture. The key difference from x86 is
// that mcasm uses 4-BYTE MEMORY UNITS instead of byte addressing.
//
// CRITICAL MEMORY OFFSET HANDLING:
// - LLVM FrameInfo stores all offsets in BYTES
// - mcasm memory addressing uses 4-BYTE UNITS (e.g., [rsp+1] = 4 bytes offset)
// - This file is responsible for converting byte offsets to mcasm units
// - Conversion happens in getFrameIndexReference and emitPrologue/Epilogue
//
//===----------------------------------------------------------------------===//

#include "McasmFrameLowering.h"
#include "McasmInstrBuilder.h"
#include "McasmInstrInfo.h"
#include "McasmMachineFunctionInfo.h"
#include "McasmSubtarget.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineModuleInfo.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/ErrorHandling.h"

using namespace llvm;

McasmFrameLowering::McasmFrameLowering(const McasmSubtarget &STI)
    : TargetFrameLowering(StackGrowsDown, Align(4), -4),
      Subtarget(STI), TII(*STI.getInstrInfo()), TRI(STI.getRegisterInfo()) {
  // mcasm uses 4-byte stack alignment and 32-bit addressing
}

void McasmFrameLowering::emitPrologue(MachineFunction &MF,
                                      MachineBasicBlock &MBB) const {
  MachineFrameInfo &MFI = MF.getFrameInfo();
  const DebugLoc &DL = MBB.findDebugLoc(MBB.begin());
  MachineBasicBlock::iterator MBBI = MBB.begin();

  // Calculate stack size in BYTES (from FrameInfo)
  uint64_t StackSizeBytes = MFI.getStackSize();

  // Align to 4 bytes
  StackSizeBytes = alignTo(StackSizeBytes, 4);

  // CRITICAL: Convert BYTES to mcasm UNITS (divide by 4)
  // mcasm uses 4-byte units: [rsp+1] means 4 bytes offset
  assert(StackSizeBytes % 4 == 0 && "Stack size must be 4-byte aligned");
  uint64_t StackSizeMcasmUnits = StackSizeBytes / 4;

  // Check mcasm stack limit: 1KB = 256 mcasm units
  if (StackSizeMcasmUnits > 256) {
    report_fatal_error("Stack size exceeds mcasm 1KB limit (256 units)");
  }

  // Allocate stack space: SUB rsp, StackSizeMcasmUnits
  if (StackSizeMcasmUnits > 0) {
    BuildMI(MBB, MBBI, DL, TII.get(Mcasm::SUB32ri), Mcasm::rsp)
        .addReg(Mcasm::rsp)
        .addImm(StackSizeMcasmUnits);
  }

  // Note: Callee-saved register spilling is handled by
  // spillCalleeSavedRegisters(), called separately by the framework
}

void McasmFrameLowering::emitEpilogue(MachineFunction &MF,
                                      MachineBasicBlock &MBB) const {
  MachineFrameInfo &MFI = MF.getFrameInfo();
  MachineBasicBlock::iterator MBBI = MBB.getFirstTerminator();
  const DebugLoc &DL = MBBI != MBB.end() ? MBBI->getDebugLoc() : DebugLoc();

  // Calculate stack size in BYTES
  uint64_t StackSizeBytes = MFI.getStackSize();
  StackSizeBytes = alignTo(StackSizeBytes, 4);

  // CRITICAL: Convert to mcasm UNITS
  uint64_t StackSizeMcasmUnits = StackSizeBytes / 4;

  // Deallocate stack space: ADD rsp, StackSizeMcasmUnits
  if (StackSizeMcasmUnits > 0) {
    BuildMI(MBB, MBBI, DL, TII.get(Mcasm::ADD32ri), Mcasm::rsp)
        .addReg(Mcasm::rsp)
        .addImm(StackSizeMcasmUnits);
  }

  // Note: Callee-saved register restoration is handled by
  // restoreCalleeSavedRegisters(), called separately by the framework
}

StackOffset McasmFrameLowering::getFrameIndexReference(
    const MachineFunction &MF, int FI, Register &FrameReg) const {
  const MachineFrameInfo &MFI = MF.getFrameInfo();

  // mcasm always uses rsp (no frame pointer)
  FrameReg = Mcasm::rsp;

  // CRITICAL: FrameInfo stores offsets in BYTES
  // We need to convert to mcasm UNITS (divide by 4)
  int64_t ByteOffset = MFI.getObjectOffset(FI);

  // Verify 4-byte alignment
  assert(ByteOffset % 4 == 0 && "Frame object offset must be 4-byte aligned");

  // Convert to mcasm units
  // NOTE: Negative offsets for local variables (stack grows down)
  // The offset is relative to rsp AFTER stack allocation
  int64_t McasmOffset = ByteOffset / 4;

  // For stack arguments (positive FI), offset is from the caller's frame
  // For local variables (negative FI), offset is from current rsp
  if (MFI.isFixedObjectIndex(FI)) {
    // Stack argument: offset from rsp + stack size
    uint64_t StackSize = MFI.getStackSize();
    StackSize = alignTo(StackSize, 4);
    int64_t StackSizeMcasmUnits = StackSize / 4;
    McasmOffset = StackSizeMcasmUnits + McasmOffset / 4;
  } else {
    // Local variable: offset is already correct (negative from rsp)
    // Make it positive for [rsp+N] syntax
    McasmOffset = -McasmOffset;
  }

  return StackOffset::getFixed(McasmOffset);
}

MachineBasicBlock::iterator McasmFrameLowering::eliminateCallFramePseudoInstr(
    MachineFunction &MF, MachineBasicBlock &MBB,
    MachineBasicBlock::iterator MI) const {
  // For mcasm, we handle call frames explicitly in LowerCall
  // Just remove the pseudo instructions
  unsigned Opcode = MI->getOpcode();
  assert((Opcode == Mcasm::ADJCALLSTACKDOWN32 ||
          Opcode == Mcasm::ADJCALLSTACKUP32) &&
         "Expected ADJCALLSTACK pseudo instruction");

  // Simply erase the pseudo instruction
  return MBB.erase(MI);
}

void McasmFrameLowering::determineCalleeSaves(MachineFunction &MF,
                                              BitVector &SavedRegs,
                                              RegScavenger *RS) const {
  // Call the base implementation first
  TargetFrameLowering::determineCalleeSaves(MF, SavedRegs, RS);

  // mcasm callee-saved registers are x0-x15 (defined in McasmCallingConv.td)
  // The base implementation already handles this via CSR_Mcasm_32,
  // so we don't need additional logic here
}

bool McasmFrameLowering::spillCalleeSavedRegisters(
    MachineBasicBlock &MBB, MachineBasicBlock::iterator MI,
    ArrayRef<CalleeSavedInfo> CSI, const TargetRegisterInfo *TRI) const {
  if (CSI.empty())
    return false;

  DebugLoc DL = MBB.findDebugLoc(MI);
  MachineFunction &MF = *MBB.getParent();

  // Spill each callee-saved register to its stack slot
  for (const CalleeSavedInfo &CS : CSI) {
    Register Reg = CS.getReg();
    int FI = CS.getFrameIdx();

    // Get the frame index reference
    Register FrameReg;
    StackOffset Offset = getFrameIndexReference(MF, FI, FrameReg);

    // Generate: MOV [rsp+offset], reg
    // Note: Offset is already in mcasm units from getFrameIndexReference
    BuildMI(MBB, MI, DL, TII.get(Mcasm::MOV32mr))
        .addReg(FrameReg)
        .addImm(1)  // Scale
        .addReg(0)  // IndexReg
        .addImm(Offset.getFixed())  // Displacement (mcasm units)
        .addReg(0)  // SegmentReg
        .addReg(Reg, RegState::Kill);
  }

  return true;
}

bool McasmFrameLowering::restoreCalleeSavedRegisters(
    MachineBasicBlock &MBB, MachineBasicBlock::iterator MI,
    MutableArrayRef<CalleeSavedInfo> CSI,
    const TargetRegisterInfo *TRI) const {
  if (CSI.empty())
    return false;

  DebugLoc DL = MBB.findDebugLoc(MI);
  MachineFunction &MF = *MBB.getParent();

  // Restore each callee-saved register from its stack slot
  // Process in reverse order
  for (const CalleeSavedInfo &CS : reverse(CSI)) {
    Register Reg = CS.getReg();
    int FI = CS.getFrameIdx();

    // Get the frame index reference
    Register FrameReg;
    StackOffset Offset = getFrameIndexReference(MF, FI, FrameReg);

    // Generate: MOV reg, [rsp+offset]
    BuildMI(MBB, MI, DL, TII.get(Mcasm::MOV32rm), Reg)
        .addReg(FrameReg)
        .addImm(1)  // Scale
        .addReg(0)  // IndexReg
        .addImm(Offset.getFixed())  // Displacement (mcasm units)
        .addReg(0); // SegmentReg
  }

  return true;
}

bool McasmFrameLowering::hasReservedCallFrame(const MachineFunction &MF) const {
  // Reserve call frame if no var-sized objects
  return !MF.getFrameInfo().hasVarSizedObjects();
}

bool McasmFrameLowering::canSimplifyCallFramePseudos(
    const MachineFunction &MF) const {
  // Can simplify if we have a reserved call frame
  return hasReservedCallFrame(MF);
}

bool McasmFrameLowering::needsFrameIndexResolution(
    const MachineFunction &MF) const {
  // Need resolution if there are stack objects
  return MF.getFrameInfo().hasStackObjects();
}

bool McasmFrameLowering::hasFPImpl(const MachineFunction &MF) const {
  // mcasm doesn't use frame pointer (simplified architecture)
  // Always return false unless frame pointer elimination is explicitly disabled
  return MF.getTarget().Options.DisableFramePointerElim(MF);
}
