//===- McasmRegisterInfo.td - Describe Mcasm Register File --*- tablegen -*-==//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file describes the Mcasm Register file for mcasm (Minecraft assembly).
// mcasm is a 32-bit integer-only architecture with the following registers:
// - r0-r7: Argument/temporary registers (caller-saved)
// - t0-t7: Temporary registers (caller-saved)
// - x0-x15: Saved registers (callee-saved)
// - rsp: Stack pointer
// - rax: Return value register
// - shp: Heap size pointer
// - sbp: Static base pointer
// - s0-s4: Compiler-reserved registers (not allocatable)
//
//===----------------------------------------------------------------------===//

class McasmReg<string n, bits<16> Enc> : Register<n> {
  let Namespace = "Mcasm";
  let HWEncoding = Enc;
}

//===----------------------------------------------------------------------===//
// Sub-Register Indices (Dummy for compatibility with vector code)
//===----------------------------------------------------------------------===//

let Namespace = "Mcasm" in {
  // These are dummy indices for compatibility with X86 vector code
  // mcasm doesn't actually support vector operations
  def sub_xmm : SubRegIndex<128>;
  def sub_ymm : SubRegIndex<256>;
}

//===----------------------------------------------------------------------===//
// Argument/Temporary Registers (Caller-saved)
//===----------------------------------------------------------------------===//

// Argument registers: r0-r7
// Used for passing first 8 integer arguments
def r0 : McasmReg<"r0", 0>;
def r1 : McasmReg<"r1", 1>;
def r2 : McasmReg<"r2", 2>;
def r3 : McasmReg<"r3", 3>;
def r4 : McasmReg<"r4", 4>;
def r5 : McasmReg<"r5", 5>;
def r6 : McasmReg<"r6", 6>;
def r7 : McasmReg<"r7", 7>;

// Temporary registers: t0-t7
// Used for temporary values (caller-saved)
def t0 : McasmReg<"t0", 8>;
def t1 : McasmReg<"t1", 9>;
def t2 : McasmReg<"t2", 10>;
def t3 : McasmReg<"t3", 11>;
def t4 : McasmReg<"t4", 12>;
def t5 : McasmReg<"t5", 13>;
def t6 : McasmReg<"t6", 14>;
def t7 : McasmReg<"t7", 15>;

//===----------------------------------------------------------------------===//
// Saved Registers (Callee-saved)
//===----------------------------------------------------------------------===//

// Saved registers: x0-x15
// Must be preserved across function calls
def x0  : McasmReg<"x0",  16>;
def x1  : McasmReg<"x1",  17>;
def x2  : McasmReg<"x2",  18>;
def x3  : McasmReg<"x3",  19>;
def x4  : McasmReg<"x4",  20>;
def x5  : McasmReg<"x5",  21>;
def x6  : McasmReg<"x6",  22>;
def x7  : McasmReg<"x7",  23>;
def x8  : McasmReg<"x8",  24>;
def x9  : McasmReg<"x9",  25>;
def x10 : McasmReg<"x10", 26>;
def x11 : McasmReg<"x11", 27>;
def x12 : McasmReg<"x12", 28>;
def x13 : McasmReg<"x13", 29>;
def x14 : McasmReg<"x14", 30>;
def x15 : McasmReg<"x15", 31>;

//===----------------------------------------------------------------------===//
// Special Registers
//===----------------------------------------------------------------------===//

def rsp : McasmReg<"rsp", 32>; // Stack pointer
def rax : McasmReg<"rax", 33>; // Return value register
def shp : McasmReg<"shp", 34>; // Heap size pointer
def sbp : McasmReg<"sbp", 35>; // Static base pointer

//===----------------------------------------------------------------------===//
// Compiler-Reserved Registers (Not Allocatable)
//===----------------------------------------------------------------------===//

def s0 : McasmReg<"s0", 36>;
def s1 : McasmReg<"s1", 37>;
def s2 : McasmReg<"s2", 38>;
def s3 : McasmReg<"s3", 39>;
def s4 : McasmReg<"s4", 40>;

//===----------------------------------------------------------------------===//
// Special Control Registers (for compatibility with LLVM framework)
//===----------------------------------------------------------------------===//

// Flags register (needed for conditional operations)
def EFLAGS : McasmReg<"flags", 41>;

//===----------------------------------------------------------------------===//
// Register Classes
//===----------------------------------------------------------------------===//

// Argument registers (r0-r7) - used for passing first 8 arguments
def GR32_ARG : RegisterClass<"Mcasm", [i32], 32,
  (add r0, r1, r2, r3, r4, r5, r6, r7)>;

// Temporary registers (t0-t7) - caller-saved
def GR32_TMP : RegisterClass<"Mcasm", [i32], 32,
  (add t0, t1, t2, t3, t4, t5, t6, t7)>;

// Saved registers (x0-x15) - callee-saved
def GR32_SAVED : RegisterClass<"Mcasm", [i32], 32,
  (add x0, x1, x2, x3, x4, x5, x6, x7,
       x8, x9, x10, x11, x12, x13, x14, x15)>;

// All general-purpose 32-bit registers (including rax)
// Allocation order: argument regs -> temp regs -> saved regs -> rax
def GR32 : RegisterClass<"Mcasm", [i32], 32,
  (add GR32_ARG, GR32_TMP, GR32_SAVED, rax)> {
  let isAllocatable = 1;
}

// All registers except stack pointer (used for most operations)
def GR32_NOSP : RegisterClass<"Mcasm", [i32], 32,
  (sub GR32, rsp)> {
  let isAllocatable = 1;
}

// Reserved registers (not allocatable)
// rsp: stack pointer
// shp, sbp: special pointers
// s0-s4: compiler reserved
// EFLAGS: status flags
def GR32_RESERVED : RegisterClass<"Mcasm", [i32], 32,
  (add rsp, shp, sbp, s0, s1, s2, s3, s4)> {
  let isAllocatable = 0;
}

//===----------------------------------------------------------------------===//
// Status Flags Register Class
//===----------------------------------------------------------------------===//

def CCR : RegisterClass<"Mcasm", [i32], 32, (add EFLAGS)> {
  let CopyCost = -1;  // Don't allow copying of status registers
  let isAllocatable = 0;
}

//===----------------------------------------------------------------------===//
// 8-bit and 16-bit Register Classes (dummy for compatibility)
//===----------------------------------------------------------------------===//

// mcasm only supports 32-bit operations, but some utility code expects
// 8-bit and 16-bit register classes to exist

// Dummy 8-bit registers (map to low byte of r0-r7)
def r0_8 : McasmReg<"r0b", 100>;
def r1_8 : McasmReg<"r1b", 101>;
def r2_8 : McasmReg<"r2b", 102>;
def r3_8 : McasmReg<"r3b", 103>;

def GR8 : RegisterClass<"Mcasm", [i8], 8, (add r0_8, r1_8, r2_8, r3_8)> {
  let isAllocatable = 0;
}

// Dummy 16-bit registers (map to low word of r0-r7)
def r0_16 : McasmReg<"r0w", 110>;
def r1_16 : McasmReg<"r1w", 111>;
def r2_16 : McasmReg<"r2w", 112>;
def r3_16 : McasmReg<"r3w", 113>;

def GR16 : RegisterClass<"Mcasm", [i16], 16, (add r0_16, r1_16, r2_16, r3_16)> {
  let isAllocatable = 0;
}

// Dummy 64-bit registers (NOT supported, only for compatibility)
def r0_64 : McasmReg<"r0d", 120>;
def r1_64 : McasmReg<"r1d", 121>;

def GR64 : RegisterClass<"Mcasm", [i64], 64, (add r0_64, r1_64)> {
  let isAllocatable = 0;
}

//===----------------------------------------------------------------------===//
// Segment Register Class (dummy for compatibility)
//===----------------------------------------------------------------------===//

// Define dummy segment registers (not used in mcasm but needed for operand definitions)
def CS_dummy : McasmReg<"cs", 42>;
def SEGMENT_REG : RegisterClass<"Mcasm", [i16], 16, (add CS_dummy)> {
  let isAllocatable = 0;
}
