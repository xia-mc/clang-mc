//===-- McasmMCInstLower.cpp - Mcasm MachineInstr to MCInst --------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file contains code to lower Mcasm MachineInstrs to their corresponding
// MCInst records.
//
// MCASM NOTE: This is a minimal rewrite for the mcasm backend. It handles
// basic lowering of machine instructions to MC layer instructions.
//
//===----------------------------------------------------------------------===//

#include "McasmMCInstLower.h"
#include "MCTargetDesc/McasmBaseInfo.h"
#include "MCTargetDesc/McasmMCAsmInfo.h"
#include "McasmAsmPrinter.h"
#include "McasmSubtarget.h"
#include "llvm/CodeGen/MachineConstantPool.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineInstr.h"
#include "llvm/CodeGen/MachineOperand.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/Mangler.h"
#include "llvm/MC/MCAsmInfo.h"
#include "llvm/MC/MCContext.h"
#include "llvm/MC/MCExpr.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCStreamer.h"
#include "llvm/MC/MCSymbol.h"

using namespace llvm;

McasmMCInstLower::McasmMCInstLower(MCContext &Ctx, const MachineFunction &MF,
                                   McasmAsmPrinter &AP)
    : Ctx(Ctx), MF(MF), AsmPrinter(AP) {}

MCSymbol *McasmMCInstLower::GetSymbolFromOperand(const MachineOperand &MO) const {
  assert((MO.isGlobal() || MO.isSymbol() || MO.isMBB()) &&
         "Operand is not a symbol");

  MCSymbol *Sym = nullptr;

  if (MO.isGlobal()) {
    const GlobalValue *GV = MO.getGlobal();
    Sym = AsmPrinter.getSymbol(GV);
  } else if (MO.isSymbol()) {
    Sym = AsmPrinter.GetExternalSymbolSymbol(MO.getSymbolName());
  } else if (MO.isMBB()) {
    Sym = MO.getMBB()->getSymbol();
  }

  return Sym;
}

MCOperand McasmMCInstLower::LowerSymbolOperand(const MachineOperand &MO,
                                               MCSymbol *Sym) const {
  const MCExpr *Expr = MCSymbolRefExpr::create(Sym, Ctx);

  if (!MO.isJTI() && !MO.isMBB() && MO.getOffset())
    Expr = MCBinaryExpr::createAdd(
        Expr, MCConstantExpr::create(MO.getOffset(), Ctx), Ctx);

  return MCOperand::createExpr(Expr);
}

MCOperand McasmMCInstLower::LowerOperand(const MachineOperand &MO) const {
  switch (MO.getType()) {
  default:
    llvm_unreachable("Unknown operand type in LowerOperand");

  case MachineOperand::MO_Register:
    // Ignore implicit registers.
    if (MO.isImplicit())
      return MCOperand();
    return MCOperand::createReg(MO.getReg());

  case MachineOperand::MO_Immediate:
    return MCOperand::createImm(MO.getImm());

  case MachineOperand::MO_MachineBasicBlock:
  case MachineOperand::MO_GlobalAddress:
  case MachineOperand::MO_ExternalSymbol:
    return LowerSymbolOperand(MO, GetSymbolFromOperand(MO));

  case MachineOperand::MO_RegisterMask:
    // Ignore register masks.
    return MCOperand();
  }
}

void McasmMCInstLower::Lower(const MachineInstr *MI, MCInst &OutMI) const {
  OutMI.setOpcode(MI->getOpcode());

  for (unsigned i = 0, e = MI->getNumOperands(); i != e; ++i) {
    const MachineOperand &MO = MI->getOperand(i);
    MCOperand MCOp = LowerOperand(MO);

    if (MCOp.isValid())
      OutMI.addOperand(MCOp);
  }
}
