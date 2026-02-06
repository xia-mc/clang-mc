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
  // Register as "mcasm" to avoid conflict with X86 backend
  RegisterTarget<Triple::x86, /*HasJIT=*/true> X(
      getTheMcasm_32Target(), "mcasm", "32-bit Mcasm (Minecraft assembly)", "Mcasm");

  // Note: 64-bit not supported, but keep the target object for compatibility
  RegisterTarget<Triple::x86_64, /*HasJIT=*/false> Y(
      getTheMcasm_64Target(), "mcasm-64", "64-bit Mcasm (NOT SUPPORTED)", "Mcasm");
}
