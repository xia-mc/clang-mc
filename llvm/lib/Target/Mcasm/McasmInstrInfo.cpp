//===-- McasmInstrInfo.cpp - Mcasm Instruction Information ----------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file contains the Mcasm implementation of the TargetInstrInfo class.
//
// MCASM NOTE: Minimal stub implementation for mcasm backend.
//
//===----------------------------------------------------------------------===//

#include "McasmInstrInfo.h"
#include "Mcasm.h"
#include "McasmSubtarget.h"

using namespace llvm;

#define GET_INSTRINFO_CTOR_DTOR
#include "McasmGenInstrInfo.inc"

McasmInstrInfo::McasmInstrInfo(const McasmSubtarget &STI)
    : McasmGenInstrInfo(STI, *STI.getRegisterInfo(), -1, -1, -1, -1),
      RI(*STI.getRegisterInfo()) {}
