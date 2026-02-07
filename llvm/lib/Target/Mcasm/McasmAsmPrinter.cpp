//===-- McasmAsmPrinter.cpp - Convert Mcasm LLVM code to mcasm assembly --===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file contains a printer that converts from our internal representation
// of machine-dependent LLVM code to mcasm assembly language.
//
// MCASM NOTE: This is a minimal rewrite for the mcasm backend. It outputs
// mcasm-specific syntax:
// - File header: #include "_ll_std"
// - External functions: export _ll_shared:funcname:
// - Internal functions: funcname:
// - Global variables: static varname [val1, val2, ...]
//
// CRITICAL: This file does NOT perform memory offset conversion. All offsets
// are already in mcasm units from FrameLowering and RegisterInfo.
//
//===----------------------------------------------------------------------===//

#include "McasmAsmPrinter.h"
#include "MCTargetDesc/McasmMCTargetDesc.h"
#include "Mcasm.h"
#include "McasmMCInstLower.h"
#include "McasmSubtarget.h"
#include "TargetInfo/McasmTargetInfo.h"
#include "llvm/CodeGen/MachineConstantPool.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineInstr.h"
#include "llvm/CodeGen/MachineModuleInfo.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/Mangler.h"
#include "llvm/IR/Module.h"
#include "llvm/MC/MCContext.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCStreamer.h"
#include "llvm/MC/MCSymbol.h"
#include "llvm/MC/TargetRegistry.h"
#include "llvm/Support/ErrorHandling.h"

using namespace llvm;

McasmAsmPrinter::McasmAsmPrinter(TargetMachine &TM,
                                 std::unique_ptr<MCStreamer> Streamer)
    : AsmPrinter(TM, std::move(Streamer)), Subtarget(nullptr) {
  fprintf(stderr, "DEBUG: McasmAsmPrinter constructor completed\n");
  fflush(stderr);
}

void McasmAsmPrinter::emitStartOfAsmFile(Module &M) {
  fprintf(stderr, "DEBUG: McasmAsmPrinter::emitStartOfAsmFile called\n");
  fflush(stderr);
  // mcasm requires #include "_ll_std" at the start of every file
  OutStreamer->emitRawText("#include \"_ll_std\"");
  OutStreamer->emitRawText("");  // Blank line
  fprintf(stderr, "DEBUG: McasmAsmPrinter::emitStartOfAsmFile completed\n");
  fflush(stderr);
}

void McasmAsmPrinter::emitEndOfAsmFile(Module &M) {
  // Nothing special needed at end of file for mcasm
}

bool McasmAsmPrinter::runOnMachineFunction(MachineFunction &MF) {
  // Set subtarget
  Subtarget = &MF.getSubtarget<McasmSubtarget>();

  // Call base class implementation
  return AsmPrinter::runOnMachineFunction(MF);
}

void McasmAsmPrinter::emitFunctionBodyStart() {
  // mcasm doesn't need CFI directives (.cfi_startproc)
  // Override to prevent base class from emitting them
}

void McasmAsmPrinter::emitFunctionBodyEnd() {
  // mcasm doesn't need CFI directives (.cfi_endproc) or .size directives
  // Override to prevent base class from emitting them
}

void McasmAsmPrinter::emitFunctionEntryLabel() {
  fprintf(stderr, "DEBUG: McasmAsmPrinter::emitFunctionEntryLabel called\n");
  fflush(stderr);

  MCSymbol *FnSym = CurrentFnSym;
  fprintf(stderr, "DEBUG:   FunctionName = %s\n", FnSym->getName().str().c_str());
  fflush(stderr);

  // Determine linkage type
  const Function &F = MF->getFunction();
  bool IsExternal = F.hasExternalLinkage() || F.hasCommonLinkage();
  fprintf(stderr, "DEBUG:   IsExternal = %d\n", (int)IsExternal);
  fflush(stderr);

  if (IsExternal) {
    // External linkage: export _ll_shared:funcname:
    // NOTE: User has reservations about "_ll_shared" naming.
    // Consider changing to "llvm" or module-based namespace in the future.
    std::string Label = "export _ll_shared:";
    Label += FnSym->getName();
    Label += ":";
    fprintf(stderr, "DEBUG:   Emitting label: %s\n", Label.c_str());
    fflush(stderr);
    OutStreamer->emitRawText(Label);
  } else {
    // Internal linkage: funcname:
    fprintf(stderr, "DEBUG:   Emitting internal label\n");
    fflush(stderr);
    OutStreamer->emitLabel(FnSym);
  }

  fprintf(stderr, "DEBUG: McasmAsmPrinter::emitFunctionEntryLabel completed\n");
  fflush(stderr);
}

void McasmAsmPrinter::emitInstruction(const MachineInstr *MI) {
  fprintf(stderr, "DEBUG: McasmAsmPrinter::emitInstruction called, Opcode=%u\n", MI->getOpcode());
  fflush(stderr);

  // Skip pseudo instructions
  if (MI->isPseudo()) {
    fprintf(stderr, "DEBUG:   Skipping pseudo instruction\n");
    fflush(stderr);
    return;
  }

  // Lower MachineInstr to MCInst
  MCInst TmpInst;
  if (!MCInstLowering) {
    MCInstLowering = std::make_unique<McasmMCInstLower>(OutContext, *MF, *this);
  }
  MCInstLowering->Lower(MI, TmpInst);

  fprintf(stderr, "DEBUG:   About to emit MCInst\n");
  fflush(stderr);

  // Emit the MCInst
  // NOTE: Memory offsets in TmpInst are already in mcasm units.
  // Do NOT perform any offset conversion here!
  EmitToStreamer(*OutStreamer, TmpInst);
}

void McasmAsmPrinter::emitGlobalVariable(const GlobalVariable *GV) {
  // Only emit initialized global variables
  if (!GV->hasInitializer()) {
    return;
  }

  // mcasm syntax: static varname [val1, val2, ...]
  std::string Output = "static ";
  Output += GV->getName();
  Output += " [";

  const Constant *C = GV->getInitializer();

  // Emit initializer values
  if (const ConstantDataSequential *CDS = dyn_cast<ConstantDataSequential>(C)) {
    // Array of integers
    for (unsigned i = 0, e = CDS->getNumElements(); i != e; ++i) {
      if (i > 0) Output += ", ";
      Output += std::to_string(CDS->getElementAsInteger(i));
    }
  } else if (const ConstantInt *CI = dyn_cast<ConstantInt>(C)) {
    // Single integer
    Output += std::to_string(CI->getSExtValue());
  } else if (const ConstantAggregateZero *CAZ = dyn_cast<ConstantAggregateZero>(C)) {
    // Zero initializer
    Type *Ty = CAZ->getType();
    if (ArrayType *ATy = dyn_cast<ArrayType>(Ty)) {
      unsigned NumElems = ATy->getNumElements();
      for (unsigned i = 0; i < NumElems; ++i) {
        if (i > 0) Output += ", ";
        Output += "0";
      }
    } else {
      Output += "0";
    }
  } else if (const ConstantArray *CA = dyn_cast<ConstantArray>(C)) {
    // Array of constants
    for (unsigned i = 0, e = CA->getNumOperands(); i != e; ++i) {
      if (i > 0) Output += ", ";
      if (const ConstantInt *CI = dyn_cast<ConstantInt>(CA->getOperand(i))) {
        Output += std::to_string(CI->getSExtValue());
      } else {
        Output += "0"; // Fallback for non-integer elements
      }
    }
  } else {
    // Unknown initializer type, emit zero
    Output += "0";
  }

  Output += "]";
  OutStreamer->emitRawText(Output);
}

// Register the AsmPrinter
extern "C" LLVM_EXTERNAL_VISIBILITY void LLVMInitializeMcasmAsmPrinter() {
  fprintf(stderr, "DEBUG: LLVMInitializeMcasmAsmPrinter called\n");
  fflush(stderr);
  RegisterAsmPrinter<McasmAsmPrinter> X(getTheMcasm_32Target());
  fprintf(stderr, "DEBUG: LLVMInitializeMcasmAsmPrinter completed\n");
  fflush(stderr);
}
