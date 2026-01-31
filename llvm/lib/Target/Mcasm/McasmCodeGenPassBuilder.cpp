//===-- McasmCodeGenPassBuilder.cpp ---------------------------------*- C++ -*-=//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
/// \file
/// This file contains Mcasm CodeGen pipeline builder.
/// TODO: Port CodeGen passes to new pass manager.
//===----------------------------------------------------------------------===//

#include "Mcasm.h"
#include "McasmISelDAGToDAG.h"
#include "McasmTargetMachine.h"

#include "llvm/CodeGen/AtomicExpand.h"
#include "llvm/CodeGen/EarlyIfConversion.h"
#include "llvm/CodeGen/IndirectBrExpand.h"
#include "llvm/CodeGen/InterleavedAccess.h"
#include "llvm/CodeGen/JMCInstrumenter.h"
#include "llvm/MC/MCStreamer.h"
#include "llvm/Passes/CodeGenPassBuilder.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Support/CodeGen.h"
#include "llvm/Transforms/CFGuard.h"

using namespace llvm;

extern cl::opt<bool> McasmEnableMachineCombinerPass;

namespace {

class McasmCodeGenPassBuilder
    : public CodeGenPassBuilder<McasmCodeGenPassBuilder, McasmTargetMachine> {
  using Base = CodeGenPassBuilder<McasmCodeGenPassBuilder, McasmTargetMachine>;

public:
  explicit McasmCodeGenPassBuilder(McasmTargetMachine &TM,
                                 const CGPassBuilderOption &Opts,
                                 PassInstrumentationCallbacks *PIC)
      : CodeGenPassBuilder(TM, Opts, PIC) {}

  void addIRPasses(PassManagerWrapper &PMW) const;
  void addPreISel(PassManagerWrapper &PMW) const;
  Error addInstSelector(PassManagerWrapper &PMW) const;
  void addILPOpts(PassManagerWrapper &PMW) const;
  void addMachineSSAOptimization(PassManagerWrapper &PMW) const;
  void addPreRegAlloc(PassManagerWrapper &PMW) const;
  // TODO(boomanaiden154): We need to add addPostFastRegAllocRewrite here once
  // it is available to support AMX.
  void addPostRegAlloc(PassManagerWrapper &PMW) const;
  void addPreSched2(PassManagerWrapper &PMW) const;
  void addPreEmitPass(PassManagerWrapper &PMW) const;
  void addPreEmitPass2(PassManagerWrapper &PMW) const;
  // TODO(boomanaiden154): We need to add addRegAssignAndRewriteOptimized here
  // once it is available to support AMX.
  void addAsmPrinter(PassManagerWrapper &PMW, CreateMCStreamer) const;
};

void McasmCodeGenPassBuilder::addIRPasses(PassManagerWrapper &PMW) const {
  addFunctionPass(AtomicExpandPass(TM), PMW);

  // We add both pass anyway and when these two passes run, one will be a
  // no-op based on the optimization level/attributes.
  addFunctionPass(McasmLowerAMXIntrinsicsPass(&TM), PMW);
  addFunctionPass(McasmLowerAMXTypePass(&TM), PMW);

  Base::addIRPasses(PMW);

  if (getOptLevel() != CodeGenOptLevel::None) {
    addFunctionPass(InterleavedAccessPass(TM), PMW);
    addFunctionPass(McasmPartialReductionPass(&TM), PMW);
  }

  // Add passes that handle indirect branch removal and insertion of a retpoline
  // thunk. These will be a no-op unless a function subtarget has the retpoline
  // feature enabled.
  addFunctionPass(IndirectBrExpandPass(TM), PMW);

  // Add Control Flow Guard checks.
  const Triple &TT = TM.getTargetTriple();
  if (TT.isOSWindows())
    addFunctionPass(CFGuardPass(TT.isMcasm_64() ? CFGuardPass::Mechanism::Dispatch
                                              : CFGuardPass::Mechanism::Check),
                    PMW);

  if (TM.Options.JMCInstrument) {
    flushFPMsToMPM(PMW);
    addModulePass(JMCInstrumenterPass(), PMW);
  }
}

void McasmCodeGenPassBuilder::addPreISel(PassManagerWrapper &PMW) const {
  // Only add this pass for 32-bit x86 Windows.
  const Triple &TT = TM.getTargetTriple();
  if (TT.isOSWindows() && TT.isMcasm_32()) {
    // TODO(boomanaiden154): Add McasmWinEHStatePass here once it has been ported.
  }
}

Error McasmCodeGenPassBuilder::addInstSelector(PassManagerWrapper &PMW) const {
  addMachineFunctionPass(McasmISelDAGToDAGPass(TM), PMW);

  // For ELF, cleanup any local-dynamic TLS accesses
  if (TM.getTargetTriple().isOSBinFormatELF() &&
      getOptLevel() != CodeGenOptLevel::None) {
    // TODO(boomanaiden154): Add CleanupLocalDynamicTLSPass here once it has
    // been ported.
  }

  // TODO(boomanaiden154): Add McasmGlobalPassRegPass here once it has been
  // ported.
  addMachineFunctionPass(McasmArgumentStackSlotPass(), PMW);
  return Error::success();
}

void McasmCodeGenPassBuilder::addILPOpts(PassManagerWrapper &PMW) const {
  addMachineFunctionPass(EarlyIfConverterPass(), PMW);
  if (McasmEnableMachineCombinerPass) {
    // TODO(boomanaiden154): Add the MachineCombinerPass here once it has been
    // ported to the new pass manager.
  }
  addMachineFunctionPass(McasmCmovConversionPass(), PMW);
}

void McasmCodeGenPassBuilder::addMachineSSAOptimization(
    PassManagerWrapper &PMW) const {
  // TODO(boomanaiden154): Add McasmDomainReassignmentPass here once it has been
  // ported.
  Base::addMachineSSAOptimization(PMW);
}

void McasmCodeGenPassBuilder::addPreRegAlloc(PassManagerWrapper &PMW) const {
  if (getOptLevel() != CodeGenOptLevel::None) {
    addMachineFunctionPass(LiveRangeShrinkPass(), PMW);
    addMachineFunctionPass(McasmFixupSetCCPass(), PMW);
    addMachineFunctionPass(McasmCallFrameOptimizationPass(), PMW);
    addMachineFunctionPass(McasmAvoidStoreForwardingBlocksPass(), PMW);
  }

  addMachineFunctionPass(McasmSuppressAPXForRelocationPass(), PMW);
  addMachineFunctionPass(McasmSpeculativeLoadHardeningPass(), PMW);
  addMachineFunctionPass(McasmFlagsCopyLoweringPass(), PMW);
  addMachineFunctionPass(McasmDynAllocaExpanderPass(), PMW);

  if (getOptLevel() != CodeGenOptLevel::None)
    addMachineFunctionPass(McasmPreTileConfigPass(), PMW);
  else
    addMachineFunctionPass(McasmFastPreTileConfigPass(), PMW);
}

void McasmCodeGenPassBuilder::addPostRegAlloc(PassManagerWrapper &PMW) const {
  addMachineFunctionPass(McasmLowerTileCopyPass(), PMW);
  addMachineFunctionPass(McasmFPStackifierPass(), PMW);
  // When -O0 is enabled, the Load Value Injection Hardening pass will fall back
  // to using the Speculative Execution Side Effect Suppression pass for
  // mitigation. This is to prevent slow downs due to
  // analyses needed by the LVIHardening pass when compiling at -O0.
  if (getOptLevel() != CodeGenOptLevel::None) {
    addMachineFunctionPass(McasmLoadValueInjectionRetHardeningPass(), PMW);
  }
}

void McasmCodeGenPassBuilder::addPreSched2(PassManagerWrapper &PMW) const {
  addMachineFunctionPass(McasmExpandPseudoPass(), PMW);
  // TODO(boomanaiden154): Add KCFGPass here once it has been ported.
}

void McasmCodeGenPassBuilder::addPreEmitPass(PassManagerWrapper &PMW) const {
  if (getOptLevel() != CodeGenOptLevel::None) {
    // TODO(boomanaiden154): Add McasmExecutionDomainFixPass here once it has
    // been ported.
    addMachineFunctionPass(BreakFalseDepsPass(), PMW);
  }

  // TODO(boomanaiden154): Add McasmIndirectBranchTrackingPass here once it has
  // been ported.
  // TODO(boomanaiden154): Add McasmIssueVZeroUpperPass here once it has been
  // ported.

  if (getOptLevel() != CodeGenOptLevel::None) {
    addMachineFunctionPass(McasmFixupBWInstsPass(), PMW);
    // TODO(boomanaiden154): Add McasmPadShortFunctionsPass here once it has been
    // ported.
    addMachineFunctionPass(McasmFixupLEAsPass(), PMW);
    addMachineFunctionPass(McasmFixupInstTuningPass(), PMW);
    addMachineFunctionPass(McasmFixupVectorConstantsPass(), PMW);
  }
  addMachineFunctionPass(McasmCompressEVEXPass(), PMW);
  // TODO(boomanaiden154): Add InsertMcasmWaitPass here once it has been ported.
}

void McasmCodeGenPassBuilder::addPreEmitPass2(PassManagerWrapper &PMW) const {
  const Triple &TT = TM.getTargetTriple();
  const MCAsmInfo *MAI = TM.getMCAsmInfo();

  // The Mcasm Speculative Execution Pass must run after all control
  // flow graph modifying passes. As a result it was listed to run right before
  // the Mcasm Retpoline Thunks pass. The reason it must run after control flow
  // graph modifications is that the model of LFENCE in LLVM has to be updated
  // (FIXME: https://bugs.llvm.org/show_bug.cgi?id=45167). Currently the
  // placement of this pass was hand checked to ensure that the subsequent
  // passes don't move the code around the LFENCEs in a way that will hurt the
  // correctness of this pass. This placement has been shown to work based on
  // hand inspection of the codegen output.
  addMachineFunctionPass(McasmSpeculativeExecutionSideEffectSuppressionPass(),
                         PMW);
  // TODO(boomanaiden154): Add McasmIndirectThunksPass here
  // once it has been ported.
  addMachineFunctionPass(McasmReturnThunksPass(), PMW);

  // Insert extra int3 instructions after trailing call instructions to avoid
  // issues in the unwinder.
  if (TT.isOSWindows() && TT.isMcasm_64())
    addMachineFunctionPass(McasmAvoidTrailingCallPass(), PMW);

  // Verify basic block incoming and outgoing cfa offset and register values and
  // correct CFA calculation rule where needed by inserting appropriate CFI
  // instructions.
  if (!TT.isOSDarwin() &&
      (!TT.isOSWindows() ||
       MAI->getExceptionHandlingType() == ExceptionHandling::DwarfCFI)) {
    // TODO(boomanaiden154): Add CFInstrInserterPass here when it has been
    // ported.
  }

  if (TT.isOSWindows()) {
    // Identify valid longjmp targets for Windows Control Flow Guard.
    // TODO(boomanaiden154): Add CFGuardLongjmpPass here when it has been
    // ported.
    // Identify valid eh continuation targets for Windows EHCont Guard.
    // TODO(boomanaiden154): Add EHContGuardTargetsPass when it has been
    // ported.
  }

  // TODO(boomanaiden154): Add McasmLoadValueInjectionRetHardeningPass here once
  // it has been ported.

  // Insert pseudo probe annotation for callsite profiling
  // TODO(boomanaiden154): Add PseudoProberInserterPass here once it has been
  // ported.

  // KCFI indirect call checks are lowered to a bundle, and on Darwin platforms,
  // also CALL_RVMARKER.
  // TODO(boomanaiden154): Add UnpackMachineBundlesPass here once it has been
  // ported.

  // Analyzes and emits pseudos to support Win x64 Unwind V2. This pass must run
  // after all real instructions have been added to the epilog.
  if (TT.isOSWindows() && TT.isMcasm_64()) {
    // TODO(boomanaiden154): Add McasmWinEHUnwindV2Pass here once it has been
    // ported.
  }
}

void McasmCodeGenPassBuilder::addAsmPrinter(PassManagerWrapper &PMW,
                                          CreateMCStreamer) const {
  // TODO: Add AsmPrinter.
}

} // namespace

void McasmTargetMachine::registerPassBuilderCallbacks(PassBuilder &PB) {
#define GET_PASS_REGISTRY "McasmPassRegistry.def"
#include "llvm/Passes/TargetPassRegistry.inc"
}

Error McasmTargetMachine::buildCodeGenPipeline(
    ModulePassManager &MPM, raw_pwrite_stream &Out, raw_pwrite_stream *DwoOut,
    CodeGenFileType FileType, const CGPassBuilderOption &Opt,
    PassInstrumentationCallbacks *PIC) {
  auto CGPB = McasmCodeGenPassBuilder(*this, Opt, PIC);
  return CGPB.buildPipeline(MPM, Out, DwoOut, FileType);
}
