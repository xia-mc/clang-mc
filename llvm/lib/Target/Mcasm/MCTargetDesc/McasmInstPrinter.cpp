//===-- McasmInstPrinter.cpp - Mcasm assembly instruction printing ----===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file contains the Mcasm implementation of MCInstPrinter for mcasm
// assembly syntax.
//
// MCASM NOTE: This is a minimal rewrite for the mcasm backend. Key differences:
// - No % prefix for registers (e.g., "rsp" not "%rsp")
// - Memory format: [base+offset] (e.g., "[rsp+1]")
// - Offsets are already in mcasm units (NOT bytes)
//
// CRITICAL: This file does NOT perform memory offset conversion.
// Offsets are already in mcasm units from FrameLowering/RegisterInfo.
//
//===----------------------------------------------------------------------===//

#include "McasmInstPrinter.h"
#include "MCTargetDesc/McasmBaseInfo.h"
#include "llvm/MC/MCAsmInfo.h"
#include "llvm/MC/MCExpr.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/MC/MCRegisterInfo.h"
#include "llvm/MC/MCSubtargetInfo.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/Format.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

#define DEBUG_TYPE "asm-printer"

// Include the auto-generated portion of the assembly writer.
#define PRINT_ALIAS_INSTR
#include "McasmGenAsmWriter.inc"

void McasmInstPrinter::printRegName(raw_ostream &OS, MCRegister Reg) {
  // mcasm does not use % prefix for registers
  OS << getRegisterName(Reg);
}

void McasmInstPrinter::printInst(const MCInst *MI, uint64_t Address,
                                    StringRef Annot,
                                    const MCSubtargetInfo &STI,
                                    raw_ostream &OS) {
  // Try to print any aliases first.
  if (!printAliasInstr(MI, Address, STI, OS))
    printInstruction(MI, Address, STI, OS);

  // Print annotation (if any)
  printAnnotation(OS, Annot);
}

void McasmInstPrinter::printOperand(const MCInst *MI, unsigned OpNo,
                                    const MCSubtargetInfo &STI,
                                    raw_ostream &OS) {
  (void)STI; // Unused for mcasm
  const MCOperand &Op = MI->getOperand(OpNo);

  if (Op.isReg()) {
    // Register operand (no % prefix for mcasm)
    printRegName(OS, Op.getReg());
  } else if (Op.isImm()) {
    // Immediate operand
    OS << Op.getImm();
  } else if (Op.isExpr()) {
    // Expression operand (global addresses, etc.)
    MAI.printExpr(OS, *Op.getExpr());
  } else {
    llvm_unreachable("Unknown operand type in printOperand");
  }
}

void McasmInstPrinter::printMemReference(const MCInst *MI, unsigned Op,
                                         const MCSubtargetInfo &STI,
                                         raw_ostream &OS) {
  (void)STI; // Unused for mcasm
  // mcasm memory format: [base+offset]
  // Memory operand structure: BaseReg, Scale, IndexReg, Disp, SegmentReg
  // For mcasm: [BaseReg + Scale*IndexReg + Disp]
  // Typical mcasm: [rsp+N] where N is in mcasm units

  const MCOperand &BaseReg = MI->getOperand(Op + Mcasm::AddrBaseReg);
  const MCOperand &IndexReg = MI->getOperand(Op + Mcasm::AddrIndexReg);
  const MCOperand &Scale = MI->getOperand(Op + Mcasm::AddrScaleAmt);
  const MCOperand &Disp = MI->getOperand(Op + Mcasm::AddrDisp);
  const MCOperand &SegmentReg = MI->getOperand(Op + Mcasm::AddrSegmentReg);

  OS << "[";

  bool NeedPlus = false;

  // Base register
  if (BaseReg.getReg()) {
    printRegName(OS, BaseReg.getReg());
    NeedPlus = true;
  }

  // Index register (Scale * IndexReg)
  if (IndexReg.getReg()) {
    if (NeedPlus) OS << "+";
    if (Scale.getImm() != 1)
      OS << Scale.getImm() << "*";
    printRegName(OS, IndexReg.getReg());
    NeedPlus = true;
  }

  // Displacement (CRITICAL: already in mcasm units, NOT bytes)
  if (Disp.isExpr()) {
    if (NeedPlus) OS << "+";
    OS << "EXPR"; // TODO: Implement proper MCExpr printing
  } else if (Disp.isImm()) {
    int64_t DispVal = Disp.getImm();
    if (DispVal != 0 || !NeedPlus) {
      if (NeedPlus) {
        if (DispVal >= 0)
          OS << "+";
      }
      OS << DispVal;
    }
  }

  OS << "]";

  // mcasm doesn't use segment registers
  (void)SegmentReg;
}

void McasmInstPrinter::printPCRelImm(const MCInst *MI, uint64_t Address,
                                     unsigned OpNo, const MCSubtargetInfo &STI,
                                     raw_ostream &OS) {
  (void)Address; // Unused for mcasm
  (void)STI; // Unused for mcasm
  const MCOperand &Op = MI->getOperand(OpNo);

  if (Op.isImm()) {
    // PC-relative immediate - print as-is (label will be resolved by assembler)
    OS << Op.getImm();
  } else if (Op.isExpr()) {
    // Expression operand (e.g., label reference)
    // Use MCAsmInfo's public API to print the expression
    MAI.printExpr(OS, *Op.getExpr());
  } else {
    llvm_unreachable("Unknown operand type in printPCRelImm");
  }
}
