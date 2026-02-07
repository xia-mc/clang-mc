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
def MOV32rr : I<0x89, MRMDestReg, (outs GR32:$dst), (ins GR32:$src),
                "mov\t{$src, $dst|$dst, $src}",
                [(set GR32:$dst, GR32:$src)]>;

// MOV - Immediate to Register
def MOV32ri : Ii32<0xB8, AddRegFrm, (outs GR32:$dst), (ins i32imm:$src),
                   "mov\t{$src, $dst|$dst, $src}",
                   [(set GR32:$dst, imm:$src)]>;

// MOV - Memory to Register (Load)
def MOV32rm : I<0x8B, MRMSrcMem, (outs GR32:$dst), (ins i32mem:$src),
                "mov\t{$src, $dst|$dst, $src}",
                [(set GR32:$dst, (load addr:$src))]>;

// MOV - Register to Memory (Store)
def MOV32mr : I<0x89, MRMDestMem, (outs), (ins i32mem:$dst, GR32:$src),
                "mov\t{$src, $dst|$dst, $src}",
                [(store GR32:$src, addr:$dst)]>;

// MOV - Immediate to Memory
def MOV32mi : Ii32<0xC7, MRM0m, (outs), (ins i32mem:$dst, i32imm:$src),
                   "mov\t{$src, $dst|$dst, $src}",
                   [(store (i32 imm:$src), addr:$dst)]>;

//===----------------------------------------------------------------------===//
// ADD - Add instruction
//===----------------------------------------------------------------------===//

let Defs = [EFLAGS] in {

// ADD - Register to Register
def ADD32rr : I<0x01, MRMDestReg, (outs GR32:$dst), (ins GR32:$src1, GR32:$src2),
                "add\t{$src2, $dst|$dst, $src2}",
                [(set GR32:$dst, (add GR32:$src1, GR32:$src2))]>;

// ADD - Immediate to Register
def ADD32ri : Ii32<0x81, MRM0r, (outs GR32:$dst), (ins GR32:$src1, i32imm:$src2),
                   "add\t{$src2, $dst|$dst, $src2}",
                   [(set GR32:$dst, (add GR32:$src1, imm:$src2))]>;

// ADD - Memory to Register
def ADD32rm : I<0x03, MRMSrcMem, (outs GR32:$dst), (ins GR32:$src1, i32mem:$src2),
                "add\t{$src2, $dst|$dst, $src2}",
                [(set GR32:$dst, (add GR32:$src1, (load addr:$src2)))]>;

// ADD - Register to Memory (read-modify-write)
def ADD32mr : I<0x01, MRMDestMem, (outs), (ins i32mem:$dst, GR32:$src),
                "add\t{$src, $dst|$dst, $src}",
                [(store (add (load addr:$dst), GR32:$src), addr:$dst)]>;

// ADD - Immediate to Memory (read-modify-write)
def ADD32mi : Ii32<0x81, MRM0m, (outs), (ins i32mem:$dst, i32imm:$src),
                   "add\t{$src, $dst|$dst, $src}",
                   [(store (add (load addr:$dst), (i32 imm:$src)), addr:$dst)]>;

} // Defs = [EFLAGS]

//===----------------------------------------------------------------------===//
// RET - Return instruction
//===----------------------------------------------------------------------===//

// RET - Pseudo instruction for return
let isTerminator = 1, isReturn = 1, isBarrier = 1, hasCtrlDep = 1, isPseudo = 1 in {
  def RET : I<0, Pseudo, (outs), (ins i32imm:$adj, variable_ops),
              "#RET", [(Mcasmretglue timm:$adj)]>;
}
