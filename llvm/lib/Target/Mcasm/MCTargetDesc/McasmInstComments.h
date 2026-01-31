//=- McasmInstComments.h - Generate verbose-asm comments for instrs -*- C++ -*-=//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This defines functionality used to emit comments about Mcasm instructions to
// an output stream for -fverbose-asm.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_Mcasm_MCTARGETDESC_McasmINSTCOMMENTS_H
#define LLVM_LIB_TARGET_Mcasm_MCTARGETDESC_McasmINSTCOMMENTS_H

namespace llvm {

  class MCInst;
  class MCInstrInfo;
  class raw_ostream;
  bool EmitAnyMcasmInstComments(const MCInst *MI, raw_ostream &OS,
                              const MCInstrInfo &MCII);
}

#endif
