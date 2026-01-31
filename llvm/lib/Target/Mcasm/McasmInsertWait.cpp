//-  McasmInsertwait.cpp - Strict-Fp:Insert wait instruction X87 instructions --//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file defines the pass which insert x86 wait instructions after each
// X87 instructions when strict float is enabled.
//
// The logic to insert a wait instruction after an X87 instruction is as below:
// 1. If the X87 instruction don't raise float exception nor is a load/store
//    instruction, or is a x87 control instruction, don't insert wait.
// 2. If the X87 instruction is an instruction which the following instruction
//    is an X87 exception synchronizing X87 instruction, don't insert wait.
// 3. For other situations, insert wait instruction.
//
//===----------------------------------------------------------------------===//

#include "Mcasm.h"
#include "McasmInstrInfo.h"
#include "McasmSubtarget.h"
#include "llvm/CodeGen/MachineBasicBlock.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineInstr.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineOperand.h"
#include "llvm/IR/DebugLoc.h"
#include "llvm/Support/Debug.h"

using namespace llvm;

#define DEBUG_TYPE "x86-insert-wait"

namespace {

class WaitInsert : public MachineFunctionPass {
public:
  static char ID;

  WaitInsert() : MachineFunctionPass(ID) {}

  bool runOnMachineFunction(MachineFunction &MF) override;

  StringRef getPassName() const override {
    return "Mcasm insert wait instruction";
  }
};

} // namespace

char WaitInsert::ID = 0;

FunctionPass *llvm::createMcasmInsertX87waitPass() { return new WaitInsert(); }

static bool isX87ControlInstruction(MachineInstr &MI) {
  switch (MI.getOpcode()) {
  case Mcasm::FNINIT:
  case Mcasm::FLDCW16m:
  case Mcasm::FNSTCW16m:
  case Mcasm::FNSTSW16r:
  case Mcasm::FNSTSWm:
  case Mcasm::FNCLEX:
  case Mcasm::FLDENVm:
  case Mcasm::FSTENVm:
  case Mcasm::FRSTORm:
  case Mcasm::FSAVEm:
  case Mcasm::FINCSTP:
  case Mcasm::FDECSTP:
  case Mcasm::FFREE:
  case Mcasm::FFREEP:
  case Mcasm::FNOP:
  case Mcasm::WAIT:
    return true;
  default:
    return false;
  }
}

static bool isX87NonWaitingControlInstruction(MachineInstr &MI) {
  // a few special control instructions don't perform a wait operation
  switch (MI.getOpcode()) {
  case Mcasm::FNINIT:
  case Mcasm::FNSTSW16r:
  case Mcasm::FNSTSWm:
  case Mcasm::FNSTCW16m:
  case Mcasm::FNCLEX:
    return true;
  default:
    return false;
  }
}

bool WaitInsert::runOnMachineFunction(MachineFunction &MF) {
  if (!MF.getFunction().hasFnAttribute(Attribute::StrictFP))
    return false;

  const McasmSubtarget &ST = MF.getSubtarget<McasmSubtarget>();
  const McasmInstrInfo *TII = ST.getInstrInfo();
  bool Changed = false;

  for (MachineBasicBlock &MBB : MF) {
    for (MachineBasicBlock::iterator MI = MBB.begin(); MI != MBB.end(); ++MI) {
      // Jump non X87 instruction.
      if (!Mcasm::isX87Instruction(*MI))
        continue;
      // If the instruction instruction neither has float exception nor is
      // a load/store instruction, or the instruction is x87 control
      // instruction, do not insert wait.
      if (!(MI->mayRaiseFPException() || MI->mayLoadOrStore()) ||
          isX87ControlInstruction(*MI))
        continue;
      // If the following instruction is an X87 instruction and isn't an X87
      // non-waiting control instruction, we can omit insert wait instruction.
      MachineBasicBlock::iterator AfterMI = std::next(MI);
      if (AfterMI != MBB.end() && Mcasm::isX87Instruction(*AfterMI) &&
          !isX87NonWaitingControlInstruction(*AfterMI))
        continue;

      BuildMI(MBB, AfterMI, MI->getDebugLoc(), TII->get(Mcasm::WAIT));
      LLVM_DEBUG(dbgs() << "\nInsert wait after:\t" << *MI);
      // Jump the newly inserting wait
      ++MI;
      Changed = true;
    }
  }
  return Changed;
}
