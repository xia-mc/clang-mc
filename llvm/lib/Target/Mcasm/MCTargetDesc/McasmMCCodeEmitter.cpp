//===-- McasmMCCodeEmitter.cpp - Mcasm Code Emitter ----------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file implements the McasmMCCodeEmitter class.
//
// MCASM NOTE: This is a minimal stub for the mcasm backend. Mcasm outputs
// plain text .mcasm files, not binary object files, so code emission is
// not actually used. This file exists only to satisfy the MC framework
// requirements.
//
//===----------------------------------------------------------------------===//

#include "MCTargetDesc/McasmBaseInfo.h"
#include "MCTargetDesc/McasmFixupKinds.h"
#include "MCTargetDesc/McasmMCAsmInfo.h"
#include "llvm/MC/MCCodeEmitter.h"
#include "llvm/MC/MCContext.h"
#include "llvm/MC/MCExpr.h"
#include "llvm/MC/MCFixup.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/MC/MCRegisterInfo.h"
#include "llvm/MC/MCSubtargetInfo.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

namespace {

class McasmMCCodeEmitter : public MCCodeEmitter {
  const MCInstrInfo &MCII;
  MCContext &Ctx;

public:
  McasmMCCodeEmitter(const MCInstrInfo &MCII, MCContext &Ctx)
      : MCII(MCII), Ctx(Ctx) {}

  ~McasmMCCodeEmitter() override = default;

  void encodeInstruction(const MCInst &MI, SmallVectorImpl<char> &CB,
                         SmallVectorImpl<MCFixup> &Fixups,
                         const MCSubtargetInfo &STI) const override {
    // Mcasm outputs text, not binary code
    // This method is not actually called for text output
    // If it is called, emit a placeholder
    CB.push_back(0);
  }

  uint64_t getMachineOpValue(const MCInst &MI, const MCOperand &MO,
                             SmallVectorImpl<MCFixup> &Fixups,
                             const MCSubtargetInfo &STI) const {
    // Not used for text output
    return 0;
  }
};

} // end anonymous namespace

MCCodeEmitter *llvm::createMcasmMCCodeEmitter(const MCInstrInfo &MCII,
                                              MCContext &Ctx) {
  fprintf(stderr, "DEBUG: createMcasmMCCodeEmitter called\n");
  fflush(stderr);
  auto *Emitter = new McasmMCCodeEmitter(MCII, Ctx);
  fprintf(stderr, "DEBUG: createMcasmMCCodeEmitter completed, Emitter=%p\n", (void*)Emitter);
  fflush(stderr);
  return Emitter;
}
