//===------- McasmExpandPseudo.cpp - Expand pseudo instructions -------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file contains a pass that expands pseudo instructions into target
// instructions to allow proper scheduling, if-conversion, other late
// optimizations, or simply the encoding of the instructions.
//
//===----------------------------------------------------------------------===//

#include "Mcasm.h"
#include "McasmFrameLowering.h"
#include "McasmInstrInfo.h"
#include "McasmMachineFunctionInfo.h"
#include "McasmSubtarget.h"
#include "llvm/CodeGen/LivePhysRegs.h"
#include "llvm/CodeGen/MachineDominators.h"
#include "llvm/CodeGen/MachineFunctionAnalysisManager.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineLoopInfo.h"
#include "llvm/CodeGen/MachinePassManager.h"
#include "llvm/CodeGen/Passes.h" // For IDs of passes that are preserved.
#include "llvm/IR/Analysis.h"
#include "llvm/IR/EHPersonalities.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/Target/TargetMachine.h"
using namespace llvm;

#define DEBUG_TYPE "x86-expand-pseudo"
#define Mcasm_EXPAND_PSEUDO_NAME "Mcasm pseudo instruction expansion pass"

namespace {
class McasmExpandPseudoImpl {
public:
  const McasmSubtarget *STI = nullptr;
  const McasmInstrInfo *TII = nullptr;
  const McasmRegisterInfo *TRI = nullptr;
  const McasmMachineFunctionInfo *McasmFI = nullptr;
  const McasmFrameLowering *McasmFL = nullptr;

  bool runOnMachineFunction(MachineFunction &MF);

private:
  void expandICallBranchFunnel(MachineBasicBlock *MBB,
                               MachineBasicBlock::iterator MBBI);
  void expandCALL_RVMARKER(MachineBasicBlock &MBB,
                           MachineBasicBlock::iterator MBBI);
  bool expandMI(MachineBasicBlock &MBB, MachineBasicBlock::iterator MBBI);
  bool expandMBB(MachineBasicBlock &MBB);

  /// This function expands pseudos which affects control flow.
  /// It is done in separate pass to simplify blocks navigation in main
  /// pass(calling expandMBB).
  bool expandPseudosWhichAffectControlFlow(MachineFunction &MF);

  /// Expand Mcasm::VASTART_SAVE_XMM_REGS into set of xmm copying instructions,
  /// placed into separate block guarded by check for al register(for SystemV
  /// abi).
  void expandVastartSaveXmmRegs(
      MachineBasicBlock *EntryBlk,
      MachineBasicBlock::iterator VAStartPseudoInstr) const;
};

class McasmExpandPseudoLegacy : public MachineFunctionPass {
public:
  static char ID;
  McasmExpandPseudoLegacy() : MachineFunctionPass(ID) {}

  void getAnalysisUsage(AnalysisUsage &AU) const override {
    AU.setPreservesCFG();
    AU.addPreservedID(MachineLoopInfoID);
    AU.addPreservedID(MachineDominatorsID);
    MachineFunctionPass::getAnalysisUsage(AU);
  }

  const McasmSubtarget *STI = nullptr;
  const McasmInstrInfo *TII = nullptr;
  const McasmRegisterInfo *TRI = nullptr;
  const McasmMachineFunctionInfo *McasmFI = nullptr;
  const McasmFrameLowering *McasmFL = nullptr;

  bool runOnMachineFunction(MachineFunction &MF) override;

  MachineFunctionProperties getRequiredProperties() const override {
    return MachineFunctionProperties().setNoVRegs();
  }

  StringRef getPassName() const override {
    return "Mcasm pseudo instruction expansion pass";
  }
};
char McasmExpandPseudoLegacy::ID = 0;
} // End anonymous namespace.

INITIALIZE_PASS(McasmExpandPseudoLegacy, DEBUG_TYPE, Mcasm_EXPAND_PSEUDO_NAME,
                false, false)

void McasmExpandPseudoImpl::expandICallBranchFunnel(
    MachineBasicBlock *MBB, MachineBasicBlock::iterator MBBI) {
  MachineBasicBlock *JTMBB = MBB;
  MachineInstr *JTInst = &*MBBI;
  MachineFunction *MF = MBB->getParent();
  const BasicBlock *BB = MBB->getBasicBlock();
  auto InsPt = MachineFunction::iterator(MBB);
  ++InsPt;

  std::vector<std::pair<MachineBasicBlock *, unsigned>> TargetMBBs;
  const DebugLoc &DL = JTInst->getDebugLoc();
  MachineOperand Selector = JTInst->getOperand(0);
  const GlobalValue *CombinedGlobal = JTInst->getOperand(1).getGlobal();

  auto CmpTarget = [&](unsigned Target) {
    if (Selector.isReg())
      MBB->addLiveIn(Selector.getReg());
    BuildMI(*MBB, MBBI, DL, TII->get(Mcasm::LEA64r), Mcasm::R11)
        .addReg(Mcasm::RIP)
        .addImm(1)
        .addReg(0)
        .addGlobalAddress(CombinedGlobal,
                          JTInst->getOperand(2 + 2 * Target).getImm())
        .addReg(0);
    BuildMI(*MBB, MBBI, DL, TII->get(Mcasm::CMP64rr))
        .add(Selector)
        .addReg(Mcasm::R11);
  };

  auto CreateMBB = [&]() {
    auto *NewMBB = MF->CreateMachineBasicBlock(BB);
    MBB->addSuccessor(NewMBB);
    if (!MBB->isLiveIn(Mcasm::EFLAGS))
      MBB->addLiveIn(Mcasm::EFLAGS);
    return NewMBB;
  };

  auto EmitCondJump = [&](unsigned CC, MachineBasicBlock *ThenMBB) {
    BuildMI(*MBB, MBBI, DL, TII->get(Mcasm::JCC_1)).addMBB(ThenMBB).addImm(CC);

    auto *ElseMBB = CreateMBB();
    MF->insert(InsPt, ElseMBB);
    MBB = ElseMBB;
    MBBI = MBB->end();
  };

  auto EmitCondJumpTarget = [&](unsigned CC, unsigned Target) {
    auto *ThenMBB = CreateMBB();
    TargetMBBs.push_back({ThenMBB, Target});
    EmitCondJump(CC, ThenMBB);
  };

  auto EmitTailCall = [&](unsigned Target) {
    BuildMI(*MBB, MBBI, DL, TII->get(Mcasm::TAILJMPd64))
        .add(JTInst->getOperand(3 + 2 * Target));
  };

  std::function<void(unsigned, unsigned)> EmitBranchFunnel =
      [&](unsigned FirstTarget, unsigned NumTargets) {
    if (NumTargets == 1) {
      EmitTailCall(FirstTarget);
      return;
    }

    if (NumTargets == 2) {
      CmpTarget(FirstTarget + 1);
      EmitCondJumpTarget(Mcasm::COND_B, FirstTarget);
      EmitTailCall(FirstTarget + 1);
      return;
    }

    if (NumTargets < 6) {
      CmpTarget(FirstTarget + 1);
      EmitCondJumpTarget(Mcasm::COND_B, FirstTarget);
      EmitCondJumpTarget(Mcasm::COND_E, FirstTarget + 1);
      EmitBranchFunnel(FirstTarget + 2, NumTargets - 2);
      return;
    }

    auto *ThenMBB = CreateMBB();
    CmpTarget(FirstTarget + (NumTargets / 2));
    EmitCondJump(Mcasm::COND_B, ThenMBB);
    EmitCondJumpTarget(Mcasm::COND_E, FirstTarget + (NumTargets / 2));
    EmitBranchFunnel(FirstTarget + (NumTargets / 2) + 1,
                  NumTargets - (NumTargets / 2) - 1);

    MF->insert(InsPt, ThenMBB);
    MBB = ThenMBB;
    MBBI = MBB->end();
    EmitBranchFunnel(FirstTarget, NumTargets / 2);
  };

  EmitBranchFunnel(0, (JTInst->getNumOperands() - 2) / 2);
  for (auto P : TargetMBBs) {
    MF->insert(InsPt, P.first);
    BuildMI(P.first, DL, TII->get(Mcasm::TAILJMPd64))
        .add(JTInst->getOperand(3 + 2 * P.second));
  }
  JTMBB->erase(JTInst);
}

void McasmExpandPseudoImpl::expandCALL_RVMARKER(
    MachineBasicBlock &MBB, MachineBasicBlock::iterator MBBI) {
  // Expand CALL_RVMARKER pseudo to call instruction, followed by the special
  //"movq %rax, %rdi" marker.
  MachineInstr &MI = *MBBI;

  MachineInstr *OriginalCall;
  assert((MI.getOperand(1).isGlobal() || MI.getOperand(1).isReg()) &&
         "invalid operand for regular call");
  unsigned Opc = -1;
  if (MI.getOpcode() == Mcasm::CALL64m_RVMARKER)
    Opc = Mcasm::CALL64m;
  else if (MI.getOpcode() == Mcasm::CALL64r_RVMARKER)
    Opc = Mcasm::CALL64r;
  else if (MI.getOpcode() == Mcasm::CALL64pcrel32_RVMARKER)
    Opc = Mcasm::CALL64pcrel32;
  else
    llvm_unreachable("unexpected opcode");

  OriginalCall = BuildMI(MBB, MBBI, MI.getDebugLoc(), TII->get(Opc)).getInstr();
  bool RAXImplicitDead = false;
  for (MachineOperand &Op : llvm::drop_begin(MI.operands())) {
    // RAX may be 'implicit dead', if there are no other users of the return
    // value. We introduce a new use, so change it to 'implicit def'.
    if (Op.isReg() && Op.isImplicit() && Op.isDead() &&
        TRI->regsOverlap(Op.getReg(), Mcasm::RAX)) {
      Op.setIsDead(false);
      Op.setIsDef(true);
      RAXImplicitDead = true;
    }
    OriginalCall->addOperand(Op);
  }

  // Emit marker "movq %rax, %rdi".  %rdi is not callee-saved, so it cannot be
  // live across the earlier call. The call to the ObjC runtime function returns
  // the first argument, so the value of %rax is unchanged after the ObjC
  // runtime call. On Windows targets, the runtime call follows the regular
  // x64 calling convention and expects the first argument in %rcx.
  auto TargetReg = STI->getTargetTriple().isOSWindows() ? Mcasm::RCX : Mcasm::RDI;
  auto *Marker = BuildMI(MBB, MBBI, MI.getDebugLoc(), TII->get(Mcasm::MOV64rr))
                     .addReg(TargetReg, RegState::Define)
                     .addReg(Mcasm::RAX)
                     .getInstr();
  if (MI.shouldUpdateAdditionalCallInfo())
    MBB.getParent()->moveAdditionalCallInfo(&MI, Marker);

  // Emit call to ObjC runtime.
  const uint32_t *RegMask =
      TRI->getCallPreservedMask(*MBB.getParent(), CallingConv::C);
  MachineInstr *RtCall =
      BuildMI(MBB, MBBI, MI.getDebugLoc(), TII->get(Mcasm::CALL64pcrel32))
          .addGlobalAddress(MI.getOperand(0).getGlobal(), 0, 0)
          .addRegMask(RegMask)
          .addReg(Mcasm::RAX,
                  RegState::Implicit |
                      (RAXImplicitDead ? (RegState::Dead | RegState::Define)
                                       : RegState::Define))
          .getInstr();
  MI.eraseFromParent();

  auto &TM = MBB.getParent()->getTarget();
  // On Darwin platforms, wrap the expanded sequence in a bundle to prevent
  // later optimizations from breaking up the sequence.
  if (TM.getTargetTriple().isOSDarwin())
    finalizeBundle(MBB, OriginalCall->getIterator(),
                   std::next(RtCall->getIterator()));
}

/// If \p MBBI is a pseudo instruction, this method expands
/// it to the corresponding (sequence of) actual instruction(s).
/// \returns true if \p MBBI has been expanded.
bool McasmExpandPseudoImpl::expandMI(MachineBasicBlock &MBB,
                                   MachineBasicBlock::iterator MBBI) {
  MachineInstr &MI = *MBBI;
  unsigned Opcode = MI.getOpcode();
  const DebugLoc &DL = MBBI->getDebugLoc();
#define GET_EGPR_IF_ENABLED(OPC) (STI->hasEGPR() ? OPC##_EVEX : OPC)
  switch (Opcode) {
  default:
    return false;
  case Mcasm::TCRETURNdi:
  case Mcasm::TCRETURNdicc:
  case Mcasm::TCRETURNri:
  case Mcasm::TCRETURN_WIN64ri:
  case Mcasm::TCRETURN_HIPE32ri:
  case Mcasm::TCRETURNmi:
  case Mcasm::TCRETURNdi64:
  case Mcasm::TCRETURNdi64cc:
  case Mcasm::TCRETURNri64:
  case Mcasm::TCRETURNri64_ImpCall:
  case Mcasm::TCRETURNmi64:
  case Mcasm::TCRETURN_WINmi64: {
    bool isMem = Opcode == Mcasm::TCRETURNmi || Opcode == Mcasm::TCRETURNmi64 ||
                 Opcode == Mcasm::TCRETURN_WINmi64;
    MachineOperand &JumpTarget = MBBI->getOperand(0);
    MachineOperand &StackAdjust = MBBI->getOperand(isMem ? Mcasm::AddrNumOperands
                                                         : 1);
    assert(StackAdjust.isImm() && "Expecting immediate value.");

    // Adjust stack pointer.
    int StackAdj = StackAdjust.getImm();
    int MaxTCDelta = McasmFI->getTCReturnAddrDelta();
    int64_t Offset = 0;
    assert(MaxTCDelta <= 0 && "MaxTCDelta should never be positive");

    // Incoporate the retaddr area.
    Offset = StackAdj - MaxTCDelta;
    assert(Offset >= 0 && "Offset should never be negative");

    if (Opcode == Mcasm::TCRETURNdicc || Opcode == Mcasm::TCRETURNdi64cc) {
      assert(Offset == 0 && "Conditional tail call cannot adjust the stack.");
    }

    if (Offset) {
      // Check for possible merge with preceding ADD instruction.
      Offset = McasmFL->mergeSPAdd(MBB, MBBI, Offset, true);
      McasmFL->emitSPUpdate(MBB, MBBI, DL, Offset, /*InEpilogue=*/true);
    }

    // Use this predicate to set REX prefix for Mcasm_64 targets.
    bool IsX64 = STI->isTargetWin64() || STI->isTargetUEFI64();
    // Jump to label or value in register.
    if (Opcode == Mcasm::TCRETURNdi || Opcode == Mcasm::TCRETURNdicc ||
        Opcode == Mcasm::TCRETURNdi64 || Opcode == Mcasm::TCRETURNdi64cc) {
      unsigned Op;
      switch (Opcode) {
      case Mcasm::TCRETURNdi:
        Op = Mcasm::TAILJMPd;
        break;
      case Mcasm::TCRETURNdicc:
        Op = Mcasm::TAILJMPd_CC;
        break;
      case Mcasm::TCRETURNdi64cc:
        assert(!MBB.getParent()->hasWinCFI() &&
               "Conditional tail calls confuse "
               "the Win64 unwinder.");
        Op = Mcasm::TAILJMPd64_CC;
        break;
      default:
        // Note: Win64 uses REX prefixes indirect jumps out of functions, but
        // not direct ones.
        Op = Mcasm::TAILJMPd64;
        break;
      }
      MachineInstrBuilder MIB = BuildMI(MBB, MBBI, DL, TII->get(Op));
      if (JumpTarget.isGlobal()) {
        MIB.addGlobalAddress(JumpTarget.getGlobal(), JumpTarget.getOffset(),
                             JumpTarget.getTargetFlags());
      } else {
        assert(JumpTarget.isSymbol());
        MIB.addExternalSymbol(JumpTarget.getSymbolName(),
                              JumpTarget.getTargetFlags());
      }
      if (Op == Mcasm::TAILJMPd_CC || Op == Mcasm::TAILJMPd64_CC) {
        MIB.addImm(MBBI->getOperand(2).getImm());
      }

    } else if (Opcode == Mcasm::TCRETURNmi || Opcode == Mcasm::TCRETURNmi64 ||
               Opcode == Mcasm::TCRETURN_WINmi64) {
      unsigned Op = (Opcode == Mcasm::TCRETURNmi)
                        ? Mcasm::TAILJMPm
                        : (IsX64 ? Mcasm::TAILJMPm64_REX : Mcasm::TAILJMPm64);
      MachineInstrBuilder MIB = BuildMI(MBB, MBBI, DL, TII->get(Op));
      for (unsigned i = 0; i != Mcasm::AddrNumOperands; ++i)
        MIB.add(MBBI->getOperand(i));
    } else if (Opcode == Mcasm::TCRETURNri64 ||
               Opcode == Mcasm::TCRETURNri64_ImpCall ||
               Opcode == Mcasm::TCRETURN_WIN64ri) {
      JumpTarget.setIsKill();
      BuildMI(MBB, MBBI, DL,
              TII->get(IsX64 ? Mcasm::TAILJMPr64_REX : Mcasm::TAILJMPr64))
          .add(JumpTarget);
    } else {
      assert(!IsX64 && "Win64 and UEFI64 require REX for indirect jumps.");
      JumpTarget.setIsKill();
      BuildMI(MBB, MBBI, DL, TII->get(Mcasm::TAILJMPr))
          .add(JumpTarget);
    }

    MachineInstr &NewMI = *std::prev(MBBI);
    NewMI.copyImplicitOps(*MBBI->getParent()->getParent(), *MBBI);
    NewMI.setCFIType(*MBB.getParent(), MI.getCFIType());

    // Update the call info.
    if (MBBI->isCandidateForAdditionalCallInfo())
      MBB.getParent()->moveAdditionalCallInfo(&*MBBI, &NewMI);

    // Delete the pseudo instruction TCRETURN.
    MBB.erase(MBBI);

    return true;
  }
  case Mcasm::EH_RETURN:
  case Mcasm::EH_RETURN64: {
    MachineOperand &DestAddr = MBBI->getOperand(0);
    assert(DestAddr.isReg() && "Offset should be in register!");
    const bool Uses64BitFramePtr = STI->isTarget64BitLP64();
    Register StackPtr = TRI->getStackRegister();
    BuildMI(MBB, MBBI, DL,
            TII->get(Uses64BitFramePtr ? Mcasm::MOV64rr : Mcasm::MOV32rr), StackPtr)
        .addReg(DestAddr.getReg());
    // The EH_RETURN pseudo is really removed during the MC Lowering.
    return true;
  }
  case Mcasm::IRET: {
    // Adjust stack to erase error code
    int64_t StackAdj = MBBI->getOperand(0).getImm();
    McasmFL->emitSPUpdate(MBB, MBBI, DL, StackAdj, true);
    // Replace pseudo with machine iret
    unsigned RetOp = STI->is64Bit() ? Mcasm::IRET64 : Mcasm::IRET32;
    // Use UIRET if UINTR is present (except for building kernel)
    if (STI->is64Bit() && STI->hasUINTR() &&
        MBB.getParent()->getTarget().getCodeModel() != CodeModel::Kernel)
      RetOp = Mcasm::UIRET;
    BuildMI(MBB, MBBI, DL, TII->get(RetOp));
    MBB.erase(MBBI);
    return true;
  }
  case Mcasm::RET: {
    // Adjust stack to erase error code
    int64_t StackAdj = MBBI->getOperand(0).getImm();
    MachineInstrBuilder MIB;
    if (StackAdj == 0) {
      MIB = BuildMI(MBB, MBBI, DL,
                    TII->get(STI->is64Bit() ? Mcasm::RET64 : Mcasm::RET32));
    } else if (isUInt<16>(StackAdj)) {
      MIB = BuildMI(MBB, MBBI, DL,
                    TII->get(STI->is64Bit() ? Mcasm::RETI64 : Mcasm::RETI32))
                .addImm(StackAdj);
    } else {
      assert(!STI->is64Bit() &&
             "shouldn't need to do this for x86_64 targets!");
      // A ret can only handle immediates as big as 2**16-1.  If we need to pop
      // off bytes before the return address, we must do it manually.
      BuildMI(MBB, MBBI, DL, TII->get(Mcasm::POP32r)).addReg(Mcasm::ECX, RegState::Define);
      McasmFL->emitSPUpdate(MBB, MBBI, DL, StackAdj, /*InEpilogue=*/true);
      BuildMI(MBB, MBBI, DL, TII->get(Mcasm::PUSH32r)).addReg(Mcasm::ECX);
      MIB = BuildMI(MBB, MBBI, DL, TII->get(Mcasm::RET32));
    }
    for (unsigned I = 1, E = MBBI->getNumOperands(); I != E; ++I)
      MIB.add(MBBI->getOperand(I));
    MBB.erase(MBBI);
    return true;
  }
  case Mcasm::LCMPXCHG16B_SAVE_RBX: {
    // Perform the following transformation.
    // SaveRbx = pseudocmpxchg Addr, <4 opds for the address>, InArg, SaveRbx
    // =>
    // RBX = InArg
    // actualcmpxchg Addr
    // RBX = SaveRbx
    const MachineOperand &InArg = MBBI->getOperand(6);
    Register SaveRbx = MBBI->getOperand(7).getReg();

    // Copy the input argument of the pseudo into the argument of the
    // actual instruction.
    // NOTE: We don't copy the kill flag since the input might be the same reg
    // as one of the other operands of LCMPXCHG16B.
    TII->copyPhysReg(MBB, MBBI, DL, Mcasm::RBX, InArg.getReg(), false);
    // Create the actual instruction.
    MachineInstr *NewInstr = BuildMI(MBB, MBBI, DL, TII->get(Mcasm::LCMPXCHG16B));
    // Copy the operands related to the address. If we access a frame variable,
    // we need to replace the RBX base with SaveRbx, as RBX has another value.
    const MachineOperand &Base = MBBI->getOperand(1);
    if (Base.getReg() == Mcasm::RBX || Base.getReg() == Mcasm::EBX)
      NewInstr->addOperand(MachineOperand::CreateReg(
          Base.getReg() == Mcasm::RBX
              ? SaveRbx
              : Register(TRI->getSubReg(SaveRbx, Mcasm::sub_32bit)),
          /*IsDef=*/false));
    else
      NewInstr->addOperand(Base);
    for (unsigned Idx = 1 + 1; Idx < 1 + Mcasm::AddrNumOperands; ++Idx)
      NewInstr->addOperand(MBBI->getOperand(Idx));
    // Finally, restore the value of RBX.
    TII->copyPhysReg(MBB, MBBI, DL, Mcasm::RBX, SaveRbx,
                     /*SrcIsKill*/ true);

    // Delete the pseudo.
    MBBI->eraseFromParent();
    return true;
  }
  // Loading/storing mask pairs requires two kmov operations. The second one of
  // these needs a 2 byte displacement relative to the specified address (with
  // 32 bit spill size). The pairs of 1bit masks up to 16 bit masks all use the
  // same spill size, they all are stored using MASKPAIR16STORE, loaded using
  // MASKPAIR16LOAD.
  //
  // The displacement value might wrap around in theory, thus the asserts in
  // both cases.
  case Mcasm::MASKPAIR16LOAD: {
    int64_t Disp = MBBI->getOperand(1 + Mcasm::AddrDisp).getImm();
    assert(Disp >= 0 && Disp <= INT32_MAX - 2 && "Unexpected displacement");
    Register Reg = MBBI->getOperand(0).getReg();
    bool DstIsDead = MBBI->getOperand(0).isDead();
    Register Reg0 = TRI->getSubReg(Reg, Mcasm::sub_mask_0);
    Register Reg1 = TRI->getSubReg(Reg, Mcasm::sub_mask_1);

    auto MIBLo =
        BuildMI(MBB, MBBI, DL, TII->get(GET_EGPR_IF_ENABLED(Mcasm::KMOVWkm)))
            .addReg(Reg0, RegState::Define | getDeadRegState(DstIsDead));
    auto MIBHi =
        BuildMI(MBB, MBBI, DL, TII->get(GET_EGPR_IF_ENABLED(Mcasm::KMOVWkm)))
            .addReg(Reg1, RegState::Define | getDeadRegState(DstIsDead));

    for (int i = 0; i < Mcasm::AddrNumOperands; ++i) {
      MIBLo.add(MBBI->getOperand(1 + i));
      if (i == Mcasm::AddrDisp)
        MIBHi.addImm(Disp + 2);
      else
        MIBHi.add(MBBI->getOperand(1 + i));
    }

    // Split the memory operand, adjusting the offset and size for the halves.
    MachineMemOperand *OldMMO = MBBI->memoperands().front();
    MachineFunction *MF = MBB.getParent();
    MachineMemOperand *MMOLo = MF->getMachineMemOperand(OldMMO, 0, 2);
    MachineMemOperand *MMOHi = MF->getMachineMemOperand(OldMMO, 2, 2);

    MIBLo.setMemRefs(MMOLo);
    MIBHi.setMemRefs(MMOHi);

    // Delete the pseudo.
    MBB.erase(MBBI);
    return true;
  }
  case Mcasm::MASKPAIR16STORE: {
    int64_t Disp = MBBI->getOperand(Mcasm::AddrDisp).getImm();
    assert(Disp >= 0 && Disp <= INT32_MAX - 2 && "Unexpected displacement");
    Register Reg = MBBI->getOperand(Mcasm::AddrNumOperands).getReg();
    bool SrcIsKill = MBBI->getOperand(Mcasm::AddrNumOperands).isKill();
    Register Reg0 = TRI->getSubReg(Reg, Mcasm::sub_mask_0);
    Register Reg1 = TRI->getSubReg(Reg, Mcasm::sub_mask_1);

    auto MIBLo =
        BuildMI(MBB, MBBI, DL, TII->get(GET_EGPR_IF_ENABLED(Mcasm::KMOVWmk)));
    auto MIBHi =
        BuildMI(MBB, MBBI, DL, TII->get(GET_EGPR_IF_ENABLED(Mcasm::KMOVWmk)));

    for (int i = 0; i < Mcasm::AddrNumOperands; ++i) {
      MIBLo.add(MBBI->getOperand(i));
      if (i == Mcasm::AddrDisp)
        MIBHi.addImm(Disp + 2);
      else
        MIBHi.add(MBBI->getOperand(i));
    }
    MIBLo.addReg(Reg0, getKillRegState(SrcIsKill));
    MIBHi.addReg(Reg1, getKillRegState(SrcIsKill));

    // Split the memory operand, adjusting the offset and size for the halves.
    MachineMemOperand *OldMMO = MBBI->memoperands().front();
    MachineFunction *MF = MBB.getParent();
    MachineMemOperand *MMOLo = MF->getMachineMemOperand(OldMMO, 0, 2);
    MachineMemOperand *MMOHi = MF->getMachineMemOperand(OldMMO, 2, 2);

    MIBLo.setMemRefs(MMOLo);
    MIBHi.setMemRefs(MMOHi);

    // Delete the pseudo.
    MBB.erase(MBBI);
    return true;
  }
  case Mcasm::MWAITX_SAVE_RBX: {
    // Perform the following transformation.
    // SaveRbx = pseudomwaitx InArg, SaveRbx
    // =>
    // [E|R]BX = InArg
    // actualmwaitx
    // [E|R]BX = SaveRbx
    const MachineOperand &InArg = MBBI->getOperand(1);
    // Copy the input argument of the pseudo into the argument of the
    // actual instruction.
    TII->copyPhysReg(MBB, MBBI, DL, Mcasm::EBX, InArg.getReg(), InArg.isKill());
    // Create the actual instruction.
    BuildMI(MBB, MBBI, DL, TII->get(Mcasm::MWAITXrrr));
    // Finally, restore the value of RBX.
    Register SaveRbx = MBBI->getOperand(2).getReg();
    TII->copyPhysReg(MBB, MBBI, DL, Mcasm::RBX, SaveRbx, /*SrcIsKill*/ true);
    // Delete the pseudo.
    MBBI->eraseFromParent();
    return true;
  }
  case TargetOpcode::ICALL_BRANCH_FUNNEL:
    expandICallBranchFunnel(&MBB, MBBI);
    return true;
  case Mcasm::PLDTILECFGV: {
    MI.setDesc(TII->get(GET_EGPR_IF_ENABLED(Mcasm::LDTILECFG)));
    return true;
  }
  case Mcasm::PTILELOADDV:
  case Mcasm::PTILELOADDT1V:
  case Mcasm::PTILELOADDRSV:
  case Mcasm::PTILELOADDRST1V:
  case Mcasm::PTCVTROWD2PSrreV:
  case Mcasm::PTCVTROWD2PSrriV:
  case Mcasm::PTCVTROWPS2BF16HrreV:
  case Mcasm::PTCVTROWPS2BF16HrriV:
  case Mcasm::PTCVTROWPS2BF16LrreV:
  case Mcasm::PTCVTROWPS2BF16LrriV:
  case Mcasm::PTCVTROWPS2PHHrreV:
  case Mcasm::PTCVTROWPS2PHHrriV:
  case Mcasm::PTCVTROWPS2PHLrreV:
  case Mcasm::PTCVTROWPS2PHLrriV:
  case Mcasm::PTILEMOVROWrreV:
  case Mcasm::PTILEMOVROWrriV: {
    for (unsigned i = 2; i > 0; --i)
      MI.removeOperand(i);
    unsigned Opc;
    switch (Opcode) {
    case Mcasm::PTILELOADDRSV:
      Opc = GET_EGPR_IF_ENABLED(Mcasm::TILELOADDRS);
      break;
    case Mcasm::PTILELOADDRST1V:
      Opc = GET_EGPR_IF_ENABLED(Mcasm::TILELOADDRST1);
      break;
    case Mcasm::PTILELOADDV:
      Opc = GET_EGPR_IF_ENABLED(Mcasm::TILELOADD);
      break;
    case Mcasm::PTILELOADDT1V:
      Opc = GET_EGPR_IF_ENABLED(Mcasm::TILELOADDT1);
      break;
    case Mcasm::PTCVTROWD2PSrreV:
      Opc = Mcasm::TCVTROWD2PSrte;
      break;
    case Mcasm::PTCVTROWD2PSrriV:
      Opc = Mcasm::TCVTROWD2PSrti;
      break;
    case Mcasm::PTCVTROWPS2BF16HrreV:
      Opc = Mcasm::TCVTROWPS2BF16Hrte;
      break;
    case Mcasm::PTCVTROWPS2BF16HrriV:
      Opc = Mcasm::TCVTROWPS2BF16Hrti;
      break;
    case Mcasm::PTCVTROWPS2BF16LrreV:
      Opc = Mcasm::TCVTROWPS2BF16Lrte;
      break;
    case Mcasm::PTCVTROWPS2BF16LrriV:
      Opc = Mcasm::TCVTROWPS2BF16Lrti;
      break;
    case Mcasm::PTCVTROWPS2PHHrreV:
      Opc = Mcasm::TCVTROWPS2PHHrte;
      break;
    case Mcasm::PTCVTROWPS2PHHrriV:
      Opc = Mcasm::TCVTROWPS2PHHrti;
      break;
    case Mcasm::PTCVTROWPS2PHLrreV:
      Opc = Mcasm::TCVTROWPS2PHLrte;
      break;
    case Mcasm::PTCVTROWPS2PHLrriV:
      Opc = Mcasm::TCVTROWPS2PHLrti;
      break;
    case Mcasm::PTILEMOVROWrreV:
      Opc = Mcasm::TILEMOVROWrte;
      break;
    case Mcasm::PTILEMOVROWrriV:
      Opc = Mcasm::TILEMOVROWrti;
      break;
    default:
      llvm_unreachable("Unexpected Opcode");
    }
    MI.setDesc(TII->get(Opc));
    return true;
  }
  case Mcasm::PTCMMIMFP16PSV:
  case Mcasm::PTCMMRLFP16PSV:
  case Mcasm::PTDPBSSDV:
  case Mcasm::PTDPBSUDV:
  case Mcasm::PTDPBUSDV:
  case Mcasm::PTDPBUUDV:
  case Mcasm::PTDPBF16PSV:
  case Mcasm::PTDPFP16PSV:
  case Mcasm::PTMMULTF32PSV:
  case Mcasm::PTDPBF8PSV:
  case Mcasm::PTDPBHF8PSV:
  case Mcasm::PTDPHBF8PSV:
  case Mcasm::PTDPHF8PSV: {
    MI.untieRegOperand(4);
    for (unsigned i = 3; i > 0; --i)
      MI.removeOperand(i);
    unsigned Opc;
    switch (Opcode) {
      // clang-format off
    case Mcasm::PTCMMIMFP16PSV:  Opc = Mcasm::TCMMIMFP16PS; break;
    case Mcasm::PTCMMRLFP16PSV:  Opc = Mcasm::TCMMRLFP16PS; break;
    case Mcasm::PTDPBSSDV:   Opc = Mcasm::TDPBSSD; break;
    case Mcasm::PTDPBSUDV:   Opc = Mcasm::TDPBSUD; break;
    case Mcasm::PTDPBUSDV:   Opc = Mcasm::TDPBUSD; break;
    case Mcasm::PTDPBUUDV:   Opc = Mcasm::TDPBUUD; break;
    case Mcasm::PTDPBF16PSV: Opc = Mcasm::TDPBF16PS; break;
    case Mcasm::PTDPFP16PSV: Opc = Mcasm::TDPFP16PS; break;
    case Mcasm::PTMMULTF32PSV: Opc = Mcasm::TMMULTF32PS; break;
    case Mcasm::PTDPBF8PSV: Opc = Mcasm::TDPBF8PS; break;
    case Mcasm::PTDPBHF8PSV: Opc = Mcasm::TDPBHF8PS; break;
    case Mcasm::PTDPHBF8PSV: Opc = Mcasm::TDPHBF8PS; break;
    case Mcasm::PTDPHF8PSV: Opc = Mcasm::TDPHF8PS; break;
    // clang-format on
    default:
      llvm_unreachable("Unexpected Opcode");
    }
    MI.setDesc(TII->get(Opc));
    MI.tieOperands(0, 1);
    return true;
  }
  case Mcasm::PTILESTOREDV: {
    for (int i = 1; i >= 0; --i)
      MI.removeOperand(i);
    MI.setDesc(TII->get(GET_EGPR_IF_ENABLED(Mcasm::TILESTORED)));
    return true;
  }
#undef GET_EGPR_IF_ENABLED
  case Mcasm::PTILEZEROV: {
    for (int i = 2; i > 0; --i) // Remove row, col
      MI.removeOperand(i);
    MI.setDesc(TII->get(Mcasm::TILEZERO));
    return true;
  }
  case Mcasm::CALL64pcrel32_RVMARKER:
  case Mcasm::CALL64r_RVMARKER:
  case Mcasm::CALL64m_RVMARKER:
    expandCALL_RVMARKER(MBB, MBBI);
    return true;
  case Mcasm::CALL64r_ImpCall:
    MI.setDesc(TII->get(Mcasm::CALL64r));
    return true;
  case Mcasm::ADD32mi_ND:
  case Mcasm::ADD64mi32_ND:
  case Mcasm::SUB32mi_ND:
  case Mcasm::SUB64mi32_ND:
  case Mcasm::AND32mi_ND:
  case Mcasm::AND64mi32_ND:
  case Mcasm::OR32mi_ND:
  case Mcasm::OR64mi32_ND:
  case Mcasm::XOR32mi_ND:
  case Mcasm::XOR64mi32_ND:
  case Mcasm::ADC32mi_ND:
  case Mcasm::ADC64mi32_ND:
  case Mcasm::SBB32mi_ND:
  case Mcasm::SBB64mi32_ND: {
    // It's possible for an EVEX-encoded legacy instruction to reach the 15-byte
    // instruction length limit: 4 bytes of EVEX prefix + 1 byte of opcode + 1
    // byte of ModRM + 1 byte of SIB + 4 bytes of displacement + 4 bytes of
    // immediate = 15 bytes in total, e.g.
    //
    //  subq    $184, %fs:257(%rbx, %rcx), %rax
    //
    // In such a case, no additional (ADSIZE or segment override) prefix can be
    // used. To resolve the issue, we split the “long” instruction into 2
    // instructions:
    //
    //  movq %fs:257(%rbx, %rcx)，%rax
    //  subq $184, %rax
    //
    //  Therefore we consider the OPmi_ND to be a pseudo instruction to some
    //  extent.
    const MachineOperand &ImmOp =
        MI.getOperand(MI.getNumExplicitOperands() - 1);
    // If the immediate is a expr, conservatively estimate 4 bytes.
    if (ImmOp.isImm() && isInt<8>(ImmOp.getImm()))
      return false;
    int MemOpNo = Mcasm::getFirstAddrOperandIdx(MI);
    const MachineOperand &DispOp = MI.getOperand(MemOpNo + Mcasm::AddrDisp);
    Register Base = MI.getOperand(MemOpNo + Mcasm::AddrBaseReg).getReg();
    // If the displacement is a expr, conservatively estimate 4 bytes.
    if (Base && DispOp.isImm() && isInt<8>(DispOp.getImm()))
      return false;
    // There can only be one of three: SIB, segment override register, ADSIZE
    Register Index = MI.getOperand(MemOpNo + Mcasm::AddrIndexReg).getReg();
    unsigned Count = !!MI.getOperand(MemOpNo + Mcasm::AddrSegmentReg).getReg();
    if (McasmII::needSIB(Base, Index, /*In64BitMode=*/true))
      ++Count;
    if (McasmMCRegisterClasses[Mcasm::GR32RegClassID].contains(Base) ||
        McasmMCRegisterClasses[Mcasm::GR32RegClassID].contains(Index))
      ++Count;
    if (Count < 2)
      return false;
    unsigned Opc, LoadOpc;
    switch (Opcode) {
#define MI_TO_RI(OP)                                                           \
  case Mcasm::OP##32mi_ND:                                                       \
    Opc = Mcasm::OP##32ri;                                                       \
    LoadOpc = Mcasm::MOV32rm;                                                    \
    break;                                                                     \
  case Mcasm::OP##64mi32_ND:                                                     \
    Opc = Mcasm::OP##64ri32;                                                     \
    LoadOpc = Mcasm::MOV64rm;                                                    \
    break;

    default:
      llvm_unreachable("Unexpected Opcode");
      MI_TO_RI(ADD);
      MI_TO_RI(SUB);
      MI_TO_RI(AND);
      MI_TO_RI(OR);
      MI_TO_RI(XOR);
      MI_TO_RI(ADC);
      MI_TO_RI(SBB);
#undef MI_TO_RI
    }
    // Insert OPri.
    Register DestReg = MI.getOperand(0).getReg();
    BuildMI(MBB, std::next(MBBI), DL, TII->get(Opc), DestReg)
        .addReg(DestReg)
        .add(ImmOp);
    // Change OPmi_ND to MOVrm.
    for (unsigned I = MI.getNumImplicitOperands() + 1; I != 0; --I)
      MI.removeOperand(MI.getNumOperands() - 1);
    MI.setDesc(TII->get(LoadOpc));
    return true;
  }
  }
  llvm_unreachable("Previous switch has a fallthrough?");
}

// This function creates additional block for storing varargs guarded
// registers. It adds check for %al into entry block, to skip
// GuardedRegsBlk if xmm registers should not be stored.
//
//     EntryBlk[VAStartPseudoInstr]     EntryBlk
//        |                              |     .
//        |                              |        .
//        |                              |   GuardedRegsBlk
//        |                      =>      |        .
//        |                              |     .
//        |                             TailBlk
//        |                              |
//        |                              |
//
void McasmExpandPseudoImpl::expandVastartSaveXmmRegs(
    MachineBasicBlock *EntryBlk,
    MachineBasicBlock::iterator VAStartPseudoInstr) const {
  assert(VAStartPseudoInstr->getOpcode() == Mcasm::VASTART_SAVE_XMM_REGS);

  MachineFunction *Func = EntryBlk->getParent();
  const TargetInstrInfo *TII = STI->getInstrInfo();
  const DebugLoc &DL = VAStartPseudoInstr->getDebugLoc();
  Register CountReg = VAStartPseudoInstr->getOperand(0).getReg();

  // Calculate liveins for newly created blocks.
  LivePhysRegs LiveRegs(*STI->getRegisterInfo());
  SmallVector<std::pair<MCPhysReg, const MachineOperand *>, 8> Clobbers;

  LiveRegs.addLiveIns(*EntryBlk);
  for (MachineInstr &MI : EntryBlk->instrs()) {
    if (MI.getOpcode() == VAStartPseudoInstr->getOpcode())
      break;

    LiveRegs.stepForward(MI, Clobbers);
  }

  // Create the new basic blocks. One block contains all the XMM stores,
  // and another block is the final destination regardless of whether any
  // stores were performed.
  const BasicBlock *LLVMBlk = EntryBlk->getBasicBlock();
  MachineFunction::iterator EntryBlkIter = ++EntryBlk->getIterator();
  MachineBasicBlock *GuardedRegsBlk = Func->CreateMachineBasicBlock(LLVMBlk);
  MachineBasicBlock *TailBlk = Func->CreateMachineBasicBlock(LLVMBlk);
  Func->insert(EntryBlkIter, GuardedRegsBlk);
  Func->insert(EntryBlkIter, TailBlk);

  // Transfer the remainder of EntryBlk and its successor edges to TailBlk.
  TailBlk->splice(TailBlk->begin(), EntryBlk,
                  std::next(MachineBasicBlock::iterator(VAStartPseudoInstr)),
                  EntryBlk->end());
  TailBlk->transferSuccessorsAndUpdatePHIs(EntryBlk);

  uint64_t FrameOffset = VAStartPseudoInstr->getOperand(4).getImm();
  uint64_t VarArgsRegsOffset = VAStartPseudoInstr->getOperand(6).getImm();

  // TODO: add support for YMM and ZMM here.
  unsigned MOVOpc = STI->hasAVX() ? Mcasm::VMOVAPSmr : Mcasm::MOVAPSmr;

  // In the XMM save block, save all the XMM argument registers.
  for (int64_t OpndIdx = 7, RegIdx = 0;
       OpndIdx < VAStartPseudoInstr->getNumOperands() - 1;
       OpndIdx++, RegIdx++) {
    auto NewMI = BuildMI(GuardedRegsBlk, DL, TII->get(MOVOpc));
    for (int i = 0; i < Mcasm::AddrNumOperands; ++i) {
      if (i == Mcasm::AddrDisp)
        NewMI.addImm(FrameOffset + VarArgsRegsOffset + RegIdx * 16);
      else
        NewMI.add(VAStartPseudoInstr->getOperand(i + 1));
    }
    NewMI.addReg(VAStartPseudoInstr->getOperand(OpndIdx).getReg());
    assert(VAStartPseudoInstr->getOperand(OpndIdx).getReg().isPhysical());
  }

  // The original block will now fall through to the GuardedRegsBlk.
  EntryBlk->addSuccessor(GuardedRegsBlk);
  // The GuardedRegsBlk will fall through to the TailBlk.
  GuardedRegsBlk->addSuccessor(TailBlk);

  if (!STI->isCallingConvWin64(Func->getFunction().getCallingConv())) {
    // If %al is 0, branch around the XMM save block.
    BuildMI(EntryBlk, DL, TII->get(Mcasm::TEST8rr))
        .addReg(CountReg)
        .addReg(CountReg);
    BuildMI(EntryBlk, DL, TII->get(Mcasm::JCC_1))
        .addMBB(TailBlk)
        .addImm(Mcasm::COND_E);
    EntryBlk->addSuccessor(TailBlk);
  }

  // Add liveins to the created block.
  addLiveIns(*GuardedRegsBlk, LiveRegs);
  addLiveIns(*TailBlk, LiveRegs);

  // Delete the pseudo.
  VAStartPseudoInstr->eraseFromParent();
}

/// Expand all pseudo instructions contained in \p MBB.
/// \returns true if any expansion occurred for \p MBB.
bool McasmExpandPseudoImpl::expandMBB(MachineBasicBlock &MBB) {
  bool Modified = false;

  // MBBI may be invalidated by the expansion.
  MachineBasicBlock::iterator MBBI = MBB.begin(), E = MBB.end();
  while (MBBI != E) {
    MachineBasicBlock::iterator NMBBI = std::next(MBBI);
    Modified |= expandMI(MBB, MBBI);
    MBBI = NMBBI;
  }

  return Modified;
}

bool McasmExpandPseudoImpl::expandPseudosWhichAffectControlFlow(
    MachineFunction &MF) {
  // Currently pseudo which affects control flow is only
  // Mcasm::VASTART_SAVE_XMM_REGS which is located in Entry block.
  // So we do not need to evaluate other blocks.
  for (MachineInstr &Instr : MF.front().instrs()) {
    if (Instr.getOpcode() == Mcasm::VASTART_SAVE_XMM_REGS) {
      expandVastartSaveXmmRegs(&(MF.front()), Instr);
      return true;
    }
  }

  return false;
}

bool McasmExpandPseudoImpl::runOnMachineFunction(MachineFunction &MF) {
  STI = &MF.getSubtarget<McasmSubtarget>();
  TII = STI->getInstrInfo();
  TRI = STI->getRegisterInfo();
  McasmFI = MF.getInfo<McasmMachineFunctionInfo>();
  McasmFL = STI->getFrameLowering();

  bool Modified = expandPseudosWhichAffectControlFlow(MF);

  for (MachineBasicBlock &MBB : MF)
    Modified |= expandMBB(MBB);
  return Modified;
}

/// Returns an instance of the pseudo instruction expansion pass.
FunctionPass *llvm::createMcasmExpandPseudoLegacyPass() {
  return new McasmExpandPseudoLegacy();
}

bool McasmExpandPseudoLegacy::runOnMachineFunction(MachineFunction &MF) {
  McasmExpandPseudoImpl Impl;
  return Impl.runOnMachineFunction(MF);
}

PreservedAnalyses
McasmExpandPseudoPass::run(MachineFunction &MF,
                         MachineFunctionAnalysisManager &MFAM) {
  McasmExpandPseudoImpl Impl;
  bool Changed = Impl.runOnMachineFunction(MF);
  if (!Changed)
    return PreservedAnalyses::all();

  PreservedAnalyses PA = getMachineFunctionPassPreservedAnalyses();
  PA.preserveSet<CFGAnalyses>();
  return PA;
}
