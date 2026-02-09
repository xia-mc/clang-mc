//===--- Mcasm.cpp - Implement Mcasm target feature support ---------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file implements Mcasm TargetInfo objects.
//
//===----------------------------------------------------------------------===//

#include "Mcasm.h"
#include "clang/Basic/MacroBuilder.h"
#include "llvm/ADT/StringSwitch.h"

using namespace clang;
using namespace clang::targets;

const char *const McasmTargetInfo::GCCRegNames[] = {
    // Parameter/temporary registers (caller-saved)
    "r0",  "r1",  "r2",  "r3",  "r4",  "r5",  "r6",  "r7",
    "t0",  "t1",  "t2",  "t3",  "t4",  "t5",  "t6",  "t7",
    // Saved registers (callee-saved)
    "x0",  "x1",  "x2",  "x3",  "x4",  "x5",  "x6",  "x7",
    "x8",  "x9",  "x10", "x11", "x12", "x13", "x14", "x15",
    // Special registers
    "rsp", "rax", "shp", "sbp",
    // Reserved registers (not allocatable)
    "s0",  "s1",  "s2",  "s3",  "s4"
};

ArrayRef<const char *> McasmTargetInfo::getGCCRegNames() const {
  return llvm::ArrayRef(GCCRegNames);
}

const TargetInfo::GCCRegAlias McasmTargetInfo::GCCRegAliases[] = {
    {{"sp"}, "rsp"},  // Stack pointer alias
};

ArrayRef<TargetInfo::GCCRegAlias> McasmTargetInfo::getGCCRegAliases() const {
  return llvm::ArrayRef(GCCRegAliases);
}

void McasmTargetInfo::getTargetDefines(const LangOptions &Opts,
                                       MacroBuilder &Builder) const {
  // Define __mcasm__ when building for target mcasm
  Builder.defineMacro("__mcasm__");
  Builder.defineMacro("__MCASM__");

  // Define architecture-specific macros
  Builder.defineMacro("__mcasm");
  Builder.defineMacro("__i386__");  // For compatibility with 32-bit code
}
