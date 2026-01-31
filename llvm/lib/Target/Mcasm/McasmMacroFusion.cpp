//===- McasmMacroFusion.cpp - Mcasm Macro Fusion ------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
/// \file This file contains the Mcasm implementation of the DAG scheduling
/// mutation to pair instructions back to back.
//
//===----------------------------------------------------------------------===//

#include "McasmMacroFusion.h"
#include "MCTargetDesc/McasmBaseInfo.h"
#include "McasmSubtarget.h"
#include "llvm/CodeGen/MacroFusion.h"
#include "llvm/CodeGen/ScheduleDAGMutation.h"
#include "llvm/CodeGen/TargetInstrInfo.h"

using namespace llvm;

static Mcasm::FirstMacroFusionInstKind classifyFirst(const MachineInstr &MI) {
  return Mcasm::classifyFirstOpcodeInMacroFusion(MI.getOpcode());
}

static Mcasm::SecondMacroFusionInstKind classifySecond(const MachineInstr &MI) {
  Mcasm::CondCode CC = Mcasm::getCondFromBranch(MI);
  return Mcasm::classifySecondCondCodeInMacroFusion(CC);
}

/// Check if the instr pair, FirstMI and SecondMI, should be fused
/// together. Given SecondMI, when FirstMI is unspecified, then check if
/// SecondMI may be part of a fused pair at all.
static bool shouldScheduleAdjacent(const TargetInstrInfo &TII,
                                   const TargetSubtargetInfo &TSI,
                                   const MachineInstr *FirstMI,
                                   const MachineInstr &SecondMI) {
  const McasmSubtarget &ST = static_cast<const McasmSubtarget &>(TSI);

  // Check if this processor supports any kind of fusion.
  if (!(ST.hasBranchFusion() || ST.hasMacroFusion()))
    return false;

  const Mcasm::SecondMacroFusionInstKind BranchKind = classifySecond(SecondMI);

  if (BranchKind == Mcasm::SecondMacroFusionInstKind::Invalid)
    return false; // Second cannot be fused with anything.

  if (FirstMI == nullptr)
    return true; // We're only checking whether Second can be fused at all.

  const Mcasm::FirstMacroFusionInstKind TestKind = classifyFirst(*FirstMI);

  if (ST.hasBranchFusion()) {
    // Branch fusion can merge CMP and TEST with all conditional jumps.
    return (TestKind == Mcasm::FirstMacroFusionInstKind::Cmp ||
            TestKind == Mcasm::FirstMacroFusionInstKind::Test);
  }

  if (ST.hasMacroFusion()) {
    return Mcasm::isMacroFused(TestKind, BranchKind);
  }

  llvm_unreachable("unknown fusion type");
}

namespace llvm {

std::unique_ptr<ScheduleDAGMutation> createMcasmMacroFusionDAGMutation() {
  return createMacroFusionDAGMutation(shouldScheduleAdjacent,
                                      /*BranchOnly=*/true);
}

} // end namespace llvm
