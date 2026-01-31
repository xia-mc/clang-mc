//==- McasmReturnThunks.cpp - Replace rets with thunks or inline thunks --=//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
/// \file
///
/// Pass that replaces ret instructions with a jmp to __x86_return_thunk.
///
/// This corresponds to -mfunction-return=thunk-extern or
/// __attribute__((function_return("thunk-extern").
///
/// This pass is a minimal implementation necessary to help mitigate
/// RetBleed for the Linux kernel.
///
/// Should support for thunk or thunk-inline be necessary in the future, then
/// this pass should be combined with x86-retpoline-thunks which already has
/// machinery to emit thunks. Until then, YAGNI.
///
/// This pass is very similar to x86-lvi-ret.
///
//===----------------------------------------------------------------------===//

#include "Mcasm.h"
#include "McasmInstrInfo.h"
#include "McasmSubtarget.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/StringRef.h"
#include "llvm/CodeGen/MachineBasicBlock.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineInstr.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineModuleInfo.h"
#include "llvm/IR/Module.h"
#include "llvm/MC/MCInstrDesc.h"
#include "llvm/Support/Debug.h"
#include "llvm/TargetParser/Triple.h"

using namespace llvm;

#define PASS_KEY "x86-return-thunks"
#define DEBUG_TYPE PASS_KEY

constexpr StringRef McasmReturnThunksPassName = "Mcasm Return Thunks";

namespace {
struct McasmReturnThunksLegacy final : public MachineFunctionPass {
  static char ID;
  McasmReturnThunksLegacy() : MachineFunctionPass(ID) {}
  StringRef getPassName() const override { return McasmReturnThunksPassName; }
  bool runOnMachineFunction(MachineFunction &MF) override;
};
} // namespace

char McasmReturnThunksLegacy::ID = 0;

static bool runMcasmReturnThunks(MachineFunction &MF) {
  LLVM_DEBUG(dbgs() << McasmReturnThunksPassName << "\n");

  bool Modified = false;

  if (!MF.getFunction().hasFnAttribute(llvm::Attribute::FnRetThunkExtern))
    return Modified;

  StringRef ThunkName = "__x86_return_thunk";
  if (MF.getFunction().getName() == ThunkName)
    return Modified;

  const auto &ST = MF.getSubtarget<McasmSubtarget>();
  const bool Is64Bit = ST.getTargetTriple().isMcasm_64();
  const unsigned RetOpc = Is64Bit ? Mcasm::RET64 : Mcasm::RET32;
  SmallVector<MachineInstr *, 16> Rets;

  for (MachineBasicBlock &MBB : MF)
    for (MachineInstr &Term : MBB.terminators())
      if (Term.getOpcode() == RetOpc)
        Rets.push_back(&Term);

  bool IndCS =
      MF.getFunction().getParent()->getModuleFlag("indirect_branch_cs_prefix");
  const MCInstrDesc &CS = ST.getInstrInfo()->get(Mcasm::CS_PREFIX);
  const MCInstrDesc &JMP = ST.getInstrInfo()->get(Mcasm::TAILJMPd);

  for (MachineInstr *Ret : Rets) {
    if (IndCS)
      BuildMI(Ret->getParent(), Ret->getDebugLoc(), CS);
    BuildMI(Ret->getParent(), Ret->getDebugLoc(), JMP)
        .addExternalSymbol(ThunkName.data());
    Ret->eraseFromParent();
    Modified = true;
  }

  return Modified;
}

bool McasmReturnThunksLegacy::runOnMachineFunction(MachineFunction &MF) {
  return runMcasmReturnThunks(MF);
}

PreservedAnalyses
McasmReturnThunksPass::run(MachineFunction &MF,
                         MachineFunctionAnalysisManager &MFAM) {
  return runMcasmReturnThunks(MF) ? getMachineFunctionPassPreservedAnalyses()
                                      .preserveSet<CFGAnalyses>()
                                : PreservedAnalyses::all();
}

INITIALIZE_PASS(McasmReturnThunksLegacy, PASS_KEY, "Mcasm Return Thunks", false,
                false)

FunctionPass *llvm::createMcasmReturnThunksLegacyPass() {
  return new McasmReturnThunksLegacy();
}
