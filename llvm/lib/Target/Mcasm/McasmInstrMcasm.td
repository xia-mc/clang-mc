//===-- Mcasm32InstrMcasm.td - mcasm Native Instructions -----*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file defines native mcasm instructions (MOV and ADD for Phase 1).
// mcasm supports dual memory operands (e.g., MOV [r0], [r1]).
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Instruction Base Classes
//===----------------------------------------------------------------------===//

// Simplified wrapper for mcasm instructions
// Uses the existing McasmInst from McasmInstrFormats.td
class Mcasm32Inst<dag outs, dag ins, string asm, list<dag> pattern>
  : McasmInst<0, Pseudo, NoImm, outs, ins, asm, GenericDomain> {
  let Pattern = pattern;
  let hasSideEffects = 0;
}

// Pseudo instruction base
class Mcasm32Pseudo<dag outs, dag ins, list<dag> pattern>
  : Mcasm32Inst<outs, ins, "", pattern> {
  let isPseudo = 1;
  let isCodeGenOnly = 1;
}

//===----------------------------------------------------------------------===//
// MOV Instructions
//===----------------------------------------------------------------------===//

// MOV reg, reg
def MOV32rr : Mcasm32Inst<
  (outs GR32:$dst), (ins GR32:$src),
  "MOV $dst, $src",
  [(set GR32:$dst, GR32:$src)]> {
  let isReMaterializable = 1;
  let isAsCheapAsAMove = 1;
}

// MOV reg, imm
def MOV32ri : Mcasm32Inst<
  (outs GR32:$dst), (ins i32imm:$src),
  "MOV $dst, $src",
  [(set GR32:$dst, imm:$src)]> {
  let isReMaterializable = 1;
  let isAsCheapAsAMove = 1;
}

// MOV reg, [mem]
def MOV32rm : Mcasm32Inst<
  (outs GR32:$dst), (ins i32mem:$src),
  "MOV $dst, [$src]",
  [(set GR32:$dst, (load addr:$src))]> {
  let mayLoad = 1;
  let canFoldAsLoad = 1;
}

// MOV [mem], reg
def MOV32mr : Mcasm32Inst<
  (outs), (ins i32mem:$dst, GR32:$src),
  "MOV [$dst], $src",
  [(store GR32:$src, addr:$dst)]> {
  let mayStore = 1;
}

// MOV [mem], imm
def MOV32mi : Mcasm32Inst<
  (outs), (ins i32mem:$dst, i32imm:$src),
  "MOV [$dst], $src",
  [(store (i32 imm:$src), addr:$dst)]> {
  let mayStore = 1;
}

// MOV [mem], [mem] - mcasm specific (dual memory operands)
// Note: This is a pseudo instruction that will be expanded
def MOV32mm : Mcasm32Pseudo<
  (outs), (ins i32mem:$dst, i32mem:$src),
  [(store (i32 (loadi32 addr:$src)), addr:$dst)]> {
  let mayLoad = 1;
  let mayStore = 1;
}

//===----------------------------------------------------------------------===//
// ADD Instructions
//===----------------------------------------------------------------------===//

// ADD reg, reg
def ADD32rr : Mcasm32Inst<
  (outs GR32:$dst), (ins GR32:$src1, GR32:$src2),
  "ADD $dst, $src2",
  [(set GR32:$dst, (add GR32:$src1, GR32:$src2))]> {
  let Constraints = "$src1 = $dst";
  let isCommutable = 1;
}

// ADD reg, imm
def ADD32ri : Mcasm32Inst<
  (outs GR32:$dst), (ins GR32:$src1, i32imm:$src2),
  "ADD $dst, $src2",
  [(set GR32:$dst, (add GR32:$src1, imm:$src2))]> {
  let Constraints = "$src1 = $dst";
}

// ADD reg, [mem]
def ADD32rm : Mcasm32Inst<
  (outs GR32:$dst), (ins GR32:$src1, i32mem:$src2),
  "ADD $dst, [$src2]",
  [(set GR32:$dst, (add GR32:$src1, (load addr:$src2)))]> {
  let Constraints = "$src1 = $dst";
  let mayLoad = 1;
}

// ADD [mem], reg
def ADD32mr : Mcasm32Inst<
  (outs), (ins i32mem:$dst, GR32:$src),
  "ADD [$dst], $src",
  [(store (add (load addr:$dst), GR32:$src), addr:$dst)]> {
  let mayLoad = 1;
  let mayStore = 1;
}

// ADD [mem], imm
def ADD32mi : Mcasm32Inst<
  (outs), (ins i32mem:$dst, i32imm:$src),
  "ADD [$dst], $src",
  [(store (add (load addr:$dst), (i32 imm:$src)), addr:$dst)]> {
  let mayLoad = 1;
  let mayStore = 1;
}

// ADD [mem], [mem] - mcasm specific (dual memory operands)
// Note: This is a pseudo instruction that will be expanded
def ADD32mm : Mcasm32Pseudo<
  (outs), (ins i32mem:$dst, i32mem:$src),
  [(store (add (loadi32 addr:$dst), (loadi32 addr:$src)), addr:$dst)]> {
  let mayLoad = 1;
  let mayStore = 1;
}

//===----------------------------------------------------------------------===//
// Control Flow Instructions (minimal for Phase 1)
//===----------------------------------------------------------------------===//

// RET
// Note: Pattern removed because Mcasmretglue expects operands
// Actual ret lowering happens in LowerReturn
def RET : Mcasm32Inst<
  (outs), (ins),
  "RET",
  []> {
  let isTerminator = 1;
  let isReturn = 1;
  let isBarrier = 1;
}

// CALL
def CALL32 : Mcasm32Inst<
  (outs), (ins i32imm:$dst),
  "CALL $dst",
  []> {
  let isCall = 1;
  let Defs = [rax, r0, r1, r2, r3, r4, r5, r6, r7, t0, t1, t2, t3, t4, t5, t6, t7, EFLAGS];
  let Uses = [rsp];
}

// CALL reg (indirect)
def CALL32r : Mcasm32Inst<
  (outs), (ins GR32:$dst),
  "CALL $dst",
  []> {
  let isCall = 1;
  let Defs = [rax, r0, r1, r2, r3, r4, r5, r6, r7, t0, t1, t2, t3, t4, t5, t6, t7, EFLAGS];
  let Uses = [rsp];
}

//===----------------------------------------------------------------------===//
// Pseudo Instructions for Stack Management
//===----------------------------------------------------------------------===//

// ADJCALLSTACKDOWN/UP - Already defined in McasmInstrCompiler.td
