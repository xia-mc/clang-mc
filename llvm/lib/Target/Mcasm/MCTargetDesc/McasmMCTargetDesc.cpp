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
  llvm::errs() << "DEBUG: createMcasmMCSubtargetInfo called\n";
  llvm::errs() << "DEBUG:   Triple = " << TT.str() << "\n";
  llvm::errs() << "DEBUG:   Triple.getArch() = " << TT.getArchName() << "\n";
  llvm::errs().flush();

  std::string ArchFS = Mcasm_MC::ParseMcasmTriple(TT);
  llvm::errs() << "DEBUG:   ArchFS = " << ArchFS << "\n";
  llvm::errs().flush();

  assert(!ArchFS.empty() && "Empty ArchFS string");

  if (!FS.empty()) {
    ArchFS = (Twine(ArchFS) + "," + FS).str();
  }

  std::string CPUName = std::string(CPU);
  if (CPUName.empty())
    CPUName = "generic";

  std::string TuneCPU = CPUName;  // Use same CPU for tuning

  llvm::errs() << "DEBUG:   CPUName = " << CPUName << "\n";
  llvm::errs() << "DEBUG:   About to call createMcasmMCSubtargetInfoImpl\n";
  llvm::errs().flush();

  MCSubtargetInfo *STI = createMcasmMCSubtargetInfoImpl(TT, CPUName, TuneCPU, ArchFS);

  llvm::errs() << "DEBUG: createMcasmMCSubtargetInfo completed\n";
  llvm::errs().flush();

  return STI;
}

static MCInstrInfo *createMcasmMCInstrInfo() {
  llvm::errs() << "DEBUG: createMcasmMCInstrInfo called\n";
  llvm::errs().flush();
  MCInstrInfo *X = new MCInstrInfo();
  llvm::errs() << "DEBUG: About to call InitMcasmMCInstrInfo\n";
  llvm::errs().flush();
  InitMcasmMCInstrInfo(X);
  llvm::errs() << "DEBUG: InitMcasmMCInstrInfo completed\n";
  llvm::errs().flush();
  return X;
}

static MCRegisterInfo *createMcasmMCRegisterInfo(const Triple &TT) {
  llvm::errs() << "DEBUG: createMcasmMCRegisterInfo called\n";
  llvm::errs().flush();
  // mcasm uses rax as the return address register (placeholder)
  (void)TT;
  unsigned RA = Mcasm::rax;

  MCRegisterInfo *X = new MCRegisterInfo();
  llvm::errs() << "DEBUG: About to call InitMcasmMCRegisterInfo\n";
  llvm::errs().flush();
  InitMcasmMCRegisterInfo(X, RA, 0, 0, RA);
  llvm::errs() << "DEBUG: InitMcasmMCRegisterInfo completed\n";
  llvm::errs().flush();
  return X;
}

static MCAsmInfo *createMcasmMCAsmInfo(const MCRegisterInfo &MRI,
                                       const Triple &TheTriple,
                                       const MCTargetOptions &Options) {
  llvm::errs() << "DEBUG: createMcasmMCAsmInfo called\n";

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

  llvm::errs() << "DEBUG: MAI created, initializing frame state\n";

  // For now, skip CFI initialization to avoid potential Dwarf register issues
  // TODO: Properly configure Dwarf register numbers for mcasm
  // unsigned SP = Mcasm::rsp;
  // MCCFIInstruction Inst = MCCFIInstruction::cfiDefCfa(nullptr,
  //                                                      MRI.getDwarfRegNum(SP, true),
  //                                                      4);
  // MAI->addInitialFrameState(Inst);

  llvm::errs() << "DEBUG: createMcasmMCAsmInfo completed\n";
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
  llvm::errs() << "DEBUG: LLVMInitializeMcasmTargetMC called\n";

  // Register the 32-bit mcasm target
  Target *T = &getTheMcasm_32Target();
  llvm::errs() << "DEBUG: Got Mcasm_32Target\n";

  // Register the MC asm info.
  RegisterMCAsmInfoFn X(*T, createMcasmMCAsmInfo);
  llvm::errs() << "DEBUG: Registered MCAsmInfo\n";

  // Register the MC instruction info.
  TargetRegistry::RegisterMCInstrInfo(*T, createMcasmMCInstrInfo);
  llvm::errs() << "DEBUG: Registered MCInstrInfo\n";

  // Register the MC register info.
  TargetRegistry::RegisterMCRegInfo(*T, createMcasmMCRegisterInfo);
  llvm::errs() << "DEBUG: Registered MCRegInfo\n";

  // Register the MC subtarget info.
  TargetRegistry::RegisterMCSubtargetInfo(*T,
                                          Mcasm_MC::createMcasmMCSubtargetInfo);
  llvm::errs() << "DEBUG: Registered MCSubtargetInfo\n";

  // Register the MC instruction analyzer.
  TargetRegistry::RegisterMCInstrAnalysis(*T, createMcasmMCInstrAnalysis);
  llvm::errs() << "DEBUG: Registered MCInstrAnalysis\n";

  // Register the code emitter.
  TargetRegistry::RegisterMCCodeEmitter(*T, createMcasmMCCodeEmitter);
  llvm::errs() << "DEBUG: Registered MCCodeEmitter\n";

  // Register the obj target streamer.
  TargetRegistry::RegisterObjectTargetStreamer(*T,
      [](MCStreamer &S, const MCSubtargetInfo &STI) -> MCTargetStreamer* {
        return createMcasmObjectTargetStreamer(S, STI);
      });
  llvm::errs() << "DEBUG: Registered ObjectTargetStreamer\n";

  // Register the asm target streamer.
  TargetRegistry::RegisterAsmTargetStreamer(*T, createMcasmAsmTargetStreamer);
  llvm::errs() << "DEBUG: Registered AsmTargetStreamer\n";

  // Register the null streamer.
  TargetRegistry::RegisterNullTargetStreamer(*T,
      [](MCStreamer &S) -> MCTargetStreamer* {
        return createMcasmNullTargetStreamer(S);
      });
  llvm::errs() << "DEBUG: Registered NullTargetStreamer\n";

  // Register the MCInstPrinter.
  TargetRegistry::RegisterMCInstPrinter(*T, createMcasmMCInstPrinter);
  llvm::errs() << "DEBUG: Registered MCInstPrinter\n";

  // Register the asm backend
  TargetRegistry::RegisterMCAsmBackend(*T, createMcasm_32AsmBackend);
  llvm::errs() << "DEBUG: Registered MCAsmBackend\n";

  llvm::errs() << "DEBUG: LLVMInitializeMcasmTargetMC completed\n";
}
