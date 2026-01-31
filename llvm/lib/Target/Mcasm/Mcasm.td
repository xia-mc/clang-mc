//===-- Mcasm.td - Target definition file for Mcasm Backend --*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This is a simplified target description file for the Mcasm architecture.
// Mcasm is a minimal 32-bit integer-only backend derived from X86.
//
//===----------------------------------------------------------------------===//

// Get the target-independent interfaces which we are implementing...
//
include "llvm/Target/Target.td"

//===----------------------------------------------------------------------===//
// Mcasm Subtarget Features
//===----------------------------------------------------------------------===//

// Mode features for compatibility with X86 predicates
// mcasm only supports 32-bit mode
def Is16Bit : SubtargetFeature<"16bit-mode", "In16BitMode", "false",
                                "16-bit mode (NOT supported in mcasm)">;

def Is32Bit : SubtargetFeature<"32bit-mode", "In32BitMode", "true",
                                "32-bit mode (i386)">;

def Is64Bit : SubtargetFeature<"64bit-mode", "In64BitMode", "false",
                                "64-bit mode (NOT supported in mcasm)">;

def IsX32 : SubtargetFeature<"x32", "IsX32", "false",
                              "x32 ABI (NOT supported in mcasm)">;

// Alias for Is32Bit (for backward compatibility)
def Mode32Bit : SubtargetFeature<"mode-32bit", "Is32Bit_", "true",
                                  "32-bit mode">;


// Basic instruction set features
def FeatureCMOV : SubtargetFeature<"cmov", "HasCMOV", "true",
                                    "Enable conditional move instructions">;

def FeatureNOPL : SubtargetFeature<"nopl", "HasNOPL", "true",
                                    "Enable NOPL instruction">;

def FeatureCX8  : SubtargetFeature<"cx8", "HasCX8", "true",
                                    "Support CMPXCHG8B instructions">;

//===----------------------------------------------------------------------===//
// Register File Description
//===----------------------------------------------------------------------===//

include "McasmRegisterInfo.td"

//===----------------------------------------------------------------------===//
// Instruction Descriptions
//===----------------------------------------------------------------------===//

include "McasmInstrInfo.td"

def McasmInstrInfo : InstrInfo;

//===----------------------------------------------------------------------===//
// Calling Conventions
//===----------------------------------------------------------------------===//

include "McasmCallingConv.td"

//===----------------------------------------------------------------------===//
// Assembly Printers and Parsers
//===----------------------------------------------------------------------===//

def McasmAsmWriter : AsmWriter {
  string AsmWriterClassName  = "InstPrinter";
  int PassSubtarget = 1;
  int Variant = 0;
}

def McasmAsmParserVariant : AsmParserVariant {
  int Variant = 0;
  string Name = "att";
  string BreakCharacters = ".";
  string TokenizingCharacters = "[]*!";
}

//===----------------------------------------------------------------------===//
// Assembly Parsers
//===----------------------------------------------------------------------===//

def McasmAsmParser : AsmParser {
  string AsmParserClassName = "AsmParser";
}

//===----------------------------------------------------------------------===//
// Subtarget Features
//===----------------------------------------------------------------------===//

class Proc<string Name, list<SubtargetFeature> Features>
 : Processor<Name, NoItineraries, Features>;

//===----------------------------------------------------------------------===//
// CPU Definitions
//===----------------------------------------------------------------------===//

// Generic 32-bit processor
def : Proc<"generic", [FeatureCMOV, FeatureNOPL, FeatureCX8, Is32Bit]>;

// Basic i386 compatible processor
def : Proc<"i386", [Is32Bit]>;

// i686 compatible processor
def : Proc<"i686", [FeatureCMOV, FeatureNOPL, Is32Bit]>;

//===----------------------------------------------------------------------===//
// Target Declaration
//===----------------------------------------------------------------------===//

// Remap standard pseudo instructions to use Mcasm-specific register classes
// This is required for LOAD_STACK_GUARD, PREALLOCATED_ARG, etc.
defm : RemapAllTargetPseudoPointerOperands<x86_ptr_rc>;

def Mcasm : Target {
  let InstructionSet = McasmInstrInfo;
  let AssemblyWriters = [McasmAsmWriter];
  let AssemblyParsers = [McasmAsmParser];
  let AssemblyParserVariants = [McasmAsmParserVariant];
}
