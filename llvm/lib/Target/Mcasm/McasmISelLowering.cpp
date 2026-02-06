//===-- McasmISelLowering.cpp - Mcasm DAG Lowering Implementation --------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file implements the McasmTargetLowering class.
//
// MCASM NOTE: Minimal stub implementation for mcasm backend.
//
//===----------------------------------------------------------------------===//

#include "McasmISelLowering.h"
#include "Mcasm.h"
#include "McasmSubtarget.h"
#include "McasmTargetMachine.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/SelectionDAG.h"

using namespace llvm;

#define DEBUG_TYPE "mcasm-lower"

McasmTargetLowering::McasmTargetLowering(const McasmTargetMachine &TM,
                                         const McasmSubtarget &STI)
    : TargetLowering(TM, STI), Subtarget(STI) {

  // Set up the register classes
  addRegisterClass(MVT::i32, &Mcasm::GR32RegClass);

  // Compute derived properties
  computeRegisterProperties(STI.getRegisterInfo());

  // Stack configuration
  // TODO: setStackPointerRegisterToSaveRestore(Mcasm::rsp);
  setMinFunctionAlignment(Align(4));
  setMinStackArgumentAlignment(Align(4));
}

SDValue McasmTargetLowering::LowerFormalArguments(
    SDValue Chain, CallingConv::ID CallConv, bool isVarArg,
    const SmallVectorImpl<ISD::InputArg> &Ins, const SDLoc &dl,
    SelectionDAG &DAG, SmallVectorImpl<SDValue> &InVals) const {
  // TODO: Implement argument lowering
  report_fatal_error("LowerFormalArguments not implemented yet");
}

SDValue McasmTargetLowering::LowerCall(
    CallLoweringInfo &CLI, SmallVectorImpl<SDValue> &InVals) const {
  // TODO: Implement call lowering
  report_fatal_error("LowerCall not implemented yet");
}

SDValue McasmTargetLowering::LowerReturn(
    SDValue Chain, CallingConv::ID CallConv, bool isVarArg,
    const SmallVectorImpl<ISD::OutputArg> &Outs,
    const SmallVectorImpl<SDValue> &OutVals, const SDLoc &dl,
    SelectionDAG &DAG) const {
  // TODO: Implement return lowering
  report_fatal_error("LowerReturn not implemented yet");
}
