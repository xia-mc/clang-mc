//=--- McasmMCExpr.h - Mcasm specific MC expression classes ---*- C++ -*-=//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file describes Mcasm-specific MCExprs, i.e, registers used for
// extended variable assignments.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_Mcasm_MCTARGETDESC_McasmMCEXPR_H
#define LLVM_LIB_TARGET_Mcasm_MCTARGETDESC_McasmMCEXPR_H

#include "McasmInstPrinter.h"
#include "llvm/MC/MCAsmInfo.h"
#include "llvm/MC/MCContext.h"
#include "llvm/MC/MCExpr.h"
#include "llvm/Support/Casting.h"
#include "llvm/Support/ErrorHandling.h"

namespace llvm {

class McasmMCExpr : public MCTargetExpr {

private:
  const MCRegister Reg; // All

  explicit McasmMCExpr(MCRegister R) : Reg(R) {}

public:
  static const McasmMCExpr *create(MCRegister Reg, MCContext &Ctx) {
    return new (Ctx) McasmMCExpr(Reg);
  }

  /// getSubExpr - Get the child of this expression.
  MCRegister getReg() const { return Reg; }

  void printImpl(raw_ostream &OS, const MCAsmInfo *MAI) const override {
    if (!MAI || MAI->getAssemblerDialect() == 0)
      OS << '%';
    OS << McasmATTInstPrinter::getRegisterName(Reg);
  }

  bool evaluateAsRelocatableImpl(MCValue &Res,
                                 const MCAssembler *Asm) const override {
    return false;
  }
  // Register values should be inlined as they are not valid .set expressions.
  bool inlineAssignedExpr() const override { return true; }
  bool isEqualTo(const MCExpr *X) const override {
    if (auto *E = dyn_cast<McasmMCExpr>(X))
      return getReg() == E->getReg();
    return false;
  }
  void visitUsedExpr(MCStreamer &Streamer) const override {}
  MCFragment *findAssociatedFragment() const override { return nullptr; }

  static bool classof(const MCExpr *E) {
    return E->getKind() == MCExpr::Target;
  }
};
} // end namespace llvm

#endif
