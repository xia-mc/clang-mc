//===-- McasmMCTargetDesc.cpp - Mcasm Target Descriptions ---------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file provides Mcasm specific target descriptions.
//
//===----------------------------------------------------------------------===//

#include "McasmMCTargetDesc.h"
#include "TargetInfo/McasmTargetInfo.h"
#include "McasmATTInstPrinter.h"
#include "McasmBaseInfo.h"
#include "McasmIntelInstPrinter.h"
#include "McasmMCAsmInfo.h"
#include "McasmTargetStreamer.h"
#include "llvm-c/Visibility.h"
#include "llvm/ADT/APInt.h"
#include "llvm/DebugInfo/CodeView/CodeView.h"
#include "llvm/MC/MCDwarf.h"
#include "llvm/MC/MCInstrAnalysis.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/MC/MCRegisterInfo.h"
#include "llvm/MC/MCStreamer.h"
#include "llvm/MC/MCSubtargetInfo.h"
#include "llvm/MC/TargetRegistry.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/TargetParser/Host.h"
#include "llvm/TargetParser/Triple.h"

using namespace llvm;

#define GET_REGINFO_MC_DESC
#include "McasmGenRegisterInfo.inc"

#define GET_INSTRINFO_MC_DESC
#define GET_INSTRINFO_MC_HELPERS
#define ENABLE_INSTR_PREDICATE_VERIFIER
#include "McasmGenInstrInfo.inc"

#define GET_SUBTARGETINFO_MC_DESC
#include "McasmGenSubtargetInfo.inc"

std::string Mcasm_MC::ParseMcasmTriple(const Triple &TT) {
  std::string FS;
  // SSE2 should default to enabled in 64-bit mode, but can be turned off
  // explicitly.
  if (TT.isMcasm_64())
    FS = "+64bit-mode,-32bit-mode,-16bit-mode,+sse2";
  else if (TT.getEnvironment() != Triple::CODE16)
    FS = "-64bit-mode,+32bit-mode,-16bit-mode";
  else
    FS = "-64bit-mode,-32bit-mode,+16bit-mode";

  if (TT.isX32())
    FS += ",+x32";

  return FS;
}

unsigned Mcasm_MC::getDwarfRegFlavour(const Triple &TT, bool isEH) {
  if (TT.isMcasm_64())
    return DWARFFlavour::Mcasm_64;

  if (TT.isOSDarwin())
    return isEH ? DWARFFlavour::Mcasm_32_DarwinEH : DWARFFlavour::Mcasm_32_Generic;
  if (TT.isOSCygMing())
    // Unsupported by now, just quick fallback
    return DWARFFlavour::Mcasm_32_Generic;
  return DWARFFlavour::Mcasm_32_Generic;
}

bool Mcasm_MC::hasLockPrefix(const MCInst &MI) {
  return MI.getFlags() & Mcasm::IP_HAS_LOCK;
}

static bool isMemOperand(const MCInst &MI, unsigned Op, unsigned RegClassID) {
  const MCOperand &Base = MI.getOperand(Op + Mcasm::AddrBaseReg);
  const MCOperand &Index = MI.getOperand(Op + Mcasm::AddrIndexReg);
  const MCRegisterClass &RC = McasmMCRegisterClasses[RegClassID];

  return (Base.isReg() && Base.getReg() && RC.contains(Base.getReg())) ||
         (Index.isReg() && Index.getReg() && RC.contains(Index.getReg()));
}

bool Mcasm_MC::is16BitMemOperand(const MCInst &MI, unsigned Op,
                               const MCSubtargetInfo &STI) {
  const MCOperand &Base = MI.getOperand(Op + Mcasm::AddrBaseReg);
  const MCOperand &Index = MI.getOperand(Op + Mcasm::AddrIndexReg);

  if (STI.hasFeature(Mcasm::Is16Bit) && Base.isReg() && !Base.getReg() &&
      Index.isReg() && !Index.getReg())
    return true;
  return isMemOperand(MI, Op, Mcasm::GR16RegClassID);
}

bool Mcasm_MC::is32BitMemOperand(const MCInst &MI, unsigned Op) {
  const MCOperand &Base = MI.getOperand(Op + Mcasm::AddrBaseReg);
  const MCOperand &Index = MI.getOperand(Op + Mcasm::AddrIndexReg);
  if (Base.isReg() && Base.getReg() == Mcasm::EIP) {
    assert(Index.isReg() && !Index.getReg() && "Invalid eip-based address");
    return true;
  }
  if (Index.isReg() && Index.getReg() == Mcasm::EIZ)
    return true;
  return isMemOperand(MI, Op, Mcasm::GR32RegClassID);
}

#ifndef NDEBUG
bool Mcasm_MC::is64BitMemOperand(const MCInst &MI, unsigned Op) {
  return isMemOperand(MI, Op, Mcasm::GR64RegClassID);
}
#endif

bool Mcasm_MC::needsAddressSizeOverride(const MCInst &MI,
                                      const MCSubtargetInfo &STI,
                                      int MemoryOperand, uint64_t TSFlags) {
  uint64_t AdSize = TSFlags & McasmII::AdSizeMask;
  bool Is16BitMode = STI.hasFeature(Mcasm::Is16Bit);
  bool Is32BitMode = STI.hasFeature(Mcasm::Is32Bit);
  bool Is64BitMode = STI.hasFeature(Mcasm::Is64Bit);
  if ((Is16BitMode && AdSize == McasmII::AdSize32) ||
      (Is32BitMode && AdSize == McasmII::AdSize16) ||
      (Is64BitMode && AdSize == McasmII::AdSize32))
    return true;
  uint64_t Form = TSFlags & McasmII::FormMask;
  switch (Form) {
  default:
    break;
  case McasmII::RawFrmDstSrc: {
    MCRegister siReg = MI.getOperand(1).getReg();
    assert(((siReg == Mcasm::SI && MI.getOperand(0).getReg() == Mcasm::DI) ||
            (siReg == Mcasm::ESI && MI.getOperand(0).getReg() == Mcasm::EDI) ||
            (siReg == Mcasm::RSI && MI.getOperand(0).getReg() == Mcasm::RDI)) &&
           "SI and DI register sizes do not match");
    return (!Is32BitMode && siReg == Mcasm::ESI) ||
           (Is32BitMode && siReg == Mcasm::SI);
  }
  case McasmII::RawFrmSrc: {
    MCRegister siReg = MI.getOperand(0).getReg();
    return (!Is32BitMode && siReg == Mcasm::ESI) ||
           (Is32BitMode && siReg == Mcasm::SI);
  }
  case McasmII::RawFrmDst: {
    MCRegister siReg = MI.getOperand(0).getReg();
    return (!Is32BitMode && siReg == Mcasm::EDI) ||
           (Is32BitMode && siReg == Mcasm::DI);
  }
  }

  // Determine where the memory operand starts, if present.
  if (MemoryOperand < 0)
    return false;

  if (STI.hasFeature(Mcasm::Is64Bit)) {
    assert(!is16BitMemOperand(MI, MemoryOperand, STI));
    return is32BitMemOperand(MI, MemoryOperand);
  }
  if (STI.hasFeature(Mcasm::Is32Bit)) {
    assert(!is64BitMemOperand(MI, MemoryOperand));
    return is16BitMemOperand(MI, MemoryOperand, STI);
  }
  assert(STI.hasFeature(Mcasm::Is16Bit));
  assert(!is64BitMemOperand(MI, MemoryOperand));
  return !is16BitMemOperand(MI, MemoryOperand, STI);
}

void Mcasm_MC::initLLVMToSEHAndCVRegMapping(MCRegisterInfo *MRI) {
  // FIXME: TableGen these.
  for (unsigned Reg = Mcasm::NoRegister + 1; Reg < Mcasm::NUM_TARGET_REGS; ++Reg) {
    unsigned SEH = MRI->getEncodingValue(Reg);
    MRI->mapLLVMRegToSEHReg(Reg, SEH);
  }

  // Mapping from CodeView to MC register id.
  static const struct {
    codeview::RegisterId CVReg;
    MCPhysReg Reg;
  } RegMap[] = {
      {codeview::RegisterId::AL, Mcasm::AL},
      {codeview::RegisterId::CL, Mcasm::CL},
      {codeview::RegisterId::DL, Mcasm::DL},
      {codeview::RegisterId::BL, Mcasm::BL},
      {codeview::RegisterId::AH, Mcasm::AH},
      {codeview::RegisterId::CH, Mcasm::CH},
      {codeview::RegisterId::DH, Mcasm::DH},
      {codeview::RegisterId::BH, Mcasm::BH},
      {codeview::RegisterId::AX, Mcasm::AX},
      {codeview::RegisterId::CX, Mcasm::CX},
      {codeview::RegisterId::DX, Mcasm::DX},
      {codeview::RegisterId::BX, Mcasm::BX},
      {codeview::RegisterId::SP, Mcasm::SP},
      {codeview::RegisterId::BP, Mcasm::BP},
      {codeview::RegisterId::SI, Mcasm::SI},
      {codeview::RegisterId::DI, Mcasm::DI},
      {codeview::RegisterId::EAX, Mcasm::EAX},
      {codeview::RegisterId::ECX, Mcasm::ECX},
      {codeview::RegisterId::EDX, Mcasm::EDX},
      {codeview::RegisterId::EBX, Mcasm::EBX},
      {codeview::RegisterId::ESP, Mcasm::ESP},
      {codeview::RegisterId::EBP, Mcasm::EBP},
      {codeview::RegisterId::ESI, Mcasm::ESI},
      {codeview::RegisterId::EDI, Mcasm::EDI},

      {codeview::RegisterId::EFLAGS, Mcasm::EFLAGS},

      {codeview::RegisterId::ST0, Mcasm::ST0},
      {codeview::RegisterId::ST1, Mcasm::ST1},
      {codeview::RegisterId::ST2, Mcasm::ST2},
      {codeview::RegisterId::ST3, Mcasm::ST3},
      {codeview::RegisterId::ST4, Mcasm::ST4},
      {codeview::RegisterId::ST5, Mcasm::ST5},
      {codeview::RegisterId::ST6, Mcasm::ST6},
      {codeview::RegisterId::ST7, Mcasm::ST7},

      {codeview::RegisterId::ST0, Mcasm::FP0},
      {codeview::RegisterId::ST1, Mcasm::FP1},
      {codeview::RegisterId::ST2, Mcasm::FP2},
      {codeview::RegisterId::ST3, Mcasm::FP3},
      {codeview::RegisterId::ST4, Mcasm::FP4},
      {codeview::RegisterId::ST5, Mcasm::FP5},
      {codeview::RegisterId::ST6, Mcasm::FP6},
      {codeview::RegisterId::ST7, Mcasm::FP7},

      {codeview::RegisterId::MM0, Mcasm::MM0},
      {codeview::RegisterId::MM1, Mcasm::MM1},
      {codeview::RegisterId::MM2, Mcasm::MM2},
      {codeview::RegisterId::MM3, Mcasm::MM3},
      {codeview::RegisterId::MM4, Mcasm::MM4},
      {codeview::RegisterId::MM5, Mcasm::MM5},
      {codeview::RegisterId::MM6, Mcasm::MM6},
      {codeview::RegisterId::MM7, Mcasm::MM7},

      {codeview::RegisterId::XMM0, Mcasm::XMM0},
      {codeview::RegisterId::XMM1, Mcasm::XMM1},
      {codeview::RegisterId::XMM2, Mcasm::XMM2},
      {codeview::RegisterId::XMM3, Mcasm::XMM3},
      {codeview::RegisterId::XMM4, Mcasm::XMM4},
      {codeview::RegisterId::XMM5, Mcasm::XMM5},
      {codeview::RegisterId::XMM6, Mcasm::XMM6},
      {codeview::RegisterId::XMM7, Mcasm::XMM7},

      {codeview::RegisterId::XMM8, Mcasm::XMM8},
      {codeview::RegisterId::XMM9, Mcasm::XMM9},
      {codeview::RegisterId::XMM10, Mcasm::XMM10},
      {codeview::RegisterId::XMM11, Mcasm::XMM11},
      {codeview::RegisterId::XMM12, Mcasm::XMM12},
      {codeview::RegisterId::XMM13, Mcasm::XMM13},
      {codeview::RegisterId::XMM14, Mcasm::XMM14},
      {codeview::RegisterId::XMM15, Mcasm::XMM15},

      {codeview::RegisterId::SIL, Mcasm::SIL},
      {codeview::RegisterId::DIL, Mcasm::DIL},
      {codeview::RegisterId::BPL, Mcasm::BPL},
      {codeview::RegisterId::SPL, Mcasm::SPL},
      {codeview::RegisterId::RAX, Mcasm::RAX},
      {codeview::RegisterId::RBX, Mcasm::RBX},
      {codeview::RegisterId::RCX, Mcasm::RCX},
      {codeview::RegisterId::RDX, Mcasm::RDX},
      {codeview::RegisterId::RSI, Mcasm::RSI},
      {codeview::RegisterId::RDI, Mcasm::RDI},
      {codeview::RegisterId::RBP, Mcasm::RBP},
      {codeview::RegisterId::RSP, Mcasm::RSP},
      {codeview::RegisterId::R8, Mcasm::R8},
      {codeview::RegisterId::R9, Mcasm::R9},
      {codeview::RegisterId::R10, Mcasm::R10},
      {codeview::RegisterId::R11, Mcasm::R11},
      {codeview::RegisterId::R12, Mcasm::R12},
      {codeview::RegisterId::R13, Mcasm::R13},
      {codeview::RegisterId::R14, Mcasm::R14},
      {codeview::RegisterId::R15, Mcasm::R15},
      {codeview::RegisterId::R8B, Mcasm::R8B},
      {codeview::RegisterId::R9B, Mcasm::R9B},
      {codeview::RegisterId::R10B, Mcasm::R10B},
      {codeview::RegisterId::R11B, Mcasm::R11B},
      {codeview::RegisterId::R12B, Mcasm::R12B},
      {codeview::RegisterId::R13B, Mcasm::R13B},
      {codeview::RegisterId::R14B, Mcasm::R14B},
      {codeview::RegisterId::R15B, Mcasm::R15B},
      {codeview::RegisterId::R8W, Mcasm::R8W},
      {codeview::RegisterId::R9W, Mcasm::R9W},
      {codeview::RegisterId::R10W, Mcasm::R10W},
      {codeview::RegisterId::R11W, Mcasm::R11W},
      {codeview::RegisterId::R12W, Mcasm::R12W},
      {codeview::RegisterId::R13W, Mcasm::R13W},
      {codeview::RegisterId::R14W, Mcasm::R14W},
      {codeview::RegisterId::R15W, Mcasm::R15W},
      {codeview::RegisterId::R8D, Mcasm::R8D},
      {codeview::RegisterId::R9D, Mcasm::R9D},
      {codeview::RegisterId::R10D, Mcasm::R10D},
      {codeview::RegisterId::R11D, Mcasm::R11D},
      {codeview::RegisterId::R12D, Mcasm::R12D},
      {codeview::RegisterId::R13D, Mcasm::R13D},
      {codeview::RegisterId::R14D, Mcasm::R14D},
      {codeview::RegisterId::R15D, Mcasm::R15D},
      {codeview::RegisterId::AMD64_YMM0, Mcasm::YMM0},
      {codeview::RegisterId::AMD64_YMM1, Mcasm::YMM1},
      {codeview::RegisterId::AMD64_YMM2, Mcasm::YMM2},
      {codeview::RegisterId::AMD64_YMM3, Mcasm::YMM3},
      {codeview::RegisterId::AMD64_YMM4, Mcasm::YMM4},
      {codeview::RegisterId::AMD64_YMM5, Mcasm::YMM5},
      {codeview::RegisterId::AMD64_YMM6, Mcasm::YMM6},
      {codeview::RegisterId::AMD64_YMM7, Mcasm::YMM7},
      {codeview::RegisterId::AMD64_YMM8, Mcasm::YMM8},
      {codeview::RegisterId::AMD64_YMM9, Mcasm::YMM9},
      {codeview::RegisterId::AMD64_YMM10, Mcasm::YMM10},
      {codeview::RegisterId::AMD64_YMM11, Mcasm::YMM11},
      {codeview::RegisterId::AMD64_YMM12, Mcasm::YMM12},
      {codeview::RegisterId::AMD64_YMM13, Mcasm::YMM13},
      {codeview::RegisterId::AMD64_YMM14, Mcasm::YMM14},
      {codeview::RegisterId::AMD64_YMM15, Mcasm::YMM15},
      {codeview::RegisterId::AMD64_YMM16, Mcasm::YMM16},
      {codeview::RegisterId::AMD64_YMM17, Mcasm::YMM17},
      {codeview::RegisterId::AMD64_YMM18, Mcasm::YMM18},
      {codeview::RegisterId::AMD64_YMM19, Mcasm::YMM19},
      {codeview::RegisterId::AMD64_YMM20, Mcasm::YMM20},
      {codeview::RegisterId::AMD64_YMM21, Mcasm::YMM21},
      {codeview::RegisterId::AMD64_YMM22, Mcasm::YMM22},
      {codeview::RegisterId::AMD64_YMM23, Mcasm::YMM23},
      {codeview::RegisterId::AMD64_YMM24, Mcasm::YMM24},
      {codeview::RegisterId::AMD64_YMM25, Mcasm::YMM25},
      {codeview::RegisterId::AMD64_YMM26, Mcasm::YMM26},
      {codeview::RegisterId::AMD64_YMM27, Mcasm::YMM27},
      {codeview::RegisterId::AMD64_YMM28, Mcasm::YMM28},
      {codeview::RegisterId::AMD64_YMM29, Mcasm::YMM29},
      {codeview::RegisterId::AMD64_YMM30, Mcasm::YMM30},
      {codeview::RegisterId::AMD64_YMM31, Mcasm::YMM31},
      {codeview::RegisterId::AMD64_ZMM0, Mcasm::ZMM0},
      {codeview::RegisterId::AMD64_ZMM1, Mcasm::ZMM1},
      {codeview::RegisterId::AMD64_ZMM2, Mcasm::ZMM2},
      {codeview::RegisterId::AMD64_ZMM3, Mcasm::ZMM3},
      {codeview::RegisterId::AMD64_ZMM4, Mcasm::ZMM4},
      {codeview::RegisterId::AMD64_ZMM5, Mcasm::ZMM5},
      {codeview::RegisterId::AMD64_ZMM6, Mcasm::ZMM6},
      {codeview::RegisterId::AMD64_ZMM7, Mcasm::ZMM7},
      {codeview::RegisterId::AMD64_ZMM8, Mcasm::ZMM8},
      {codeview::RegisterId::AMD64_ZMM9, Mcasm::ZMM9},
      {codeview::RegisterId::AMD64_ZMM10, Mcasm::ZMM10},
      {codeview::RegisterId::AMD64_ZMM11, Mcasm::ZMM11},
      {codeview::RegisterId::AMD64_ZMM12, Mcasm::ZMM12},
      {codeview::RegisterId::AMD64_ZMM13, Mcasm::ZMM13},
      {codeview::RegisterId::AMD64_ZMM14, Mcasm::ZMM14},
      {codeview::RegisterId::AMD64_ZMM15, Mcasm::ZMM15},
      {codeview::RegisterId::AMD64_ZMM16, Mcasm::ZMM16},
      {codeview::RegisterId::AMD64_ZMM17, Mcasm::ZMM17},
      {codeview::RegisterId::AMD64_ZMM18, Mcasm::ZMM18},
      {codeview::RegisterId::AMD64_ZMM19, Mcasm::ZMM19},
      {codeview::RegisterId::AMD64_ZMM20, Mcasm::ZMM20},
      {codeview::RegisterId::AMD64_ZMM21, Mcasm::ZMM21},
      {codeview::RegisterId::AMD64_ZMM22, Mcasm::ZMM22},
      {codeview::RegisterId::AMD64_ZMM23, Mcasm::ZMM23},
      {codeview::RegisterId::AMD64_ZMM24, Mcasm::ZMM24},
      {codeview::RegisterId::AMD64_ZMM25, Mcasm::ZMM25},
      {codeview::RegisterId::AMD64_ZMM26, Mcasm::ZMM26},
      {codeview::RegisterId::AMD64_ZMM27, Mcasm::ZMM27},
      {codeview::RegisterId::AMD64_ZMM28, Mcasm::ZMM28},
      {codeview::RegisterId::AMD64_ZMM29, Mcasm::ZMM29},
      {codeview::RegisterId::AMD64_ZMM30, Mcasm::ZMM30},
      {codeview::RegisterId::AMD64_ZMM31, Mcasm::ZMM31},
      {codeview::RegisterId::AMD64_K0, Mcasm::K0},
      {codeview::RegisterId::AMD64_K1, Mcasm::K1},
      {codeview::RegisterId::AMD64_K2, Mcasm::K2},
      {codeview::RegisterId::AMD64_K3, Mcasm::K3},
      {codeview::RegisterId::AMD64_K4, Mcasm::K4},
      {codeview::RegisterId::AMD64_K5, Mcasm::K5},
      {codeview::RegisterId::AMD64_K6, Mcasm::K6},
      {codeview::RegisterId::AMD64_K7, Mcasm::K7},
      {codeview::RegisterId::AMD64_XMM16, Mcasm::XMM16},
      {codeview::RegisterId::AMD64_XMM17, Mcasm::XMM17},
      {codeview::RegisterId::AMD64_XMM18, Mcasm::XMM18},
      {codeview::RegisterId::AMD64_XMM19, Mcasm::XMM19},
      {codeview::RegisterId::AMD64_XMM20, Mcasm::XMM20},
      {codeview::RegisterId::AMD64_XMM21, Mcasm::XMM21},
      {codeview::RegisterId::AMD64_XMM22, Mcasm::XMM22},
      {codeview::RegisterId::AMD64_XMM23, Mcasm::XMM23},
      {codeview::RegisterId::AMD64_XMM24, Mcasm::XMM24},
      {codeview::RegisterId::AMD64_XMM25, Mcasm::XMM25},
      {codeview::RegisterId::AMD64_XMM26, Mcasm::XMM26},
      {codeview::RegisterId::AMD64_XMM27, Mcasm::XMM27},
      {codeview::RegisterId::AMD64_XMM28, Mcasm::XMM28},
      {codeview::RegisterId::AMD64_XMM29, Mcasm::XMM29},
      {codeview::RegisterId::AMD64_XMM30, Mcasm::XMM30},
      {codeview::RegisterId::AMD64_XMM31, Mcasm::XMM31},

  };
  for (const auto &I : RegMap)
    MRI->mapLLVMRegToCVReg(I.Reg, static_cast<int>(I.CVReg));
}

MCSubtargetInfo *Mcasm_MC::createMcasmMCSubtargetInfo(const Triple &TT,
                                                  StringRef CPU, StringRef FS) {
  std::string ArchFS = Mcasm_MC::ParseMcasmTriple(TT);
  assert(!ArchFS.empty() && "Failed to parse Mcasm triple");
  if (!FS.empty())
    ArchFS = (Twine(ArchFS) + "," + FS).str();

  if (CPU.empty())
    CPU = "generic";

  return createMcasmMCSubtargetInfoImpl(TT, CPU, /*TuneCPU*/ CPU, ArchFS);
}

static MCInstrInfo *createMcasmMCInstrInfo() {
  MCInstrInfo *X = new MCInstrInfo();
  InitMcasmMCInstrInfo(X);
  return X;
}

static MCRegisterInfo *createMcasmMCRegisterInfo(const Triple &TT) {
  unsigned RA = TT.isMcasm_64() ? Mcasm::RIP  // Should have dwarf #16.
                              : Mcasm::EIP; // Should have dwarf #8.

  MCRegisterInfo *X = new MCRegisterInfo();
  InitMcasmMCRegisterInfo(X, RA, Mcasm_MC::getDwarfRegFlavour(TT, false),
                        Mcasm_MC::getDwarfRegFlavour(TT, true), RA);
  Mcasm_MC::initLLVMToSEHAndCVRegMapping(X);
  return X;
}

static MCAsmInfo *createMcasmMCAsmInfo(const MCRegisterInfo &MRI,
                                     const Triple &TheTriple,
                                     const MCTargetOptions &Options) {
  bool is64Bit = TheTriple.isMcasm_64();

  MCAsmInfo *MAI;
  if (TheTriple.isOSBinFormatMachO()) {
    if (is64Bit)
      MAI = new Mcasm_64MCAsmInfoDarwin(TheTriple);
    else
      MAI = new McasmMCAsmInfoDarwin(TheTriple);
  } else if (TheTriple.isOSBinFormatELF()) {
    // Force the use of an ELF container.
    MAI = new McasmELFMCAsmInfo(TheTriple);
  } else if (TheTriple.isWindowsMSVCEnvironment() ||
             TheTriple.isWindowsCoreCLREnvironment() || TheTriple.isUEFI()) {
    if (Options.getAssemblyLanguage().equals_insensitive("masm"))
      MAI = new McasmMCAsmInfoMicrosoftMASM(TheTriple);
    else
      MAI = new McasmMCAsmInfoMicrosoft(TheTriple);
  } else if (TheTriple.isOSCygMing() ||
             TheTriple.isWindowsItaniumEnvironment()) {
    MAI = new McasmMCAsmInfoGNUCOFF(TheTriple);
  } else {
    // The default is ELF.
    MAI = new McasmELFMCAsmInfo(TheTriple);
  }

  // Initialize initial frame state.
  // Calculate amount of bytes used for return address storing
  int stackGrowth = is64Bit ? -8 : -4;

  // Initial state of the frame pointer is esp+stackGrowth.
  unsigned StackPtr = is64Bit ? Mcasm::RSP : Mcasm::ESP;
  MCCFIInstruction Inst = MCCFIInstruction::cfiDefCfa(
      nullptr, MRI.getDwarfRegNum(StackPtr, true), -stackGrowth);
  MAI->addInitialFrameState(Inst);

  // Add return address to move list
  unsigned InstPtr = is64Bit ? Mcasm::RIP : Mcasm::EIP;
  MCCFIInstruction Inst2 = MCCFIInstruction::createOffset(
      nullptr, MRI.getDwarfRegNum(InstPtr, true), stackGrowth);
  MAI->addInitialFrameState(Inst2);

  return MAI;
}

static MCInstPrinter *createMcasmMCInstPrinter(const Triple &T,
                                             unsigned SyntaxVariant,
                                             const MCAsmInfo &MAI,
                                             const MCInstrInfo &MII,
                                             const MCRegisterInfo &MRI) {
  if (SyntaxVariant == 0)
    return new McasmATTInstPrinter(MAI, MII, MRI);
  if (SyntaxVariant == 1)
    return new McasmIntelInstPrinter(MAI, MII, MRI);
  return nullptr;
}

static MCRelocationInfo *createMcasmMCRelocationInfo(const Triple &TheTriple,
                                                   MCContext &Ctx) {
  // Default to the stock relocation info.
  return llvm::createMCRelocationInfo(TheTriple, Ctx);
}

namespace llvm {
namespace Mcasm_MC {

class McasmMCInstrAnalysis : public MCInstrAnalysis {
  McasmMCInstrAnalysis(const McasmMCInstrAnalysis &) = delete;
  McasmMCInstrAnalysis &operator=(const McasmMCInstrAnalysis &) = delete;
  ~McasmMCInstrAnalysis() override = default;

public:
  McasmMCInstrAnalysis(const MCInstrInfo *MCII) : MCInstrAnalysis(MCII) {}

#define GET_STIPREDICATE_DECLS_FOR_MC_ANALYSIS
#include "McasmGenSubtargetInfo.inc"

  bool clearsSuperRegisters(const MCRegisterInfo &MRI, const MCInst &Inst,
                            APInt &Mask) const override;
  std::vector<std::pair<uint64_t, uint64_t>>
  findPltEntries(uint64_t PltSectionVA, ArrayRef<uint8_t> PltContents,
                 const MCSubtargetInfo &STI) const override;

  bool evaluateBranch(const MCInst &Inst, uint64_t Addr, uint64_t Size,
                      uint64_t &Target) const override;
  std::optional<uint64_t>
  evaluateMemoryOperandAddress(const MCInst &Inst, const MCSubtargetInfo *STI,
                               uint64_t Addr, uint64_t Size) const override;
  std::optional<uint64_t>
  getMemoryOperandRelocationOffset(const MCInst &Inst,
                                   uint64_t Size) const override;
};

#define GET_STIPREDICATE_DEFS_FOR_MC_ANALYSIS
#include "McasmGenSubtargetInfo.inc"

bool McasmMCInstrAnalysis::clearsSuperRegisters(const MCRegisterInfo &MRI,
                                              const MCInst &Inst,
                                              APInt &Mask) const {
  const MCInstrDesc &Desc = Info->get(Inst.getOpcode());
  unsigned NumDefs = Desc.getNumDefs();
  unsigned NumImplicitDefs = Desc.implicit_defs().size();
  assert(Mask.getBitWidth() == NumDefs + NumImplicitDefs &&
         "Unexpected number of bits in the mask!");

  bool HasVEX = (Desc.TSFlags & McasmII::EncodingMask) == McasmII::VEX;
  bool HasEVEX = (Desc.TSFlags & McasmII::EncodingMask) == McasmII::EVEX;
  bool HasXOP = (Desc.TSFlags & McasmII::EncodingMask) == McasmII::XOP;

  const MCRegisterClass &GR32RC = MRI.getRegClass(Mcasm::GR32RegClassID);
  const MCRegisterClass &VR128XRC = MRI.getRegClass(Mcasm::VR128XRegClassID);
  const MCRegisterClass &VR256XRC = MRI.getRegClass(Mcasm::VR256XRegClassID);

  auto ClearsSuperReg = [=](MCRegister RegID) {
    // On Mcasm-64, a general purpose integer register is viewed as a 64-bit
    // register internal to the processor.
    // An update to the lower 32 bits of a 64 bit integer register is
    // architecturally defined to zero extend the upper 32 bits.
    if (GR32RC.contains(RegID))
      return true;

    // Early exit if this instruction has no vex/evex/xop prefix.
    if (!HasEVEX && !HasVEX && !HasXOP)
      return false;

    // All VEX and EVEX encoded instructions are defined to zero the high bits
    // of the destination register up to VLMAX (i.e. the maximum vector register
    // width pertaining to the instruction).
    // We assume the same behavior for XOP instructions too.
    return VR128XRC.contains(RegID) || VR256XRC.contains(RegID);
  };

  Mask.clearAllBits();
  for (unsigned I = 0, E = NumDefs; I < E; ++I) {
    const MCOperand &Op = Inst.getOperand(I);
    if (ClearsSuperReg(Op.getReg()))
      Mask.setBit(I);
  }

  for (unsigned I = 0, E = NumImplicitDefs; I < E; ++I) {
    const MCPhysReg Reg = Desc.implicit_defs()[I];
    if (ClearsSuperReg(Reg))
      Mask.setBit(NumDefs + I);
  }

  return Mask.getBoolValue();
}

static std::vector<std::pair<uint64_t, uint64_t>>
findMcasmPltEntries(uint64_t PltSectionVA, ArrayRef<uint8_t> PltContents) {
  // Do a lightweight parsing of PLT entries.
  std::vector<std::pair<uint64_t, uint64_t>> Result;
  for (uint64_t Byte = 0, End = PltContents.size(); Byte + 6 < End; ) {
    // Recognize a jmp.
    if (PltContents[Byte] == 0xff && PltContents[Byte + 1] == 0xa3) {
      // The jmp instruction at the beginning of each PLT entry jumps to the
      // address of the base of the .got.plt section plus the immediate.
      // Set the 1 << 32 bit to let ELFObjectFileBase::getPltEntries convert the
      // offset to an address. Imm may be a negative int32_t if the GOT entry is
      // in .got.
      uint32_t Imm = support::endian::read32le(PltContents.data() + Byte + 2);
      Result.emplace_back(PltSectionVA + Byte, Imm | (uint64_t(1) << 32));
      Byte += 6;
    } else if (PltContents[Byte] == 0xff && PltContents[Byte + 1] == 0x25) {
      // The jmp instruction at the beginning of each PLT entry jumps to the
      // immediate.
      uint32_t Imm = support::endian::read32le(PltContents.data() + Byte + 2);
      Result.push_back(std::make_pair(PltSectionVA + Byte, Imm));
      Byte += 6;
    } else
      Byte++;
  }
  return Result;
}

static std::vector<std::pair<uint64_t, uint64_t>>
findMcasm_64PltEntries(uint64_t PltSectionVA, ArrayRef<uint8_t> PltContents) {
  // Do a lightweight parsing of PLT entries.
  std::vector<std::pair<uint64_t, uint64_t>> Result;
  for (uint64_t Byte = 0, End = PltContents.size(); Byte + 6 < End; ) {
    // Recognize a jmp.
    if (PltContents[Byte] == 0xff && PltContents[Byte + 1] == 0x25) {
      // The jmp instruction at the beginning of each PLT entry jumps to the
      // address of the next instruction plus the immediate.
      uint32_t Imm = support::endian::read32le(PltContents.data() + Byte + 2);
      Result.push_back(
          std::make_pair(PltSectionVA + Byte, PltSectionVA + Byte + 6 + Imm));
      Byte += 6;
    } else
      Byte++;
  }
  return Result;
}

std::vector<std::pair<uint64_t, uint64_t>>
McasmMCInstrAnalysis::findPltEntries(uint64_t PltSectionVA,
                                   ArrayRef<uint8_t> PltContents,
                                   const MCSubtargetInfo &STI) const {
  const Triple &TargetTriple = STI.getTargetTriple();
  switch (TargetTriple.getArch()) {
  case Triple::x86:
    return findMcasmPltEntries(PltSectionVA, PltContents);
  case Triple::x86_64:
    return findMcasm_64PltEntries(PltSectionVA, PltContents);
  default:
    return {};
  }
}

bool McasmMCInstrAnalysis::evaluateBranch(const MCInst &Inst, uint64_t Addr,
                                        uint64_t Size, uint64_t &Target) const {
  if (Inst.getNumOperands() == 0 ||
      Info->get(Inst.getOpcode()).operands()[0].OperandType !=
          MCOI::OPERAND_PCREL)
    return false;
  Target = Addr + Size + Inst.getOperand(0).getImm();
  return true;
}

std::optional<uint64_t> McasmMCInstrAnalysis::evaluateMemoryOperandAddress(
    const MCInst &Inst, const MCSubtargetInfo *STI, uint64_t Addr,
    uint64_t Size) const {
  const MCInstrDesc &MCID = Info->get(Inst.getOpcode());
  int MemOpStart = McasmII::getMemoryOperandNo(MCID.TSFlags);
  if (MemOpStart == -1)
    return std::nullopt;
  MemOpStart += McasmII::getOperandBias(MCID);

  const MCOperand &SegReg = Inst.getOperand(MemOpStart + Mcasm::AddrSegmentReg);
  const MCOperand &BaseReg = Inst.getOperand(MemOpStart + Mcasm::AddrBaseReg);
  const MCOperand &IndexReg = Inst.getOperand(MemOpStart + Mcasm::AddrIndexReg);
  const MCOperand &ScaleAmt = Inst.getOperand(MemOpStart + Mcasm::AddrScaleAmt);
  const MCOperand &Disp = Inst.getOperand(MemOpStart + Mcasm::AddrDisp);
  if (SegReg.getReg() || IndexReg.getReg() || ScaleAmt.getImm() != 1 ||
      !Disp.isImm())
    return std::nullopt;

  // RIP-relative addressing.
  if (BaseReg.getReg() == Mcasm::RIP)
    return Addr + Size + Disp.getImm();

  return std::nullopt;
}

std::optional<uint64_t>
McasmMCInstrAnalysis::getMemoryOperandRelocationOffset(const MCInst &Inst,
                                                     uint64_t Size) const {
  if (Inst.getOpcode() != Mcasm::LEA64r)
    return std::nullopt;
  const MCInstrDesc &MCID = Info->get(Inst.getOpcode());
  int MemOpStart = McasmII::getMemoryOperandNo(MCID.TSFlags);
  if (MemOpStart == -1)
    return std::nullopt;
  MemOpStart += McasmII::getOperandBias(MCID);
  const MCOperand &SegReg = Inst.getOperand(MemOpStart + Mcasm::AddrSegmentReg);
  const MCOperand &BaseReg = Inst.getOperand(MemOpStart + Mcasm::AddrBaseReg);
  const MCOperand &IndexReg = Inst.getOperand(MemOpStart + Mcasm::AddrIndexReg);
  const MCOperand &ScaleAmt = Inst.getOperand(MemOpStart + Mcasm::AddrScaleAmt);
  const MCOperand &Disp = Inst.getOperand(MemOpStart + Mcasm::AddrDisp);
  // Must be a simple rip-relative address.
  if (BaseReg.getReg() != Mcasm::RIP || SegReg.getReg() || IndexReg.getReg() ||
      ScaleAmt.getImm() != 1 || !Disp.isImm())
    return std::nullopt;
  // rip-relative ModR/M immediate is 32 bits.
  assert(Size > 4 && "invalid instruction size for rip-relative lea");
  return Size - 4;
}

} // end of namespace Mcasm_MC

} // end of namespace llvm

static MCInstrAnalysis *createMcasmMCInstrAnalysis(const MCInstrInfo *Info) {
  return new Mcasm_MC::McasmMCInstrAnalysis(Info);
}

// Force static initialization.
extern "C" LLVM_C_ABI void LLVMInitializeMcasmTargetMC() {
  for (Target *T : {&getTheMcasm_32Target(), &getTheMcasm_64Target()}) {
    // Register the MC asm info.
    RegisterMCAsmInfoFn X(*T, createMcasmMCAsmInfo);

    // Register the MC instruction info.
    TargetRegistry::RegisterMCInstrInfo(*T, createMcasmMCInstrInfo);

    // Register the MC register info.
    TargetRegistry::RegisterMCRegInfo(*T, createMcasmMCRegisterInfo);

    // Register the MC subtarget info.
    TargetRegistry::RegisterMCSubtargetInfo(*T,
                                            Mcasm_MC::createMcasmMCSubtargetInfo);

    // Register the MC instruction analyzer.
    TargetRegistry::RegisterMCInstrAnalysis(*T, createMcasmMCInstrAnalysis);

    // Register the code emitter.
    TargetRegistry::RegisterMCCodeEmitter(*T, createMcasmMCCodeEmitter);

    // Register the obj target streamer.
    TargetRegistry::RegisterObjectTargetStreamer(*T,
                                                 createMcasmObjectTargetStreamer);

    // Register the asm target streamer.
    TargetRegistry::RegisterAsmTargetStreamer(*T, createMcasmAsmTargetStreamer);

    // Register the null streamer.
    TargetRegistry::RegisterNullTargetStreamer(*T, createMcasmNullTargetStreamer);

    TargetRegistry::RegisterCOFFStreamer(*T, createMcasmWinCOFFStreamer);
    TargetRegistry::RegisterELFStreamer(*T, createMcasmELFStreamer);

    // Register the MCInstPrinter.
    TargetRegistry::RegisterMCInstPrinter(*T, createMcasmMCInstPrinter);

    // Register the MC relocation info.
    TargetRegistry::RegisterMCRelocationInfo(*T, createMcasmMCRelocationInfo);
  }

  // Register the asm backend.
  TargetRegistry::RegisterMCAsmBackend(getTheMcasm_32Target(),
                                       createMcasm_32AsmBackend);
  TargetRegistry::RegisterMCAsmBackend(getTheMcasm_64Target(),
                                       createMcasm_64AsmBackend);
}

MCRegister llvm::getMcasmSubSuperRegister(MCRegister Reg, unsigned Size,
                                        bool High) {
#define DEFAULT_NOREG                                                          \
  default:                                                                     \
    return Mcasm::NoRegister;
#define SUB_SUPER(R1, R2, R3, R4, R)                                           \
  case Mcasm::R1:                                                                \
  case Mcasm::R2:                                                                \
  case Mcasm::R3:                                                                \
  case Mcasm::R4:                                                                \
    return Mcasm::R;
#define A_SUB_SUPER(R)                                                         \
  case Mcasm::AH:                                                                \
    SUB_SUPER(AL, AX, EAX, RAX, R)
#define D_SUB_SUPER(R)                                                         \
  case Mcasm::DH:                                                                \
    SUB_SUPER(DL, DX, EDX, RDX, R)
#define C_SUB_SUPER(R)                                                         \
  case Mcasm::CH:                                                                \
    SUB_SUPER(CL, CX, ECX, RCX, R)
#define B_SUB_SUPER(R)                                                         \
  case Mcasm::BH:                                                                \
    SUB_SUPER(BL, BX, EBX, RBX, R)
#define SI_SUB_SUPER(R) SUB_SUPER(SIL, SI, ESI, RSI, R)
#define DI_SUB_SUPER(R) SUB_SUPER(DIL, DI, EDI, RDI, R)
#define BP_SUB_SUPER(R) SUB_SUPER(BPL, BP, EBP, RBP, R)
#define SP_SUB_SUPER(R) SUB_SUPER(SPL, SP, ESP, RSP, R)
#define NO_SUB_SUPER(NO, REG)                                                  \
  SUB_SUPER(R##NO##B, R##NO##W, R##NO##D, R##NO, REG)
#define NO_SUB_SUPER_B(NO) NO_SUB_SUPER(NO, R##NO##B)
#define NO_SUB_SUPER_W(NO) NO_SUB_SUPER(NO, R##NO##W)
#define NO_SUB_SUPER_D(NO) NO_SUB_SUPER(NO, R##NO##D)
#define NO_SUB_SUPER_Q(NO) NO_SUB_SUPER(NO, R##NO)
  switch (Size) {
  default:
    llvm_unreachable("illegal register size");
  case 8:
    if (High) {
      switch (Reg.id()) {
        DEFAULT_NOREG
        A_SUB_SUPER(AH)
        D_SUB_SUPER(DH)
        C_SUB_SUPER(CH)
        B_SUB_SUPER(BH)
      }
    } else {
      switch (Reg.id()) {
        DEFAULT_NOREG
        A_SUB_SUPER(AL)
        D_SUB_SUPER(DL)
        C_SUB_SUPER(CL)
        B_SUB_SUPER(BL)
        SI_SUB_SUPER(SIL)
        DI_SUB_SUPER(DIL)
        BP_SUB_SUPER(BPL)
        SP_SUB_SUPER(SPL)
        NO_SUB_SUPER_B(8)
        NO_SUB_SUPER_B(9)
        NO_SUB_SUPER_B(10)
        NO_SUB_SUPER_B(11)
        NO_SUB_SUPER_B(12)
        NO_SUB_SUPER_B(13)
        NO_SUB_SUPER_B(14)
        NO_SUB_SUPER_B(15)
        NO_SUB_SUPER_B(16)
        NO_SUB_SUPER_B(17)
        NO_SUB_SUPER_B(18)
        NO_SUB_SUPER_B(19)
        NO_SUB_SUPER_B(20)
        NO_SUB_SUPER_B(21)
        NO_SUB_SUPER_B(22)
        NO_SUB_SUPER_B(23)
        NO_SUB_SUPER_B(24)
        NO_SUB_SUPER_B(25)
        NO_SUB_SUPER_B(26)
        NO_SUB_SUPER_B(27)
        NO_SUB_SUPER_B(28)
        NO_SUB_SUPER_B(29)
        NO_SUB_SUPER_B(30)
        NO_SUB_SUPER_B(31)
      }
    }
  case 16:
    switch (Reg.id()) {
      DEFAULT_NOREG
      A_SUB_SUPER(AX)
      D_SUB_SUPER(DX)
      C_SUB_SUPER(CX)
      B_SUB_SUPER(BX)
      SI_SUB_SUPER(SI)
      DI_SUB_SUPER(DI)
      BP_SUB_SUPER(BP)
      SP_SUB_SUPER(SP)
      NO_SUB_SUPER_W(8)
      NO_SUB_SUPER_W(9)
      NO_SUB_SUPER_W(10)
      NO_SUB_SUPER_W(11)
      NO_SUB_SUPER_W(12)
      NO_SUB_SUPER_W(13)
      NO_SUB_SUPER_W(14)
      NO_SUB_SUPER_W(15)
      NO_SUB_SUPER_W(16)
      NO_SUB_SUPER_W(17)
      NO_SUB_SUPER_W(18)
      NO_SUB_SUPER_W(19)
      NO_SUB_SUPER_W(20)
      NO_SUB_SUPER_W(21)
      NO_SUB_SUPER_W(22)
      NO_SUB_SUPER_W(23)
      NO_SUB_SUPER_W(24)
      NO_SUB_SUPER_W(25)
      NO_SUB_SUPER_W(26)
      NO_SUB_SUPER_W(27)
      NO_SUB_SUPER_W(28)
      NO_SUB_SUPER_W(29)
      NO_SUB_SUPER_W(30)
      NO_SUB_SUPER_W(31)
    }
  case 32:
    switch (Reg.id()) {
      DEFAULT_NOREG
      A_SUB_SUPER(EAX)
      D_SUB_SUPER(EDX)
      C_SUB_SUPER(ECX)
      B_SUB_SUPER(EBX)
      SI_SUB_SUPER(ESI)
      DI_SUB_SUPER(EDI)
      BP_SUB_SUPER(EBP)
      SP_SUB_SUPER(ESP)
      NO_SUB_SUPER_D(8)
      NO_SUB_SUPER_D(9)
      NO_SUB_SUPER_D(10)
      NO_SUB_SUPER_D(11)
      NO_SUB_SUPER_D(12)
      NO_SUB_SUPER_D(13)
      NO_SUB_SUPER_D(14)
      NO_SUB_SUPER_D(15)
      NO_SUB_SUPER_D(16)
      NO_SUB_SUPER_D(17)
      NO_SUB_SUPER_D(18)
      NO_SUB_SUPER_D(19)
      NO_SUB_SUPER_D(20)
      NO_SUB_SUPER_D(21)
      NO_SUB_SUPER_D(22)
      NO_SUB_SUPER_D(23)
      NO_SUB_SUPER_D(24)
      NO_SUB_SUPER_D(25)
      NO_SUB_SUPER_D(26)
      NO_SUB_SUPER_D(27)
      NO_SUB_SUPER_D(28)
      NO_SUB_SUPER_D(29)
      NO_SUB_SUPER_D(30)
      NO_SUB_SUPER_D(31)
    }
  case 64:
    switch (Reg.id()) {
      DEFAULT_NOREG
      A_SUB_SUPER(RAX)
      D_SUB_SUPER(RDX)
      C_SUB_SUPER(RCX)
      B_SUB_SUPER(RBX)
      SI_SUB_SUPER(RSI)
      DI_SUB_SUPER(RDI)
      BP_SUB_SUPER(RBP)
      SP_SUB_SUPER(RSP)
      NO_SUB_SUPER_Q(8)
      NO_SUB_SUPER_Q(9)
      NO_SUB_SUPER_Q(10)
      NO_SUB_SUPER_Q(11)
      NO_SUB_SUPER_Q(12)
      NO_SUB_SUPER_Q(13)
      NO_SUB_SUPER_Q(14)
      NO_SUB_SUPER_Q(15)
      NO_SUB_SUPER_Q(16)
      NO_SUB_SUPER_Q(17)
      NO_SUB_SUPER_Q(18)
      NO_SUB_SUPER_Q(19)
      NO_SUB_SUPER_Q(20)
      NO_SUB_SUPER_Q(21)
      NO_SUB_SUPER_Q(22)
      NO_SUB_SUPER_Q(23)
      NO_SUB_SUPER_Q(24)
      NO_SUB_SUPER_Q(25)
      NO_SUB_SUPER_Q(26)
      NO_SUB_SUPER_Q(27)
      NO_SUB_SUPER_Q(28)
      NO_SUB_SUPER_Q(29)
      NO_SUB_SUPER_Q(30)
      NO_SUB_SUPER_Q(31)
    }
  }
}
