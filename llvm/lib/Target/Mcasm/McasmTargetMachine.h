//===-- McasmTargetMachine.h - Define TargetMachine for the Mcasm ---*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file declares the Mcasm specific subclass of TargetMachine.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_Mcasm_McasmTARGETMACHINE_H
#define LLVM_LIB_TARGET_Mcasm_McasmTARGETMACHINE_H

#include "McasmSubtarget.h"
#include "llvm/ADT/StringMap.h"
#include "llvm/CodeGen/CodeGenTargetMachineImpl.h"
#include "llvm/Support/CodeGen.h"
#include <memory>
#include <optional>

namespace llvm {

class StringRef;
class TargetTransformInfo;

class McasmTargetMachine final : public CodeGenTargetMachineImpl {
  std::unique_ptr<TargetLoweringObjectFile> TLOF;
  mutable StringMap<std::unique_ptr<McasmSubtarget>> SubtargetMap;
  // True if this is used in JIT.
  bool IsJIT;

  /// Reset internal state.
  void reset() override;

public:
  McasmTargetMachine(const Target &T, const Triple &TT, StringRef CPU,
                   StringRef FS, const TargetOptions &Options,
                   std::optional<Reloc::Model> RM,
                   std::optional<CodeModel::Model> CM, CodeGenOptLevel OL,
                   bool JIT);
  ~McasmTargetMachine() override;

  const McasmSubtarget *getSubtargetImpl(const Function &F) const override;
  // DO NOT IMPLEMENT: There is no such thing as a valid default subtarget,
  // subtargets are per-function entities based on the target-specific
  // attributes of each function.
  const McasmSubtarget *getSubtargetImpl() const = delete;

  TargetTransformInfo getTargetTransformInfo(const Function &F) const override;

  // Set up the pass pipeline.
  TargetPassConfig *createPassConfig(PassManagerBase &PM) override;

  TargetLoweringObjectFile *getObjFileLowering() const override {
    return TLOF.get();
  }

  MachineFunctionInfo *
  createMachineFunctionInfo(BumpPtrAllocator &Allocator, const Function &F,
                            const TargetSubtargetInfo *STI) const override;

  yaml::MachineFunctionInfo *createDefaultFuncInfoYAML() const override;
  yaml::MachineFunctionInfo *
  convertFuncInfoToYAML(const MachineFunction &MF) const override;
  bool parseMachineFunctionInfo(const yaml::MachineFunctionInfo &,
                                PerFunctionMIParsingState &PFS,
                                SMDiagnostic &Error,
                                SMRange &SourceRange) const override;

  void registerPassBuilderCallbacks(PassBuilder &PB) override;

  Error buildCodeGenPipeline(ModulePassManager &, raw_pwrite_stream &,
                             raw_pwrite_stream *, CodeGenFileType,
                             const CGPassBuilderOption &,
                             PassInstrumentationCallbacks *) override;

  bool isJIT() const { return IsJIT; }

  bool isNoopAddrSpaceCast(unsigned SrcAS, unsigned DestAS) const override;
  ScheduleDAGInstrs *
  createMachineScheduler(MachineSchedContext *C) const override;
  ScheduleDAGInstrs *
  createPostMachineScheduler(MachineSchedContext *C) const override;
};

} // end namespace llvm

#endif // LLVM_LIB_TARGET_Mcasm_McasmTARGETMACHINE_H
