//===-- McasmInstrInfo.td - Main Mcasm Instruction Properties --*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file describes the Mcasm properties of the instructions which are needed
// for code generation, machine code emission, and analysis.
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Mcasm Pattern fragments.
//
include "McasmInstrFragments.td"

//===----------------------------------------------------------------------===//
// Mcasm Predicate Definitions.
//
include "McasmInstrPredicates.td"

//===----------------------------------------------------------------------===//
// Mcasm Operand Definitions.
//
include "McasmInstrOperands.td"

//===----------------------------------------------------------------------===//
// Mcasm Instruction Format Definitions.
//
include "McasmInstrFormats.td"

//===----------------------------------------------------------------------===//
// Mcasm Instruction utilities.
//
// Temporarily disabled - contains X86-specific vector/float code
// include "McasmInstrUtils.td"

//===----------------------------------------------------------------------===//
// mcasm Native Instructions (Phase 1: MOV and ADD only)
//===----------------------------------------------------------------------===//

include "McasmInstrMcasm.td"

//===----------------------------------------------------------------------===//
// Basic Integer Instructions (Original X86-based, TEMPORARILY DISABLED)
//===----------------------------------------------------------------------===//

// Temporarily comment out X86 instruction includes to simplify compilation
// These will be re-enabled or replaced with mcasm versions later

// include "McasmInstrMisc.td"
// include "McasmInstrArithmetic.td"
// include "McasmInstrCMovSetCC.td"
// include "McasmInstrExtension.td"
// include "McasmInstrControl.td"
// include "McasmInstrShiftRotate.td"

// System instructions.
// include "McasmInstrSystem.td"

// Compiler Pseudo Instructions and Pat Patterns
include "McasmInstrCompiler.td"

// Assembler mnemonic/instruction aliases
// include "McasmInstrAsmAlias.td"
