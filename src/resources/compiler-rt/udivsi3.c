//===-- udivsi3.c - Implement __udivsi3 -----------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file implements __udivsi3 for the compiler_rt library.
//
//===----------------------------------------------------------------------===//

#include "int_lib.h"

typedef su_int fixuint_t;
typedef si_int fixint_t;
#include "int_div_impl.inc"

// Returns: a / b

COMPILER_RT_ABI su_int __udivsi3(su_int a, su_int b) {
if (b == 0) return 0;

  int64_t n = (int64_t)(uint64_t)a;
  int64_t d = (int64_t)(uint64_t)b;

  if (n < d) return 0;
  if (d == 1) return a;

  int64_t q = 0;

  while (n >= d) {
    int64_t t = d;
    int64_t m = 1;

    while (t <= (n / 2)) {
      t = t * 2;
      m = m * 2;
    }

    n -= t;
    q += m;
  }

  return (unsigned int)q;
}

#if defined(__ARM_EABI__)
COMPILER_RT_ALIAS(__udivsi3, __aeabi_uidiv)
#endif
