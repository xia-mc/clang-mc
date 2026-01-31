//===- McasmMacroFusion.h - Mcasm Macro Fusion --------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
/// \file This file contains the Mcasm definition of the DAG scheduling mutation
///  to pair instructions back to back.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_Mcasm_McasmMACROFUSION_H
#define LLVM_LIB_TARGET_Mcasm_McasmMACROFUSION_H

#include <memory>

namespace llvm {

class ScheduleDAGMutation;

/// Note that you have to add:
///   DAG.addMutation(createMcasmMacroFusionDAGMutation());
/// to McasmTargetMachine::createMachineScheduler() to have an effect.
std::unique_ptr<ScheduleDAGMutation>
createMcasmMacroFusionDAGMutation();

} // end namespace llvm

#endif
