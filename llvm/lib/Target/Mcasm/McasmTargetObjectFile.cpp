//===-- McasmTargetObjectFile.cpp - Mcasm Object Files --------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file implements custom object file handling for the Mcasm target.
// It provides symbol name customization to match mcasm assembly format.
//
//===----------------------------------------------------------------------===//

#include "McasmTargetObjectFile.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/Mangler.h"
#include "llvm/MC/MCContext.h"
#include "llvm/MC/MCSymbol.h"

using namespace llvm;

MCSymbol *McasmTargetObjectFile::getTargetSymbol(const GlobalValue *GV,
                                                  const TargetMachine &TM) const {
  SmallString<128> NameStr;

  // Check if this is an externally-linked function
  if (GV->hasExternalLinkage() || GV->hasCommonLinkage()) {
    if (const auto *F = dyn_cast<Function>(GV)) {
      // For external functions, add _ll_shared: prefix for mcasm format
      NameStr = "_ll_shared:";
      NameStr += F->getName();
      return getContext().getOrCreateSymbol(NameStr);
    }
  }

  // For global variables (including string literals), sanitize the name
  // Remove leading dot and replace remaining dots with underscores
  StringRef RawName = GV->getName();
  if (!RawName.empty() && RawName[0] == '.') {
    // Remove leading dot (e.g., .str -> str)
    NameStr = RawName.substr(1);
  } else {
    NameStr = RawName;
  }

  // Replace remaining dots with underscores (e.g., str.1 -> str_1)
  for (char &C : NameStr) {
    if (C == '.') {
      C = '_';
    }
  }

  // If we modified the name, return the sanitized symbol
  if (NameStr != RawName) {
    return getContext().getOrCreateSymbol(NameStr);
  }

  // For other cases, return nullptr to use default behavior
  return nullptr;
}
