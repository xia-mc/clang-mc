//===-- adddi3.c - Implement __adddi3 ------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file implements __adddi3 for the compiler_rt library.
//
//===----------------------------------------------------------------------===//

#include "int_lib.h"

// Returns: a + b (two's-complement wrap-around).
//
// Implement with two 32-bit limbs so 32-bit targets do not need native i64
// add lowering for this routine itself.
COMPILER_RT_ABI di_int __adddi3(di_int a, di_int b) {
  udwords x;
  udwords y;
  udwords r;

  x.all = (du_int)a;
  y.all = (du_int)b;

  r.s.low = x.s.low + y.s.low;
  r.s.high = x.s.high + y.s.high + (r.s.low < x.s.low);

  return (di_int)r.all;
}
