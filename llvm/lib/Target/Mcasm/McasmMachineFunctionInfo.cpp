//===-- McasmMachineFunctionInfo.cpp - Mcasm machine function info ------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "McasmMachineFunctionInfo.h"
#include "McasmRegisterInfo.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/CodeGen/TargetSubtargetInfo.h"

using namespace llvm;

yaml::McasmMachineFunctionInfo::McasmMachineFunctionInfo(
    const llvm::McasmMachineFunctionInfo &MFI)
    : AMXProgModel(MFI.getAMXProgModel()) {}

void yaml::McasmMachineFunctionInfo::mappingImpl(yaml::IO &YamlIO) {
  MappingTraits<McasmMachineFunctionInfo>::mapping(YamlIO, *this);
}

MachineFunctionInfo *McasmMachineFunctionInfo::clone(
    BumpPtrAllocator &Allocator, MachineFunction &DestMF,
    const DenseMap<MachineBasicBlock *, MachineBasicBlock *> &Src2DstMBB)
    const {
  return DestMF.cloneInfo<McasmMachineFunctionInfo>(*this);
}

void McasmMachineFunctionInfo::initializeBaseYamlFields(
    const yaml::McasmMachineFunctionInfo &YamlMFI) {
  AMXProgModel = YamlMFI.AMXProgModel;
}

void McasmMachineFunctionInfo::anchor() { }

void McasmMachineFunctionInfo::setRestoreBasePointer(const MachineFunction *MF) {
  if (!RestoreBasePointerOffset) {
    // Mcasm: slot size is always 4 bytes
    unsigned SlotSize = 4;
    for (const MCPhysReg *CSR = MF->getRegInfo().getCalleeSavedRegs();
         unsigned Reg = *CSR; ++CSR) {
      // Mcasm only has 32-bit registers
      if (Mcasm::GR32RegClass.contains(Reg))
        RestoreBasePointerOffset -= SlotSize;
    }
  }
}

