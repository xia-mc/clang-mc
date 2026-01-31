//===-- McasmLoadValueInjectionRetHardening.cpp - LVI RET hardening for x86 --==//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
///
/// Description: Replaces every `ret` instruction with the sequence:
/// ```
/// pop <scratch-reg>
/// lfence
/// jmp *<scratch-reg>
/// ```
/// where `<scratch-reg>` is some available scratch register, according to the
/// calling convention of the function being mitigated.
///
//===----------------------------------------------------------------------===//

#include "Mcasm.h"
#include "McasmInstrBuilder.h"
#include "McasmSubtarget.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/CodeGen/MachineBasicBlock.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/Debug.h"

using namespace llvm;

#define PASS_KEY "x86-lvi-ret"
#define DEBUG_TYPE PASS_KEY

STATISTIC(NumFences, "Number of LFENCEs inserted for LVI mitigation");
STATISTIC(NumFunctionsConsidered, "Number of functions analyzed");
STATISTIC(NumFunctionsMitigated, "Number of functions for which mitigations "
                                 "were deployed");

namespace {

constexpr StringRef McasmLVIRetPassName =
    "Mcasm Load Value Injection (LVI) Ret-Hardening";

class McasmLoadValueInjectionRetHardeningLegacy : public MachineFunctionPass {
public:
  McasmLoadValueInjectionRetHardeningLegacy() : MachineFunctionPass(ID) {}
  StringRef getPassName() const override { return McasmLVIRetPassName; }
  bool runOnMachineFunction(MachineFunction &MF) override;

  static char ID;
};

} // end anonymous namespace

char McasmLoadValueInjectionRetHardeningLegacy::ID = 0;

static bool runMcasmLoadValueInjectionRetHardening(MachineFunction &MF) {
  const McasmSubtarget *Subtarget = &MF.getSubtarget<McasmSubtarget>();
  if (!Subtarget->useLVIControlFlowIntegrity() || !Subtarget->is64Bit())
    return false; // FIXME: support 32-bit

  LLVM_DEBUG(dbgs() << "***** " << McasmLVIRetPassName << " : " << MF.getName()
                    << " *****\n");
  ++NumFunctionsConsidered;
  const McasmRegisterInfo *TRI = Subtarget->getRegisterInfo();
  const McasmInstrInfo *TII = Subtarget->getInstrInfo();

  bool Modified = false;
  for (auto &MBB : MF) {
    for (auto MBBI = MBB.begin(); MBBI != MBB.end(); ++MBBI) {
      if (MBBI->getOpcode() != Mcasm::RET64)
        continue;

      unsigned ClobberReg = TRI->findDeadCallerSavedReg(MBB, MBBI);
      if (ClobberReg != Mcasm::NoRegister) {
        BuildMI(MBB, MBBI, DebugLoc(), TII->get(Mcasm::POP64r))
            .addReg(ClobberReg, RegState::Define)
            .setMIFlag(MachineInstr::FrameDestroy);
        BuildMI(MBB, MBBI, DebugLoc(), TII->get(Mcasm::LFENCE));
        BuildMI(MBB, MBBI, DebugLoc(), TII->get(Mcasm::JMP64r))
            .addReg(ClobberReg);
        MBB.erase(MBBI);
      } else {
        // In case there is no available scratch register, we can still read
        // from RSP to assert that RSP points to a valid page. The write to RSP
        // is also helpful because it verifies that the stack's write
        // permissions are intact.
        MachineInstr *Fence =
            BuildMI(MBB, MBBI, DebugLoc(), TII->get(Mcasm::LFENCE));
        addRegOffset(BuildMI(MBB, Fence, DebugLoc(), TII->get(Mcasm::SHL64mi)),
                     Mcasm::RSP, false, 0)
            .addImm(0)
            ->addRegisterDead(Mcasm::EFLAGS, TRI);
      }

      ++NumFences;
      Modified = true;
      break;
    }
  }

  if (Modified)
    ++NumFunctionsMitigated;
  return Modified;
}

bool McasmLoadValueInjectionRetHardeningLegacy::runOnMachineFunction(
    MachineFunction &MF) {
  // Don't skip functions with the "optnone" attr but participate in opt-bisect.
  // Note: NewPM implements this behavior by default.
  const Function &F = MF.getFunction();
  if (!F.hasOptNone() && skipFunction(F))
    return false;

  return runMcasmLoadValueInjectionRetHardening(MF);
}

PreservedAnalyses McasmLoadValueInjectionRetHardeningPass::run(
    MachineFunction &MF, MachineFunctionAnalysisManager &MFAM) {
  return runMcasmLoadValueInjectionRetHardening(MF)
             ? getMachineFunctionPassPreservedAnalyses()
                   .preserveSet<CFGAnalyses>()
             : PreservedAnalyses::all();
}

INITIALIZE_PASS(McasmLoadValueInjectionRetHardeningLegacy, PASS_KEY,
                "Mcasm LVI ret hardener", false, false)

FunctionPass *llvm::createMcasmLoadValueInjectionRetHardeningLegacyPass() {
  return new McasmLoadValueInjectionRetHardeningLegacy();
}
