//===-- McasmMCInstLower.h - Mcasm MachineInstr to MCInst ------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file declares the McasmMCInstLower class for lowering MachineInstrs
// to MCInsts.
//
// MCASM NOTE: This is a minimal rewrite for the mcasm backend.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_MCASM_MCASMMCINSTLOWER_H
#define LLVM_LIB_TARGET_MCASM_MCASMMCINSTLOWER_H

#include "llvm/Support/Compiler.h"

namespace llvm {
class MachineFunction;
class MachineInstr;
class MachineOperand;
class MCContext;
class MCInst;
class MCOperand;
class MCSymbol;
class McasmAsmPrinter;

/// McasmMCInstLower - This class is used to lower a MachineInstr to an MCInst.
class LLVM_LIBRARY_VISIBILITY McasmMCInstLower {
  MCContext &Ctx;
  const MachineFunction &MF;
  McasmAsmPrinter &AsmPrinter;

public:
  McasmMCInstLower(MCContext &Ctx, const MachineFunction &MF,
                   McasmAsmPrinter &AP);

  /// Lower a MachineInstr to an MCInst
  void Lower(const MachineInstr *MI, MCInst &OutMI) const;

  MCSymbol *GetSymbolFromOperand(const MachineOperand &MO) const;
  MCOperand LowerSymbolOperand(const MachineOperand &MO, MCSymbol *Sym) const;

private:
  MCOperand LowerOperand(const MachineOperand &MO) const;
};

} // namespace llvm

#endif // LLVM_LIB_TARGET_MCASM_MCASMMCINSTLOWER_H
