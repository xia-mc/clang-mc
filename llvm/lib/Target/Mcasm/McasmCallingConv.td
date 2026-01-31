//===-- McasmCallingConv.td - Calling Conventions for Mcasm --*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This describes the calling conventions for the mcasm architecture.
// mcasm is a 32-bit integer-only architecture for Minecraft assembly.
//
// Calling Convention:
// - First 8 integer arguments: r0-r7
// - Additional arguments: pushed on stack (right-to-left, 4-byte aligned)
// - Return value: rax
// - Caller cleans up stack
// - Callee-saved registers: x0-x15
//
//===----------------------------------------------------------------------===//

/// CCIfSubtarget - Match if the current subtarget has a feature F.
class CCIfSubtarget<string F, CCAction A>
    : CCIf<!strconcat("State.getMachineFunction()."
                      "getSubtarget<McasmSubtarget>().", F),
           A>;

//===----------------------------------------------------------------------===//
// mcasm 32-bit Calling Convention
//===----------------------------------------------------------------------===//

def CC_Mcasm_32 : CallingConv<[
  // Handle byval/preallocated parameters
  // These are passed by copying to stack with 4-byte alignment
  CCIfByVal<CCPassByVal<4, 4>>,
  CCIfPreallocated<CCPassByVal<4, 4>>,

  // Promote small integer types to i32
  // mcasm only supports 32-bit operations
  CCIfType<[i1, i8, i16], CCPromoteToType<i32>>,

  // First 8 integer arguments are passed in r0-r7
  CCIfType<[i32], CCAssignToReg<[r0, r1, r2, r3, r4, r5, r6, r7]>>,

  // Additional integer arguments are spilled to stack
  // Stack slots are 4 bytes in size and 4-byte aligned
  // Note: Stack offsets are in mcasm units (4-byte units), not bytes
  CCIfType<[i32], CCAssignToStack<4, 4>>
]>;

//===----------------------------------------------------------------------===//
// Return Value Calling Convention
//===----------------------------------------------------------------------===//

def RetCC_Mcasm_32 : CallingConv<[
  // Promote i1 to i8 for return values
  CCIfType<[i1], CCPromoteToType<i8>>,

  // All integer return values (i8, i16, i32) are returned in rax
  CCIfType<[i8, i16, i32], CCAssignToReg<[rax]>>
]>;

//===----------------------------------------------------------------------===//
// Callee-Saved Registers
//===----------------------------------------------------------------------===//

// No callee-saved registers (for leaf functions or special cases)
def CSR_NoRegs : CalleeSavedRegs<(add)>;

// Standard callee-saved registers: x0-x15
// These registers must be preserved across function calls
def CSR_Mcasm_32 : CalleeSavedRegs<(add x0, x1, x2, x3, x4, x5, x6, x7,
                                        x8, x9, x10, x11, x12, x13, x14, x15)>;

// All registers saved (for special cases like interrupt handlers)
def CSR_Mcasm_32_AllRegs : CalleeSavedRegs<(add r0, r1, r2, r3, r4, r5, r6, r7,
                                                t0, t1, t2, t3, t4, t5, t6, t7,
                                                x0, x1, x2, x3, x4, x5, x6, x7,
                                                x8, x9, x10, x11, x12, x13, x14, x15,
                                                rax)>;
