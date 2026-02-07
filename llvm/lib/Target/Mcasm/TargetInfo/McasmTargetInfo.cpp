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
#include "llvm/Support/raw_ostream.h"
using namespace llvm;

Target &llvm::getTheMcasm_32Target() {
  static Target TheMcasm_32Target;
  return TheMcasm_32Target;
}

extern "C" LLVM_C_ABI void LLVMInitializeMcasmTargetInfo() {
  llvm::outs() << "DEBUG: LLVMInitializeMcasmTargetInfo called\n";
  llvm::outs().flush();

  // Register mcasm as its own architecture (not x86)
  RegisterTarget<Triple::mcasm, /*HasJIT=*/true> X(
      getTheMcasm_32Target(), "mcasm", "32-bit Mcasm (Minecraft assembly)", "Mcasm");

  llvm::outs() << "DEBUG: RegisterTarget completed\n";
  llvm::outs().flush();
}
