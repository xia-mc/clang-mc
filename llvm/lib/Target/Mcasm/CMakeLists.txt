add_llvm_component_group(Mcasm HAS_JIT)

set(LLVM_TARGET_DEFINITIONS Mcasm.td)

tablegen(LLVM McasmGenAsmMatcher.inc -gen-asm-matcher)
tablegen(LLVM McasmGenAsmWriter.inc -gen-asm-writer)
# MCASM NOTE: Intel syntax (AsmWriter1) not needed for mcasm
# tablegen(LLVM McasmGenAsmWriter1.inc -gen-asm-writer -asmwriternum=1)
tablegen(LLVM McasmGenMnemonicTables.inc -gen-x86-mnemonic-tables)
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
  # Core backend implementation
  McasmTargetObjectFile.cpp
  McasmTargetMachine.cpp
  McasmSubtarget.cpp
  McasmRegisterInfo.cpp
  McasmFrameLowering.cpp
  McasmISelLowering.cpp
  McasmInstrInfo.cpp
  McasmSelectionDAGInfo.cpp
  McasmMCInstLower.cpp
  McasmAsmPrinter.cpp
  )

add_llvm_target(McasmCodeGen ${sources}
  PARTIAL_SOURCES_INTENDED
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
