//===-- McasmMCAsmInfo.h - Mcasm asm properties --------------------*- C++ -*--===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file contains the declaration of the McasmMCAsmInfo class.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_Mcasm_MCTARGETDESC_McasmMCASMINFO_H
#define LLVM_LIB_TARGET_Mcasm_MCTARGETDESC_McasmMCASMINFO_H

#include "MCTargetDesc/McasmMCExpr.h"
#include "llvm/MC/MCAsmInfoCOFF.h"
#include "llvm/MC/MCAsmInfoDarwin.h"
#include "llvm/MC/MCAsmInfoELF.h"
#include "llvm/MC/MCExpr.h"

namespace llvm {
class Triple;

class McasmMCAsmInfoDarwin : public MCAsmInfoDarwin {
  virtual void anchor();

public:
  explicit McasmMCAsmInfoDarwin(const Triple &Triple);
};

struct Mcasm_64MCAsmInfoDarwin : public McasmMCAsmInfoDarwin {
  explicit Mcasm_64MCAsmInfoDarwin(const Triple &Triple);
  const MCExpr *
  getExprForPersonalitySymbol(const MCSymbol *Sym, unsigned Encoding,
                              MCStreamer &Streamer) const override;
};

class McasmELFMCAsmInfo : public MCAsmInfoELF {
  void anchor() override;

public:
  explicit McasmELFMCAsmInfo(const Triple &Triple);
};

class McasmMCAsmInfoMicrosoft : public MCAsmInfoMicrosoft {
  void anchor() override;

public:
  explicit McasmMCAsmInfoMicrosoft(const Triple &Triple);
};

class McasmMCAsmInfoMicrosoftMASM : public McasmMCAsmInfoMicrosoft {
  void anchor() override;

public:
  explicit McasmMCAsmInfoMicrosoftMASM(const Triple &Triple);
};

class McasmMCAsmInfoGNUCOFF : public MCAsmInfoGNUCOFF {
  void anchor() override;

public:
  explicit McasmMCAsmInfoGNUCOFF(const Triple &Triple);
};

namespace Mcasm {
using Specifier = uint16_t;

enum {
  S_None,
  S_COFF_SECREL,

  S_ABS8 = MCSymbolRefExpr::FirstTargetSpecifier,
  S_DTPOFF,
  S_DTPREL,
  S_GOT,
  S_GOTENT,
  S_GOTNTPOFF,
  S_GOTOFF,
  S_GOTPCREL,
  S_GOTPCREL_NORELAX,
  S_GOTREL,
  S_GOTTPOFF,
  S_INDNTPOFF,
  S_NTPOFF,
  S_PCREL,
  S_PLT,
  S_PLTOFF,
  S_SIZE,
  S_TLSCALL,
  S_TLSDESC,
  S_TLSGD,
  S_TLSLD,
  S_TLSLDM,
  S_TLVP,
  S_TLVPPAGE,
  S_TLVPPAGEOFF,
  S_TPOFF,
};
} // namespace Mcasm
} // namespace llvm

#endif
