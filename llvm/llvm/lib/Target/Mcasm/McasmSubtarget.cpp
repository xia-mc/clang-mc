//===-- McasmSubtarget.cpp - Mcasm Subtarget Information ------------------===//
//
// MCASM NOTE: Minimal implementation for mcasm backend.
// Most X86-specific features have been removed.
//
//===----------------------------------------------------------------------===//

#include "McasmSubtarget.h"
#include "Mcasm.h"
#include "McasmTargetMachine.h"
#include "MCTargetDesc/McasmBaseInfo.h"
#include "llvm/CodeGen/GlobalISel/CallLowering.h"
#include "llvm/CodeGen/GlobalISel/InstructionSelector.h"
#include "llvm/CodeGen/ScheduleDAGMutation.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/TargetParser/Triple.h"

using namespace llvm;

#define DEBUG_TYPE "subtarget"

#define GET_SUBTARGETINFO_TARGET_DESC
#define GET_SUBTARGETINFO_CTOR
#include "McasmGenSubtargetInfo.inc"

static cl::opt<bool>
McasmEarlyIfConv("mcasm-early-ifcvt", cl::Hidden,
               cl::desc("Enable early if-conversion on Mcasm"));

// Classify a blockaddress reference
unsigned char McasmSubtarget::classifyBlockAddressReference() const {
  return classifyLocalReference(nullptr);
}

// Classify a global variable reference
unsigned char
McasmSubtarget::classifyGlobalReference(const GlobalValue *GV) const {
  return classifyGlobalReference(GV, *GV->getParent());
}

unsigned char
McasmSubtarget::classifyLocalReference(const GlobalValue *GV) const {
  // MCASM NOTE: Simplified - always use direct references
  if (!isPositionIndependent())
    return McasmII::MO_NO_FLAG;
  
  // For PIC, use GOT
  if (isTargetELF())
    return McasmII::MO_GOTOFF;
  
  return McasmII::MO_NO_FLAG;
}

unsigned char
McasmSubtarget::classifyGlobalReference(const GlobalValue *GV, const Module &M) const {
  // MCASM NOTE: Simplified classification
  if (TM.shouldAssumeDSOLocal(GV))
    return classifyLocalReference(GV);
  
  // Non-local references use GOT
  return McasmII::MO_GOTPCREL;
}

unsigned char McasmSubtarget::classifyGlobalFunctionReference(
    const GlobalValue *GV, const Module &M) const {
  return classifyGlobalReference(GV, M);
}

unsigned char McasmSubtarget::classifyGlobalFunctionReference(
    const GlobalValue *GV) const {
  return classifyGlobalReference(GV);
}

bool McasmSubtarget::isLegalToCallImmediateAddr() const {
  // MCASM NOTE: mcasm is 32-bit, always allow immediate addresses
  return true;
}

void McasmSubtarget::initSubtargetFeatures(StringRef CPU, StringRef TuneCPU,
                                          StringRef FS) {
  fprintf(stderr, "DEBUG: McasmSubtarget::initSubtargetFeatures called\n");
  fprintf(stderr, "DEBUG:   CPU = %s, TuneCPU = %s, FS = %s\n",
          CPU.str().c_str(), TuneCPU.str().c_str(), FS.str().c_str());
  fflush(stderr);

  // MCASM NOTE: Simplified feature initialization
  std::string CPUName = std::string(CPU);
  if (CPUName.empty())
    CPUName = "generic";

  fprintf(stderr, "DEBUG:   CPUName = %s\n", CPUName.c_str());
  fflush(stderr);

  std::string TuneCPUName = std::string(TuneCPU);
  if (TuneCPUName.empty())
    TuneCPUName = CPUName;

  fprintf(stderr, "DEBUG:   TuneCPUName = %s\n", TuneCPUName.c_str());
  fprintf(stderr, "DEBUG:   About to call ParseSubtargetFeatures...\n");
  fflush(stderr);

  ParseSubtargetFeatures(CPUName, TuneCPUName, FS);

  fprintf(stderr, "DEBUG:   ParseSubtargetFeatures completed\n");
  fflush(stderr);
}

McasmSubtarget &McasmSubtarget::initializeSubtargetDependencies(StringRef CPU,
                                                            StringRef TuneCPU,
                                                            StringRef FS) {
  initSubtargetFeatures(CPU, TuneCPU, FS);
  return *this;
}

McasmSubtarget::McasmSubtarget(const Triple &TT, StringRef CPU, StringRef TuneCPU,
                           StringRef FS, const McasmTargetMachine &TM,
                           MaybeAlign StackAlignOverride,
                           unsigned, unsigned)  // Ignore vector width params
    : McasmGenSubtargetInfo(TT, CPU, TuneCPU, FS),
      PICStyle(PICStyles::Style::None), TM(TM), TargetTriple(TT),
      StackAlignOverride(StackAlignOverride),
      InstrInfo(initializeSubtargetDependencies(CPU, TuneCPU, FS)),
      TLInfo(TM, *this), FrameLowering(*this) {

  fprintf(stderr, "DEBUG: McasmSubtarget constructor called\n");
  fprintf(stderr, "DEBUG:   TT = %s\n", TT.str().c_str());
  fprintf(stderr, "DEBUG:   CPU = %s\n", CPU.str().c_str());
  fprintf(stderr, "DEBUG:   TuneCPU = %s\n", TuneCPU.str().c_str());
  fprintf(stderr, "DEBUG:   FS = %s\n", FS.str().c_str());
  fflush(stderr);

  // CRITICAL FIX: TableGen generates incorrect default values for mode flags
  // Force correct values for mcasm (32-bit only)
  In64BitMode = false;  // mcasm is 32-bit only, NEVER 64-bit
  In32BitMode = true;   // mcasm is always 32-bit
  In16BitMode = false;  // mcasm is not 16-bit

  fprintf(stderr, "DEBUG:   In64BitMode = %d, In32BitMode = %d, In16BitMode = %d\n",
          In64BitMode, In32BitMode, In16BitMode);
  fflush(stderr);

  // Determine the PICStyle based on the target selected
  if (!isPositionIndependent())
    setPICStyle(PICStyles::Style::None);
  else if (In64BitMode)  // Use In64BitMode instead of is64Bit()
    setPICStyle(PICStyles::Style::RIPRel);
  else if (isTargetCOFF())
    setPICStyle(PICStyles::Style::None);
  else if (isTargetDarwin())
    setPICStyle(PICStyles::Style::StubPIC);
  else if (isTargetELF())
    setPICStyle(PICStyles::Style::GOT);

  fprintf(stderr, "DEBUG: McasmSubtarget constructor completed successfully\n");
  fprintf(stderr, "DEBUG:   TLInfo = %p\n", (void*)&TLInfo);
  fprintf(stderr, "DEBUG:   InstrInfo = %p\n", (void*)&InstrInfo);
  fprintf(stderr, "DEBUG:   FrameLowering = %p\n", (void*)&FrameLowering);
  fflush(stderr);
}

McasmSubtarget::~McasmSubtarget() = default;

const CallLowering *McasmSubtarget::getCallLowering() const {
  return nullptr;  // GlobalISel not supported
}

InstructionSelector *McasmSubtarget::getInstructionSelector() const {
  return nullptr;  // GlobalISel not supported
}

const LegalizerInfo *McasmSubtarget::getLegalizerInfo() const {
  return nullptr;  // GlobalISel not supported
}

const RegisterBankInfo *McasmSubtarget::getRegBankInfo() const {
  return nullptr;  // GlobalISel not supported
}

bool McasmSubtarget::enableEarlyIfConversion() const {
  return hasCMOV() && McasmEarlyIfConv;
}

void McasmSubtarget::getPostRAMutations(
    std::vector<std::unique_ptr<ScheduleDAGMutation>> &Mutations) const {
  // MCASM NOTE: No macro fusion for mcasm
}

bool McasmSubtarget::isPositionIndependent() const {
  return TM.isPositionIndependent();
}
