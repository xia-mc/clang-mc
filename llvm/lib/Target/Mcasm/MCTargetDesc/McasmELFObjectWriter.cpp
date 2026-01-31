//===-- McasmELFObjectWriter.cpp - Mcasm ELF Writer ---------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "MCTargetDesc/McasmFixupKinds.h"
#include "MCTargetDesc/McasmMCAsmInfo.h"
#include "MCTargetDesc/McasmMCTargetDesc.h"
#include "llvm/BinaryFormat/ELF.h"
#include "llvm/MC/MCAsmInfo.h"
#include "llvm/MC/MCContext.h"
#include "llvm/MC/MCELFObjectWriter.h"
#include "llvm/MC/MCExpr.h"
#include "llvm/MC/MCFixup.h"
#include "llvm/MC/MCObjectWriter.h"
#include "llvm/MC/MCValue.h"
#include "llvm/Support/ErrorHandling.h"
#include <cassert>
#include <cstdint>

using namespace llvm;

namespace {
enum Mcasm_32RelType { RT32_NONE, RT32_32, RT32_16, RT32_8 };
enum Mcasm_64RelType { RT64_NONE, RT64_64, RT64_32, RT64_32S, RT64_16, RT64_8 };

class McasmELFObjectWriter : public MCELFObjectTargetWriter {
public:
  McasmELFObjectWriter(bool IsELF64, uint8_t OSABI, uint16_t EMachine);
  ~McasmELFObjectWriter() override = default;

protected:
  unsigned getRelocType(const MCFixup &, const MCValue &,
                        bool IsPCRel) const override;
  bool needsRelocateWithSymbol(const MCValue &, unsigned Type) const override;

  void checkIs32(SMLoc Loc, Mcasm_64RelType Type) const;
  void checkIs64(SMLoc Loc, Mcasm_64RelType Type) const;
  unsigned getRelocType32(SMLoc Loc, Mcasm::Specifier Specifier,
                          Mcasm_32RelType Type, bool IsPCRel,
                          MCFixupKind Kind) const;
  unsigned getRelocType64(SMLoc Loc, Mcasm::Specifier Specifier,
                          Mcasm_64RelType Type, bool IsPCRel,
                          MCFixupKind Kind) const;
};

} // end anonymous namespace

McasmELFObjectWriter::McasmELFObjectWriter(bool IsELF64, uint8_t OSABI,
                                       uint16_t EMachine)
    : MCELFObjectTargetWriter(IsELF64, OSABI, EMachine,
                              // Only i386 and IAMCU use Rel instead of RelA.
                              /*HasRelocationAddend*/
                              (EMachine != ELF::EM_386) &&
                                  (EMachine != ELF::EM_IAMCU)) {}

static Mcasm_64RelType getType64(MCFixupKind Kind, Mcasm::Specifier &Specifier,
                               bool &IsPCRel) {
  switch (unsigned(Kind)) {
  default:
    llvm_unreachable("Unimplemented");
  case FK_NONE:
    return RT64_NONE;
  case FK_Data_8:
    return RT64_64;
  case Mcasm::reloc_signed_4byte:
  case Mcasm::reloc_signed_4byte_relax:
    if (Specifier == Mcasm::S_None && !IsPCRel)
      return RT64_32S;
    return RT64_32;
  case Mcasm::reloc_global_offset_table:
    Specifier = Mcasm::S_GOT;
    IsPCRel = true;
    return RT64_32;
  case FK_Data_4:
  case Mcasm::reloc_riprel_4byte:
  case Mcasm::reloc_riprel_4byte_relax:
  case Mcasm::reloc_riprel_4byte_relax_rex:
  case Mcasm::reloc_riprel_4byte_relax_rex2:
  case Mcasm::reloc_riprel_4byte_movq_load:
  case Mcasm::reloc_riprel_4byte_movq_load_rex2:
  case Mcasm::reloc_riprel_4byte_relax_evex:
    return RT64_32;
  case Mcasm::reloc_branch_4byte_pcrel:
    Specifier = Mcasm::S_PLT;
    return RT64_32;
  case FK_Data_2:
    return RT64_16;
  case FK_Data_1:
    return RT64_8;
  }
}

void McasmELFObjectWriter::checkIs32(SMLoc Loc, Mcasm_64RelType Type) const {
  if (Type != RT64_32)
    reportError(Loc, "32 bit reloc applied to a field with a different size");
}

void McasmELFObjectWriter::checkIs64(SMLoc Loc, Mcasm_64RelType Type) const {
  if (Type != RT64_64)
    reportError(Loc, "64 bit reloc applied to a field with a different size");
}

unsigned McasmELFObjectWriter::getRelocType64(SMLoc Loc, Mcasm::Specifier Specifier,
                                            Mcasm_64RelType Type, bool IsPCRel,
                                            MCFixupKind Kind) const {
  switch (Specifier) {
  default:
    llvm_unreachable("Unimplemented");
  case Mcasm::S_None:
  case Mcasm::S_ABS8:
    switch (Type) {
    case RT64_NONE:
      if (Specifier == Mcasm::S_None)
        return ELF::R_Mcasm_64_NONE;
      llvm_unreachable("Unimplemented");
    case RT64_64:
      return IsPCRel ? ELF::R_Mcasm_64_PC64 : ELF::R_Mcasm_64_64;
    case RT64_32:
      return IsPCRel ? ELF::R_Mcasm_64_PC32 : ELF::R_Mcasm_64_32;
    case RT64_32S:
      return ELF::R_Mcasm_64_32S;
    case RT64_16:
      return IsPCRel ? ELF::R_Mcasm_64_PC16 : ELF::R_Mcasm_64_16;
    case RT64_8:
      return IsPCRel ? ELF::R_Mcasm_64_PC8 : ELF::R_Mcasm_64_8;
    }
    llvm_unreachable("unexpected relocation type!");
  case Mcasm::S_GOT:
    switch (Type) {
    case RT64_64:
      return IsPCRel ? ELF::R_Mcasm_64_GOTPC64 : ELF::R_Mcasm_64_GOT64;
    case RT64_32:
      return IsPCRel ? ELF::R_Mcasm_64_GOTPC32 : ELF::R_Mcasm_64_GOT32;
    case RT64_32S:
    case RT64_16:
    case RT64_8:
    case RT64_NONE:
      llvm_unreachable("Unimplemented");
    }
    llvm_unreachable("unexpected relocation type!");
  case Mcasm::S_GOTOFF:
    assert(!IsPCRel);
    if (Type != RT64_64)
      reportError(Loc, "unsupported relocation type");
    return ELF::R_Mcasm_64_GOTOFF64;
  case Mcasm::S_TPOFF:
    assert(!IsPCRel);
    switch (Type) {
    case RT64_64:
      return ELF::R_Mcasm_64_TPOFF64;
    case RT64_32:
      return ELF::R_Mcasm_64_TPOFF32;
    case RT64_32S:
    case RT64_16:
    case RT64_8:
    case RT64_NONE:
      llvm_unreachable("Unimplemented");
    }
    llvm_unreachable("unexpected relocation type!");
  case Mcasm::S_DTPOFF:
    assert(!IsPCRel);
    switch (Type) {
    case RT64_64:
      return ELF::R_Mcasm_64_DTPOFF64;
    case RT64_32:
      return ELF::R_Mcasm_64_DTPOFF32;
    case RT64_32S:
    case RT64_16:
    case RT64_8:
    case RT64_NONE:
      llvm_unreachable("Unimplemented");
    }
    llvm_unreachable("unexpected relocation type!");
  case Mcasm::S_SIZE:
    assert(!IsPCRel);
    switch (Type) {
    case RT64_64:
      return ELF::R_Mcasm_64_SIZE64;
    case RT64_32:
      return ELF::R_Mcasm_64_SIZE32;
    case RT64_32S:
    case RT64_16:
    case RT64_8:
    case RT64_NONE:
      llvm_unreachable("Unimplemented");
    }
    llvm_unreachable("unexpected relocation type!");
  case Mcasm::S_TLSCALL:
    return ELF::R_Mcasm_64_TLSDESC_CALL;
  case Mcasm::S_TLSDESC:
    return ((unsigned)Kind == Mcasm::reloc_riprel_4byte_relax_rex2)
               ? ELF::R_Mcasm_64_CODE_4_GOTPC32_TLSDESC
               : ELF::R_Mcasm_64_GOTPC32_TLSDESC;
  case Mcasm::S_TLSGD:
    checkIs32(Loc, Type);
    return ELF::R_Mcasm_64_TLSGD;
  case Mcasm::S_GOTTPOFF:
    checkIs32(Loc, Type);
    if ((unsigned)Kind == Mcasm::reloc_riprel_4byte_movq_load_rex2 ||
        (unsigned)Kind == Mcasm::reloc_riprel_4byte_relax_rex2)
      return ELF::R_Mcasm_64_CODE_4_GOTTPOFF;
    else if ((unsigned)Kind == Mcasm::reloc_riprel_4byte_relax_evex)
      return ELF::R_Mcasm_64_CODE_6_GOTTPOFF;
    return ELF::R_Mcasm_64_GOTTPOFF;
  case Mcasm::S_TLSLD:
    checkIs32(Loc, Type);
    return ELF::R_Mcasm_64_TLSLD;
  case Mcasm::S_PLT:
    checkIs32(Loc, Type);
    return ELF::R_Mcasm_64_PLT32;
  case Mcasm::S_GOTPCREL:
    checkIs32(Loc, Type);
    // Older versions of ld.bfd/ld.gold/lld
    // do not support GOTPCRELX/REX_GOTPCRELX/CODE_4_GOTPCRELX,
    // and we want to keep back-compatibility.
    if (!getContext().getTargetOptions()->McasmRelaxRelocations)
      return ELF::R_Mcasm_64_GOTPCREL;
    switch (unsigned(Kind)) {
    default:
      return ELF::R_Mcasm_64_GOTPCREL;
    case Mcasm::reloc_riprel_4byte_relax:
      return ELF::R_Mcasm_64_GOTPCRELX;
    case Mcasm::reloc_riprel_4byte_relax_rex:
    case Mcasm::reloc_riprel_4byte_movq_load:
      return ELF::R_Mcasm_64_REX_GOTPCRELX;
    case Mcasm::reloc_riprel_4byte_relax_rex2:
    case Mcasm::reloc_riprel_4byte_movq_load_rex2:
      return ELF::R_Mcasm_64_CODE_4_GOTPCRELX;
    }
    llvm_unreachable("unexpected relocation type!");
  case Mcasm::S_GOTPCREL_NORELAX:
    checkIs32(Loc, Type);
    return ELF::R_Mcasm_64_GOTPCREL;
  case Mcasm::S_PLTOFF:
    checkIs64(Loc, Type);
    return ELF::R_Mcasm_64_PLTOFF64;
  }
}

unsigned McasmELFObjectWriter::getRelocType32(SMLoc Loc, Mcasm::Specifier Specifier,
                                            Mcasm_32RelType Type, bool IsPCRel,
                                            MCFixupKind Kind) const {
  switch (Specifier) {
  default:
    llvm_unreachable("Unimplemented");
  case Mcasm::S_None:
  case Mcasm::S_ABS8:
    switch (Type) {
    case RT32_NONE:
      if (Specifier == Mcasm::S_None)
        return ELF::R_386_NONE;
      llvm_unreachable("Unimplemented");
    case RT32_32:
      return IsPCRel ? ELF::R_386_PC32 : ELF::R_386_32;
    case RT32_16:
      return IsPCRel ? ELF::R_386_PC16 : ELF::R_386_16;
    case RT32_8:
      return IsPCRel ? ELF::R_386_PC8 : ELF::R_386_8;
    }
    llvm_unreachable("unexpected relocation type!");
  case Mcasm::S_GOT:
    if (Type != RT32_32)
      break;
    if (IsPCRel)
      return ELF::R_386_GOTPC;
    // Older versions of ld.bfd/ld.gold/lld do not support R_386_GOT32X and we
    // want to maintain compatibility.
    if (!getContext().getTargetOptions()->McasmRelaxRelocations)
      return ELF::R_386_GOT32;

    return Kind == Mcasm::reloc_signed_4byte_relax ? ELF::R_386_GOT32X
                                                 : ELF::R_386_GOT32;
  case Mcasm::S_GOTOFF:
    assert(!IsPCRel);
    if (Type != RT32_32)
      break;
    return ELF::R_386_GOTOFF;
  case Mcasm::S_TLSCALL:
    return ELF::R_386_TLS_DESC_CALL;
  case Mcasm::S_TLSDESC:
    return ELF::R_386_TLS_GOTDESC;
  case Mcasm::S_TPOFF:
    if (Type != RT32_32)
      break;
    assert(!IsPCRel);
    return ELF::R_386_TLS_LE_32;
  case Mcasm::S_DTPOFF:
    if (Type != RT32_32)
      break;
    assert(!IsPCRel);
    return ELF::R_386_TLS_LDO_32;
  case Mcasm::S_TLSGD:
    if (Type != RT32_32)
      break;
    assert(!IsPCRel);
    return ELF::R_386_TLS_GD;
  case Mcasm::S_GOTTPOFF:
    if (Type != RT32_32)
      break;
    assert(!IsPCRel);
    return ELF::R_386_TLS_IE_32;
  case Mcasm::S_PLT:
    if (Type != RT32_32)
      break;
    return ELF::R_386_PLT32;
  case Mcasm::S_INDNTPOFF:
    if (Type != RT32_32)
      break;
    assert(!IsPCRel);
    return ELF::R_386_TLS_IE;
  case Mcasm::S_NTPOFF:
    if (Type != RT32_32)
      break;
    assert(!IsPCRel);
    return ELF::R_386_TLS_LE;
  case Mcasm::S_GOTNTPOFF:
    if (Type != RT32_32)
      break;
    assert(!IsPCRel);
    return ELF::R_386_TLS_GOTIE;
  case Mcasm::S_TLSLDM:
    if (Type != RT32_32)
      break;
    assert(!IsPCRel);
    return ELF::R_386_TLS_LDM;
  }
  reportError(Loc, "unsupported relocation type");
  return ELF::R_386_NONE;
}

unsigned McasmELFObjectWriter::getRelocType(const MCFixup &Fixup,
                                          const MCValue &Target,
                                          bool IsPCRel) const {
  MCFixupKind Kind = Fixup.getKind();
  auto Specifier = Mcasm::Specifier(Target.getSpecifier());
  switch (Specifier) {
  case Mcasm::S_GOTTPOFF:
  case Mcasm::S_INDNTPOFF:
  case Mcasm::S_NTPOFF:
  case Mcasm::S_GOTNTPOFF:
  case Mcasm::S_TLSCALL:
  case Mcasm::S_TLSDESC:
  case Mcasm::S_TLSGD:
  case Mcasm::S_TLSLD:
  case Mcasm::S_TLSLDM:
  case Mcasm::S_TPOFF:
  case Mcasm::S_DTPOFF:
    if (auto *S = const_cast<MCSymbol *>(Target.getAddSym()))
      static_cast<MCSymbolELF *>(S)->setType(ELF::STT_TLS);
    break;
  default:
    break;
  }

  Mcasm_64RelType Type = getType64(Kind, Specifier, IsPCRel);
  if (getEMachine() == ELF::EM_Mcasm_64)
    return getRelocType64(Fixup.getLoc(), Specifier, Type, IsPCRel, Kind);

  assert((getEMachine() == ELF::EM_386 || getEMachine() == ELF::EM_IAMCU) &&
         "Unsupported ELF machine type.");

  Mcasm_32RelType RelType = RT32_NONE;
  switch (Type) {
  case RT64_NONE:
    break;
  case RT64_64:
    reportError(Fixup.getLoc(), "unsupported relocation type");
    return ELF::R_386_NONE;
  case RT64_32:
  case RT64_32S:
    RelType = RT32_32;
    break;
  case RT64_16:
    RelType = RT32_16;
    break;
  case RT64_8:
    RelType = RT32_8;
    break;
  }
  return getRelocType32(Fixup.getLoc(), Specifier, RelType, IsPCRel, Kind);
}

bool McasmELFObjectWriter::needsRelocateWithSymbol(const MCValue &V,
                                                 unsigned Type) const {
  switch (V.getSpecifier()) {
  case Mcasm::S_GOT:
  case Mcasm::S_PLT:
  case Mcasm::S_GOTPCREL:
  case Mcasm::S_GOTPCREL_NORELAX:
    return true;
  default:
    return false;
  }
}

std::unique_ptr<MCObjectTargetWriter>
llvm::createMcasmELFObjectWriter(bool IsELF64, uint8_t OSABI, uint16_t EMachine) {
  return std::make_unique<McasmELFObjectWriter>(IsELF64, OSABI, EMachine);
}
