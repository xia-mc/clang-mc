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
#include "llvm/MC/MCELFObjectWriter.h"
#include "llvm/MC/MCFixup.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCObjectWriter.h"
#include "llvm/MC/MCRegisterInfo.h"
#include "llvm/MC/MCSubtargetInfo.h"
#include "llvm/MC/TargetRegistry.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/BinaryFormat/ELF.h"

using namespace llvm;

namespace {

class McasmELFObjectWriter : public MCELFObjectTargetWriter {
public:
  McasmELFObjectWriter(uint8_t OSABI, bool HasRelocationAddend)
      : MCELFObjectTargetWriter(/*Is64Bit=*/false, OSABI, ELF::EM_386,
                                HasRelocationAddend) {}

  ~McasmELFObjectWriter() override = default;

protected:
  unsigned getRelocType(const MCFixup &Fixup, const MCValue &Target,
                        bool IsPCRel) const override {
    // Mcasm doesn't actually generate relocations for text output
    // Return a dummy value
    return ELF::R_386_NONE;
  }
};

std::unique_ptr<MCObjectTargetWriter>
createMcasmELFObjectWriter(bool Is64Bit, uint8_t OSABI, uint16_t EMachine,
                           bool HasRelocationAddend) {
  return std::make_unique<McasmELFObjectWriter>(OSABI, HasRelocationAddend);
}

class McasmAsmBackend : public MCAsmBackend {
public:
  McasmAsmBackend(const Target &T, const MCSubtargetInfo &STI)
      : MCAsmBackend(llvm::endianness::little) {}

  ~McasmAsmBackend() override = default;

  void applyFixup(const MCFragment &Fragment, const MCFixup &Fixup,
                  const MCValue &Target, uint8_t *Data,
                  uint64_t Value, bool IsResolved) override {
    // Mcasm outputs text, fixups are not used in binary sense
    (void)Fragment;
    (void)Fixup;
    (void)Target;
    (void)Data;
    (void)Value;
    (void)IsResolved;
  }

  std::unique_ptr<MCObjectTargetWriter>
  createObjectTargetWriter() const override {
    // Mcasm primarily outputs text, but we need to provide a valid writer
    // for the MCAsmStreamer infrastructure. Create a minimal ELF writer.
    // OSABI = 0 (ELFOSABI_NONE), HasRelocationAddend = false
    return createMcasmELFObjectWriter(/*Is64Bit=*/false, /*OSABI=*/0,
                                      /*EMachine=*/ELF::EM_386,
                                      /*HasRelocationAddend=*/false);
  }

  bool fixupNeedsRelaxation(const MCFixup &Fixup, uint64_t Value) const override {
    // No relaxation needed for text output
    return false;
  }

  std::optional<MCFixupKind> getFixupKind(StringRef Name) const override {
    return std::nullopt;
  }

  MCFixupKindInfo getFixupKindInfo(MCFixupKind Kind) const override {
    // Return a default invalid fixup info for mcasm (text output only)
    return MCFixupKindInfo{"INVALID", 0, 0, 0};
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

MCAsmBackend *llvm::createMcasm_32AsmBackend(const Target &T,
                                             const MCSubtargetInfo &STI,
                                             const MCRegisterInfo &MRI,
                                             const MCTargetOptions &Options) {
  fprintf(stderr, "DEBUG: createMcasm_32AsmBackend called\n");
  fflush(stderr);
  auto *Backend = new McasmAsmBackend(T, STI);
  fprintf(stderr, "DEBUG: createMcasm_32AsmBackend completed, Backend=%p\n", (void*)Backend);
  fflush(stderr);
  return Backend;
}
