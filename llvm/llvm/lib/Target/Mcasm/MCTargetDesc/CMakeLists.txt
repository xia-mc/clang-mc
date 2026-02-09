add_llvm_component_library(LLVMMcasmDesc
  McasmInstPrinter.cpp
  McasmAsmBackend.cpp
  McasmMCTargetDesc.cpp
  McasmMCAsmInfo.cpp
  McasmMCCodeEmitter.cpp
  McasmFilteredStream.cpp
  McasmMnemonicTables.cpp

  LINK_COMPONENTS
  BinaryFormat
  MC
  Support
  McasmInfo

  ADD_TO_COMPONENT
  Mcasm
  )
