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
#include "llvm/CodeGen/GlobalISel/CallLowering.h"
#include "llvm/CodeGen/GlobalISel/InstructionSelector.h"
#include "llvm/CodeGen/GlobalISel/LegalizerInfo.h"
#include "llvm/CodeGen/RegisterBankInfo.h"
#include "llvm/CodeGen/MachineScheduler.h"
#include "llvm/MC/MCSubtargetInfo.h"
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

// MCASM NOTE: Minimal target initialization - only register the 32-bit target
// Mcasm is 32-bit only, so we don't register the 64-bit target
extern "C" LLVM_C_ABI void LLVMInitializeMcasmTarget() {
  RegisterTargetMachine<McasmTargetMachine> X(getTheMcasm_32Target());
  // Note: getTheMcasm_64Target() exists for compatibility but is NOT registered
}

static std::unique_ptr<TargetLoweringObjectFile> createTLOF(const Triple &TT) {
  if (TT.isOSBinFormatCOFF())
    return std::make_unique<TargetLoweringObjectFileCOFF>();
  return std::make_unique<McasmELFTargetObjectFile>();
}

McasmTargetMachine::McasmTargetMachine(const Target &T, const Triple &TT,
                                       StringRef CPU, StringRef FS,
                                       const TargetOptions &Options,
                                       std::optional<Reloc::Model> RM,
                                       std::optional<CodeModel::Model> CM,
                                       CodeGenOptLevel OL, bool JIT)
    : CodeGenTargetMachineImpl(T, "e-p:32:32-i8:32-i16:32-i32:32-f32:32-a:0:32-n32",
                               TT, CPU, FS, Options,
                               RM.value_or(Reloc::Static),
                               CM.value_or(CodeModel::Small), OL),
      TLOF(createTLOF(getTargetTriple())), IsJIT(JIT) {
  initAsmInfo();
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
    : TargetPassConfig(TM, PM) {}

  McasmTargetMachine &getMcasmTargetMachine() const {
    return getTM<McasmTargetMachine>();
  }

  bool addInstSelector() override {
    // Add the instruction selector pass
    addPass(createMcasmISelDag(getMcasmTargetMachine(), getOptLevel()));
    return false;  // false means we handled it
  }
};
}

TargetPassConfig *McasmTargetMachine::createPassConfig(PassManagerBase &PM) {
  return new McasmPassConfig(*this, PM);
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
