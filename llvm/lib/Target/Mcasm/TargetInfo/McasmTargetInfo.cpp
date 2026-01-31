//===-- McasmTargetInfo.cpp - Mcasm Target Implementation ---------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "TargetInfo/McasmTargetInfo.h"
#include "llvm-c/Visibility.h"
#include "llvm/MC/TargetRegistry.h"
using namespace llvm;

Target &llvm::getTheMcasm_32Target() {
  static Target TheMcasm_32Target;
  return TheMcasm_32Target;
}
Target &llvm::getTheMcasm_64Target() {
  static Target TheMcasm_64Target;
  return TheMcasm_64Target;
}

extern "C" LLVM_C_ABI void LLVMInitializeMcasmTargetInfo() {
  RegisterTarget<Triple::x86, /*HasJIT=*/true> X(
      getTheMcasm_32Target(), "x86", "32-bit Mcasm: Pentium-Pro and above", "Mcasm");

  RegisterTarget<Triple::x86_64, /*HasJIT=*/true> Y(
      getTheMcasm_64Target(), "x86-64", "64-bit Mcasm: EM64T and AMD64", "Mcasm");
}
