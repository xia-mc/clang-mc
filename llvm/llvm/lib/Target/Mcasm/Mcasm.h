//===-- Mcasm.h - Top-level interface for Mcasm representation ------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file contains the entry points for global functions defined in the x86
// target library, as used by the LLVM JIT.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_Mcasm_Mcasm_H
#define LLVM_LIB_TARGET_Mcasm_Mcasm_H

#include "llvm/CodeGen/MachineFunctionAnalysisManager.h"
#include "llvm/IR/Analysis.h"
#include "llvm/IR/PassManager.h"
#include "llvm/PassInfo.h"
#include "llvm/Support/CodeGen.h"
#include "llvm/Target/TargetMachine.h"

namespace llvm {

class FunctionPass;
class InstructionSelector;
class PassRegistry;
class McasmRegisterBankInfo;
class McasmSubtarget;
class McasmTargetMachine;

/// This pass converts a legalized DAG into a Mcasm-specific DAG, ready for
/// instruction scheduling.
FunctionPass *createMcasmISelDag(McasmTargetMachine &TM, CodeGenOptLevel OptLevel);

/// This pass initializes a global base register for PIC on x86-32.
FunctionPass *createMcasmGlobalBaseRegPass();

/// This pass combines multiple accesses to local-dynamic TLS variables so that
/// the TLS base address for the module is only fetched once per execution path
/// through the function.
FunctionPass *createCleanupLocalDynamicTLSPass();

/// This function returns a pass which converts floating-point register
/// references and pseudo instructions into floating-point stack references and
/// physical instructions.
class McasmFPStackifierPass : public PassInfoMixin<McasmFPStackifierPass> {
public:
  PreservedAnalyses run(MachineFunction &MF,
                        MachineFunctionAnalysisManager &MFAM);
};

FunctionPass *createMcasmFPStackifierLegacyPass();

/// This pass inserts AVX vzeroupper instructions before each call to avoid
/// transition penalty between functions encoded with AVX and SSE.
FunctionPass *createMcasmIssueVZeroUpperPass();

/// This pass inserts ENDBR instructions before indirect jump/call
/// destinations as part of CET IBT mechanism.
FunctionPass *createMcasmIndirectBranchTrackingPass();

/// Return a pass that pads short functions with NOOPs.
/// This will prevent a stall when returning on the Atom.
FunctionPass *createMcasmPadShortFunctions();

/// Return a pass that selectively replaces certain instructions (like add,
/// sub, inc, dec, some shifts, and some multiplies) by equivalent LEA
/// instructions, in order to eliminate execution delays in some processors.
class McasmFixupLEAsPass : public PassInfoMixin<McasmFixupLEAsPass> {
public:
  PreservedAnalyses run(MachineFunction &MF,
                        MachineFunctionAnalysisManager &MFAM);
};

FunctionPass *createMcasmFixupLEAsLegacyPass();

/// Return a pass that replaces equivalent slower instructions with faster
/// ones.
class McasmFixupInstTuningPass : public PassInfoMixin<McasmFixupInstTuningPass> {
public:
  PreservedAnalyses run(MachineFunction &MF,
                        MachineFunctionAnalysisManager &MFAM);
};

FunctionPass *createMcasmFixupInstTuningLegacyPass();

/// Return a pass that reduces the size of vector constant pool loads.
class McasmFixupVectorConstantsPass
    : public PassInfoMixin<McasmFixupInstTuningPass> {
public:
  PreservedAnalyses run(MachineFunction &MF,
                        MachineFunctionAnalysisManager &MFAM);
};

FunctionPass *createMcasmFixupVectorConstantsLegacyPass();

/// Return a pass that removes redundant LEA instructions and redundant address
/// recalculations.
class McasmOptimizeLEAsPass : public PassInfoMixin<McasmOptimizeLEAsPass> {
public:
  PreservedAnalyses run(MachineFunction &MF,
                        MachineFunctionAnalysisManager &MFAM);
};

FunctionPass *createMcasmOptimizeLEAsLegacyPass();

/// Return a pass that transforms setcc + movzx pairs into xor + setcc.
class McasmFixupSetCCPass : public PassInfoMixin<McasmFixupSetCCPass> {
public:
  PreservedAnalyses run(MachineFunction &MF,
                        MachineFunctionAnalysisManager &MFAM);
};

FunctionPass *createMcasmFixupSetCCLegacyPass();

/// Return a pass that avoids creating store forward block issues in the
/// hardware.
class McasmAvoidStoreForwardingBlocksPass
    : public PassInfoMixin<McasmAvoidStoreForwardingBlocksPass> {
public:
  PreservedAnalyses run(MachineFunction &MF,
                        MachineFunctionAnalysisManager &MFAM);
};

FunctionPass *createMcasmAvoidStoreForwardingBlocksLegacyPass();

/// Return a pass that lowers EFLAGS copy pseudo instructions.
class McasmFlagsCopyLoweringPass
    : public PassInfoMixin<McasmFlagsCopyLoweringPass> {
public:
  PreservedAnalyses run(MachineFunction &MF,
                        MachineFunctionAnalysisManager &MFAM);
};

FunctionPass *createMcasmFlagsCopyLoweringLegacyPass();

/// Return a pass that expands DynAlloca pseudo-instructions.
class McasmDynAllocaExpanderPass
    : public PassInfoMixin<McasmDynAllocaExpanderPass> {
public:
  PreservedAnalyses run(MachineFunction &MF,
                        MachineFunctionAnalysisManager &MFAM);
};

FunctionPass *createMcasmDynAllocaExpanderLegacyPass();

/// Return a pass that config the tile registers.
class McasmTileConfigPass : public PassInfoMixin<McasmTileConfigPass> {
public:
  PreservedAnalyses run(MachineFunction &MF,
                        MachineFunctionAnalysisManager &MFAM);
};

FunctionPass *createMcasmTileConfigLegacyPass();

/// Return a pass that preconfig the tile registers before fast reg allocation.
class McasmFastPreTileConfigPass
    : public PassInfoMixin<McasmFastPreTileConfigPass> {
public:
  PreservedAnalyses run(MachineFunction &MF,
                        MachineFunctionAnalysisManager &MFAM);
};

FunctionPass *createMcasmFastPreTileConfigLegacyPass();

/// Return a pass that config the tile registers after fast reg allocation.
class McasmFastTileConfigPass : public PassInfoMixin<McasmFastTileConfigPass> {
public:
  PreservedAnalyses run(MachineFunction &MF,
                        MachineFunctionAnalysisManager &MFAM);
};

FunctionPass *createMcasmFastTileConfigLegacyPass();

/// Return a pass that insert pseudo tile config instruction.
class McasmPreTileConfigPass : public PassInfoMixin<McasmPreTileConfigPass> {
public:
  PreservedAnalyses run(MachineFunction &MF,
                        MachineFunctionAnalysisManager &MFAM);
};

FunctionPass *createMcasmPreTileConfigLegacyPass();

/// Return a pass that lower the tile copy instruction.
class McasmLowerTileCopyPass : public PassInfoMixin<McasmLowerTileCopyPass> {
public:
  PreservedAnalyses run(MachineFunction &MF,
                        MachineFunctionAnalysisManager &MFAM);
};

FunctionPass *createMcasmLowerTileCopyLegacyPass();

/// Return a pass that inserts int3 at the end of the function if it ends with a
/// CALL instruction. The pass does the same for each funclet as well. This
/// ensures that the open interval of function start and end PCs contains all
/// return addresses for the benefit of the Windows x64 unwinder.
class McasmAvoidTrailingCallPass
    : public PassInfoMixin<McasmAvoidTrailingCallPass> {
public:
  PreservedAnalyses run(MachineFunction &MF,
                        MachineFunctionAnalysisManager &MFAM);
  static bool isRequired() { return true; }
};

FunctionPass *createMcasmAvoidTrailingCallLegacyPass();

/// Return a pass that optimizes the code-size of x86 call sequences. This is
/// done by replacing esp-relative movs with pushes.
class McasmCallFrameOptimizationPass
    : public PassInfoMixin<McasmCallFrameOptimizationPass> {
public:
  PreservedAnalyses run(MachineFunction &MF,
                        MachineFunctionAnalysisManager &MFAM);
};

FunctionPass *createMcasmCallFrameOptimizationLegacyPass();

/// Return an IR pass that inserts EH registration stack objects and explicit
/// EH state updates. This pass must run after EH preparation, which does
/// Windows-specific but architecture-neutral preparation.
FunctionPass *createMcasmWinEHStatePass();

/// Return a Machine IR pass that expands Mcasm-specific pseudo
/// instructions into a sequence of actual instructions. This pass
/// must run after prologue/epilogue insertion and before lowering
/// the MachineInstr to MC.
class McasmExpandPseudoPass : public PassInfoMixin<McasmExpandPseudoPass> {
public:
  PreservedAnalyses run(MachineFunction &MF,
                        MachineFunctionAnalysisManager &MFAM);
};

FunctionPass *createMcasmExpandPseudoLegacyPass();

/// This pass converts Mcasm cmov instructions into branch when profitable.
class McasmCmovConversionPass : public PassInfoMixin<McasmCmovConversionPass> {
public:
  PreservedAnalyses run(MachineFunction &MF,
                        MachineFunctionAnalysisManager &MFAM);
};

FunctionPass *createMcasmCmovConversionLegacyPass();

/// Return a Machine IR pass that selectively replaces
/// certain byte and word instructions by equivalent 32 bit instructions,
/// in order to eliminate partial register usage, false dependences on
/// the upper portions of registers, and to save code size.
class McasmFixupBWInstsPass : public PassInfoMixin<McasmFixupBWInstsPass> {
public:
  PreservedAnalyses run(MachineFunction &MF,
                        MachineFunctionAnalysisManager &MFAM);
};

FunctionPass *createMcasmFixupBWInstsLegacyPass();

/// Return a Machine IR pass that reassigns instruction chains from one domain
/// to another, when profitable.
class McasmDomainReassignmentPass
    : public PassInfoMixin<McasmDomainReassignmentPass> {
public:
  PreservedAnalyses run(MachineFunction &MF,
                        MachineFunctionAnalysisManager &MFAM);
};

FunctionPass *createMcasmDomainReassignmentLegacyPass();

/// This pass compress instructions from EVEX space to legacy/VEX/EVEX space when
/// possible in order to reduce code size or facilitate HW decoding.
class McasmCompressEVEXPass : public PassInfoMixin<McasmCompressEVEXPass> {
public:
  PreservedAnalyses run(MachineFunction &MF,
                        MachineFunctionAnalysisManager &MFAM);
};

FunctionPass *createMcasmCompressEVEXLegacyPass();

/// This pass creates the thunks for the retpoline feature.
FunctionPass *createMcasmIndirectThunksPass();

/// This pass replaces ret instructions with jmp's to __x86_return thunk.
class McasmReturnThunksPass : public PassInfoMixin<McasmReturnThunksPass> {
public:
  PreservedAnalyses run(MachineFunction &MF,
                        MachineFunctionAnalysisManager &MFAM);
};

FunctionPass *createMcasmReturnThunksLegacyPass();

/// This pass insert wait instruction after X87 instructions which could raise
/// fp exceptions when strict-fp enabled.
FunctionPass *createMcasmInsertX87waitPass();

/// This pass optimizes arithmetic based on knowledge that is only used by
/// a reduction sequence and is therefore safe to reassociate in interesting
/// ways.
class McasmPartialReductionPass : public PassInfoMixin<McasmPartialReductionPass> {
private:
  const McasmTargetMachine *TM;

public:
  McasmPartialReductionPass(const McasmTargetMachine *TM) : TM(TM) {}
  PreservedAnalyses run(Function &F, FunctionAnalysisManager &FAM);
};

FunctionPass *createMcasmPartialReductionLegacyPass();

/// // Analyzes and emits pseudos to support Win x64 Unwind V2.
FunctionPass *createMcasmWinEHUnwindV2Pass();

/// The pass transforms load/store <256 x i32> to AMX load/store intrinsics
/// or split the data to two <128 x i32>.
class McasmLowerAMXTypePass : public PassInfoMixin<McasmLowerAMXTypePass> {
private:
  const TargetMachine *TM;

public:
  McasmLowerAMXTypePass(const TargetMachine *TM) : TM(TM) {}
  PreservedAnalyses run(Function &F, FunctionAnalysisManager &FAM);
  static bool isRequired() { return true; }
};

FunctionPass *createMcasmLowerAMXTypeLegacyPass();

// Suppresses APX features for relocations for supporting older linkers.
class McasmSuppressAPXForRelocationPass
    : public PassInfoMixin<McasmSuppressAPXForRelocationPass> {
public:
  PreservedAnalyses run(MachineFunction &MF,
                        MachineFunctionAnalysisManager &MFAM);
};

FunctionPass *createMcasmSuppressAPXForRelocationLegacyPass();

/// The pass transforms amx intrinsics to scalar operation if the function has
/// optnone attribute or it is O0.
class McasmLowerAMXIntrinsicsPass
    : public PassInfoMixin<McasmLowerAMXIntrinsicsPass> {
private:
  const TargetMachine *TM;

public:
  McasmLowerAMXIntrinsicsPass(const TargetMachine *TM) : TM(TM) {}
  PreservedAnalyses run(Function &F, FunctionAnalysisManager &FAM);
  static bool isRequired() { return true; }
};

FunctionPass *createMcasmLowerAMXIntrinsicsLegacyPass();

InstructionSelector *createMcasmInstructionSelector(const McasmTargetMachine &TM,
                                                  const McasmSubtarget &,
                                                  const McasmRegisterBankInfo &);

FunctionPass *createMcasmPreLegalizerCombiner();
FunctionPass *createMcasmLoadValueInjectionLoadHardeningPass();

class McasmLoadValueInjectionRetHardeningPass
    : public PassInfoMixin<McasmLoadValueInjectionRetHardeningPass> {
public:
  PreservedAnalyses run(MachineFunction &MF,
                        MachineFunctionAnalysisManager &MFAM);
};

FunctionPass *createMcasmLoadValueInjectionRetHardeningLegacyPass();

class McasmSpeculativeExecutionSideEffectSuppressionPass
    : public PassInfoMixin<McasmSpeculativeExecutionSideEffectSuppressionPass> {
public:
  PreservedAnalyses run(MachineFunction &MF,
                        MachineFunctionAnalysisManager &MFAM);
};

FunctionPass *createMcasmSpeculativeExecutionSideEffectSuppressionLegacyPass();

class McasmSpeculativeLoadHardeningPass
    : public PassInfoMixin<McasmSpeculativeLoadHardeningPass> {
public:
  PreservedAnalyses run(MachineFunction &MF,
                        MachineFunctionAnalysisManager &MFAM);
};

FunctionPass *createMcasmSpeculativeLoadHardeningLegacyPass();

class McasmArgumentStackSlotPass
    : public PassInfoMixin<McasmArgumentStackSlotPass> {
public:
  PreservedAnalyses run(MachineFunction &MF,
                        MachineFunctionAnalysisManager &MFAM);
};

FunctionPass *createMcasmArgumentStackSlotLegacyPass();

void initializeCompressEVEXLegacyPass(PassRegistry &);
void initializeMcasmFixupBWInstLegacyPass(PassRegistry &);
void initializeFixupLEAsLegacyPass(PassRegistry &);
void initializeMcasmArgumentStackSlotLegacyPass(PassRegistry &);
void initializeMcasmAsmPrinterPass(PassRegistry &);
void initializeMcasmFixupInstTuningLegacyPass(PassRegistry &);
void initializeMcasmFixupVectorConstantsLegacyPass(PassRegistry &);
void initializeWinEHStatePassPass(PassRegistry &);
void initializeMcasmAvoidSFBLegacyPass(PassRegistry &);
void initializeMcasmAvoidTrailingCallLegacyPassPass(PassRegistry &);
void initializeMcasmCallFrameOptimizationLegacyPass(PassRegistry &);
void initializeMcasmCmovConversionLegacyPass(PassRegistry &);
void initializeMcasmDAGToDAGISelLegacyPass(PassRegistry &);
void initializeMcasmDomainReassignmentLegacyPass(PassRegistry &);
void initializeMcasmDynAllocaExpanderLegacyPass(PassRegistry &);
void initializeMcasmExecutionDomainFixPass(PassRegistry &);
void initializeMcasmExpandPseudoLegacyPass(PassRegistry &);
void initializeMcasmFPStackifierLegacyPass(PassRegistry &);
void initializeMcasmFastPreTileConfigLegacyPass(PassRegistry &);
void initializeMcasmFastTileConfigLegacyPass(PassRegistry &);
void initializeMcasmFixupSetCCLegacyPass(PassRegistry &);
void initializeMcasmFlagsCopyLoweringLegacyPass(PassRegistry &);
void initializeMcasmLoadValueInjectionLoadHardeningPassPass(PassRegistry &);
void initializeMcasmLoadValueInjectionRetHardeningLegacyPass(PassRegistry &);
void initializeMcasmLowerAMXIntrinsicsLegacyPassPass(PassRegistry &);
void initializeMcasmLowerAMXTypeLegacyPassPass(PassRegistry &);
void initializeMcasmLowerTileCopyLegacyPass(PassRegistry &);
void initializeMcasmOptimizeLEAsLegacyPass(PassRegistry &);
void initializeMcasmPartialReductionLegacyPass(PassRegistry &);
void initializeMcasmPreTileConfigLegacyPass(PassRegistry &);
void initializeMcasmReturnThunksLegacyPass(PassRegistry &);
void initializeMcasmSpeculativeExecutionSideEffectSuppressionLegacyPass(
    PassRegistry &);
void initializeMcasmSpeculativeLoadHardeningLegacyPass(PassRegistry &);
void initializeMcasmSuppressAPXForRelocationLegacyPass(PassRegistry &);
void initializeMcasmTileConfigLegacyPass(PassRegistry &);
void initializeMcasmWinEHUnwindV2Pass(PassRegistry &);
void initializeMcasmPreLegalizerCombinerPass(PassRegistry &);

namespace McasmAS {
enum : unsigned {
  GS = 256,
  FS = 257,
  SS = 258,
  PTR32_SPTR = 270,
  PTR32_UPTR = 271,
  PTR64 = 272
};
} // End McasmAS namespace

} // End llvm namespace

#endif
