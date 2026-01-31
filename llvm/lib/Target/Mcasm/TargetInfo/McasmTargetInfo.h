//===-- McasmTargetInfo.h - Mcasm Target Implementation -------------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_Mcasm_TARGETINFO_McasmTARGETINFO_H
#define LLVM_LIB_TARGET_Mcasm_TARGETINFO_McasmTARGETINFO_H

namespace llvm {

class Target;

Target &getTheMcasm_32Target();
Target &getTheMcasm_64Target();

}

#endif // LLVM_LIB_TARGET_Mcasm_TARGETINFO_McasmTARGETINFO_H
