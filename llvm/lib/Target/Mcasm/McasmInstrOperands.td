//===------- McasmInstrOperands.td - Mcasm Operand Definitions --*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file defines operand types for the mcasm architecture.
// mcasm is 32-bit only, so only 32-bit operands are supported.
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Register Classes for Addressing
//===----------------------------------------------------------------------===//

// Pointer register class (32-bit only for mcasm)
def x86_ptr_rc : RegisterClass<"Mcasm", [i32], 32, (add GR32)>;

// Pointer register class excluding stack pointer
def ptr_rc_nosp : RegisterClass<"Mcasm", [i32], 32, (add GR32_NOSP)>;

//===----------------------------------------------------------------------===//
// Memory Operand Definitions
//===----------------------------------------------------------------------===//

// Memory operand AsmOperandClass hierarchy
def McasmMemAsmOperand : AsmOperandClass {
  let Name = "Mem";
}

let RenderMethod = "addMemOperands", SuperClasses = [McasmMemAsmOperand] in {
  def McasmMem8AsmOperand   : AsmOperandClass { let Name = "Mem8"; }
  def McasmMem16AsmOperand  : AsmOperandClass { let Name = "Mem16"; }
  def McasmMem32AsmOperand  : AsmOperandClass { let Name = "Mem32"; }
}

def McasmAbsMemAsmOperand : AsmOperandClass {
  let Name = "AbsMem";
  let SuperClasses = [McasmMemAsmOperand];
}

// Base class for memory operands
// MIOperandInfo: (base, scale, index, displacement, segment)
class McasmMemOperand<string printMethod,
                      AsmOperandClass parserMatchClass = McasmMemAsmOperand,
                      int size = 0> : Operand<iPTR> {
  let PrintMethod = printMethod;
  let MIOperandInfo = (ops x86_ptr_rc, i8imm, ptr_rc_nosp, i32imm, SEGMENT_REG);
  let ParserMatchClass = parserMatchClass;
  let OperandType = "OPERAND_MEMORY";
  int Size = size;
}

//===----------------------------------------------------------------------===//
// Concrete Memory Operands
//===----------------------------------------------------------------------===//

// Generic memory operand (any size)
def anymem : McasmMemOperand<"printMemReference">;

// Unsized memory operand
def opaquemem : McasmMemOperand<"printMemReference">;

// Sized memory operands (mcasm only uses 32-bit, others are dummy)
def i8mem   : McasmMemOperand<"printMemReference",   McasmMem8AsmOperand, 8>;
def i16mem  : McasmMemOperand<"printMemReference",  McasmMem16AsmOperand, 16>;
def i32mem  : McasmMemOperand<"printMemReference",  McasmMem32AsmOperand, 32>;
def i64mem  : McasmMemOperand<"printMemReference",  McasmMem32AsmOperand, 64>; // Dummy

//===----------------------------------------------------------------------===//
// Addressing Modes
//===----------------------------------------------------------------------===//

// mcasm memory addressing: base + scale*index + displacement
// Example: [rsp+4], [r0+t1*4+8]
// Note: Scale is typically 1, 2, 4, or 8 (encoded in i8imm)

//===----------------------------------------------------------------------===//
// Immediate Operands
//===----------------------------------------------------------------------===//

// Note: i8imm, i16imm, i32imm are already defined in Target.td

// Immediate types for sign-extended values
// These allow 8-bit immediates to be sign-extended to 16/32/64 bits
def i16i8imm  : Operand<i16>;
def i32i8imm  : Operand<i32>;
def i64i8imm  : Operand<i64>;
def i64i32imm : Operand<i64>;

// PC-relative 32-bit immediate (for branches/calls)
def i32imm_pcrel : Operand<i32> {
  let PrintMethod = "printPCRelImm";
}

// Branch target operands
def brtarget32 : Operand<OtherVT> {
  let PrintMethod = "printPCRelImm";
  let EncoderMethod = "getJumpTargetOpValue";
  let OperandType = "OPERAND_PCREL";
}

//===----------------------------------------------------------------------===//
// Address Operand
//===----------------------------------------------------------------------===//

// Note: addr is already defined in McasmInstrFragments.td

//===----------------------------------------------------------------------===//
// Special Operands for Pseudo Instructions
//===----------------------------------------------------------------------===//

// Target immediate operands (for callseq, etc.)
// Note: timm is defined in Target.td, but we need specific print method
def i32timm : Operand<i32> {
  let PrintMethod = "printImmediate";
}

// Bare symbol operand for direct calls (no wrapping)
// Used by PseudoCALL to match direct function calls
def bare_symbol : Operand<i32>;
