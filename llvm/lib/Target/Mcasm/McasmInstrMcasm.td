//===-- McasmInstrMcasm.td - Mcasm Native Instructions -----*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file defines the mcasm native instructions (MOV and ADD for Phase 1).
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// MOV - Move instruction
//===----------------------------------------------------------------------===//

// MOV - Register to Register
// mcasm syntax: mov dst, src (no AT&T/Intel distinction)
def MOV32rr : I<0x89, MRMDestReg, (outs GR32:$dst), (ins GR32:$src),
                "mov\t$dst, $src",
                [(set GR32:$dst, GR32:$src)]>;

// MOV - Immediate to Register
// AddedComplexity = 10 to prioritize over MOV32rr for constant operands
def MOV32ri : Ii32<0xB8, AddRegFrm, (outs GR32:$dst), (ins i32imm:$src),
                   "mov\t$dst, $src",
                   [(set GR32:$dst, imm:$src)]> {
  let isReMaterializable = 1;
  let isAsCheapAsAMove = 1;
  let AddedComplexity = 10;
}

// MOV - Memory to Register (Load)
def MOV32rm : I<0x8B, MRMSrcMem, (outs GR32:$dst), (ins i32mem:$src),
                "mov\t$dst, $src",
                [(set GR32:$dst, (load addr:$src))]>;

// MOV - Register to Memory (Store)
def MOV32mr : I<0x89, MRMDestMem, (outs), (ins i32mem:$dst, GR32:$src),
                "mov\t$dst, $src",
                [(store GR32:$src, addr:$dst)]>;

// MOV - Immediate to Memory
def MOV32mi : Ii32<0xC7, MRM0m, (outs), (ins i32mem:$dst, i32imm:$src),
                   "mov\t$dst, $src",
                   [(store (i32 imm:$src), addr:$dst)]>;

//===----------------------------------------------------------------------===//
// Address Materialization Patterns
//===----------------------------------------------------------------------===//

// Pattern for loading global addresses, block addresses, constant pool entries,
// and jump tables. These are lowered to Wrapper nodes in LowerOperation,
// and then matched here to MOV32ri instructions.
def : Pat<(i32 (McasmWrapper tglobaladdr:$src)), (MOV32ri tglobaladdr:$src)>;
def : Pat<(i32 (McasmWrapper tblockaddress:$src)), (MOV32ri tblockaddress:$src)>;
def : Pat<(i32 (McasmWrapper tconstpool:$src)), (MOV32ri tconstpool:$src)>;
def : Pat<(i32 (McasmWrapper tjumptable:$src)), (MOV32ri tjumptable:$src)>;

//===----------------------------------------------------------------------===//
// ADD - Add instruction
//===----------------------------------------------------------------------===//

let Defs = [EFLAGS] in {

// ADD - Register to Register
def ADD32rr : I<0x01, MRMDestReg, (outs GR32:$dst), (ins GR32:$src1, GR32:$src2),
                "add\t$dst, $src2",
                [(set GR32:$dst, (add GR32:$src1, GR32:$src2))]>;

// ADD - Immediate to Register
def ADD32ri : Ii32<0x81, MRM0r, (outs GR32:$dst), (ins GR32:$src1, i32imm:$src2),
                   "add\t$dst, $src2",
                   [(set GR32:$dst, (add GR32:$src1, imm:$src2))]>;

// ADD - Memory to Register
def ADD32rm : I<0x03, MRMSrcMem, (outs GR32:$dst), (ins GR32:$src1, i32mem:$src2),
                "add\t$dst, $src2",
                [(set GR32:$dst, (add GR32:$src1, (load addr:$src2)))]>;

// ADD - Register to Memory (read-modify-write)
def ADD32mr : I<0x01, MRMDestMem, (outs), (ins i32mem:$dst, GR32:$src),
                "add\t$dst, $src",
                [(store (add (load addr:$dst), GR32:$src), addr:$dst)]>;

// ADD - Immediate to Memory (read-modify-write)
def ADD32mi : Ii32<0x81, MRM0m, (outs), (ins i32mem:$dst, i32imm:$src),
                   "add\t$dst, $src",
                   [(store (add (load addr:$dst), (i32 imm:$src)), addr:$dst)]>;

} // Defs = [EFLAGS]

//===----------------------------------------------------------------------===//
// SUB - Subtract instruction
//===----------------------------------------------------------------------===//

let Defs = [EFLAGS] in {

// SUB - Register from Register
def SUB32rr : I<0x29, MRMDestReg, (outs GR32:$dst), (ins GR32:$src1, GR32:$src2),
                "sub\t$dst, $src2",
                [(set GR32:$dst, (sub GR32:$src1, GR32:$src2))]>;

// SUB - Immediate from Register
def SUB32ri : Ii32<0x81, MRM5r, (outs GR32:$dst), (ins GR32:$src1, i32imm:$src2),
                   "sub\t$dst, $src2",
                   [(set GR32:$dst, (sub GR32:$src1, imm:$src2))]>;

// SUB - Memory from Register
def SUB32rm : I<0x2B, MRMSrcMem, (outs GR32:$dst), (ins GR32:$src1, i32mem:$src2),
                "sub\t$dst, $src2",
                [(set GR32:$dst, (sub GR32:$src1, (load addr:$src2)))]>;

// SUB - Register from Memory (read-modify-write)
def SUB32mr : I<0x29, MRMDestMem, (outs), (ins i32mem:$dst, GR32:$src),
                "sub\t$dst, $src",
                [(store (sub (load addr:$dst), GR32:$src), addr:$dst)]>;

// SUB - Immediate from Memory (read-modify-write)
def SUB32mi : Ii32<0x81, MRM5m, (outs), (ins i32mem:$dst, i32imm:$src),
                   "sub\t$dst, $src",
                   [(store (sub (load addr:$dst), (i32 imm:$src)), addr:$dst)]>;

} // Defs = [EFLAGS]

//===----------------------------------------------------------------------===//
// Control Flow Instructions
//===----------------------------------------------------------------------===//

// JMP - Unconditional jump to label
let isBarrier = 1, isBranch = 1, isTerminator = 1 in {
  def JMP32 : I<0xE9, RawFrm, (outs), (ins brtarget32:$dst),
                "jmp\t$dst",
                [(br bb:$dst)]>;
}

// CALL - Procedure call to label
// Note: mcasm CALL does NOT modify stack (different from x86)
let isCall = 1, Uses = [rsp] in {
  def CALL32 : I<0xE8, RawFrm, (outs), (ins brtarget32:$dst),
                 "call\t$dst",
                 []>;
}

//===----------------------------------------------------------------------===//
// RET - Return instruction (mcasm native - no parameters)
//===----------------------------------------------------------------------===//

// RET - Real mcasm return instruction (not pseudo)
// mcasm RET has NO parameters - caller cleanup is done by caller with ADD/POP
let isTerminator = 1, isReturn = 1, isBarrier = 1, hasCtrlDep = 1,
    Uses = [rax] in {
  def RET : I<0xC3, RawFrm, (outs), (ins), "ret", [(Mcasmretglue)]>;
}

//===----------------------------------------------------------------------===//
// Dynamic Instructions - For function pointers and callbacks
//===----------------------------------------------------------------------===//

// MOVD - Move label reference (function pointer)
// Gets a unique identifier for a label (similar to taking address of function)
// More expensive than MOV, should be cached when possible

// MOVD label, register
def MOVD32ri : I<0xB9, AddRegFrm, (outs GR32:$dst), (ins i32imm:$src),
                 "movd\t$dst, $src",
                 []>;

// MOVD label, memory
def MOVD32mi : Ii32<0xC8, MRM0m, (outs), (ins i32mem:$dst, i32imm:$src),
                    "movd\t$dst, $src",
                    []>;

// CALLD - Dynamic procedure call via label reference
// Calls a procedure through a label reference stored in register or memory
// More expensive than CALL, use cautiously

// CALLD register
let isCall = 1, Uses = [rsp] in {
  def CALLD32r : I<0xFF, MRM2r, (outs), (ins GR32:$dst),
                   "calld\t$dst",
                   []>;
}

// CALLD memory
let isCall = 1, Uses = [rsp] in {
  def CALLD32m : I<0xFF, MRM2m, (outs), (ins i32mem:$dst),
                   "calld\t$dst",
                   []>;
}

// JMPD - Dynamic unconditional jump via label reference
// Jumps to a label through a reference stored in register or memory
// More expensive than JMP, use cautiously
// Note: No dynamic conditional jumps (JccD) - combine Jcc with JMPD instead

// JMPD register
let isBarrier = 1, isBranch = 1, isTerminator = 1, isIndirectBranch = 1 in {
  def JMPD32r : I<0xFF, MRM4r, (outs), (ins GR32:$dst),
                  "jmpd\t$dst",
                  [(brind GR32:$dst)]>;
}

// JMPD memory
let isBarrier = 1, isBranch = 1, isTerminator = 1, isIndirectBranch = 1 in {
  def JMPD32m : I<0xFF, MRM4m, (outs), (ins i32mem:$dst),
                  "jmpd\t$dst",
                  [(brind (load addr:$dst))]>;
}

//===----------------------------------------------------------------------===//
// Conditional Jump Instructions - Jcc
//===----------------------------------------------------------------------===//
// mcasm conditional jumps directly compare operands and jump,
// unlike x86 which uses flags from prior CMP instruction.
// Format: Jcc src1, src2, label (or Jcc src, label for JZ/JNZ)

// JE - Jump if Equal (src1 == src2)
let isBranch = 1, isTerminator = 1, Uses = [EFLAGS] in {
  def JE32rr : I<0x74, MRMDestReg, (outs), (ins GR32:$src1, GR32:$src2, brtarget32:$dst),
                 "je\t$src1, $src2, $dst",
                 []>;
}

// JZ - Jump if Zero (src == 0)
let isBranch = 1, isTerminator = 1, Uses = [EFLAGS] in {
  def JZ32r : I<0x74, MRMSrcReg, (outs), (ins GR32:$src, brtarget32:$dst),
                "jz\t$src, $dst",
                []>;
}

// JNE - Jump if Not Equal (src1 != src2)
let isBranch = 1, isTerminator = 1, Uses = [EFLAGS] in {
  def JNE32rr : I<0x75, MRMDestReg, (outs), (ins GR32:$src1, GR32:$src2, brtarget32:$dst),
                  "jne\t$src1, $src2, $dst",
                  []>;
}

// JNZ - Jump if Not Zero (src != 0)
let isBranch = 1, isTerminator = 1, Uses = [EFLAGS] in {
  def JNZ32r : I<0x75, MRMSrcReg, (outs), (ins GR32:$src, brtarget32:$dst),
                 "jnz\t$src, $dst",
                 []>;
}

// JG - Jump if Greater (src1 > src2, signed)
let isBranch = 1, isTerminator = 1, Uses = [EFLAGS] in {
  def JG32rr : I<0x7F, MRMDestReg, (outs), (ins GR32:$src1, GR32:$src2, brtarget32:$dst),
                 "jg\t$src1, $src2, $dst",
                 []>;
}

// JGE - Jump if Greater or Equal (src1 >= src2, signed)
let isBranch = 1, isTerminator = 1, Uses = [EFLAGS] in {
  def JGE32rr : I<0x7D, MRMDestReg, (outs), (ins GR32:$src1, GR32:$src2, brtarget32:$dst),
                  "jge\t$src1, $src2, $dst",
                  []>;
}

// JL - Jump if Less (src1 < src2, signed)
let isBranch = 1, isTerminator = 1, Uses = [EFLAGS] in {
  def JL32rr : I<0x7C, MRMDestReg, (outs), (ins GR32:$src1, GR32:$src2, brtarget32:$dst),
                 "jl\t$src1, $src2, $dst",
                 []>;
}

// JLE - Jump if Less or Equal (src1 <= src2, signed)
let isBranch = 1, isTerminator = 1, Uses = [EFLAGS] in {
  def JLE32rr : I<0x7E, MRMDestReg, (outs), (ins GR32:$src1, GR32:$src2, brtarget32:$dst),
                  "jle\t$src1, $src2, $dst",
                  []>;
}
