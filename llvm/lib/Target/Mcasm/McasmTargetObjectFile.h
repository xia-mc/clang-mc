//===-- McasmTargetObjectFile.h - Mcasm Object Info -------------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file defines custom object file handling for the Mcasm target.
// It customizes symbol names to match mcasm assembly format (_ll_shared: prefix).
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_MCASM_MCASMTARGETOBJECTFILE_H
#define LLVM_LIB_TARGET_MCASM_MCASMTARGETOBJECTFILE_H

#include "llvm/CodeGen/TargetLoweringObjectFileImpl.h"

namespace llvm {

// Use ELF as base since mcasm primarily targets ELF-like output
class McasmTargetObjectFile : public TargetLoweringObjectFileELF {
public:
  McasmTargetObjectFile() = default;
  ~McasmTargetObjectFile() override = default;

  /// Override to customize symbol names for mcasm format
  MCSymbol *getTargetSymbol(const GlobalValue *GV,
                            const TargetMachine &TM) const override;
};

} // end namespace llvm

#endif
