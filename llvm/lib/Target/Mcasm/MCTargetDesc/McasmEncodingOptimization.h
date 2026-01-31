//===-- McasmEncodingOptimization.h - Mcasm Encoding optimization ---*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file contains the declarations of the Mcasm encoding optimization
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_Mcasm_McasmENCODINGOPTIMIZATION_H
#define LLVM_LIB_TARGET_Mcasm_McasmENCODINGOPTIMIZATION_H
namespace llvm {
class MCInst;
class MCInstrDesc;
namespace Mcasm {
bool optimizeInstFromVEX3ToVEX2(MCInst &MI, const MCInstrDesc &Desc);
bool optimizeShiftRotateWithImmediateOne(MCInst &MI);
bool optimizeVPCMPWithImmediateOneOrSix(MCInst &MI);
bool optimizeMOVSX(MCInst &MI);
bool optimizeINCDEC(MCInst &MI, bool In64BitMode);
bool optimizeMOV(MCInst &MI, bool In64BitMode);
bool optimizeToFixedRegisterOrShortImmediateForm(MCInst &MI);
unsigned getOpcodeForShortImmediateForm(unsigned Opcode);
unsigned getOpcodeForLongImmediateForm(unsigned Opcode);
} // namespace Mcasm
} // namespace llvm
#endif
