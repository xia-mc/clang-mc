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
