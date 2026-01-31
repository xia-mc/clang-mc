add_llvm_component_group(Mcasm HAS_JIT)

set(LLVM_TARGET_DEFINITIONS Mcasm.td)

tablegen(LLVM McasmGenAsmMatcher.inc -gen-asm-matcher)
tablegen(LLVM McasmGenAsmWriter.inc -gen-asm-writer)
# MCASM NOTE: Intel syntax (AsmWriter1) not needed for mcasm
# tablegen(LLVM McasmGenAsmWriter1.inc -gen-asm-writer -asmwriternum=1)
tablegen(LLVM McasmGenCallingConv.inc -gen-callingconv)
tablegen(LLVM McasmGenDAGISel.inc -gen-dag-isel)
tablegen(LLVM McasmGenDisassemblerTables.inc -gen-disassembler)
tablegen(LLVM McasmGenInstrMapping.inc -gen-x86-instr-mapping)
tablegen(LLVM McasmGenExegesis.inc -gen-exegesis)
tablegen(LLVM McasmGenFastISel.inc -gen-fast-isel)
tablegen(LLVM McasmGenInstrInfo.inc -gen-instr-info
                                  -instr-info-expand-mi-operand-info=0)
tablegen(LLVM McasmGenRegisterInfo.inc -gen-register-info)
tablegen(LLVM McasmGenSubtargetInfo.inc -gen-subtarget)

add_public_tablegen_target(McasmCommonTableGen)

set(sources
  McasmArgumentStackSlotRebase.cpp
  McasmAsmPrinter.cpp
  McasmAvoidTrailingCall.cpp
  McasmCallFrameOptimization.cpp
  McasmCallingConv.cpp
  McasmCmovConversion.cpp
  McasmCodeGenPassBuilder.cpp
  McasmExpandPseudo.cpp
  McasmFastISel.cpp
  McasmFixupBWInsts.cpp
  McasmFixupLEAs.cpp
  McasmFixupInstTuning.cpp
  McasmFixupVectorConstants.cpp
  McasmAvoidStoreForwardingBlocks.cpp
  McasmDynAllocaExpander.cpp
  McasmFixupSetCC.cpp
  McasmFlagsCopyLowering.cpp
  McasmFrameLowering.cpp
  McasmISelDAGToDAG.cpp
  McasmISelLowering.cpp
  McasmISelLoweringCall.cpp
  McasmIndirectBranchTracking.cpp
  McasmIndirectThunks.cpp
  McasmInstrFoldTables.cpp
  McasmInstrInfo.cpp
  McasmLoadValueInjectionLoadHardening.cpp
  McasmLoadValueInjectionRetHardening.cpp
  McasmMCInstLower.cpp
  McasmMachineFunctionInfo.cpp
  McasmMacroFusion.cpp
  McasmOptimizeLEAs.cpp
  McasmPadShortFunction.cpp
  McasmRegisterInfo.cpp
  McasmReturnThunks.cpp
  McasmSelectionDAGInfo.cpp
  McasmSpeculativeLoadHardening.cpp
  McasmSpeculativeExecutionSideEffectSuppression.cpp
  McasmSubtarget.cpp
  McasmSuppressAPXForReloc.cpp
  McasmTargetMachine.cpp
  McasmTargetObjectFile.cpp
  McasmTargetTransformInfo.cpp
  McasmWinEHState.cpp
  McasmWinEHUnwindV2.cpp
  McasmInsertWait.cpp
  )

add_llvm_target(McasmCodeGen ${sources}
  LINK_COMPONENTS
  Analysis
  AsmPrinter
  CFGuard
  CodeGen
  CodeGenTypes
  Core
  GlobalISel
  IRPrinter
  Instrumentation
  MC
  ObjCARC
  ProfileData
  Scalar
  SelectionDAG
  Support
  Target
  TargetParser
  TransformUtils
  McasmDesc
  McasmInfo

  ADD_TO_COMPONENT
  Mcasm
  )

add_subdirectory(MCTargetDesc)
add_subdirectory(TargetInfo)
