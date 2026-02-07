//===-- McasmMCTargetDesc.cpp - Mcasm Target Descriptions ----------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file provides Mcasm specific target descriptions.
//
// MCASM NOTE: This is a minimal rewrite for the mcasm backend (32-bit only).
// Removed all 64-bit support, floating point, vector, and complex features.
//
//===----------------------------------------------------------------------===//

#include "McasmMCTargetDesc.h"
#include "McasmInstPrinter.h"
#include "McasmMCAsmInfo.h"
#include "McasmTargetStreamer.h"
#include "TargetInfo/McasmTargetInfo.h"
#include "llvm/ADT/APInt.h"
#include "llvm/MC/MCContext.h"
#include "llvm/MC/MCDwarf.h"
#include "llvm/MC/MCExpr.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCInstPrinter.h"
#include "llvm/MC/MCInstrAnalysis.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/MC/MCRegisterInfo.h"
#include "llvm/MC/MCStreamer.h"
#include "llvm/MC/MCSubtargetInfo.h"
#include "llvm/MC/TargetRegistry.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/TargetParser/Triple.h"

using namespace llvm;

#define GET_REGINFO_MC_DESC
#include "McasmGenRegisterInfo.inc"

#define GET_INSTRINFO_MC_DESC
#define ENABLE_INSTR_PREDICATE_VERIFIER
#include "McasmGenInstrInfo.inc"

#define GET_SUBTARGETINFO_MC_DESC
#include "McasmGenSubtargetInfo.inc"

std::string llvm::Mcasm_MC::ParseMcasmTriple(const Triple &TT) {
  // mcasm is 32-bit only, no SSE/AVX
  std::string FS;
  if (TT.getEnvironment() != Triple::CODE16)
    FS = "-64bit-mode,+32bit-mode,-16bit-mode";
  else
    FS = "-64bit-mode,-32bit-mode,+16bit-mode";
  return FS;
}

unsigned llvm::Mcasm_MC::getDwarfRegFlavour(const Triple &TT, bool isEH) {
  // mcasm is 32-bit only
  (void)TT;
  (void)isEH;
  return DWARFFlavour::Mcasm_32_Generic;
}

MCSubtargetInfo *llvm::Mcasm_MC::createMcasmMCSubtargetInfo(
    const Triple &TT, StringRef CPU, StringRef FS) {
  std::string ArchFS = Mcasm_MC::ParseMcasmTriple(TT);
  assert(!ArchFS.empty() && "Empty ArchFS string");

  if (!FS.empty()) {
    ArchFS = (Twine(ArchFS) + "," + FS).str();
  }

  std::string CPUName = std::string(CPU);
  if (CPUName.empty())
    CPUName = "generic";

  std::string TuneCPU = CPUName;  // Use same CPU for tuning

  return createMcasmMCSubtargetInfoImpl(TT, CPUName, TuneCPU, ArchFS);
}

static MCInstrInfo *createMcasmMCInstrInfo() {
  MCInstrInfo *X = new MCInstrInfo();
  InitMcasmMCInstrInfo(X);
  return X;
}

static MCRegisterInfo *createMcasmMCRegisterInfo(const Triple &TT) {
  // mcasm uses rax as the return address register (placeholder)
  (void)TT;
  unsigned RA = Mcasm::rax;

  MCRegisterInfo *X = new MCRegisterInfo();
  InitMcasmMCRegisterInfo(X, RA, 0, 0, RA);
  return X;
}

static MCAsmInfo *createMcasmMCAsmInfo(const MCRegisterInfo &MRI,
                                       const Triple &TheTriple,
                                       const MCTargetOptions &Options) {
  bool is64Bit = TheTriple.getArch() == Triple::x86_64;

  MCAsmInfo *MAI;
  if (TheTriple.isOSBinFormatMachO()) {
    MAI = new McasmMCAsmInfoDarwin(TheTriple);
  } else if (TheTriple.isOSBinFormatELF()) {
    MAI = new McasmELFMCAsmInfo(TheTriple);
  } else if (TheTriple.isOSBinFormatCOFF()) {
    MAI = new McasmMCAsmInfoMicrosoft(TheTriple);
  } else {
    // Fallback - use ELF for mcasm (GOFF not supported)
    MAI = new McasmELFMCAsmInfo(TheTriple);
  }

  // Initialize asm info
  // mcasm uses rsp as stack pointer (32-bit, 4 bytes)
  (void)is64Bit;
  unsigned SP = Mcasm::rsp;
  MCCFIInstruction Inst = MCCFIInstruction::cfiDefCfa(nullptr,
                                                       MRI.getDwarfRegNum(SP, true),
                                                       4);  // mcasm is 32-bit
  MAI->addInitialFrameState(Inst);

  return MAI;
}

static MCInstPrinter *createMcasmMCInstPrinter(const Triple &T,
                                               unsigned SyntaxVariant,
                                               const MCAsmInfo &MAI,
                                               const MCInstrInfo &MII,
                                               const MCRegisterInfo &MRI) {
  // mcasm only has one syntax (mcasm syntax, not AT&T or Intel)
  (void)SyntaxVariant;
  return new McasmInstPrinter(MAI, MII, MRI);
}

MCTargetStreamer *llvm::createMcasmAsmTargetStreamer(MCStreamer &S,
                                                     formatted_raw_ostream &OS,
                                                     MCInstPrinter *InstPrint) {
  return new McasmTargetStreamer(S);
}

// Note: createMcasmNullTargetStreamer is defined in McasmTargetStreamer.h

// Implementation of createMcasmObjectTargetStreamer (declared in McasmMCTargetDesc.h)
MCTargetStreamer *llvm::createMcasmObjectTargetStreamer(MCStreamer &S,
                                                        const MCSubtargetInfo &STI) {
  return new McasmTargetStreamer(S);
}

namespace {

class McasmMCInstrAnalysis : public MCInstrAnalysis {
public:
  McasmMCInstrAnalysis(const MCInstrInfo *Info) : MCInstrAnalysis(Info) {}
};

} // end anonymous namespace

static MCInstrAnalysis *createMcasmMCInstrAnalysis(const MCInstrInfo *Info) {
  return new McasmMCInstrAnalysis(Info);
}

// Force static initialization
extern "C" LLVM_C_ABI void LLVMInitializeMcasmTargetMC() {
  // Register the 32-bit mcasm target
  Target *T = &getTheMcasm_32Target();

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
      [](MCStreamer &S, const MCSubtargetInfo &STI) -> MCTargetStreamer* {
        return createMcasmObjectTargetStreamer(S, STI);
      });

  // Register the asm target streamer.
  TargetRegistry::RegisterAsmTargetStreamer(*T, createMcasmAsmTargetStreamer);

  // Register the null streamer.
  TargetRegistry::RegisterNullTargetStreamer(*T,
      [](MCStreamer &S) -> MCTargetStreamer* {
        return createMcasmNullTargetStreamer(S);
      });

  // Register the MCInstPrinter.
  TargetRegistry::RegisterMCInstPrinter(*T, createMcasmMCInstPrinter);

  // Register the asm backend
  TargetRegistry::RegisterMCAsmBackend(*T, createMcasm_32AsmBackend);
}
