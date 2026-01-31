//===-- McasmFixupInstTunings.cpp - replace instructions -----------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file does a tuning pass replacing slower machine instructions
// with faster ones. We do this here, as opposed to during normal ISel, as
// attempting to get the "right" instruction can break patterns. This pass
// is not meant search for special cases where an instruction can be transformed
// to another, it is only meant to do transformations where the old instruction
// is always replacable with the new instructions. For example:
//
//      `vpermq ymm` -> `vshufd ymm`
//          -- BAD, not always valid (lane cross/non-repeated mask)
//
//      `vpermilps ymm` -> `vshufd ymm`
//          -- GOOD, always replaceable
//
//===----------------------------------------------------------------------===//

#include "Mcasm.h"
#include "McasmInstrInfo.h"
#include "McasmSubtarget.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/CodeGen/MachineFunctionAnalysisManager.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachinePassManager.h"
#include "llvm/IR/Analysis.h"

using namespace llvm;

#define DEBUG_TYPE "x86-fixup-inst-tuning"

STATISTIC(NumInstChanges, "Number of instructions changes");

namespace {
class McasmFixupInstTuningImpl {
public:
  bool runOnMachineFunction(MachineFunction &MF);

private:
  bool processInstruction(MachineFunction &MF, MachineBasicBlock &MBB,
                          MachineBasicBlock::iterator &I);

  const McasmInstrInfo *TII = nullptr;
  const McasmSubtarget *ST = nullptr;
  const MCSchedModel *SM = nullptr;
};

class McasmFixupInstTuningLegacy : public MachineFunctionPass {
public:
  static char ID;

  McasmFixupInstTuningLegacy() : MachineFunctionPass(ID) {}

  StringRef getPassName() const override { return "Mcasm Fixup Inst Tuning"; }

  bool runOnMachineFunction(MachineFunction &MF) override;
  bool processInstruction(MachineFunction &MF, MachineBasicBlock &MBB,
                          MachineBasicBlock::iterator &I);

  // This pass runs after regalloc and doesn't support VReg operands.
  MachineFunctionProperties getRequiredProperties() const override {
    return MachineFunctionProperties().setNoVRegs();
  }
};
} // end anonymous namespace

char McasmFixupInstTuningLegacy ::ID = 0;

INITIALIZE_PASS(McasmFixupInstTuningLegacy, DEBUG_TYPE, DEBUG_TYPE, false, false)

FunctionPass *llvm::createMcasmFixupInstTuningLegacyPass() {
  return new McasmFixupInstTuningLegacy();
}

template <typename T>
static std::optional<bool> CmpOptionals(T NewVal, T CurVal) {
  if (NewVal.has_value() && CurVal.has_value() && *NewVal != *CurVal)
    return *NewVal < *CurVal;

  return std::nullopt;
}

bool McasmFixupInstTuningImpl::processInstruction(
    MachineFunction &MF, MachineBasicBlock &MBB,
    MachineBasicBlock::iterator &I) {
  MachineInstr &MI = *I;
  unsigned Opc = MI.getOpcode();
  unsigned NumOperands = MI.getDesc().getNumOperands();
  bool OptSize = MF.getFunction().hasOptSize();

  auto GetInstTput = [&](unsigned Opcode) -> std::optional<double> {
    // We already checked that SchedModel exists in `NewOpcPreferable`.
    return MCSchedModel::getReciprocalThroughput(
        *ST, *(SM->getSchedClassDesc(TII->get(Opcode).getSchedClass())));
  };

  auto GetInstLat = [&](unsigned Opcode) -> std::optional<double> {
    // We already checked that SchedModel exists in `NewOpcPreferable`.
    return MCSchedModel::computeInstrLatency(
        *ST, *(SM->getSchedClassDesc(TII->get(Opcode).getSchedClass())));
  };

  auto GetInstSize = [&](unsigned Opcode) -> std::optional<unsigned> {
    if (unsigned Size = TII->get(Opcode).getSize())
      return Size;
    // Zero size means we where unable to compute it.
    return std::nullopt;
  };

  auto NewOpcPreferable = [&](unsigned NewOpc,
                              bool ReplaceInTie = true) -> bool {
    std::optional<bool> Res;
    if (SM->hasInstrSchedModel()) {
      // Compare tput -> lat -> code size.
      Res = CmpOptionals(GetInstTput(NewOpc), GetInstTput(Opc));
      if (Res.has_value())
        return *Res;

      Res = CmpOptionals(GetInstLat(NewOpc), GetInstLat(Opc));
      if (Res.has_value())
        return *Res;
    }

    Res = CmpOptionals(GetInstSize(Opc), GetInstSize(NewOpc));
    if (Res.has_value())
      return *Res;

    // We either have either were unable to get tput/lat/codesize or all values
    // were equal. Return specified option for a tie.
    return ReplaceInTie;
  };

  // `vpermilpd r, i` -> `vshufpd r, r, i`
  // `vpermilpd r, i, k` -> `vshufpd r, r, i, k`
  // `vshufpd` is always as fast or faster than `vpermilpd` and takes
  // 1 less byte of code size for VEX and EVEX encoding.
  auto ProcessVPERMILPDri = [&](unsigned NewOpc) -> bool {
    if (!NewOpcPreferable(NewOpc))
      return false;
    LLVM_DEBUG(dbgs() << "Replacing: " << MI);
    {
      unsigned MaskImm = MI.getOperand(NumOperands - 1).getImm();
      MI.removeOperand(NumOperands - 1);
      MI.addOperand(MI.getOperand(NumOperands - 2));
      MI.setDesc(TII->get(NewOpc));
      MI.addOperand(MachineOperand::CreateImm(MaskImm));
    }
    LLVM_DEBUG(dbgs() << "     With: " << MI);
    return true;
  };

  // `vpermilps r, i` -> `vshufps r, r, i`
  // `vpermilps r, i, k` -> `vshufps r, r, i, k`
  // `vshufps` is always as fast or faster than `vpermilps` and takes
  // 1 less byte of code size for VEX and EVEX encoding.
  auto ProcessVPERMILPSri = [&](unsigned NewOpc) -> bool {
    if (!NewOpcPreferable(NewOpc))
      return false;
    LLVM_DEBUG(dbgs() << "Replacing: " << MI);
    {
      unsigned MaskImm = MI.getOperand(NumOperands - 1).getImm();
      MI.removeOperand(NumOperands - 1);
      MI.addOperand(MI.getOperand(NumOperands - 2));
      MI.setDesc(TII->get(NewOpc));
      MI.addOperand(MachineOperand::CreateImm(MaskImm));
    }
    LLVM_DEBUG(dbgs() << "     With: " << MI);
    return true;
  };

  // `vpermilps m, i` -> `vpshufd m, i` iff no domain delay penalty on shuffles.
  // `vpshufd` is always as fast or faster than `vpermilps` and takes 1 less
  // byte of code size.
  auto ProcessVPERMILPSmi = [&](unsigned NewOpc) -> bool {
    // TODO: Might be work adding bypass delay if -Os/-Oz is enabled as
    // `vpshufd` saves a byte of code size.
    if (!ST->hasNoDomainDelayShuffle() ||
        !NewOpcPreferable(NewOpc, /*ReplaceInTie*/ false))
      return false;
    LLVM_DEBUG(dbgs() << "Replacing: " << MI);
    {
      MI.setDesc(TII->get(NewOpc));
    }
    LLVM_DEBUG(dbgs() << "     With: " << MI);
    return true;
  };

  // `vunpcklpd/vmovlhps r, r` -> `vunpcklqdq r, r`/`vshufpd r, r, 0x00`
  // `vunpckhpd/vmovlhps r, r` -> `vunpckhqdq r, r`/`vshufpd r, r, 0xff`
  // `vunpcklpd r, r, k` -> `vunpcklqdq r, r, k`/`vshufpd r, r, k, 0x00`
  // `vunpckhpd r, r, k` -> `vunpckhqdq r, r, k`/`vshufpd r, r, k, 0xff`
  // `vunpcklpd r, m` -> `vunpcklqdq r, m, k`
  // `vunpckhpd r, m` -> `vunpckhqdq r, m, k`
  // `vunpcklpd r, m, k` -> `vunpcklqdq r, m, k`
  // `vunpckhpd r, m, k` -> `vunpckhqdq r, m, k`
  // 1) If no bypass delay and `vunpck{l|h}qdq` faster than `vunpck{l|h}pd`
  //        -> `vunpck{l|h}qdq`
  // 2) If `vshufpd` faster than `vunpck{l|h}pd`
  //        -> `vshufpd`
  //
  // `vunpcklps` -> `vunpckldq` (for all operand types if no bypass delay)
  auto ProcessUNPCK = [&](unsigned NewOpc, unsigned MaskImm) -> bool {
    if (!NewOpcPreferable(NewOpc, /*ReplaceInTie*/ false))
      return false;
    LLVM_DEBUG(dbgs() << "Replacing: " << MI);
    {
      MI.setDesc(TII->get(NewOpc));
      MI.addOperand(MachineOperand::CreateImm(MaskImm));
    }
    LLVM_DEBUG(dbgs() << "     With: " << MI);
    return true;
  };

  auto ProcessUNPCKToIntDomain = [&](unsigned NewOpc) -> bool {
    // TODO it may be worth it to set ReplaceInTie to `true` as there is no real
    // downside to the integer unpck, but if someone doesn't specify exact
    // target we won't find it faster.
    if (!ST->hasNoDomainDelayShuffle() ||
        !NewOpcPreferable(NewOpc, /*ReplaceInTie*/ false))
      return false;
    LLVM_DEBUG(dbgs() << "Replacing: " << MI);
    {
      MI.setDesc(TII->get(NewOpc));
    }
    LLVM_DEBUG(dbgs() << "     With: " << MI);
    return true;
  };

  auto ProcessUNPCKLPDrr = [&](unsigned NewOpcIntDomain,
                               unsigned NewOpc) -> bool {
    if (ProcessUNPCKToIntDomain(NewOpcIntDomain))
      return true;
    return ProcessUNPCK(NewOpc, 0x00);
  };
  auto ProcessUNPCKHPDrr = [&](unsigned NewOpcIntDomain,
                               unsigned NewOpc) -> bool {
    if (ProcessUNPCKToIntDomain(NewOpcIntDomain))
      return true;
    return ProcessUNPCK(NewOpc, 0xff);
  };

  auto ProcessUNPCKPDrm = [&](unsigned NewOpcIntDomain) -> bool {
    return ProcessUNPCKToIntDomain(NewOpcIntDomain);
  };

  auto ProcessUNPCKPS = [&](unsigned NewOpc) -> bool {
    return ProcessUNPCKToIntDomain(NewOpc);
  };

  auto ProcessBLENDWToBLENDD = [&](unsigned MovOpc, unsigned NumElts) -> bool {
    if (!ST->hasAVX2() || !NewOpcPreferable(MovOpc))
      return false;
    // Convert to VPBLENDD if scaling the VPBLENDW mask down/up loses no bits.
    APInt MaskW =
        APInt(8, MI.getOperand(NumOperands - 1).getImm(), /*IsSigned=*/false);
    APInt MaskD = APIntOps::ScaleBitMask(MaskW, 4, /*MatchAllBits=*/true);
    if (MaskW != APIntOps::ScaleBitMask(MaskD, 8, /*MatchAllBits=*/true))
      return false;
    APInt NewMaskD = APInt::getSplat(NumElts, MaskD);
    LLVM_DEBUG(dbgs() << "Replacing: " << MI);
    {
      MI.setDesc(TII->get(MovOpc));
      MI.removeOperand(NumOperands - 1);
      MI.addOperand(MachineOperand::CreateImm(NewMaskD.getZExtValue()));
    }
    LLVM_DEBUG(dbgs() << "     With: " << MI);
    return true;
  };

  auto ProcessBLENDToMOV = [&](unsigned MovOpc, unsigned Mask,
                               unsigned MovImm) -> bool {
    if ((MI.getOperand(NumOperands - 1).getImm() & Mask) != MovImm)
      return false;
    if (!OptSize && !NewOpcPreferable(MovOpc))
      return false;
    LLVM_DEBUG(dbgs() << "Replacing: " << MI);
    {
      MI.setDesc(TII->get(MovOpc));
      MI.removeOperand(NumOperands - 1);
    }
    LLVM_DEBUG(dbgs() << "     With: " << MI);
    return true;
  };

  // Is ADD(X,X) more efficient than SHL(X,1)?
  auto ProcessShiftLeftToAdd = [&](unsigned AddOpc) -> bool {
    if (MI.getOperand(NumOperands - 1).getImm() != 1)
      return false;
    if (!NewOpcPreferable(AddOpc, /*ReplaceInTie*/ true))
      return false;
    LLVM_DEBUG(dbgs() << "Replacing: " << MI);
    {
      MI.setDesc(TII->get(AddOpc));
      MI.removeOperand(NumOperands - 1);
      MI.addOperand(MI.getOperand(NumOperands - 2));
    }
    LLVM_DEBUG(dbgs() << "     With: " << MI);
    return false;
  };

  switch (Opc) {
  case Mcasm::BLENDPDrri:
    return ProcessBLENDToMOV(Mcasm::MOVSDrr, 0x3, 0x1);
  case Mcasm::VBLENDPDrri:
    return ProcessBLENDToMOV(Mcasm::VMOVSDrr, 0x3, 0x1);

  case Mcasm::BLENDPSrri:
    return ProcessBLENDToMOV(Mcasm::MOVSSrr, 0xF, 0x1) ||
           ProcessBLENDToMOV(Mcasm::MOVSDrr, 0xF, 0x3);
  case Mcasm::VBLENDPSrri:
    return ProcessBLENDToMOV(Mcasm::VMOVSSrr, 0xF, 0x1) ||
           ProcessBLENDToMOV(Mcasm::VMOVSDrr, 0xF, 0x3);

  case Mcasm::VPBLENDWrri:
    // TODO: Add Mcasm::VPBLENDWrmi handling
    // TODO: Add Mcasm::VPBLENDWYrri handling
    // TODO: Add Mcasm::VPBLENDWYrmi handling
    return ProcessBLENDWToBLENDD(Mcasm::VPBLENDDrri, 4);

  case Mcasm::VPERMILPDri:
    return ProcessVPERMILPDri(Mcasm::VSHUFPDrri);
  case Mcasm::VPERMILPDYri:
    return ProcessVPERMILPDri(Mcasm::VSHUFPDYrri);
  case Mcasm::VPERMILPDZ128ri:
    return ProcessVPERMILPDri(Mcasm::VSHUFPDZ128rri);
  case Mcasm::VPERMILPDZ256ri:
    return ProcessVPERMILPDri(Mcasm::VSHUFPDZ256rri);
  case Mcasm::VPERMILPDZri:
    return ProcessVPERMILPDri(Mcasm::VSHUFPDZrri);
  case Mcasm::VPERMILPDZ128rikz:
    return ProcessVPERMILPDri(Mcasm::VSHUFPDZ128rrikz);
  case Mcasm::VPERMILPDZ256rikz:
    return ProcessVPERMILPDri(Mcasm::VSHUFPDZ256rrikz);
  case Mcasm::VPERMILPDZrikz:
    return ProcessVPERMILPDri(Mcasm::VSHUFPDZrrikz);
  case Mcasm::VPERMILPDZ128rik:
    return ProcessVPERMILPDri(Mcasm::VSHUFPDZ128rrik);
  case Mcasm::VPERMILPDZ256rik:
    return ProcessVPERMILPDri(Mcasm::VSHUFPDZ256rrik);
  case Mcasm::VPERMILPDZrik:
    return ProcessVPERMILPDri(Mcasm::VSHUFPDZrrik);

  case Mcasm::VPERMILPSri:
    return ProcessVPERMILPSri(Mcasm::VSHUFPSrri);
  case Mcasm::VPERMILPSYri:
    return ProcessVPERMILPSri(Mcasm::VSHUFPSYrri);
  case Mcasm::VPERMILPSZ128ri:
    return ProcessVPERMILPSri(Mcasm::VSHUFPSZ128rri);
  case Mcasm::VPERMILPSZ256ri:
    return ProcessVPERMILPSri(Mcasm::VSHUFPSZ256rri);
  case Mcasm::VPERMILPSZri:
    return ProcessVPERMILPSri(Mcasm::VSHUFPSZrri);
  case Mcasm::VPERMILPSZ128rikz:
    return ProcessVPERMILPSri(Mcasm::VSHUFPSZ128rrikz);
  case Mcasm::VPERMILPSZ256rikz:
    return ProcessVPERMILPSri(Mcasm::VSHUFPSZ256rrikz);
  case Mcasm::VPERMILPSZrikz:
    return ProcessVPERMILPSri(Mcasm::VSHUFPSZrrikz);
  case Mcasm::VPERMILPSZ128rik:
    return ProcessVPERMILPSri(Mcasm::VSHUFPSZ128rrik);
  case Mcasm::VPERMILPSZ256rik:
    return ProcessVPERMILPSri(Mcasm::VSHUFPSZ256rrik);
  case Mcasm::VPERMILPSZrik:
    return ProcessVPERMILPSri(Mcasm::VSHUFPSZrrik);
  case Mcasm::VPERMILPSmi:
    return ProcessVPERMILPSmi(Mcasm::VPSHUFDmi);
  case Mcasm::VPERMILPSYmi:
    // TODO: See if there is a more generic way we can test if the replacement
    // instruction is supported.
    return ST->hasAVX2() ? ProcessVPERMILPSmi(Mcasm::VPSHUFDYmi) : false;
  case Mcasm::VPERMILPSZ128mi:
    return ProcessVPERMILPSmi(Mcasm::VPSHUFDZ128mi);
  case Mcasm::VPERMILPSZ256mi:
    return ProcessVPERMILPSmi(Mcasm::VPSHUFDZ256mi);
  case Mcasm::VPERMILPSZmi:
    return ProcessVPERMILPSmi(Mcasm::VPSHUFDZmi);
  case Mcasm::VPERMILPSZ128mikz:
    return ProcessVPERMILPSmi(Mcasm::VPSHUFDZ128mikz);
  case Mcasm::VPERMILPSZ256mikz:
    return ProcessVPERMILPSmi(Mcasm::VPSHUFDZ256mikz);
  case Mcasm::VPERMILPSZmikz:
    return ProcessVPERMILPSmi(Mcasm::VPSHUFDZmikz);
  case Mcasm::VPERMILPSZ128mik:
    return ProcessVPERMILPSmi(Mcasm::VPSHUFDZ128mik);
  case Mcasm::VPERMILPSZ256mik:
    return ProcessVPERMILPSmi(Mcasm::VPSHUFDZ256mik);
  case Mcasm::VPERMILPSZmik:
    return ProcessVPERMILPSmi(Mcasm::VPSHUFDZmik);

  case Mcasm::MOVLHPSrr:
  case Mcasm::UNPCKLPDrr:
    return ProcessUNPCKLPDrr(Mcasm::PUNPCKLQDQrr, Mcasm::SHUFPDrri);
  case Mcasm::VMOVLHPSrr:
  case Mcasm::VUNPCKLPDrr:
    return ProcessUNPCKLPDrr(Mcasm::VPUNPCKLQDQrr, Mcasm::VSHUFPDrri);
  case Mcasm::VUNPCKLPDYrr:
    return ProcessUNPCKLPDrr(Mcasm::VPUNPCKLQDQYrr, Mcasm::VSHUFPDYrri);
    // VMOVLHPS is always 128 bits.
  case Mcasm::VMOVLHPSZrr:
  case Mcasm::VUNPCKLPDZ128rr:
    return ProcessUNPCKLPDrr(Mcasm::VPUNPCKLQDQZ128rr, Mcasm::VSHUFPDZ128rri);
  case Mcasm::VUNPCKLPDZ256rr:
    return ProcessUNPCKLPDrr(Mcasm::VPUNPCKLQDQZ256rr, Mcasm::VSHUFPDZ256rri);
  case Mcasm::VUNPCKLPDZrr:
    return ProcessUNPCKLPDrr(Mcasm::VPUNPCKLQDQZrr, Mcasm::VSHUFPDZrri);
  case Mcasm::VUNPCKLPDZ128rrk:
    return ProcessUNPCKLPDrr(Mcasm::VPUNPCKLQDQZ128rrk, Mcasm::VSHUFPDZ128rrik);
  case Mcasm::VUNPCKLPDZ256rrk:
    return ProcessUNPCKLPDrr(Mcasm::VPUNPCKLQDQZ256rrk, Mcasm::VSHUFPDZ256rrik);
  case Mcasm::VUNPCKLPDZrrk:
    return ProcessUNPCKLPDrr(Mcasm::VPUNPCKLQDQZrrk, Mcasm::VSHUFPDZrrik);
  case Mcasm::VUNPCKLPDZ128rrkz:
    return ProcessUNPCKLPDrr(Mcasm::VPUNPCKLQDQZ128rrkz, Mcasm::VSHUFPDZ128rrikz);
  case Mcasm::VUNPCKLPDZ256rrkz:
    return ProcessUNPCKLPDrr(Mcasm::VPUNPCKLQDQZ256rrkz, Mcasm::VSHUFPDZ256rrikz);
  case Mcasm::VUNPCKLPDZrrkz:
    return ProcessUNPCKLPDrr(Mcasm::VPUNPCKLQDQZrrkz, Mcasm::VSHUFPDZrrikz);
  case Mcasm::UNPCKHPDrr:
    return ProcessUNPCKHPDrr(Mcasm::PUNPCKHQDQrr, Mcasm::SHUFPDrri);
  case Mcasm::VUNPCKHPDrr:
    return ProcessUNPCKHPDrr(Mcasm::VPUNPCKHQDQrr, Mcasm::VSHUFPDrri);
  case Mcasm::VUNPCKHPDYrr:
    return ProcessUNPCKHPDrr(Mcasm::VPUNPCKHQDQYrr, Mcasm::VSHUFPDYrri);
  case Mcasm::VUNPCKHPDZ128rr:
    return ProcessUNPCKHPDrr(Mcasm::VPUNPCKHQDQZ128rr, Mcasm::VSHUFPDZ128rri);
  case Mcasm::VUNPCKHPDZ256rr:
    return ProcessUNPCKHPDrr(Mcasm::VPUNPCKHQDQZ256rr, Mcasm::VSHUFPDZ256rri);
  case Mcasm::VUNPCKHPDZrr:
    return ProcessUNPCKHPDrr(Mcasm::VPUNPCKHQDQZrr, Mcasm::VSHUFPDZrri);
  case Mcasm::VUNPCKHPDZ128rrk:
    return ProcessUNPCKHPDrr(Mcasm::VPUNPCKHQDQZ128rrk, Mcasm::VSHUFPDZ128rrik);
  case Mcasm::VUNPCKHPDZ256rrk:
    return ProcessUNPCKHPDrr(Mcasm::VPUNPCKHQDQZ256rrk, Mcasm::VSHUFPDZ256rrik);
  case Mcasm::VUNPCKHPDZrrk:
    return ProcessUNPCKHPDrr(Mcasm::VPUNPCKHQDQZrrk, Mcasm::VSHUFPDZrrik);
  case Mcasm::VUNPCKHPDZ128rrkz:
    return ProcessUNPCKHPDrr(Mcasm::VPUNPCKHQDQZ128rrkz, Mcasm::VSHUFPDZ128rrikz);
  case Mcasm::VUNPCKHPDZ256rrkz:
    return ProcessUNPCKHPDrr(Mcasm::VPUNPCKHQDQZ256rrkz, Mcasm::VSHUFPDZ256rrikz);
  case Mcasm::VUNPCKHPDZrrkz:
    return ProcessUNPCKHPDrr(Mcasm::VPUNPCKHQDQZrrkz, Mcasm::VSHUFPDZrrikz);
  case Mcasm::UNPCKLPDrm:
    return ProcessUNPCKPDrm(Mcasm::PUNPCKLQDQrm);
  case Mcasm::VUNPCKLPDrm:
    return ProcessUNPCKPDrm(Mcasm::VPUNPCKLQDQrm);
  case Mcasm::VUNPCKLPDYrm:
    return ProcessUNPCKPDrm(Mcasm::VPUNPCKLQDQYrm);
  case Mcasm::VUNPCKLPDZ128rm:
    return ProcessUNPCKPDrm(Mcasm::VPUNPCKLQDQZ128rm);
  case Mcasm::VUNPCKLPDZ256rm:
    return ProcessUNPCKPDrm(Mcasm::VPUNPCKLQDQZ256rm);
  case Mcasm::VUNPCKLPDZrm:
    return ProcessUNPCKPDrm(Mcasm::VPUNPCKLQDQZrm);
  case Mcasm::VUNPCKLPDZ128rmk:
    return ProcessUNPCKPDrm(Mcasm::VPUNPCKLQDQZ128rmk);
  case Mcasm::VUNPCKLPDZ256rmk:
    return ProcessUNPCKPDrm(Mcasm::VPUNPCKLQDQZ256rmk);
  case Mcasm::VUNPCKLPDZrmk:
    return ProcessUNPCKPDrm(Mcasm::VPUNPCKLQDQZrmk);
  case Mcasm::VUNPCKLPDZ128rmkz:
    return ProcessUNPCKPDrm(Mcasm::VPUNPCKLQDQZ128rmkz);
  case Mcasm::VUNPCKLPDZ256rmkz:
    return ProcessUNPCKPDrm(Mcasm::VPUNPCKLQDQZ256rmkz);
  case Mcasm::VUNPCKLPDZrmkz:
    return ProcessUNPCKPDrm(Mcasm::VPUNPCKLQDQZrmkz);
  case Mcasm::UNPCKHPDrm:
    return ProcessUNPCKPDrm(Mcasm::PUNPCKHQDQrm);
  case Mcasm::VUNPCKHPDrm:
    return ProcessUNPCKPDrm(Mcasm::VPUNPCKHQDQrm);
  case Mcasm::VUNPCKHPDYrm:
    return ProcessUNPCKPDrm(Mcasm::VPUNPCKHQDQYrm);
  case Mcasm::VUNPCKHPDZ128rm:
    return ProcessUNPCKPDrm(Mcasm::VPUNPCKHQDQZ128rm);
  case Mcasm::VUNPCKHPDZ256rm:
    return ProcessUNPCKPDrm(Mcasm::VPUNPCKHQDQZ256rm);
  case Mcasm::VUNPCKHPDZrm:
    return ProcessUNPCKPDrm(Mcasm::VPUNPCKHQDQZrm);
  case Mcasm::VUNPCKHPDZ128rmk:
    return ProcessUNPCKPDrm(Mcasm::VPUNPCKHQDQZ128rmk);
  case Mcasm::VUNPCKHPDZ256rmk:
    return ProcessUNPCKPDrm(Mcasm::VPUNPCKHQDQZ256rmk);
  case Mcasm::VUNPCKHPDZrmk:
    return ProcessUNPCKPDrm(Mcasm::VPUNPCKHQDQZrmk);
  case Mcasm::VUNPCKHPDZ128rmkz:
    return ProcessUNPCKPDrm(Mcasm::VPUNPCKHQDQZ128rmkz);
  case Mcasm::VUNPCKHPDZ256rmkz:
    return ProcessUNPCKPDrm(Mcasm::VPUNPCKHQDQZ256rmkz);
  case Mcasm::VUNPCKHPDZrmkz:
    return ProcessUNPCKPDrm(Mcasm::VPUNPCKHQDQZrmkz);

  case Mcasm::UNPCKLPSrr:
    return ProcessUNPCKPS(Mcasm::PUNPCKLDQrr);
  case Mcasm::VUNPCKLPSrr:
    return ProcessUNPCKPS(Mcasm::VPUNPCKLDQrr);
  case Mcasm::VUNPCKLPSYrr:
    return ProcessUNPCKPS(Mcasm::VPUNPCKLDQYrr);
  case Mcasm::VUNPCKLPSZ128rr:
    return ProcessUNPCKPS(Mcasm::VPUNPCKLDQZ128rr);
  case Mcasm::VUNPCKLPSZ256rr:
    return ProcessUNPCKPS(Mcasm::VPUNPCKLDQZ256rr);
  case Mcasm::VUNPCKLPSZrr:
    return ProcessUNPCKPS(Mcasm::VPUNPCKLDQZrr);
  case Mcasm::VUNPCKLPSZ128rrk:
    return ProcessUNPCKPS(Mcasm::VPUNPCKLDQZ128rrk);
  case Mcasm::VUNPCKLPSZ256rrk:
    return ProcessUNPCKPS(Mcasm::VPUNPCKLDQZ256rrk);
  case Mcasm::VUNPCKLPSZrrk:
    return ProcessUNPCKPS(Mcasm::VPUNPCKLDQZrrk);
  case Mcasm::VUNPCKLPSZ128rrkz:
    return ProcessUNPCKPS(Mcasm::VPUNPCKLDQZ128rrkz);
  case Mcasm::VUNPCKLPSZ256rrkz:
    return ProcessUNPCKPS(Mcasm::VPUNPCKLDQZ256rrkz);
  case Mcasm::VUNPCKLPSZrrkz:
    return ProcessUNPCKPS(Mcasm::VPUNPCKLDQZrrkz);
  case Mcasm::UNPCKHPSrr:
    return ProcessUNPCKPS(Mcasm::PUNPCKHDQrr);
  case Mcasm::VUNPCKHPSrr:
    return ProcessUNPCKPS(Mcasm::VPUNPCKHDQrr);
  case Mcasm::VUNPCKHPSYrr:
    return ProcessUNPCKPS(Mcasm::VPUNPCKHDQYrr);
  case Mcasm::VUNPCKHPSZ128rr:
    return ProcessUNPCKPS(Mcasm::VPUNPCKHDQZ128rr);
  case Mcasm::VUNPCKHPSZ256rr:
    return ProcessUNPCKPS(Mcasm::VPUNPCKHDQZ256rr);
  case Mcasm::VUNPCKHPSZrr:
    return ProcessUNPCKPS(Mcasm::VPUNPCKHDQZrr);
  case Mcasm::VUNPCKHPSZ128rrk:
    return ProcessUNPCKPS(Mcasm::VPUNPCKHDQZ128rrk);
  case Mcasm::VUNPCKHPSZ256rrk:
    return ProcessUNPCKPS(Mcasm::VPUNPCKHDQZ256rrk);
  case Mcasm::VUNPCKHPSZrrk:
    return ProcessUNPCKPS(Mcasm::VPUNPCKHDQZrrk);
  case Mcasm::VUNPCKHPSZ128rrkz:
    return ProcessUNPCKPS(Mcasm::VPUNPCKHDQZ128rrkz);
  case Mcasm::VUNPCKHPSZ256rrkz:
    return ProcessUNPCKPS(Mcasm::VPUNPCKHDQZ256rrkz);
  case Mcasm::VUNPCKHPSZrrkz:
    return ProcessUNPCKPS(Mcasm::VPUNPCKHDQZrrkz);
  case Mcasm::UNPCKLPSrm:
    return ProcessUNPCKPS(Mcasm::PUNPCKLDQrm);
  case Mcasm::VUNPCKLPSrm:
    return ProcessUNPCKPS(Mcasm::VPUNPCKLDQrm);
  case Mcasm::VUNPCKLPSYrm:
    return ProcessUNPCKPS(Mcasm::VPUNPCKLDQYrm);
  case Mcasm::VUNPCKLPSZ128rm:
    return ProcessUNPCKPS(Mcasm::VPUNPCKLDQZ128rm);
  case Mcasm::VUNPCKLPSZ256rm:
    return ProcessUNPCKPS(Mcasm::VPUNPCKLDQZ256rm);
  case Mcasm::VUNPCKLPSZrm:
    return ProcessUNPCKPS(Mcasm::VPUNPCKLDQZrm);
  case Mcasm::VUNPCKLPSZ128rmk:
    return ProcessUNPCKPS(Mcasm::VPUNPCKLDQZ128rmk);
  case Mcasm::VUNPCKLPSZ256rmk:
    return ProcessUNPCKPS(Mcasm::VPUNPCKLDQZ256rmk);
  case Mcasm::VUNPCKLPSZrmk:
    return ProcessUNPCKPS(Mcasm::VPUNPCKLDQZrmk);
  case Mcasm::VUNPCKLPSZ128rmkz:
    return ProcessUNPCKPS(Mcasm::VPUNPCKLDQZ128rmkz);
  case Mcasm::VUNPCKLPSZ256rmkz:
    return ProcessUNPCKPS(Mcasm::VPUNPCKLDQZ256rmkz);
  case Mcasm::VUNPCKLPSZrmkz:
    return ProcessUNPCKPS(Mcasm::VPUNPCKLDQZrmkz);
  case Mcasm::UNPCKHPSrm:
    return ProcessUNPCKPS(Mcasm::PUNPCKHDQrm);
  case Mcasm::VUNPCKHPSrm:
    return ProcessUNPCKPS(Mcasm::VPUNPCKHDQrm);
  case Mcasm::VUNPCKHPSYrm:
    return ProcessUNPCKPS(Mcasm::VPUNPCKHDQYrm);
  case Mcasm::VUNPCKHPSZ128rm:
    return ProcessUNPCKPS(Mcasm::VPUNPCKHDQZ128rm);
  case Mcasm::VUNPCKHPSZ256rm:
    return ProcessUNPCKPS(Mcasm::VPUNPCKHDQZ256rm);
  case Mcasm::VUNPCKHPSZrm:
    return ProcessUNPCKPS(Mcasm::VPUNPCKHDQZrm);
  case Mcasm::VUNPCKHPSZ128rmk:
    return ProcessUNPCKPS(Mcasm::VPUNPCKHDQZ128rmk);
  case Mcasm::VUNPCKHPSZ256rmk:
    return ProcessUNPCKPS(Mcasm::VPUNPCKHDQZ256rmk);
  case Mcasm::VUNPCKHPSZrmk:
    return ProcessUNPCKPS(Mcasm::VPUNPCKHDQZrmk);
  case Mcasm::VUNPCKHPSZ128rmkz:
    return ProcessUNPCKPS(Mcasm::VPUNPCKHDQZ128rmkz);
  case Mcasm::VUNPCKHPSZ256rmkz:
    return ProcessUNPCKPS(Mcasm::VPUNPCKHDQZ256rmkz);
  case Mcasm::VUNPCKHPSZrmkz:
    return ProcessUNPCKPS(Mcasm::VPUNPCKHDQZrmkz);

  case Mcasm::PSLLWri:
    return ProcessShiftLeftToAdd(Mcasm::PADDWrr);
  case Mcasm::VPSLLWri:
    return ProcessShiftLeftToAdd(Mcasm::VPADDWrr);
  case Mcasm::VPSLLWYri:
    return ProcessShiftLeftToAdd(Mcasm::VPADDWYrr);
  case Mcasm::VPSLLWZ128ri:
    return ProcessShiftLeftToAdd(Mcasm::VPADDWZ128rr);
  case Mcasm::VPSLLWZ256ri:
    return ProcessShiftLeftToAdd(Mcasm::VPADDWZ256rr);
  case Mcasm::VPSLLWZri:
    return ProcessShiftLeftToAdd(Mcasm::VPADDWZrr);
  case Mcasm::PSLLDri:
    return ProcessShiftLeftToAdd(Mcasm::PADDDrr);
  case Mcasm::VPSLLDri:
    return ProcessShiftLeftToAdd(Mcasm::VPADDDrr);
  case Mcasm::VPSLLDYri:
    return ProcessShiftLeftToAdd(Mcasm::VPADDDYrr);
  case Mcasm::VPSLLDZ128ri:
    return ProcessShiftLeftToAdd(Mcasm::VPADDDZ128rr);
  case Mcasm::VPSLLDZ256ri:
    return ProcessShiftLeftToAdd(Mcasm::VPADDDZ256rr);
  case Mcasm::VPSLLDZri:
    return ProcessShiftLeftToAdd(Mcasm::VPADDDZrr);
  case Mcasm::PSLLQri:
    return ProcessShiftLeftToAdd(Mcasm::PADDQrr);
  case Mcasm::VPSLLQri:
    return ProcessShiftLeftToAdd(Mcasm::VPADDQrr);
  case Mcasm::VPSLLQYri:
    return ProcessShiftLeftToAdd(Mcasm::VPADDQYrr);
  case Mcasm::VPSLLQZ128ri:
    return ProcessShiftLeftToAdd(Mcasm::VPADDQZ128rr);
  case Mcasm::VPSLLQZ256ri:
    return ProcessShiftLeftToAdd(Mcasm::VPADDQZ256rr);
  case Mcasm::VPSLLQZri:
    return ProcessShiftLeftToAdd(Mcasm::VPADDQZrr);

  default:
    return false;
  }
}

bool McasmFixupInstTuningImpl::runOnMachineFunction(MachineFunction &MF) {
  LLVM_DEBUG(dbgs() << "Start McasmFixupInstTuning\n";);
  bool Changed = false;
  ST = &MF.getSubtarget<McasmSubtarget>();
  TII = ST->getInstrInfo();
  SM = &ST->getSchedModel();

  for (MachineBasicBlock &MBB : MF) {
    for (MachineBasicBlock::iterator I = MBB.begin(); I != MBB.end(); ++I) {
      if (processInstruction(MF, MBB, I)) {
        ++NumInstChanges;
        Changed = true;
      }
    }
  }
  LLVM_DEBUG(dbgs() << "End McasmFixupInstTuning\n";);
  return Changed;
}

bool McasmFixupInstTuningLegacy::runOnMachineFunction(MachineFunction &MF) {
  McasmFixupInstTuningImpl Impl;
  return Impl.runOnMachineFunction(MF);
}

PreservedAnalyses
McasmFixupInstTuningPass::run(MachineFunction &MF,
                            MachineFunctionAnalysisManager &MFAM) {
  McasmFixupInstTuningImpl Impl;
  return Impl.runOnMachineFunction(MF)
             ? getMachineFunctionPassPreservedAnalyses()
                   .preserveSet<CFGAnalyses>()
             : PreservedAnalyses::all();
}
