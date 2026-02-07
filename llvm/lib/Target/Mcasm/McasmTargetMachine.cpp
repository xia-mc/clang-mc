//===-- McasmTargetMachine.cpp - Minimal Mcasm TargetMachine with stubs ---===//
//
// MCASM NOTE: This is a minimal stub implementation with necessary stubs
// to satisfy linker requirements without compiling problematic X86 files.
//
//===----------------------------------------------------------------------===//

#include "McasmTargetMachine.h"
#include "MCTargetDesc/McasmMCTargetDesc.h"
#include "TargetInfo/McasmTargetInfo.h"
#include "Mcasm.h"
#include "McasmSubtarget.h"
#include "McasmISelDAGToDAG.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Support/Error.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/CodeGen/GlobalISel/CallLowering.h"
#include "llvm/CodeGen/GlobalISel/InstructionSelector.h"
#include "llvm/CodeGen/GlobalISel/LegalizerInfo.h"
#include "llvm/CodeGen/RegisterBankInfo.h"
#include "llvm/CodeGen/MachineScheduler.h"
#include "llvm/MC/MCSubtargetInfo.h"
#include "llvm/MC/MCStreamer.h"
#include "llvm/MC/MCAsmInfo.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/MC/MCRegisterInfo.h"
#include "McasmTargetObjectFile.h"
#include "llvm/CodeGen/TargetPassConfig.h"
#include "llvm/MC/TargetRegistry.h"
#include "llvm/Pass.h"
#include "llvm/Support/CodeGen.h"
#include "llvm/Target/TargetLoweringObjectFile.h"
#include "llvm/Target/TargetOptions.h"
#include "llvm/Analysis/TargetTransformInfo.h"
#include "llvm/CodeGen/BasicTTIImpl.h"
#include <optional>

using namespace llvm;

namespace {
// Minimal TTI implementation for Mcasm
class McasmTTIImpl : public BasicTTIImplBase<McasmTTIImpl> {
  using BaseT = BasicTTIImplBase<McasmTTIImpl>;
  friend BaseT;

  const McasmSubtarget *ST;
  const McasmTargetLowering *TLI;

  const McasmSubtarget *getST() const { return ST; }
  const McasmTargetLowering *getTLI() const { return TLI; }

public:
  explicit McasmTTIImpl(const McasmTargetMachine *TM, const Function &F)
      : BaseT(TM, F.getDataLayout()), ST(TM->getSubtargetImpl(F)),
        TLI(ST->getTargetLowering()) {}
};
} // end anonymous namespace

// MCASM NOTE: Minimal target initialization - only 32-bit target
extern "C" LLVM_C_ABI void LLVMInitializeMcasmTarget() {
  llvm::errs() << "DEBUG: LLVMInitializeMcasmTarget called\n";
  RegisterTargetMachine<McasmTargetMachine> X(getTheMcasm_32Target());
  llvm::errs() << "DEBUG: RegisterTargetMachine completed\n";
}

static void debugLog(const char *msg) {
  llvm::errs() << "DEBUG: " << msg << "\n";
  llvm::errs().flush();
}

static std::unique_ptr<TargetLoweringObjectFile> createTLOF(const Triple &TT) {
  debugLog("createTLOF called");
  if (TT.isOSBinFormatCOFF()) {
    debugLog("Creating COFF TLOF");
    return std::make_unique<TargetLoweringObjectFileCOFF>();
  }
  debugLog("Creating ELF TLOF");
  return std::make_unique<McasmELFTargetObjectFile>();
}

McasmTargetMachine::McasmTargetMachine(const Target &T, const Triple &TT,
                                       StringRef CPU, StringRef FS,
                                       const TargetOptions &Options,
                                       std::optional<Reloc::Model> RM,
                                       std::optional<CodeModel::Model> CM,
                                       CodeGenOptLevel OL, bool JIT)
    : CodeGenTargetMachineImpl(([&]() { debugLog("Before base class constructor"); return T; })(),
                               "e-p:32:32-i8:32-i16:32-i32:32-f32:32-a:0:32-n32",
                               TT, CPU, FS, Options,
                               RM.value_or(Reloc::Static),
                               CM.value_or(CodeModel::Small), OL),
      TLOF(createTLOF(getTargetTriple())), IsJIT(JIT) {
  debugLog("McasmTargetMachine constructor body entered");
  debugLog("About to call initAsmInfo()");
  initAsmInfo();
  debugLog("initAsmInfo() completed");
}

McasmTargetMachine::~McasmTargetMachine() = default;

// Get or create subtarget for the given function
const McasmSubtarget *McasmTargetMachine::getSubtargetImpl(const Function &F) const {
  Attribute CPUAttr = F.getFnAttribute("target-cpu");
  Attribute TuneAttr = F.getFnAttribute("tune-cpu");
  Attribute FSAttr = F.getFnAttribute("target-features");

  StringRef CPU =
      CPUAttr.isValid() ? CPUAttr.getValueAsString() : (StringRef)getTargetCPU();
  StringRef TuneCPU = TuneAttr.isValid() ? TuneAttr.getValueAsString() : (StringRef)CPU;
  StringRef FS =
      FSAttr.isValid() ? FSAttr.getValueAsString() : (StringRef)getTargetFeatureString();

  SmallString<512> Key;
  Key.reserve(CPU.size() + TuneCPU.size() + FS.size());
  Key += CPU;
  Key += TuneCPU;
  Key += FS;

  auto &I = SubtargetMap[Key];
  if (!I) {
    I = std::make_unique<McasmSubtarget>(TargetTriple, CPU, TuneCPU, FS, *this,
                                         MaybeAlign(), 0, 0);
  }
  return I.get();
}

void McasmTargetMachine::reset() {
  // Stub
}

TargetTransformInfo McasmTargetMachine::getTargetTransformInfo(const Function &F) const {
  return TargetTransformInfo(std::make_unique<McasmTTIImpl>(this, F));
}

MachineFunctionInfo *McasmTargetMachine::createMachineFunctionInfo(
    BumpPtrAllocator &, const Function &, const TargetSubtargetInfo *) const {
  return nullptr;
}

yaml::MachineFunctionInfo *McasmTargetMachine::createDefaultFuncInfoYAML() const {
  return nullptr;
}

yaml::MachineFunctionInfo *McasmTargetMachine::convertFuncInfoToYAML(
    const MachineFunction &) const {
  return nullptr;
}

bool McasmTargetMachine::parseMachineFunctionInfo(
    const yaml::MachineFunctionInfo &, PerFunctionMIParsingState &,
    SMDiagnostic &, SMRange &) const {
  return false;
}

bool McasmTargetMachine::isNoopAddrSpaceCast(unsigned, unsigned) const {
  return false;
}

ScheduleDAGInstrs *McasmTargetMachine::createMachineScheduler(
    MachineSchedContext *) const {
  return nullptr;
}

ScheduleDAGInstrs *McasmTargetMachine::createPostMachineScheduler(
    MachineSchedContext *) const {
  return nullptr;
}

namespace {
class McasmPassConfig : public TargetPassConfig {
public:
  McasmPassConfig(McasmTargetMachine &TM, PassManagerBase &PM)
    : TargetPassConfig(TM, PM) {
    fprintf(stderr, "DEBUG: McasmPassConfig constructor\n");
    fflush(stderr);
  }

  McasmTargetMachine &getMcasmTargetMachine() const {
    return getTM<McasmTargetMachine>();
  }

  bool addInstSelector() override {
    fprintf(stderr, "DEBUG: McasmPassConfig::addInstSelector called\n");
    fflush(stderr);
    // Add the instruction selector pass
    addPass(createMcasmISelDag(getMcasmTargetMachine(), getOptLevel()));
    fprintf(stderr, "DEBUG: McasmPassConfig::addInstSelector completed\n");
    fflush(stderr);
    return false;  // false means we handled it
  }

  void addIRPasses() override {
    fprintf(stderr, "DEBUG: McasmPassConfig::addIRPasses called\n");
    fflush(stderr);
    TargetPassConfig::addIRPasses();
    fprintf(stderr, "DEBUG: McasmPassConfig::addIRPasses completed\n");
    fflush(stderr);
  }

  bool addIRTranslator() override {
    fprintf(stderr, "DEBUG: McasmPassConfig::addIRTranslator called\n");
    fflush(stderr);
    return TargetPassConfig::addIRTranslator();
  }

  void addCodeGenPrepare() override {
    fprintf(stderr, "DEBUG: McasmPassConfig::addCodeGenPrepare called\n");
    fflush(stderr);
    TargetPassConfig::addCodeGenPrepare();
    fprintf(stderr, "DEBUG: McasmPassConfig::addCodeGenPrepare completed\n");
    fflush(stderr);
  }

  bool addLegalizeMachineIR() override {
    fprintf(stderr, "DEBUG: McasmPassConfig::addLegalizeMachineIR called\n");
    fflush(stderr);
    return TargetPassConfig::addLegalizeMachineIR();
  }

  bool addRegBankSelect() override {
    fprintf(stderr, "DEBUG: McasmPassConfig::addRegBankSelect called\n");
    fflush(stderr);
    return TargetPassConfig::addRegBankSelect();
  }

  bool addGlobalInstructionSelect() override {
    fprintf(stderr, "DEBUG: McasmPassConfig::addGlobalInstructionSelect called\n");
    fflush(stderr);
    return TargetPassConfig::addGlobalInstructionSelect();
  }

  void addMachineSSAOptimization() override {
    fprintf(stderr, "DEBUG: McasmPassConfig::addMachineSSAOptimization called\n");
    fflush(stderr);
    TargetPassConfig::addMachineSSAOptimization();
    fprintf(stderr, "DEBUG: McasmPassConfig::addMachineSSAOptimization completed\n");
    fflush(stderr);
  }

  void addPreRegAlloc() override {
    fprintf(stderr, "DEBUG: McasmPassConfig::addPreRegAlloc called\n");
    fflush(stderr);
    TargetPassConfig::addPreRegAlloc();
    fprintf(stderr, "DEBUG: McasmPassConfig::addPreRegAlloc completed\n");
    fflush(stderr);
  }

  void addPostRegAlloc() override {
    fprintf(stderr, "DEBUG: McasmPassConfig::addPostRegAlloc called\n");
    fflush(stderr);
    TargetPassConfig::addPostRegAlloc();
    fprintf(stderr, "DEBUG: McasmPassConfig::addPostRegAlloc completed\n");
    fflush(stderr);
  }

  void addPreSched2() override {
    fprintf(stderr, "DEBUG: McasmPassConfig::addPreSched2 called\n");
    fflush(stderr);
    TargetPassConfig::addPreSched2();
    fprintf(stderr, "DEBUG: McasmPassConfig::addPreSched2 completed\n");
    fflush(stderr);
  }

  void addPreEmitPass() override {
    fprintf(stderr, "DEBUG: McasmPassConfig::addPreEmitPass called\n");
    fflush(stderr);
    TargetPassConfig::addPreEmitPass();
    fprintf(stderr, "DEBUG: McasmPassConfig::addPreEmitPass completed\n");
    fflush(stderr);
  }
};
}

TargetPassConfig *McasmTargetMachine::createPassConfig(PassManagerBase &PM) {
  fprintf(stderr, "DEBUG: McasmTargetMachine::createPassConfig called\n");
  fflush(stderr);
  auto *PC = new McasmPassConfig(*this, PM);
  fprintf(stderr, "DEBUG: McasmTargetMachine::createPassConfig completed, PC=%p\n", (void*)PC);
  fflush(stderr);
  return PC;
}

bool McasmTargetMachine::addPassesToEmitFile(
    PassManagerBase &PM, raw_pwrite_stream &Out, raw_pwrite_stream *DwoOut,
    CodeGenFileType FileType, bool DisableVerify,
    MachineModuleInfoWrapperPass *MMIWP) {
  fprintf(stderr, "DEBUG: McasmTargetMachine::addPassesToEmitFile called\n");
  fflush(stderr);
  fprintf(stderr, "DEBUG:   FileType=%d, DisableVerify=%d, MMIWP=%p\n",
          (int)FileType, (int)DisableVerify, (void*)MMIWP);
  fflush(stderr);

  fprintf(stderr, "DEBUG: About to call base class addPassesToEmitFile\n");
  fflush(stderr);
  bool Result = CodeGenTargetMachineImpl::addPassesToEmitFile(
      PM, Out, DwoOut, FileType, DisableVerify, MMIWP);
  fprintf(stderr, "DEBUG: Base class addPassesToEmitFile returned %d\n", (int)Result);
  fflush(stderr);

  return Result;
}

bool McasmTargetMachine::addAsmPrinter(PassManagerBase &PM,
                                       raw_pwrite_stream &Out,
                                       raw_pwrite_stream *DwoOut,
                                       CodeGenFileType FileType,
                                       MCContext &Context) {
  fprintf(stderr, "DEBUG: McasmTargetMachine::addAsmPrinter called\n");
  fflush(stderr);
  fprintf(stderr, "DEBUG:   FileType=%d, DwoOut=%p, Context=%p\n",
          (int)FileType, (void*)DwoOut, (void*)&Context);
  fflush(stderr);

  fprintf(stderr, "DEBUG: About to call base class addAsmPrinter\n");
  fflush(stderr);
  bool Result = CodeGenTargetMachineImpl::addAsmPrinter(PM, Out, DwoOut, FileType, Context);
  fprintf(stderr, "DEBUG: Base class addAsmPrinter returned %d\n", (int)Result);
  fflush(stderr);

  return Result;
}

Expected<std::unique_ptr<MCStreamer>>
McasmTargetMachine::createMCStreamer(raw_pwrite_stream &Out,
                                     raw_pwrite_stream *DwoOut,
                                     CodeGenFileType FileType,
                                     MCContext &Context) {
  fprintf(stderr, "DEBUG: McasmTargetMachine::createMCStreamer called\n");
  fflush(stderr);
  fprintf(stderr, "DEBUG:   FileType=%d\n", (int)FileType);
  fflush(stderr);

  fprintf(stderr, "DEBUG: Checking MC components\n");
  fflush(stderr);
  fprintf(stderr, "DEBUG: Step 1 - about to call getMCSubtargetInfo()\n");
  fflush(stderr);
  const MCSubtargetInfo *STIPtr = getMCSubtargetInfo();
  fprintf(stderr, "DEBUG:   getMCSubtargetInfo() = %p\n", (void*)STIPtr);
  fflush(stderr);

  fprintf(stderr, "DEBUG: Step 2 - about to call getMCAsmInfo()\n");
  fflush(stderr);
  const MCAsmInfo *MAIPtr = getMCAsmInfo();
  fprintf(stderr, "DEBUG:   getMCAsmInfo() = %p\n", (void*)MAIPtr);
  fflush(stderr);

  fprintf(stderr, "DEBUG: Step 3 - about to call getMCRegisterInfo()\n");
  fflush(stderr);
  const MCRegisterInfo *MRIPtr = getMCRegisterInfo();
  fprintf(stderr, "DEBUG:   getMCRegisterInfo() = %p\n", (void*)MRIPtr);
  fflush(stderr);

  fprintf(stderr, "DEBUG: Step 4 - about to call getMCInstrInfo()\n");
  fflush(stderr);
  const MCInstrInfo *MIIPtr = getMCInstrInfo();
  fprintf(stderr, "DEBUG:   getMCInstrInfo() = %p\n", (void*)MIIPtr);
  fflush(stderr);

  fprintf(stderr, "DEBUG: About to call base class createMCStreamer\n");
  fflush(stderr);
  auto Result = CodeGenTargetMachineImpl::createMCStreamer(Out, DwoOut, FileType, Context);
  fprintf(stderr, "DEBUG: Base class createMCStreamer returned\n");
  fflush(stderr);

  return Result;
}

// Stubs for new Pass Manager functions
void McasmTargetMachine::registerPassBuilderCallbacks(PassBuilder &) {
  // Stub
}

Error McasmTargetMachine::buildCodeGenPipeline(
    PassManager<Module, AnalysisManager<Module>> &,
    raw_pwrite_stream &,
    raw_pwrite_stream *,
    CodeGenFileType,
    const CGPassBuilderOption &,
    PassInstrumentationCallbacks *) {
  return Error::success();
}
