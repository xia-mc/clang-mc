//===-- McasmAsmBackend.cpp - Mcasm Assembler Backend --------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file implements the McasmAsmBackend class.
//
// MCASM NOTE: This is a minimal rewrite for the mcasm backend. Mcasm outputs
// plain text .mcasm files, not binary object files, so most of the assembler
// backend is stubbed out.
//
//===----------------------------------------------------------------------===//

#include "MCTargetDesc/McasmBaseInfo.h"
#include "MCTargetDesc/McasmFixupKinds.h"
#include "MCTargetDesc/McasmMCAsmInfo.h"
#include "llvm/MC/MCAsmBackend.h"
#include "llvm/MC/MCAssembler.h"
#include "llvm/MC/MCContext.h"
#include "llvm/MC/MCFixup.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCObjectWriter.h"
#include "llvm/MC/MCRegisterInfo.h"
#include "llvm/MC/MCSubtargetInfo.h"
#include "llvm/MC/TargetRegistry.h"
#include "llvm/Support/ErrorHandling.h"

using namespace llvm;

namespace {

class McasmAsmBackend : public MCAsmBackend {
public:
  McasmAsmBackend(const Target &T, const MCSubtargetInfo &STI)
      : MCAsmBackend(llvm::endianness::little) {}

  ~McasmAsmBackend() override = default;

  void applyFixup(const MCAssembler &Asm, const MCFixup &Fixup,
                  const MCValue &Target, MutableArrayRef<char> Data,
                  uint64_t Value, bool IsResolved,
                  const MCSubtargetInfo *STI) const override {
    // Mcasm outputs text, fixups are not used in binary sense
  }

  std::unique_ptr<MCObjectTargetWriter>
  createObjectTargetWriter() const override {
    // Mcasm does not output binary object files
    llvm_unreachable("Mcasm does not create object files");
  }

  bool fixupNeedsRelaxation(const MCFixup &Fixup, uint64_t Value) const override {
    // No relaxation needed for text output
    return false;
  }

  unsigned getNumFixupKinds() const override {
    // No binary fixups for text output
    return 0;
  }

  std::optional<MCFixupKind> getFixupKind(StringRef Name) const override {
    return std::nullopt;
  }

  const MCFixupKindInfo &getFixupKindInfo(MCFixupKind Kind) const override {
    static const MCFixupKindInfo Infos[1] = {
        {"INVALID", 0, 0, 0}
    };
    return Infos[0];
  }

  void relaxInstruction(MCInst &Inst,
                        const MCSubtargetInfo &STI) const override {
    // No instruction relaxation for mcasm
  }

  bool writeNopData(raw_ostream &OS, uint64_t Count,
                    const MCSubtargetInfo *STI) const override {
    // For text output, we can ignore NOP data
    return true;
  }
};

} // end anonymous namespace

MCAsmBackend *llvm::createMcasmAsmBackend(const Target &T,
                                          const MCSubtargetInfo &STI,
                                          const MCRegisterInfo &MRI,
                                          const MCTargetOptions &Options) {
  return new McasmAsmBackend(T, STI);
}
