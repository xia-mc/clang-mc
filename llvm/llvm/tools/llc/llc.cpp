//===-- llc.cpp - Implement the LLVM Native Code Generator ----------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This is the llc code generator driver. It provides a convenient
// command-line interface for generating an assembly file or a relocatable file,
// given LLVM bitcode.
//
//===----------------------------------------------------------------------===//

#include "NewPMDriver.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/ADT/ScopeExit.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Analysis/RuntimeLibcallInfo.h"
#include "llvm/Analysis/TargetLibraryInfo.h"
#include "llvm/CodeGen/CommandFlags.h"
#include "llvm/CodeGen/LinkAllAsmWriterComponents.h"
#include "llvm/CodeGen/LinkAllCodegenComponents.h"
#include "llvm/CodeGen/MIRParser/MIRParser.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineModuleInfo.h"
#include "llvm/CodeGen/TargetPassConfig.h"
#include "llvm/CodeGen/TargetSubtargetInfo.h"
#include "llvm/IR/AutoUpgrade.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/DiagnosticInfo.h"
#include "llvm/IR/DiagnosticPrinter.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/LLVMRemarkStreamer.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/InitializePasses.h"
#include "llvm/MC/MCTargetOptionsCommandFlags.h"
#include "llvm/MC/TargetRegistry.h"
#include "llvm/Pass.h"
#include "llvm/Plugins/PassPlugin.h"
#include "llvm/Remarks/HotnessThresholdParser.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/FormattedStream.h"
#include "llvm/Support/InitLLVM.h"
#include "llvm/Support/PGOOptions.h"
#include "llvm/Support/Path.h"
#include "llvm/Support/PluginLoader.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/TimeProfiler.h"
#include "llvm/Support/ToolOutputFile.h"
#include "llvm/Support/WithColor.h"
#include "llvm/Target/TargetLoweringObjectFile.h"
#include "llvm/Target/TargetMachine.h"
#include "llvm/TargetParser/Host.h"
#include "llvm/TargetParser/SubtargetFeature.h"
#include "llvm/TargetParser/Triple.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include <cassert>
#include <memory>
#include <optional>
using namespace llvm;

static codegen::RegisterCodeGenFlags CGF;
static codegen::RegisterSaveStatsFlag SSF;

// General options for llc.  Other pass-specific options are specified
// within the corresponding llc passes, and target-specific options
// and back-end code generation options are specified with the target machine.
//
static cl::opt<std::string>
    InputFilename(cl::Positional, cl::desc("<input bitcode>"), cl::init("-"));

static cl::list<std::string>
    InstPrinterOptions("M", cl::desc("InstPrinter options"));

static cl::opt<std::string>
    InputLanguage("x", cl::desc("Input language ('ir' or 'mir')"));

static cl::opt<std::string> OutputFilename("o", cl::desc("Output filename"),
                                           cl::value_desc("filename"));

static cl::opt<std::string>
    SplitDwarfOutputFile("split-dwarf-output", cl::desc(".dwo output filename"),
                         cl::value_desc("filename"));

static cl::opt<unsigned>
    TimeCompilations("time-compilations", cl::Hidden, cl::init(1u),
                     cl::value_desc("N"),
                     cl::desc("Repeat compilation N times for timing"));

static cl::opt<bool> TimeTrace("time-trace", cl::desc("Record time trace"));

static cl::opt<unsigned> TimeTraceGranularity(
    "time-trace-granularity",
    cl::desc(
        "Minimum time granularity (in microseconds) traced by time profiler"),
    cl::init(500), cl::Hidden);

static cl::opt<std::string>
    TimeTraceFile("time-trace-file",
                  cl::desc("Specify time trace file destination"),
                  cl::value_desc("filename"));

static cl::opt<std::string>
    BinutilsVersion("binutils-version", cl::Hidden,
                    cl::desc("Produced object files can use all ELF features "
                             "supported by this binutils version and newer."
                             "If -no-integrated-as is specified, the generated "
                             "assembly will consider GNU as support."
                             "'none' means that all ELF features can be used, "
                             "regardless of binutils support"));

static cl::opt<bool>
    PreserveComments("preserve-as-comments", cl::Hidden,
                     cl::desc("Preserve Comments in outputted assembly"),
                     cl::init(true));

// Determine optimization level.
static cl::opt<char>
    OptLevel("O",
             cl::desc("Optimization level. [-O0, -O1, -O2, or -O3] "
                      "(default = '-O2')"),
             cl::Prefix, cl::init('2'));

static cl::opt<std::string>
    TargetTriple("mtriple", cl::desc("Override target triple for module"));

static cl::opt<std::string> SplitDwarfFile(
    "split-dwarf-file",
    cl::desc(
        "Specify the name of the .dwo file to encode in the DWARF output"));

static cl::opt<bool> NoVerify("disable-verify", cl::Hidden,
                              cl::desc("Do not verify input module"));

static cl::opt<bool> VerifyEach("verify-each",
                                cl::desc("Verify after each transform"));

static cl::opt<bool>
    DisableSimplifyLibCalls("disable-simplify-libcalls",
                            cl::desc("Disable simplify-libcalls"));

static cl::opt<bool> ShowMCEncoding("show-mc-encoding", cl::Hidden,
                                    cl::desc("Show encoding in .s output"));

static cl::opt<unsigned>
    OutputAsmVariant("output-asm-variant",
                     cl::desc("Syntax variant to use for output printing"));

static cl::opt<bool>
    DwarfDirectory("dwarf-directory", cl::Hidden,
                   cl::desc("Use .file directives with an explicit directory"),
                   cl::init(true));

static cl::opt<bool> AsmVerbose("asm-verbose",
                                cl::desc("Add comments to directives."),
                                cl::init(true));

static cl::opt<bool>
    CompileTwice("compile-twice", cl::Hidden,
                 cl::desc("Run everything twice, re-using the same pass "
                          "manager and verify the result is the same."),
                 cl::init(false));

static cl::opt<bool> DiscardValueNames(
    "discard-value-names",
    cl::desc("Discard names from Value (other than GlobalValue)."),
    cl::init(false), cl::Hidden);

static cl::opt<bool>
    PrintMIR2VecVocab("print-mir2vec-vocab", cl::Hidden,
                      cl::desc("Print MIR2Vec vocabulary contents"),
                      cl::init(false));

static cl::opt<bool>
    PrintMIR2Vec("print-mir2vec", cl::Hidden,
                 cl::desc("Print MIR2Vec embeddings for functions"),
                 cl::init(false));

static cl::list<std::string> IncludeDirs("I", cl::desc("include search path"));

static cl::opt<bool> RemarksWithHotness(
    "pass-remarks-with-hotness",
    cl::desc("With PGO, include profile count in optimization remarks"),
    cl::Hidden);

static cl::opt<std::optional<uint64_t>, false, remarks::HotnessThresholdParser>
    RemarksHotnessThreshold(
        "pass-remarks-hotness-threshold",
        cl::desc("Minimum profile count required for "
                 "an optimization remark to be output. "
                 "Use 'auto' to apply the threshold from profile summary."),
        cl::value_desc("N or 'auto'"), cl::init(0), cl::Hidden);

static cl::opt<std::string>
    RemarksFilename("pass-remarks-output",
                    cl::desc("Output filename for pass remarks"),
                    cl::value_desc("filename"));

static cl::opt<std::string>
    RemarksPasses("pass-remarks-filter",
                  cl::desc("Only record optimization remarks from passes whose "
                           "names match the given regular expression"),
                  cl::value_desc("regex"));

static cl::opt<std::string> RemarksFormat(
    "pass-remarks-format",
    cl::desc("The format used for serializing remarks (default: YAML)"),
    cl::value_desc("format"), cl::init("yaml"));

static cl::list<std::string> PassPlugins("load-pass-plugin",
                                         cl::desc("Load plugin library"));

static cl::opt<bool> EnableNewPassManager(
    "enable-new-pm", cl::desc("Enable the new pass manager"), cl::init(false));

// This flag specifies a textual description of the optimization pass pipeline
// to run over the module. This flag switches opt to use the new pass manager
// infrastructure, completely disabling all of the flags specific to the old
// pass management.
static cl::opt<std::string> PassPipeline(
    "passes",
    cl::desc(
        "A textual description of the pass pipeline. To have analysis passes "
        "available before a certain pass, add 'require<foo-analysis>'."));
static cl::alias PassPipeline2("p", cl::aliasopt(PassPipeline),
                               cl::desc("Alias for -passes"));

static std::vector<std::string> &getRunPassNames() {
  static std::vector<std::string> RunPassNames;
  return RunPassNames;
}

namespace {
struct RunPassOption {
  void operator=(const std::string &Val) const {
    if (Val.empty())
      return;
    SmallVector<StringRef, 8> PassNames;
    StringRef(Val).split(PassNames, ',', -1, false);
    for (auto PassName : PassNames)
      getRunPassNames().push_back(std::string(PassName));
  }
};
} // namespace

static RunPassOption RunPassOpt;

static cl::opt<RunPassOption, true, cl::parser<std::string>> RunPass(
    "run-pass",
    cl::desc("Run compiler only for specified passes (comma separated list)"),
    cl::value_desc("pass-name"), cl::location(RunPassOpt));

// PGO command line options
enum PGOKind {
  NoPGO,
  SampleUse,
};

static cl::opt<PGOKind>
    PGOKindFlag("pgo-kind", cl::init(NoPGO), cl::Hidden,
                cl::desc("The kind of profile guided optimization"),
                cl::values(clEnumValN(NoPGO, "nopgo", "Do not use PGO."),
                           clEnumValN(SampleUse, "pgo-sample-use-pipeline",
                                      "Use sampled profile to guide PGO.")));

// Function to set PGO options on TargetMachine based on command line flags.
static void setPGOOptions(TargetMachine &TM) {
  std::optional<PGOOptions> PGOOpt;

  switch (PGOKindFlag) {
  case SampleUse:
    // Use default values for other PGOOptions parameters. This parameter
    // is used to test that PGO data is preserved at -O0.
    PGOOpt = PGOOptions("", "", "", "", PGOOptions::SampleUse,
                        PGOOptions::NoCSAction);
    break;
  case NoPGO:
    PGOOpt = std::nullopt;
    break;
  }

  if (PGOOpt)
    TM.setPGOOption(PGOOpt);
}

static int compileModule(char **argv, SmallVectorImpl<PassPlugin> &,
                         LLVMContext &Context, std::string &OutputFilename);

[[noreturn]] static void reportError(Twine Msg, StringRef Filename = "") {
  SmallString<256> Prefix;
  if (!Filename.empty()) {
    if (Filename == "-")
      Filename = "<stdin>";
    ("'" + Twine(Filename) + "': ").toStringRef(Prefix);
  }
  WithColor::error(errs(), "llc") << Prefix << Msg << "\n";
  exit(1);
}

[[noreturn]] static void reportError(Error Err, StringRef Filename) {
  assert(Err);
  handleAllErrors(createFileError(Filename, std::move(Err)),
                  [&](const ErrorInfoBase &EI) { reportError(EI.message()); });
  llvm_unreachable("reportError() should not return");
}

// Test: Use a simple callback function instead of lambda
static std::optional<std::string> SimpleSetDataLayout(StringRef DataLayoutTargetTriple,
                                                       StringRef OldDLStr) {
  fprintf(stderr, "DEBUG CALLBACK: SimpleSetDataLayout called\n");
  fflush(stderr);
  return std::string("e-p:32:32-i32:32-n32");
}

static std::unique_ptr<ToolOutputFile> GetOutputStream(Triple::OSType OS) {
  // If we don't yet have an output filename, make one.
  if (OutputFilename.empty()) {
    if (InputFilename == "-")
      OutputFilename = "-";
    else {
      // If InputFilename ends in .bc or .ll, remove it.
      StringRef IFN = InputFilename;
      if (IFN.ends_with(".bc") || IFN.ends_with(".ll"))
        OutputFilename = std::string(IFN.drop_back(3));
      else if (IFN.ends_with(".mir"))
        OutputFilename = std::string(IFN.drop_back(4));
      else
        OutputFilename = std::string(IFN);

      switch (codegen::getFileType()) {
      case CodeGenFileType::AssemblyFile:
        OutputFilename += ".s";
        break;
      case CodeGenFileType::ObjectFile:
        if (OS == Triple::Win32)
          OutputFilename += ".obj";
        else
          OutputFilename += ".o";
        break;
      case CodeGenFileType::Null:
        OutputFilename = "-";
        break;
      }
    }
  }

  // Decide if we need "binary" output.
  bool Binary = false;
  switch (codegen::getFileType()) {
  case CodeGenFileType::AssemblyFile:
    break;
  case CodeGenFileType::ObjectFile:
  case CodeGenFileType::Null:
    Binary = true;
    break;
  }

  // Open the file.
  std::error_code EC;
  sys::fs::OpenFlags OpenFlags = sys::fs::OF_None;
  if (!Binary)
    OpenFlags |= sys::fs::OF_TextWithCRLF;
  auto FDOut = std::make_unique<ToolOutputFile>(OutputFilename, EC, OpenFlags);
  if (EC)
    reportError(EC.message());
  return FDOut;
}

// main - Entry point for the llc compiler.
//
int main(int argc, char **argv) {
  InitLLVM X(argc, argv);

  // Enable debug stream buffering.
  EnableDebugBuffering = true;

  fprintf(stderr, "DEBUG LLC: About to initialize all targets\n");
  fflush(stderr);
  // Initialize targets first, so that --version shows registered targets.
  InitializeAllTargets();
  fprintf(stderr, "DEBUG LLC: InitializeAllTargets() completed\n");
  fflush(stderr);
  InitializeAllTargetMCs();
  fprintf(stderr, "DEBUG LLC: InitializeAllTargetMCs() completed\n");
  fflush(stderr);
  InitializeAllAsmPrinters();
  fprintf(stderr, "DEBUG LLC: InitializeAllAsmPrinters() completed\n");
  fflush(stderr);
  InitializeAllAsmParsers();
  fprintf(stderr, "DEBUG LLC: InitializeAllAsmParsers() completed\n");
  fflush(stderr);

  // Initialize codegen and IR passes used by llc so that the -print-after,
  // -print-before, and -stop-after options work.
  PassRegistry *Registry = PassRegistry::getPassRegistry();
  initializeCore(*Registry);
  initializeCodeGen(*Registry);
  initializeLoopStrengthReducePass(*Registry);
  initializePostInlineEntryExitInstrumenterPass(*Registry);
  initializeUnreachableBlockElimLegacyPassPass(*Registry);
  initializeConstantHoistingLegacyPassPass(*Registry);
  initializeScalarOpts(*Registry);
  initializeVectorization(*Registry);
  initializeScalarizeMaskedMemIntrinLegacyPassPass(*Registry);
  initializeTransformUtils(*Registry);

  // Initialize debugging passes.
  initializeScavengerTestPass(*Registry);

  SmallVector<PassPlugin, 1> PluginList;
  PassPlugins.setCallback([&](const std::string &PluginPath) {
    auto Plugin = PassPlugin::Load(PluginPath);
    if (!Plugin)
      reportFatalUsageError(Plugin.takeError());
    PluginList.emplace_back(Plugin.get());
  });

  // Register the Target and CPU printer for --version.
  cl::AddExtraVersionPrinter(sys::printDefaultTargetAndDetectedCPU);
  // Register the target printer for --version.
  cl::AddExtraVersionPrinter(TargetRegistry::printRegisteredTargetsForVersion);

  fprintf(stderr, "DEBUG LLC: About to parse command line options\n");
  fflush(stderr);

  cl::ParseCommandLineOptions(argc, argv, "llvm system compiler\n");

  fprintf(stderr, "DEBUG LLC: Command line options parsed successfully\n");
  fflush(stderr);

  if (!PassPipeline.empty() && !getRunPassNames().empty()) {
    errs() << "The `llc -run-pass=...` syntax for the new pass manager is "
              "not supported, please use `llc -passes=<pipeline>` (or the `-p` "
              "alias for a more concise version).\n";
    return 1;
  }

  if (TimeTrace)
    timeTraceProfilerInitialize(TimeTraceGranularity, argv[0]);
  llvm::scope_exit TimeTraceScopeExit([]() {
    if (TimeTrace) {
      if (auto E = timeTraceProfilerWrite(TimeTraceFile, OutputFilename)) {
        handleAllErrors(std::move(E), [&](const StringError &SE) {
          errs() << SE.getMessage() << "\n";
        });
        return;
      }
      timeTraceProfilerCleanup();
    }
  });

  LLVMContext Context;
  Context.setDiscardValueNames(DiscardValueNames);

  // Set a diagnostic handler that doesn't exit on the first error
  Context.setDiagnosticHandler(std::make_unique<LLCDiagnosticHandler>());

  Expected<LLVMRemarkFileHandle> RemarksFileOrErr =
      setupLLVMOptimizationRemarks(Context, RemarksFilename, RemarksPasses,
                                   RemarksFormat, RemarksWithHotness,
                                   RemarksHotnessThreshold);
  if (Error E = RemarksFileOrErr.takeError())
    reportError(std::move(E), RemarksFilename);
  LLVMRemarkFileHandle RemarksFile = std::move(*RemarksFileOrErr);

  codegen::MaybeEnableStatistics();
  std::string OutputFilename;

  if (InputLanguage != "" && InputLanguage != "ir" && InputLanguage != "mir")
    reportError("input language must be '', 'IR' or 'MIR'");

  // Compile the module TimeCompilations times to give better compile time
  // metrics.
  for (unsigned I = TimeCompilations; I; --I)
    if (int RetVal = compileModule(argv, PluginList, Context, OutputFilename))
      return RetVal;

  if (RemarksFile)
    RemarksFile->keep();

  return codegen::MaybeSaveStatistics(OutputFilename, "llc");
}

static bool addPass(PassManagerBase &PM, const char *argv0, StringRef PassName,
                    TargetPassConfig &TPC) {
  if (PassName == "none")
    return false;

  const PassRegistry *PR = PassRegistry::getPassRegistry();
  const PassInfo *PI = PR->getPassInfo(PassName);
  if (!PI) {
    WithColor::error(errs(), argv0)
        << "run-pass " << PassName << " is not registered.\n";
    return true;
  }

  Pass *P;
  if (PI->getNormalCtor())
    P = PI->getNormalCtor()();
  else {
    WithColor::error(errs(), argv0)
        << "cannot create pass: " << PI->getPassName() << "\n";
    return true;
  }
  std::string Banner = std::string("After ") + std::string(P->getPassName());
  TPC.addMachinePrePasses();
  PM.add(P);
  TPC.addMachinePostPasses(Banner);

  return false;
}

static int compileModule(char **argv, SmallVectorImpl<PassPlugin> &PluginList,
                         LLVMContext &Context, std::string &OutputFilename) {
  fprintf(stderr, "DEBUG LLC: compileModule() called\n");
  fflush(stderr);

  // Load the module to be compiled...
  SMDiagnostic Err;
  std::unique_ptr<Module> M;
  std::unique_ptr<MIRParser> MIR;
  Triple TheTriple;

  fprintf(stderr, "DEBUG LLC: About to call getCPUStr()\n");
  fflush(stderr);
  std::string CPUStr = codegen::getCPUStr();
  fprintf(stderr, "DEBUG LLC: getCPUStr() returned: '%s'\n", CPUStr.c_str());
  fflush(stderr);

  fprintf(stderr, "DEBUG LLC: About to call getFeaturesStr()\n");
  fflush(stderr);
  std::string FeaturesStr = codegen::getFeaturesStr();
  fprintf(stderr, "DEBUG LLC: getFeaturesStr() returned: '%s'\n", FeaturesStr.c_str());
  fflush(stderr);

  // Set attributes on functions as loaded from MIR from command line arguments.
  fprintf(stderr, "DEBUG LLC: Setting up MIR function attributes lambda\n");
  fflush(stderr);
  auto setMIRFunctionAttributes = [&CPUStr, &FeaturesStr](Function &F) {
    codegen::setFunctionAttributes(CPUStr, FeaturesStr, F);
  };

  fprintf(stderr, "DEBUG LLC: About to call getMAttrs()\n");
  fflush(stderr);
  auto MAttrs = codegen::getMAttrs();
  fprintf(stderr, "DEBUG LLC: getMAttrs() returned %zu attributes\n", MAttrs.size());
  fflush(stderr);

  bool SkipModule =
      CPUStr == "help" || (!MAttrs.empty() && MAttrs.front() == "help");
  fprintf(stderr, "DEBUG LLC: SkipModule = %d\n", SkipModule);
  fflush(stderr);

  fprintf(stderr, "DEBUG LLC: About to parse optimization level\n");
  fflush(stderr);
  CodeGenOptLevel OLvl;
  if (auto Level = CodeGenOpt::parseLevel(OptLevel)) {
    OLvl = *Level;
    fprintf(stderr, "DEBUG LLC: Optimization level parsed successfully\n");
    fflush(stderr);
  } else {
    WithColor::error(errs(), argv[0]) << "invalid optimization level.\n";
    return 1;
  }

  fprintf(stderr, "DEBUG LLC: Checking BinutilsVersion\n");
  fflush(stderr);

  // Parse 'none' or '$major.$minor'. Disallow -binutils-version=0 because we
  // use that to indicate the MC default.
  if (!BinutilsVersion.empty() && BinutilsVersion != "none") {
    StringRef V = BinutilsVersion.getValue();
    unsigned Num;
    if (V.consumeInteger(10, Num) || Num == 0 ||
        !(V.empty() ||
          (V.consume_front(".") && !V.consumeInteger(10, Num) && V.empty()))) {
      WithColor::error(errs(), argv[0])
          << "invalid -binutils-version, accepting 'none' or major.minor\n";
      return 1;
    }
  }
  fprintf(stderr, "DEBUG LLC: BinutilsVersion check passed\n");
  fflush(stderr);

  fprintf(stderr, "DEBUG LLC: Creating TargetOptions struct\n");
  fflush(stderr);
  TargetOptions Options;
  fprintf(stderr, "DEBUG LLC: TargetOptions created\n");
  fflush(stderr);

  fprintf(stderr, "DEBUG LLC: Defining InitializeOptions lambda\n");
  fflush(stderr);
  auto InitializeOptions = [&](const Triple &TheTriple) {
    fprintf(stderr, "DEBUG LLC LAMBDA: InitializeOptions called with Triple='%s'\n", TheTriple.str().c_str());
    fflush(stderr);
    fprintf(stderr, "DEBUG LLC LAMBDA: About to call InitTargetOptionsFromCodeGenFlags\n");
    fflush(stderr);
    Options = codegen::InitTargetOptionsFromCodeGenFlags(TheTriple);
    fprintf(stderr, "DEBUG LLC LAMBDA: InitTargetOptionsFromCodeGenFlags returned\n");
    fflush(stderr);

    if (Options.XCOFFReadOnlyPointers) {
      if (!TheTriple.isOSAIX())
        reportError("-mxcoff-roptr option is only supported on AIX",
                    InputFilename);

      // Since the storage mapping class is specified per csect,
      // without using data sections, it is less effective to use read-only
      // pointers. Using read-only pointers may cause other RO variables in the
      // same csect to become RW when the linker acts upon `-bforceimprw`;
      // therefore, we require that separate data sections are used in the
      // presence of ReadOnlyPointers. We respect the setting of data-sections
      // since we have not found reasons to do otherwise that overcome the user
      // surprise of not respecting the setting.
      if (!Options.DataSections)
        reportError("-mxcoff-roptr option must be used with -data-sections",
                    InputFilename);
    }

    if (TheTriple.isX86() &&
        codegen::getFuseFPOps() != FPOpFusion::FPOpFusionMode::Standard)
      WithColor::warning(errs(), argv[0])
          << "X86 backend ignores --fp-contract setting; use IR fast-math "
             "flags instead.";

    Options.BinutilsVersion =
        TargetMachine::parseBinutilsVersion(BinutilsVersion);
    Options.MCOptions.ShowMCEncoding = ShowMCEncoding;
    Options.MCOptions.AsmVerbose = AsmVerbose;
    Options.MCOptions.PreserveAsmComments = PreserveComments;
    if (OutputAsmVariant.getNumOccurrences())
      Options.MCOptions.OutputAsmVariant = OutputAsmVariant;
    Options.MCOptions.IASSearchPaths = IncludeDirs;
    Options.MCOptions.InstPrinterOptions = InstPrinterOptions;
    Options.MCOptions.SplitDwarfFile = SplitDwarfFile;
    if (DwarfDirectory.getPosition()) {
      Options.MCOptions.MCUseDwarfDirectory =
          DwarfDirectory ? MCTargetOptions::EnableDwarfDirectory
                         : MCTargetOptions::DisableDwarfDirectory;
    } else {
      // -dwarf-directory is not set explicitly. Some assemblers
      // (e.g. GNU as or ptxas) do not support `.file directory'
      // syntax prior to DWARFv5. Let the target decide the default
      // value.
      Options.MCOptions.MCUseDwarfDirectory =
          MCTargetOptions::DefaultDwarfDirectory;
    }
  };
  fprintf(stderr, "DEBUG LLC: InitializeOptions lambda defined\n");
  fflush(stderr);

  fprintf(stderr, "DEBUG LLC: About to get relocation model\n");
  fflush(stderr);
  std::optional<Reloc::Model> RM = codegen::getExplicitRelocModel();
  fprintf(stderr, "DEBUG LLC: Got relocation model\n");
  fflush(stderr);

  fprintf(stderr, "DEBUG LLC: About to get code model\n");
  fflush(stderr);
  std::optional<CodeModel::Model> CM = codegen::getExplicitCodeModel();
  fprintf(stderr, "DEBUG LLC: Got code model\n");
  fflush(stderr);

  fprintf(stderr, "DEBUG LLC: About to create TheTarget pointer\n");
  fflush(stderr);
  const Target *TheTarget = nullptr;
  fprintf(stderr, "DEBUG LLC: About to create Target unique_ptr\n");
  fflush(stderr);
  std::unique_ptr<TargetMachine> Target;
  fprintf(stderr, "DEBUG LLC: Checking SkipModule flag (SkipModule=%d)\n", SkipModule);
  fflush(stderr);

  // If user just wants to list available options, skip module loading
  if (!SkipModule) {
    fprintf(stderr, "DEBUG LLC: Entering !SkipModule branch\n");
    fflush(stderr);

    // REMOVED: Manual module creation (was creating empty module)
    // Now we'll parse the actual IR file below

    fprintf(stderr, "DEBUG LLC: About to define SetDataLayout lambda\n");
    fflush(stderr);
    auto SetDataLayout = [&TheTarget, &Target, &TheTriple, &InitializeOptions,
                           &CPUStr, &FeaturesStr, &Options, &RM, &CM, &OLvl, &argv](
                             StringRef DataLayoutTargetTriple,
                             StringRef OldDLStr) -> std::optional<std::string> {
      fprintf(stderr, "DEBUG LLC LAMBDA: SetDataLayout called\n");
      fflush(stderr);

      // Test: Skip all TargetMachine creation, just return hardcoded DL
      fprintf(stderr, "DEBUG LLC LAMBDA: Returning hardcoded DL directly\n");
      fflush(stderr);
      std::optional<std::string> result = std::string("e-p:32:32-i32:32-n32");
      fprintf(stderr, "DEBUG LLC LAMBDA: Created optional, about to return\n");
      fflush(stderr);
      return result;

      // If we are supposed to override the target triple, do so now.

      // If we are supposed to override the target triple, do so now.
      fprintf(stderr, "DEBUG LLC LAMBDA: Converting DataLayoutTargetTriple to string\n");
      fflush(stderr);
      std::string IRTargetTriple = DataLayoutTargetTriple.str();
      fprintf(stderr, "DEBUG LLC LAMBDA: IRTargetTriple='%s'\n", IRTargetTriple.c_str());
      fflush(stderr);

      fprintf(stderr, "DEBUG LLC LAMBDA: Checking TargetTriple.empty()\n");
      fflush(stderr);
      if (!TargetTriple.empty()) {
        fprintf(stderr, "DEBUG LLC LAMBDA: TargetTriple not empty, normalizing\n");
        fflush(stderr);
        IRTargetTriple = Triple::normalize(TargetTriple);
        fprintf(stderr, "DEBUG LLC LAMBDA: Normalized triple='%s'\n", IRTargetTriple.c_str());
        fflush(stderr);
      }

      fprintf(stderr, "DEBUG LLC LAMBDA: Creating Triple object from '%s'\n", IRTargetTriple.c_str());
      fflush(stderr);
      TheTriple = Triple(IRTargetTriple);
      fprintf(stderr, "DEBUG LLC LAMBDA: Triple created\n");
      fflush(stderr);

      fprintf(stderr, "DEBUG LLC LAMBDA: Checking TheTriple.getTriple().empty()\n");
      fflush(stderr);
      if (TheTriple.getTriple().empty()) {
        fprintf(stderr, "DEBUG LLC LAMBDA: Triple empty, getting default\n");
        fflush(stderr);
        TheTriple.setTriple(sys::getDefaultTargetTriple());
        fprintf(stderr, "DEBUG LLC LAMBDA: Default triple set\n");
        fflush(stderr);
      }

      std::string Error;
      fprintf(stderr, "DEBUG LLC: About to call TargetRegistry::lookupTarget (MIR path)\n");
      fprintf(stderr, "DEBUG LLC:   MArch='%s', Triple='%s'\n",
              codegen::getMArch().c_str(), TheTriple.str().c_str());
      fflush(stderr);

      TheTarget =
          TargetRegistry::lookupTarget(codegen::getMArch(), TheTriple, Error);

      fprintf(stderr, "DEBUG LLC: lookupTarget completed, TheTarget=%p\n", (void*)TheTarget);
      fflush(stderr);

      if (!TheTarget) {
        WithColor::error(errs(), argv[0]) << Error << "\n";
        exit(1);
      }

      fprintf(stderr, "DEBUG LLC: About to initialize options\n");
      fflush(stderr);

      InitializeOptions(TheTriple);

      fprintf(stderr, "DEBUG LLC: About to create TargetMachine\n");
      fflush(stderr);

      Target = std::unique_ptr<TargetMachine>(TheTarget->createTargetMachine(
          TheTriple, CPUStr, FeaturesStr, Options, RM, CM, OLvl));

      fprintf(stderr, "DEBUG LLC: TargetMachine created successfully\n");
      fflush(stderr);

      fprintf(stderr, "DEBUG LLC: Checking Target pointer\n");
      fflush(stderr);
      assert(Target && "Could not allocate target machine!");
      fprintf(stderr, "DEBUG LLC: Target pointer OK\n");
      fflush(stderr);

      // Set PGO options based on command line flags
      fprintf(stderr, "DEBUG LLC: About to call setPGOOptions\n");
      fflush(stderr);
      setPGOOptions(*Target);
      fprintf(stderr, "DEBUG LLC: setPGOOptions completed\n");
      fflush(stderr);

      fprintf(stderr, "DEBUG LLC: About to call createDataLayout\n");
      fflush(stderr);
      auto DL = Target->createDataLayout();
      fprintf(stderr, "DEBUG LLC: createDataLayout completed\n");
      fflush(stderr);

      fprintf(stderr, "DEBUG LLC: About to call getStringRepresentation\n");
      fflush(stderr);
      auto DLStr = DL.getStringRepresentation();
      fprintf(stderr, "DEBUG LLC: getStringRepresentation completed: '%s'\n", DLStr.c_str());
      fflush(stderr);

      fprintf(stderr, "DEBUG LLC: About to return from lambda\n");
      fflush(stderr);

      // Test: return hardcoded value
      fprintf(stderr, "DEBUG LLC: Returning hardcoded value\n");
      fflush(stderr);
      return std::string("e-p:32:32-i32:32-n32");

      // Original code:
      // auto result = DLStr;
      // std::optional<std::string> optResult = result;
      // return optResult;
    };
    fprintf(stderr, "DEBUG LLC: SetDataLayout lambda definition completed\n");
    fflush(stderr);

    fprintf(stderr, "DEBUG LLC: Checking input language: '%s'\n", InputLanguage.c_str());
    fprintf(stderr, "DEBUG LLC: InputFilename: '%s'\n", InputFilename.c_str());
    fflush(stderr);

    // Skip actual file parsing since we created module manually
    if (!M) {
      fprintf(stderr, "DEBUG LLC: Module not created manually, parsing file\n");
      fflush(stderr);
      if (InputLanguage == "mir" ||
          (InputLanguage == "" && StringRef(InputFilename).ends_with(".mir"))) {
        fprintf(stderr, "DEBUG LLC: Parsing MIR file\n");
        fflush(stderr);
        MIR = createMIRParserFromFile(InputFilename, Err, Context,
                                      setMIRFunctionAttributes);
        if (MIR)
          M = MIR->parseIRModule(SetDataLayout);
      } else {
        fprintf(stderr, "DEBUG LLC: Parsing IR file\n");
        fflush(stderr);
        fprintf(stderr, "DEBUG LLC: Trying WITHOUT callback\n");
        fflush(stderr);
        M = parseIRFile(InputFilename, Err, Context);
      }
    }
    fprintf(stderr, "DEBUG LLC: After parsing/creation, checking Module\n");
    fflush(stderr);
    if (!M) {
      Err.print(argv[0], WithColor::error(errs(), argv[0]));
      return 1;
    }
    fprintf(stderr, "DEBUG LLC: Module OK\n");
    fflush(stderr);

    fprintf(stderr, "DEBUG LLC: Checking TargetTriple\n");
    fflush(stderr);
    if (!TargetTriple.empty()) {
      fprintf(stderr, "DEBUG LLC: Setting module target triple\n");
      fflush(stderr);
      M->setTargetTriple(Triple(Triple::normalize(TargetTriple)));
    }

    // Create TargetMachine if not already created
    if (!Target) {
      fprintf(stderr, "DEBUG LLC: Target not created yet, creating now\n");
      fflush(stderr);

      TheTriple = M->getTargetTriple();
      if (TheTriple.getTriple().empty())
        TheTriple.setTriple(sys::getDefaultTargetTriple());

      // Get the target specific parser
      std::string Error;
      TheTarget = TargetRegistry::lookupTarget(codegen::getMArch(), TheTriple, Error);
      if (!TheTarget) {
        WithColor::error(errs(), argv[0]) << Error << "\n";
        return 1;
      }

      InitializeOptions(TheTriple);
      Target = std::unique_ptr<TargetMachine>(TheTarget->createTargetMachine(
          TheTriple, CPUStr, FeaturesStr, Options, RM, CM, OLvl));
      assert(Target && "Could not allocate target machine!");

      setPGOOptions(*Target);
      fprintf(stderr, "DEBUG LLC: TargetMachine created successfully\n");
      fflush(stderr);
    }

    fprintf(stderr, "DEBUG LLC: Getting code model from IR\n");
    fflush(stderr);
    std::optional<CodeModel::Model> CM_IR = M->getCodeModel();
    fprintf(stderr, "DEBUG LLC: Checking if need to set code model\n");
    fflush(stderr);
    if (!CM && CM_IR) {
      fprintf(stderr, "DEBUG LLC: Setting code model on Target\n");
      fflush(stderr);
      Target->setCodeModel(*CM_IR);
    }
    fprintf(stderr, "DEBUG LLC: Checking large data threshold\n");
    fflush(stderr);
    if (std::optional<uint64_t> LDT = codegen::getExplicitLargeDataThreshold()) {
      fprintf(stderr, "DEBUG LLC: Setting large data threshold\n");
      fflush(stderr);
      Target->setLargeDataThreshold(*LDT);
    }
  } else {
    TheTriple = Triple(Triple::normalize(TargetTriple));
    if (TheTriple.getTriple().empty())
      TheTriple.setTriple(sys::getDefaultTargetTriple());

    // Get the target specific parser.
    std::string Error;
    TheTarget =
        TargetRegistry::lookupTarget(codegen::getMArch(), TheTriple, Error);
    if (!TheTarget) {
      WithColor::error(errs(), argv[0]) << Error << "\n";
      return 1;
    }

    InitializeOptions(TheTriple);
    Target = std::unique_ptr<TargetMachine>(TheTarget->createTargetMachine(
        TheTriple, CPUStr, FeaturesStr, Options, RM, CM, OLvl));
    assert(Target && "Could not allocate target machine!");

    // Set PGO options based on command line flags
    setPGOOptions(*Target);

    // If we don't have a module then just exit now. We do this down
    // here since the CPU/Feature help is underneath the target machine
    // creation.
    return 0;
  }

  fprintf(stderr, "DEBUG LLC: After if/else, checking module assertion\n");
  fflush(stderr);
  assert(M && "Should have exited if we didn't have a module!");
  fprintf(stderr, "DEBUG LLC: Module assertion passed\n");
  fflush(stderr);

  fprintf(stderr, "DEBUG LLC: Checking FloatABI\n");
  fflush(stderr);
  if (codegen::getFloatABIForCalls() != FloatABI::Default)
    Target->Options.FloatABIType = codegen::getFloatABIForCalls();
  fprintf(stderr, "DEBUG LLC: FloatABI check done\n");
  fflush(stderr);

  // Figure out where we are going to send the output.
  fprintf(stderr, "DEBUG LLC: About to figure out output\n");
  fflush(stderr);

  fprintf(stderr, "DEBUG LLC: Calling GetOutputStream\n");
  fflush(stderr);
  std::unique_ptr<ToolOutputFile> Out = GetOutputStream(TheTriple.getOS());
  fprintf(stderr, "DEBUG LLC: GetOutputStream returned\n");
  fflush(stderr);
  if (!Out)
    return 1;

  fprintf(stderr, "DEBUG LLC: Setting object filename for debug\n");
  fflush(stderr);
  // Ensure the filename is passed down to CodeViewDebug.
  Target->Options.ObjectFilenameForDebug = Out->outputFilename();

  // Return a copy of the output filename via the output param
  OutputFilename = Out->outputFilename();
  fprintf(stderr, "DEBUG LLC: Output filename set\n");
  fflush(stderr);

  // Tell target that this tool is not necessarily used with argument ABI
  // compliance (i.e. narrow integer argument extensions).
  Target->Options.VerifyArgABICompliance = 0;

  fprintf(stderr, "DEBUG LLC: Checking split dwarf\n");
  fflush(stderr);
  std::unique_ptr<ToolOutputFile> DwoOut;
  if (!SplitDwarfOutputFile.empty()) {
    std::error_code EC;
    DwoOut = std::make_unique<ToolOutputFile>(SplitDwarfOutputFile, EC,
                                              sys::fs::OF_None);
    if (EC)
      reportError(EC.message(), SplitDwarfOutputFile);
  }

  fprintf(stderr, "DEBUG LLC: Creating TargetLibraryInfoImpl\n");
  fflush(stderr);
  // Add an appropriate TargetLibraryInfo pass for the module's triple.
  TargetLibraryInfoImpl TLII(M->getTargetTriple(), Target->Options.VecLib);
  fprintf(stderr, "DEBUG LLC: TargetLibraryInfoImpl created\n");
  fflush(stderr);

  fprintf(stderr, "DEBUG LLC: Checking DisableSimplifyLibCalls\n");
  fflush(stderr);
  // The -disable-simplify-libcalls flag actually disables all builtin optzns.
  if (DisableSimplifyLibCalls)
    TLII.disableAllFunctions();

  fprintf(stderr, "DEBUG LLC: About to verify module\n");
  fflush(stderr);
  // Verify module immediately to catch problems before doInitialization() is
  // called on any passes.
  if (!NoVerify && verifyModule(*M, &errs()))
    reportError("input module cannot be verified", InputFilename);
  fprintf(stderr, "DEBUG LLC: Module verified\n");
  fflush(stderr);

  fprintf(stderr, "DEBUG LLC: Setting function attributes\n");
  fflush(stderr);
  // Override function attributes based on CPUStr, FeaturesStr, and command line
  // flags.
  codegen::setFunctionAttributes(CPUStr, FeaturesStr, *M);
  fprintf(stderr, "DEBUG LLC: Function attributes set\n");
  fflush(stderr);

  fprintf(stderr, "DEBUG LLC: Checking plugins (PluginList size: %zu)\n", PluginList.size());
  fflush(stderr);
  for (auto &Plugin : PluginList) {
    fprintf(stderr, "DEBUG LLC: Processing plugin\n");
    fflush(stderr);
    CodeGenFileType CGFT = codegen::getFileType();
    if (Plugin.invokePreCodeGenCallback(*M, *Target, CGFT, Out->os())) {
      // TODO: Deduplicate code with below and the NewPMDriver.
      if (Context.getDiagHandlerPtr()->HasErrors)
        exit(1);
      Out->keep();
      return 0;
    }
  }
  fprintf(stderr, "DEBUG LLC: Plugins processed\n");
  fflush(stderr);

  fprintf(stderr, "DEBUG LLC: Checking mc::getExplicitRelaxAll()\n");
  fflush(stderr);
  if (mc::getExplicitRelaxAll() &&
      codegen::getFileType() != CodeGenFileType::ObjectFile)
    WithColor::warning(errs(), argv[0])
        << ": warning: ignoring -mc-relax-all because filetype != obj";
  fprintf(stderr, "DEBUG LLC: RelaxAll check done\n");
  fflush(stderr);

  fprintf(stderr, "DEBUG LLC: Setting VerifierKind\n");
  fflush(stderr);
  VerifierKind VK = VerifierKind::InputOutput;
  if (NoVerify)
    VK = VerifierKind::None;
  else if (VerifyEach)
    VK = VerifierKind::EachPass;
  fprintf(stderr, "DEBUG LLC: VerifierKind set\n");
  fflush(stderr);

  fprintf(stderr, "DEBUG LLC: Checking if using new PM (EnableNewPassManager=%d, PassPipeline.empty=%d)\n",
          (int)(bool)EnableNewPassManager, (int)PassPipeline.empty());
  fflush(stderr);
  if (EnableNewPassManager || !PassPipeline.empty()) {
    fprintf(stderr, "DEBUG LLC: Using new pass manager\n");
    fflush(stderr);
    return compileModuleWithNewPM(argv[0], std::move(M), std::move(MIR),
                                  std::move(Target), std::move(Out),
                                  std::move(DwoOut), Context, TLII, VK,
                                  PassPipeline, codegen::getFileType());
  }

  fprintf(stderr, "DEBUG LLC: Using legacy pass manager\n");
  fflush(stderr);
  // Build up all of the passes that we want to do to the module.
  fprintf(stderr, "DEBUG LLC: Creating legacy::PassManager\n");
  fflush(stderr);
  legacy::PassManager PM;
  fprintf(stderr, "DEBUG LLC: PassManager created\n");
  fflush(stderr);
  fprintf(stderr, "DEBUG LLC: Adding TargetLibraryInfoWrapperPass\n");
  fflush(stderr);
  PM.add(new TargetLibraryInfoWrapperPass(TLII));
  fprintf(stderr, "DEBUG LLC: TargetLibraryInfoWrapperPass added\n");
  fflush(stderr);
  fprintf(stderr, "DEBUG LLC: Adding RuntimeLibraryInfoWrapper\n");
  fflush(stderr);
  PM.add(new RuntimeLibraryInfoWrapper(
      TheTriple, Target->Options.ExceptionModel, Target->Options.FloatABIType,
      Target->Options.EABIVersion, Options.MCOptions.ABIName,
      Target->Options.VecLib));
  fprintf(stderr, "DEBUG LLC: RuntimeLibraryInfoWrapper added\n");
  fflush(stderr);

  fprintf(stderr, "DEBUG LLC: Entering output stream setup block\n");
  fflush(stderr);
  {
    fprintf(stderr, "DEBUG LLC: About to get Out->os() (Out=%p)\n", (void*)Out.get());
    fflush(stderr);
    raw_pwrite_stream *OS = &Out->os();
    fprintf(stderr, "DEBUG LLC: Got Out->os() successfully (OS=%p)\n", (void*)OS);
    fflush(stderr);

    // Manually do the buffering rather than using buffer_ostream,
    // so we can memcmp the contents in CompileTwice mode
    fprintf(stderr, "DEBUG LLC: Creating SmallVector Buffer\n");
    fflush(stderr);
    SmallVector<char, 0> Buffer;
    fprintf(stderr, "DEBUG LLC: Buffer created\n");
    fflush(stderr);
    std::unique_ptr<raw_svector_ostream> BOS;
    fprintf(stderr, "DEBUG LLC: Checking file type and CompileTwice\n");
    fflush(stderr);
    fprintf(stderr, "DEBUG LLC: Getting file type\n");
    fflush(stderr);
    CodeGenFileType FileType = codegen::getFileType();
    fprintf(stderr, "DEBUG LLC: FileType = %d\n", (int)FileType);
    fflush(stderr);
    bool NeedBuffer = false;
    if (FileType != CodeGenFileType::AssemblyFile) {
      fprintf(stderr, "DEBUG LLC: Not assembly file, checking supportsSeeking\n");
      fflush(stderr);
      fprintf(stderr, "DEBUG LLC: About to call Out->os() second time\n");
      fflush(stderr);
      bool Supports = Out->os().supportsSeeking();
      fprintf(stderr, "DEBUG LLC: supportsSeeking returned %d\n", (int)Supports);
      fflush(stderr);
      NeedBuffer = !Supports;
    }
    fprintf(stderr, "DEBUG LLC: CompileTwice = %d, NeedBuffer = %d\n", (int)CompileTwice, (int)NeedBuffer);
    fflush(stderr);
    if (NeedBuffer || CompileTwice) {
      fprintf(stderr, "DEBUG LLC: Creating BOS\n");
      fflush(stderr);
      BOS = std::make_unique<raw_svector_ostream>(Buffer);
      fprintf(stderr, "DEBUG LLC: BOS created\n");
      fflush(stderr);
      OS = BOS.get();
    }

    fprintf(stderr, "DEBUG LLC: Getting argv[0]\n");
    fflush(stderr);
    const char *argv0 = argv[0];
    fprintf(stderr, "DEBUG LLC: argv0 = %s\n", argv0);
    fflush(stderr);
    fprintf(stderr, "DEBUG LLC: Creating MachineModuleInfoWrapperPass (Target=%p)\n", (void*)Target.get());
    fflush(stderr);
    MachineModuleInfoWrapperPass *MMIWP =
        new MachineModuleInfoWrapperPass(Target.get());
    fprintf(stderr, "DEBUG LLC: MachineModuleInfoWrapperPass created (MMIWP=%p)\n", (void*)MMIWP);
    fflush(stderr);

    // Set a temporary diagnostic handler. This is used before
    // MachineModuleInfoWrapperPass::doInitialization for features like -M.
    fprintf(stderr, "DEBUG LLC: Setting up diagnostic handler\n");
    fflush(stderr);
    bool HasMCErrors = false;
    fprintf(stderr, "DEBUG LLC: Getting MMI\n");
    fflush(stderr);
    MachineModuleInfo &MMI = MMIWP->getMMI();
    fprintf(stderr, "DEBUG LLC: Getting MCContext\n");
    fflush(stderr);
    MCContext &MCCtx = MMI.getContext();
    fprintf(stderr, "DEBUG LLC: MCContext obtained, setting diagnostic handler\n");
    fflush(stderr);
    MCCtx.setDiagnosticHandler([&](const SMDiagnostic &SMD, bool IsInlineAsm,
                                   const SourceMgr &SrcMgr,
                                   std::vector<const MDNode *> &LocInfos) {
      WithColor::error(errs(), argv0) << SMD.getMessage() << '\n';
      HasMCErrors = true;
    });
    fprintf(stderr, "DEBUG LLC: Diagnostic handler set\n");
    fflush(stderr);

    // Construct a custom pass pipeline that starts after instruction
    // selection.
    fprintf(stderr, "DEBUG LLC: Checking getRunPassNames()\n");
    fflush(stderr);
    if (!getRunPassNames().empty()) {
      fprintf(stderr, "DEBUG LLC: getRunPassNames() is not empty, processing run-pass\n");
      fflush(stderr);
      if (!MIR) {
        WithColor::error(errs(), argv[0])
            << "run-pass is for .mir file only.\n";
        delete MMIWP;
        return 1;
      }
      TargetPassConfig *PTPC = Target->createPassConfig(PM);
      TargetPassConfig &TPC = *PTPC;
      if (TPC.hasLimitedCodeGenPipeline()) {
        WithColor::error(errs(), argv[0])
            << "run-pass cannot be used with "
            << TPC.getLimitedCodeGenPipelineReason() << ".\n";
        delete PTPC;
        delete MMIWP;
        return 1;
      }

      TPC.setDisableVerify(NoVerify);
      PM.add(&TPC);
      PM.add(MMIWP);
      TPC.printAndVerify("");
      for (const std::string &RunPassName : getRunPassNames()) {
        if (addPass(PM, argv0, RunPassName, TPC))
          return 1;
      }
      TPC.setInitialized();
      PM.add(createPrintMIRPass(*OS));

      // Add MIR2Vec vocabulary printer if requested
      if (PrintMIR2VecVocab) {
        PM.add(createMIR2VecVocabPrinterLegacyPass(errs()));
      }

      // Add MIR2Vec printer if requested
      if (PrintMIR2Vec) {
        PM.add(createMIR2VecPrinterLegacyPass(errs()));
      }

      PM.add(createFreeMachineFunctionPass());
    } else {
      fprintf(stderr, "DEBUG LLC: Entering normal code generation path (not run-pass)\n");
      fflush(stderr);
      fprintf(stderr, "DEBUG LLC: About to call Target->addPassesToEmitFile\n");
      fflush(stderr);
      fprintf(stderr, "DEBUG LLC: Target=%p, OS=%p, FileType=%d, NoVerify=%d, MMIWP=%p\n",
              (void*)Target.get(), (void*)OS, (int)codegen::getFileType(), (int)NoVerify, (void*)MMIWP);
      fflush(stderr);
      if (Target->addPassesToEmitFile(PM, *OS, DwoOut ? &DwoOut->os() : nullptr,
                                      codegen::getFileType(), NoVerify,
                                      MMIWP)) {
        fprintf(stderr, "DEBUG LLC: addPassesToEmitFile returned true (error)\n");
        fflush(stderr);
        if (!HasMCErrors)
          reportError("target does not support generation of this file type");
      }
      fprintf(stderr, "DEBUG LLC: addPassesToEmitFile completed successfully\n");
      fflush(stderr);

      fprintf(stderr, "DEBUG LLC: Checking MIR2Vec options\n");
      fflush(stderr);
      // Add MIR2Vec vocabulary printer if requested
      if (PrintMIR2VecVocab) {
        PM.add(createMIR2VecVocabPrinterLegacyPass(errs()));
      }

      // Add MIR2Vec printer if requested
      if (PrintMIR2Vec) {
        PM.add(createMIR2VecPrinterLegacyPass(errs()));
      }
      fprintf(stderr, "DEBUG LLC: MIR2Vec checks done\n");
      fflush(stderr);
    }

    fprintf(stderr, "DEBUG LLC: About to initialize ObjFileLowering\n");
    fflush(stderr);
    Target->getObjFileLowering()->Initialize(MMIWP->getMMI().getContext(),
                                             *Target);
    fprintf(stderr, "DEBUG LLC: ObjFileLowering initialized\n");
    fflush(stderr);
    if (MIR) {
      fprintf(stderr, "DEBUG LLC: Parsing MIR\n");
      fflush(stderr);
      assert(MMIWP && "Forgot to create MMIWP?");
      if (MIR->parseMachineFunctions(*M, MMIWP->getMMI()))
        return 1;
    }

    fprintf(stderr, "DEBUG LLC: About to print option values\n");
    fflush(stderr);
    // Before executing passes, print the final values of the LLVM options.
    cl::PrintOptionValues();
    fprintf(stderr, "DEBUG LLC: Option values printed\n");
    fflush(stderr);

    fprintf(stderr, "DEBUG LLC: Checking CompileTwice (CompileTwice=%d)\n", (int)CompileTwice);
    fflush(stderr);
    // If requested, run the pass manager over the same module again,
    // to catch any bugs due to persistent state in the passes. Note that
    // opt has the same functionality, so it may be worth abstracting this out
    // in the future.
    SmallVector<char, 0> CompileTwiceBuffer;
    if (CompileTwice) {
      fprintf(stderr, "DEBUG LLC: Running PM twice\n");
      fflush(stderr);
      std::unique_ptr<Module> M2(llvm::CloneModule(*M));
      PM.run(*M2);
      CompileTwiceBuffer = Buffer;
      Buffer.clear();
    }

    fprintf(stderr, "DEBUG LLC: About to run PM.run(*M)\n");
    fflush(stderr);
    PM.run(*M);
    fprintf(stderr, "DEBUG LLC: PM.run(*M) completed\n");
    fflush(stderr);

    if (Context.getDiagHandlerPtr()->HasErrors || HasMCErrors)
      return 1;

    // Compare the two outputs and make sure they're the same
    if (CompileTwice) {
      if (Buffer.size() != CompileTwiceBuffer.size() ||
          (memcmp(Buffer.data(), CompileTwiceBuffer.data(), Buffer.size()) !=
           0)) {
        errs()
            << "Running the pass manager twice changed the output.\n"
               "Writing the result of the second run to the specified output\n"
               "To generate the one-run comparison binary, just run without\n"
               "the compile-twice option\n";
        Out->os() << Buffer;
        Out->keep();
        return 1;
      }
    }

    if (BOS) {
      Out->os() << Buffer;
    }
  }

  // Declare success.
  Out->keep();
  if (DwoOut)
    DwoOut->keep();

  return 0;
}
