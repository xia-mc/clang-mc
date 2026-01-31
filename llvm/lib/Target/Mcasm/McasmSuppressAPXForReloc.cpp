//===- McasmSuppressAPXForReloc.cpp - Suppress APX features for relocations -===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
/// \file
///
/// This pass is added to suppress APX features for relocations. It's used to
/// keep backward compatibility with old version of linker having no APX
/// support. It can be removed after APX support is included in the default
/// linker on OS.
///
//===----------------------------------------------------------------------===//

#include "Mcasm.h"
#include "McasmInstrInfo.h"
#include "McasmRegisterInfo.h"
#include "McasmSubtarget.h"

#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineOperand.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/CodeGen/Passes.h"
#include "llvm/CodeGen/TargetRegisterInfo.h"
#include "llvm/Support/ErrorHandling.h"

using namespace llvm;

#define DEBUG_TYPE "x86-suppress-apx-for-relocation"

cl::opt<bool> McasmEnableAPXForRelocation(
    "x86-enable-apx-for-relocation",
    cl::desc("Enable APX features (EGPR, NDD and NF) for instructions with "
             "relocations on x86-64 ELF"),
    cl::init(false));

namespace {
class McasmSuppressAPXForRelocationLegacy : public MachineFunctionPass {
public:
  McasmSuppressAPXForRelocationLegacy() : MachineFunctionPass(ID) {}

  StringRef getPassName() const override {
    return "Mcasm Suppress APX features for relocation";
  }

  bool runOnMachineFunction(MachineFunction &MF) override;

  static char ID;
};
} // namespace

char McasmSuppressAPXForRelocationLegacy::ID = 0;

INITIALIZE_PASS_BEGIN(McasmSuppressAPXForRelocationLegacy, DEBUG_TYPE,
                      "Mcasm Suppress APX features for relocation", false, false)
INITIALIZE_PASS_END(McasmSuppressAPXForRelocationLegacy, DEBUG_TYPE,
                    "Mcasm Suppress APX features for relocation", false, false)

FunctionPass *llvm::createMcasmSuppressAPXForRelocationLegacyPass() {
  return new McasmSuppressAPXForRelocationLegacy();
}

static void suppressEGPRRegClass(MachineRegisterInfo *MRI, MachineInstr &MI,
                                 const McasmSubtarget &ST, unsigned int OpNum) {
  Register Reg = MI.getOperand(OpNum).getReg();
  if (!Reg.isVirtual()) {
    assert(!McasmII::isApxExtendedReg(Reg) && "APX EGPR is used unexpectedly.");
    return;
  }
  const TargetRegisterClass *RC = MRI->getRegClass(Reg);
  const McasmRegisterInfo *RI = ST.getRegisterInfo();
  const TargetRegisterClass *NewRC = RI->constrainRegClassToNonRex2(RC);
  MRI->setRegClass(Reg, NewRC);
}

// Suppress EGPR in operand 0 of uses to avoid APX relocation types emitted. The
// register in operand 0 of instruction with relocation may be replaced with
// operand 0 of uses which may be EGPR. That may lead to emit APX relocation
// types which breaks the backward compatibility with builtin linkers on
// existing OS. For example, the register in operand 0 of instruction with
// relocation is used in PHI instruction, and it may be replaced with operand 0
// of PHI instruction after PHI elimination and Machine Copy Propagation pass.
static void suppressEGPRRegClassInRegAndUses(MachineRegisterInfo *MRI,
                                             MachineInstr &MI,
                                             const McasmSubtarget &ST,
                                             unsigned int OpNum) {
  suppressEGPRRegClass(MRI, MI, ST, OpNum);
  Register Reg = MI.getOperand(OpNum).getReg();
  for (MachineInstr &Use : MRI->use_instructions(Reg))
    if (Use.getOpcode() == Mcasm::PHI)
      suppressEGPRRegClass(MRI, Use, ST, 0);
}

static bool handleInstructionWithEGPR(MachineFunction &MF,
                                      const McasmSubtarget &ST) {
  if (!ST.hasEGPR())
    return false;

  MachineRegisterInfo *MRI = &MF.getRegInfo();
  auto suppressEGPRInInstrWithReloc = [&](MachineInstr &MI,
                                          ArrayRef<unsigned> OpNoArray) {
    int MemOpNo = McasmII::getMemoryOperandNo(MI.getDesc().TSFlags) +
                  McasmII::getOperandBias(MI.getDesc());
    const MachineOperand &MO = MI.getOperand(Mcasm::AddrDisp + MemOpNo);
    if (MO.getTargetFlags() == McasmII::MO_GOTTPOFF ||
        MO.getTargetFlags() == McasmII::MO_GOTPCREL) {
      LLVM_DEBUG(dbgs() << "Transform instruction with relocation type:\n  "
                        << MI);
      for (unsigned OpNo : OpNoArray)
        suppressEGPRRegClassInRegAndUses(MRI, MI, ST, OpNo);
      LLVM_DEBUG(dbgs() << "to:\n  " << MI << "\n");
    }
  };

  for (MachineBasicBlock &MBB : MF) {
    for (MachineInstr &MI : MBB) {
      unsigned Opcode = MI.getOpcode();
      switch (Opcode) {
        // For GOTPC32_TLSDESC, it's emitted with physical register (EAX/RAX) in
        // McasmAsmPrinter::LowerTlsAddr, and there is no corresponding target
        // flag for it, so we don't need to handle LEA64r with TLSDESC and EGPR
        // in this pass (before emitting assembly).
      case Mcasm::TEST32mr:
      case Mcasm::TEST64mr: {
        suppressEGPRInInstrWithReloc(MI, {5});
        break;
      }
      case Mcasm::CMP32rm:
      case Mcasm::CMP64rm:
      case Mcasm::MOV32rm:
      case Mcasm::MOV64rm: {
        suppressEGPRInInstrWithReloc(MI, {0});
        break;
      }
      case Mcasm::ADC32rm:
      case Mcasm::ADD32rm:
      case Mcasm::AND32rm:
      case Mcasm::OR32rm:
      case Mcasm::SBB32rm:
      case Mcasm::SUB32rm:
      case Mcasm::XOR32rm:
      case Mcasm::ADC64rm:
      case Mcasm::ADD64rm:
      case Mcasm::AND64rm:
      case Mcasm::OR64rm:
      case Mcasm::SBB64rm:
      case Mcasm::SUB64rm:
      case Mcasm::XOR64rm: {
        suppressEGPRInInstrWithReloc(MI, {0, 1});
        break;
      }
      }
    }
  }
  return true;
}

static bool handleNDDOrNFInstructions(MachineFunction &MF,
                                      const McasmSubtarget &ST) {
  if (!ST.hasNDD() && !ST.hasNF())
    return false;

  const McasmInstrInfo *TII = ST.getInstrInfo();
  MachineRegisterInfo *MRI = &MF.getRegInfo();
  for (MachineBasicBlock &MBB : MF) {
    for (MachineInstr &MI : llvm::make_early_inc_range(MBB)) {
      unsigned Opcode = MI.getOpcode();
      switch (Opcode) {
      case Mcasm::ADD64rm_NF:
      case Mcasm::ADD64mr_NF_ND:
      case Mcasm::ADD64rm_NF_ND: {
        int MemOpNo = McasmII::getMemoryOperandNo(MI.getDesc().TSFlags) +
                      McasmII::getOperandBias(MI.getDesc());
        const MachineOperand &MO = MI.getOperand(Mcasm::AddrDisp + MemOpNo);
        if (MO.getTargetFlags() == McasmII::MO_GOTTPOFF)
          llvm_unreachable("Unexpected NF instruction!");
        break;
      }
      case Mcasm::ADD64rm_ND: {
        int MemOpNo = McasmII::getMemoryOperandNo(MI.getDesc().TSFlags) +
                      McasmII::getOperandBias(MI.getDesc());
        const MachineOperand &MO = MI.getOperand(Mcasm::AddrDisp + MemOpNo);
        if (MO.getTargetFlags() == McasmII::MO_GOTTPOFF ||
            MO.getTargetFlags() == McasmII::MO_GOTPCREL) {
          LLVM_DEBUG(dbgs() << "Transform instruction with relocation type:\n  "
                            << MI);
          Register Reg = MRI->createVirtualRegister(&Mcasm::GR64_NOREX2RegClass);
          [[maybe_unused]] MachineInstrBuilder CopyMIB =
              BuildMI(MBB, MI, MI.getDebugLoc(), TII->get(TargetOpcode::COPY),
                      Reg)
                  .addReg(MI.getOperand(1).getReg());
          MI.getOperand(1).setReg(Reg);
          const MCInstrDesc &NewDesc = TII->get(Mcasm::ADD64rm);
          MI.setDesc(NewDesc);
          suppressEGPRRegClassInRegAndUses(MRI, MI, ST, 0);
          MI.tieOperands(0, 1);
          LLVM_DEBUG(dbgs() << "to:\n  " << *CopyMIB << "\n");
          LLVM_DEBUG(dbgs() << "  " << MI << "\n");
        }
        break;
      }
      case Mcasm::ADD64mr_ND: {
        int MemRefBegin = McasmII::getMemoryOperandNo(MI.getDesc().TSFlags);
        const MachineOperand &MO = MI.getOperand(MemRefBegin + Mcasm::AddrDisp);
        if (MO.getTargetFlags() == McasmII::MO_GOTTPOFF) {
          LLVM_DEBUG(dbgs() << "Transform instruction with relocation type:\n  "
                            << MI);
          suppressEGPRRegClassInRegAndUses(MRI, MI, ST, 0);
          Register Reg = MRI->createVirtualRegister(&Mcasm::GR64_NOREX2RegClass);
          [[maybe_unused]] MachineInstrBuilder CopyMIB =
              BuildMI(MBB, MI, MI.getDebugLoc(), TII->get(TargetOpcode::COPY),
                      Reg)
                  .addReg(MI.getOperand(6).getReg());
          MachineInstrBuilder NewMIB =
              BuildMI(MBB, MI, MI.getDebugLoc(), TII->get(Mcasm::ADD64rm),
                      MI.getOperand(0).getReg())
                  .addReg(Reg)
                  .addReg(MI.getOperand(1).getReg())
                  .addImm(MI.getOperand(2).getImm())
                  .addReg(MI.getOperand(3).getReg())
                  .add(MI.getOperand(4))
                  .addReg(MI.getOperand(5).getReg());
          MachineOperand *FlagDef =
              MI.findRegisterDefOperand(Mcasm::EFLAGS, /*TRI=*/nullptr);
          if (FlagDef && FlagDef->isDead()) {
            MachineOperand *NewFlagDef =
                NewMIB->findRegisterDefOperand(Mcasm::EFLAGS, /*TRI=*/nullptr);
            if (NewFlagDef)
              NewFlagDef->setIsDead();
          }
          MI.eraseFromParent();
          LLVM_DEBUG(dbgs() << "to:\n  " << *CopyMIB << "\n");
          LLVM_DEBUG(dbgs() << "  " << *NewMIB << "\n");
        }
        break;
      }
      }
    }
  }
  return true;
}

static bool suppressAPXForRelocation(MachineFunction &MF) {
  if (McasmEnableAPXForRelocation)
    return false;
  const McasmSubtarget &ST = MF.getSubtarget<McasmSubtarget>();
  bool Changed = handleInstructionWithEGPR(MF, ST);
  Changed |= handleNDDOrNFInstructions(MF, ST);

  return Changed;
}

bool McasmSuppressAPXForRelocationLegacy::runOnMachineFunction(
    MachineFunction &MF) {
  return suppressAPXForRelocation(MF);
}

PreservedAnalyses
McasmSuppressAPXForRelocationPass::run(MachineFunction &MF,
                                     MachineFunctionAnalysisManager &MFAM) {
  return suppressAPXForRelocation(MF)
             ? getMachineFunctionPassPreservedAnalyses()
                   .preserveSet<CFGAnalyses>()
             : PreservedAnalyses::all();
}
