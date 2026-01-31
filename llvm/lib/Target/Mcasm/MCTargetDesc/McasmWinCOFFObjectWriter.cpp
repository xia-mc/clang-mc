//===-- McasmWinCOFFObjectWriter.cpp - Mcasm Win COFF Writer ------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "MCTargetDesc/McasmFixupKinds.h"
#include "MCTargetDesc/McasmMCAsmInfo.h"
#include "MCTargetDesc/McasmMCTargetDesc.h"
#include "llvm/BinaryFormat/COFF.h"
#include "llvm/MC/MCContext.h"
#include "llvm/MC/MCExpr.h"
#include "llvm/MC/MCFixup.h"
#include "llvm/MC/MCObjectWriter.h"
#include "llvm/MC/MCValue.h"
#include "llvm/MC/MCWinCOFFObjectWriter.h"
#include "llvm/Support/ErrorHandling.h"

using namespace llvm;

namespace {

class McasmWinCOFFObjectWriter : public MCWinCOFFObjectTargetWriter {
public:
  McasmWinCOFFObjectWriter(bool Is64Bit);
  ~McasmWinCOFFObjectWriter() override = default;

  unsigned getRelocType(MCContext &Ctx, const MCValue &Target,
                        const MCFixup &Fixup, bool IsCrossSection,
                        const MCAsmBackend &MAB) const override;
};

} // end anonymous namespace

McasmWinCOFFObjectWriter::McasmWinCOFFObjectWriter(bool Is64Bit)
    : MCWinCOFFObjectTargetWriter(Is64Bit ? COFF::IMAGE_FILE_MACHINE_AMD64
                                          : COFF::IMAGE_FILE_MACHINE_I386) {}

unsigned McasmWinCOFFObjectWriter::getRelocType(MCContext &Ctx,
                                              const MCValue &Target,
                                              const MCFixup &Fixup,
                                              bool IsCrossSection,
                                              const MCAsmBackend &MAB) const {
  const bool Is64Bit = getMachine() == COFF::IMAGE_FILE_MACHINE_AMD64;
  unsigned FixupKind = Fixup.getKind();
  bool PCRel = Fixup.isPCRel();
  if (IsCrossSection) {
    // IMAGE_REL_AMD64_REL64 does not exist. We treat FK_Data_8 as FK_PCRel_4 so
    // that .quad a-b can lower to IMAGE_REL_AMD64_REL32. This allows generic
    // instrumentation to not bother with the COFF limitation. A negative value
    // needs attention.
    if (!PCRel &&
        (FixupKind == FK_Data_4 || FixupKind == llvm::Mcasm::reloc_signed_4byte ||
         (FixupKind == FK_Data_8 && Is64Bit))) {
      FixupKind = FK_Data_4;
      PCRel = true;
    } else {
      Ctx.reportError(Fixup.getLoc(), "Cannot represent this expression");
      return COFF::IMAGE_REL_AMD64_ADDR32;
    }
  }

  auto Spec = Target.getSpecifier();
  if (Is64Bit) {
    switch (FixupKind) {
    case Mcasm::reloc_riprel_4byte:
    case Mcasm::reloc_riprel_4byte_movq_load:
    case Mcasm::reloc_riprel_4byte_movq_load_rex2:
    case Mcasm::reloc_riprel_4byte_relax:
    case Mcasm::reloc_riprel_4byte_relax_rex:
    case Mcasm::reloc_riprel_4byte_relax_rex2:
    case Mcasm::reloc_riprel_4byte_relax_evex:
    case Mcasm::reloc_branch_4byte_pcrel:
      return COFF::IMAGE_REL_AMD64_REL32;
    case FK_Data_4:
      if (PCRel)
        return COFF::IMAGE_REL_AMD64_REL32;
      [[fallthrough]];
    case Mcasm::reloc_signed_4byte:
    case Mcasm::reloc_signed_4byte_relax:
      if (Spec == MCSymbolRefExpr::VK_COFF_IMGREL32)
        return COFF::IMAGE_REL_AMD64_ADDR32NB;
      if (Spec == Mcasm::S_COFF_SECREL)
        return COFF::IMAGE_REL_AMD64_SECREL;
      return COFF::IMAGE_REL_AMD64_ADDR32;
    case FK_Data_8:
      return COFF::IMAGE_REL_AMD64_ADDR64;
    case FK_SecRel_2:
      return COFF::IMAGE_REL_AMD64_SECTION;
    case FK_SecRel_4:
      return COFF::IMAGE_REL_AMD64_SECREL;
    default:
      Ctx.reportError(Fixup.getLoc(), "unsupported relocation type");
      return COFF::IMAGE_REL_AMD64_ADDR32;
    }
  } else if (getMachine() == COFF::IMAGE_FILE_MACHINE_I386) {
    switch (FixupKind) {
    case Mcasm::reloc_riprel_4byte:
    case Mcasm::reloc_riprel_4byte_movq_load:
      return COFF::IMAGE_REL_I386_REL32;
    case FK_Data_4:
      if (PCRel)
        return COFF::IMAGE_REL_I386_REL32;
      [[fallthrough]];
    case Mcasm::reloc_signed_4byte:
    case Mcasm::reloc_signed_4byte_relax:
      if (Spec == MCSymbolRefExpr::VK_COFF_IMGREL32)
        return COFF::IMAGE_REL_I386_DIR32NB;
      if (Spec == Mcasm::S_COFF_SECREL)
        return COFF::IMAGE_REL_I386_SECREL;
      return COFF::IMAGE_REL_I386_DIR32;
    case FK_SecRel_2:
      return COFF::IMAGE_REL_I386_SECTION;
    case FK_SecRel_4:
      return COFF::IMAGE_REL_I386_SECREL;
    default:
      Ctx.reportError(Fixup.getLoc(), "unsupported relocation type");
      return COFF::IMAGE_REL_I386_DIR32;
    }
  } else
    llvm_unreachable("Unsupported COFF machine type.");
}

std::unique_ptr<MCObjectTargetWriter>
llvm::createMcasmWinCOFFObjectWriter(bool Is64Bit) {
  return std::make_unique<McasmWinCOFFObjectWriter>(Is64Bit);
}
