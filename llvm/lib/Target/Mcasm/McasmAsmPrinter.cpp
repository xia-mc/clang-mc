//===-- McasmAsmPrinter.cpp - Convert Mcasm LLVM code to AT&T assembly --------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file contains a printer that converts from our internal representation
// of machine-dependent LLVM code to Mcasm machine code.
//
//===----------------------------------------------------------------------===//

#include "McasmAsmPrinter.h"
#include "MCTargetDesc/McasmATTInstPrinter.h"
#include "MCTargetDesc/McasmBaseInfo.h"
#include "MCTargetDesc/McasmMCTargetDesc.h"
#include "MCTargetDesc/McasmTargetStreamer.h"
#include "TargetInfo/McasmTargetInfo.h"
#include "Mcasm.h"
#include "McasmInstrInfo.h"
#include "McasmMachineFunctionInfo.h"
#include "McasmSubtarget.h"
#include "llvm-c/Visibility.h"
#include "llvm/Analysis/StaticDataProfileInfo.h"
#include "llvm/BinaryFormat/COFF.h"
#include "llvm/BinaryFormat/ELF.h"
#include "llvm/CodeGen/MachineConstantPool.h"
#include "llvm/CodeGen/MachineModuleInfoImpls.h"
#include "llvm/CodeGen/TargetLoweringObjectFileImpl.h"
#include "llvm/CodeGenTypes/MachineValueType.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/InlineAsm.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/Mangler.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Type.h"
#include "llvm/MC/MCAsmInfo.h"
#include "llvm/MC/MCCodeEmitter.h"
#include "llvm/MC/MCContext.h"
#include "llvm/MC/MCExpr.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCInstBuilder.h"
#include "llvm/MC/MCSectionCOFF.h"
#include "llvm/MC/MCSectionELF.h"
#include "llvm/MC/MCSectionMachO.h"
#include "llvm/MC/MCStreamer.h"
#include "llvm/MC/MCSymbol.h"
#include "llvm/MC/TargetRegistry.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Target/TargetMachine.h"

using namespace llvm;

McasmAsmPrinter::McasmAsmPrinter(TargetMachine &TM,
                             std::unique_ptr<MCStreamer> Streamer)
    : AsmPrinter(TM, std::move(Streamer), ID), FM(*this) {}

//===----------------------------------------------------------------------===//
// Primitive Helper Functions.
//===----------------------------------------------------------------------===//

/// runOnMachineFunction - Emit the function body.
///
bool McasmAsmPrinter::runOnMachineFunction(MachineFunction &MF) {
  if (auto *PSIW = getAnalysisIfAvailable<ProfileSummaryInfoWrapperPass>())
    PSI = &PSIW->getPSI();
  if (auto *SDPIW = getAnalysisIfAvailable<StaticDataProfileInfoWrapperPass>())
    SDPI = &SDPIW->getStaticDataProfileInfo();

  Subtarget = &MF.getSubtarget<McasmSubtarget>();

  SMShadowTracker.startFunction(MF);
  CodeEmitter.reset(TM.getTarget().createMCCodeEmitter(
      *Subtarget->getInstrInfo(), MF.getContext()));

  const Module *M = MF.getFunction().getParent();
  EmitFPOData = Subtarget->isTargetWin32() && M->getCodeViewFlag();

  IndCSPrefix = M->getModuleFlag("indirect_branch_cs_prefix");

  SetupMachineFunction(MF);

  if (Subtarget->isTargetCOFF()) {
    bool Local = MF.getFunction().hasLocalLinkage();
    OutStreamer->beginCOFFSymbolDef(CurrentFnSym);
    OutStreamer->emitCOFFSymbolStorageClass(
        Local ? COFF::IMAGE_SYM_CLASS_STATIC : COFF::IMAGE_SYM_CLASS_EXTERNAL);
    OutStreamer->emitCOFFSymbolType(COFF::IMAGE_SYM_DTYPE_FUNCTION
                                    << COFF::SCT_COMPLEX_TYPE_SHIFT);
    OutStreamer->endCOFFSymbolDef();
  }

  // Emit the rest of the function body.
  emitFunctionBody();

  // Emit the XRay table for this function.
  emitXRayTable();

  EmitFPOData = false;

  IndCSPrefix = false;

  // We didn't modify anything.
  return false;
}

void McasmAsmPrinter::emitFunctionBodyStart() {
  if (EmitFPOData) {
    auto *XTS =
        static_cast<McasmTargetStreamer *>(OutStreamer->getTargetStreamer());
    XTS->emitFPOProc(
        CurrentFnSym,
        MF->getInfo<McasmMachineFunctionInfo>()->getArgumentStackSize());
  }
}

void McasmAsmPrinter::emitFunctionBodyEnd() {
  if (EmitFPOData) {
    auto *XTS =
        static_cast<McasmTargetStreamer *>(OutStreamer->getTargetStreamer());
    XTS->emitFPOEndProc();
  }
}

uint32_t McasmAsmPrinter::MaskKCFIType(uint32_t Value) {
  // If the type hash matches an invalid pattern, mask the value.
  const uint32_t InvalidValues[] = {
      0xFA1E0FF3, /* ENDBR64 */
      0xFB1E0FF3, /* ENDBR32 */
  };
  for (uint32_t N : InvalidValues) {
    // LowerKCFI_CHECK emits -Value for indirect call checks, so we must also
    // mask that. Note that -(Value + 1) == ~Value.
    if (N == Value || -N == Value)
      return Value + 1;
  }
  return Value;
}

void McasmAsmPrinter::EmitKCFITypePadding(const MachineFunction &MF,
                                        bool HasType) {
  // Keep the function entry aligned, taking patchable-function-prefix into
  // account if set.
  int64_t PrefixBytes = 0;
  (void)MF.getFunction()
      .getFnAttribute("patchable-function-prefix")
      .getValueAsString()
      .getAsInteger(10, PrefixBytes);

  // Also take the type identifier into account if we're emitting
  // one. Otherwise, just pad with nops. The Mcasm::MOV32ri instruction emitted
  // in McasmAsmPrinter::emitKCFITypeId is 5 bytes long.
  if (HasType)
    PrefixBytes += 5;

  emitNops(offsetToAlignment(PrefixBytes, MF.getAlignment()));
}

/// emitKCFITypeId - Emit the KCFI type information in architecture specific
/// format.
void McasmAsmPrinter::emitKCFITypeId(const MachineFunction &MF) {
  const Function &F = MF.getFunction();
  if (!F.getParent()->getModuleFlag("kcfi"))
    return;

  ConstantInt *Type = nullptr;
  if (const MDNode *MD = F.getMetadata(LLVMContext::MD_kcfi_type))
    Type = mdconst::extract<ConstantInt>(MD->getOperand(0));

  // If we don't have a type to emit, just emit padding if needed to maintain
  // the same alignment for all functions.
  if (!Type) {
    EmitKCFITypePadding(MF, /*HasType=*/false);
    return;
  }

  // Emit a function symbol for the type data to avoid unreachable instruction
  // warnings from binary validation tools, and use the same linkage as the
  // parent function. Note that using local linkage would result in duplicate
  // symbols for weak parent functions.
  MCSymbol *FnSym = OutContext.getOrCreateSymbol("__cfi_" + MF.getName());
  emitLinkage(&MF.getFunction(), FnSym);
  if (MAI->hasDotTypeDotSizeDirective())
    OutStreamer->emitSymbolAttribute(FnSym, MCSA_ELF_TypeFunction);
  OutStreamer->emitLabel(FnSym);

  // Embed the type hash in the Mcasm::MOV32ri instruction to avoid special
  // casing object file parsers.
  EmitKCFITypePadding(MF);
  unsigned DestReg = Mcasm::EAX;

  if (F.getParent()->getModuleFlag("kcfi-arity")) {
    // The ArityToRegMap assumes the 64-bit SysV ABI.
    [[maybe_unused]] const auto &Triple = MF.getTarget().getTargetTriple();
    assert(Triple.isMcasm_64() && !Triple.isOSWindows());

    // Determine the function's arity (i.e., the number of arguments) at the ABI
    // level by counting the number of parameters that are passed
    // as registers, such as pointers and 64-bit (or smaller) integers. The
    // Linux x86-64 ABI allows up to 6 integer parameters to be passed in GPRs.
    // Additional parameters or parameters larger than 64 bits may be passed on
    // the stack, in which case the arity is denoted as 7. Floating-point
    // arguments passed in XMM0-XMM7 are not counted toward arity because
    // floating-point values are not relevant to enforcing kCFI at this time.
    const unsigned ArityToRegMap[8] = {Mcasm::EAX, Mcasm::ECX, Mcasm::EDX, Mcasm::EBX,
                                       Mcasm::ESP, Mcasm::EBP, Mcasm::ESI, Mcasm::EDI};
    int Arity;
    if (MF.getInfo<McasmMachineFunctionInfo>()->getArgumentStackSize() > 0) {
      Arity = 7;
    } else {
      Arity = 0;
      for (const auto &LI : MF.getRegInfo().liveins()) {
        auto Reg = LI.first;
        if (Mcasm::GR8RegClass.contains(Reg) || Mcasm::GR16RegClass.contains(Reg) ||
            Mcasm::GR32RegClass.contains(Reg) ||
            Mcasm::GR64RegClass.contains(Reg)) {
          ++Arity;
        }
      }
    }
    DestReg = ArityToRegMap[Arity];
  }

  EmitAndCountInstruction(MCInstBuilder(Mcasm::MOV32ri)
                              .addReg(DestReg)
                              .addImm(MaskKCFIType(Type->getZExtValue())));

  if (MAI->hasDotTypeDotSizeDirective()) {
    MCSymbol *EndSym = OutContext.createTempSymbol("cfi_func_end");
    OutStreamer->emitLabel(EndSym);

    const MCExpr *SizeExp = MCBinaryExpr::createSub(
        MCSymbolRefExpr::create(EndSym, OutContext),
        MCSymbolRefExpr::create(FnSym, OutContext), OutContext);
    OutStreamer->emitELFSize(FnSym, SizeExp);
  }
}

/// PrintSymbolOperand - Print a raw symbol reference operand.  This handles
/// jump tables, constant pools, global address and external symbols, all of
/// which print to a label with various suffixes for relocation types etc.
void McasmAsmPrinter::PrintSymbolOperand(const MachineOperand &MO,
                                       raw_ostream &O) {
  switch (MO.getType()) {
  default: llvm_unreachable("unknown symbol type!");
  case MachineOperand::MO_ConstantPoolIndex:
    GetCPISymbol(MO.getIndex())->print(O, MAI);
    printOffset(MO.getOffset(), O);
    break;
  case MachineOperand::MO_GlobalAddress: {
    const GlobalValue *GV = MO.getGlobal();

    MCSymbol *GVSym;
    if (MO.getTargetFlags() == McasmII::MO_DARWIN_NONLAZY ||
        MO.getTargetFlags() == McasmII::MO_DARWIN_NONLAZY_PIC_BASE)
      GVSym = getSymbolWithGlobalValueBase(GV, "$non_lazy_ptr");
    else
      GVSym = getSymbolPreferLocal(*GV);

    // Handle dllimport linkage.
    if (MO.getTargetFlags() == McasmII::MO_DLLIMPORT)
      GVSym = OutContext.getOrCreateSymbol(Twine("__imp_") + GVSym->getName());
    else if (MO.getTargetFlags() == McasmII::MO_COFFSTUB)
      GVSym =
          OutContext.getOrCreateSymbol(Twine(".refptr.") + GVSym->getName());

    if (MO.getTargetFlags() == McasmII::MO_DARWIN_NONLAZY ||
        MO.getTargetFlags() == McasmII::MO_DARWIN_NONLAZY_PIC_BASE) {
      MCSymbol *Sym = getSymbolWithGlobalValueBase(GV, "$non_lazy_ptr");
      MachineModuleInfoImpl::StubValueTy &StubSym =
          MMI->getObjFileInfo<MachineModuleInfoMachO>().getGVStubEntry(Sym);
      if (!StubSym.getPointer())
        StubSym = MachineModuleInfoImpl::StubValueTy(getSymbol(GV),
                                                     !GV->hasInternalLinkage());
    }

    // If the name begins with a dollar-sign, enclose it in parens.  We do this
    // to avoid having it look like an integer immediate to the assembler.
    if (GVSym->getName()[0] != '$')
      GVSym->print(O, MAI);
    else {
      O << '(';
      GVSym->print(O, MAI);
      O << ')';
    }
    printOffset(MO.getOffset(), O);
    break;
  }
  }

  switch (MO.getTargetFlags()) {
  default:
    llvm_unreachable("Unknown target flag on GV operand");
  case McasmII::MO_NO_FLAG:    // No flag.
    break;
  case McasmII::MO_DARWIN_NONLAZY:
  case McasmII::MO_DLLIMPORT:
  case McasmII::MO_COFFSTUB:
    // These affect the name of the symbol, not any suffix.
    break;
  case McasmII::MO_GOT_ABSOLUTE_ADDRESS:
    O << " + [.-";
    MF->getPICBaseSymbol()->print(O, MAI);
    O << ']';
    break;
  case McasmII::MO_PIC_BASE_OFFSET:
  case McasmII::MO_DARWIN_NONLAZY_PIC_BASE:
    O << '-';
    MF->getPICBaseSymbol()->print(O, MAI);
    break;
  case McasmII::MO_TLSGD:     O << "@TLSGD";     break;
  case McasmII::MO_TLSLD:     O << "@TLSLD";     break;
  case McasmII::MO_TLSLDM:    O << "@TLSLDM";    break;
  case McasmII::MO_GOTTPOFF:  O << "@GOTTPOFF";  break;
  case McasmII::MO_INDNTPOFF: O << "@INDNTPOFF"; break;
  case McasmII::MO_TPOFF:     O << "@TPOFF";     break;
  case McasmII::MO_DTPOFF:    O << "@DTPOFF";    break;
  case McasmII::MO_NTPOFF:    O << "@NTPOFF";    break;
  case McasmII::MO_GOTNTPOFF: O << "@GOTNTPOFF"; break;
  case McasmII::MO_GOTPCREL:  O << "@GOTPCREL";  break;
  case McasmII::MO_GOTPCREL_NORELAX: O << "@GOTPCREL_NORELAX"; break;
  case McasmII::MO_GOT:       O << "@GOT";       break;
  case McasmII::MO_GOTOFF:    O << "@GOTOFF";    break;
  case McasmII::MO_PLT:       O << "@PLT";       break;
  case McasmII::MO_TLVP:      O << "@TLVP";      break;
  case McasmII::MO_TLVP_PIC_BASE:
    O << "@TLVP" << '-';
    MF->getPICBaseSymbol()->print(O, MAI);
    break;
  case McasmII::MO_SECREL:    O << "@SECREL32";  break;
  }
}

void McasmAsmPrinter::PrintOperand(const MachineInstr *MI, unsigned OpNo,
                                 raw_ostream &O) {
  const MachineOperand &MO = MI->getOperand(OpNo);
  const bool IsATT = MI->getInlineAsmDialect() == InlineAsm::AD_ATT;
  switch (MO.getType()) {
  default: llvm_unreachable("unknown operand type!");
  case MachineOperand::MO_Register: {
    if (IsATT)
      O << '%';
    O << McasmATTInstPrinter::getRegisterName(MO.getReg());
    return;
  }

  case MachineOperand::MO_Immediate:
    if (IsATT)
      O << '$';
    O << MO.getImm();
    return;

  case MachineOperand::MO_ConstantPoolIndex:
  case MachineOperand::MO_GlobalAddress: {
    switch (MI->getInlineAsmDialect()) {
    case InlineAsm::AD_ATT:
      O << '$';
      break;
    case InlineAsm::AD_Intel:
      O << "offset ";
      break;
    }
    PrintSymbolOperand(MO, O);
    break;
  }
  case MachineOperand::MO_BlockAddress: {
    MCSymbol *Sym = GetBlockAddressSymbol(MO.getBlockAddress());
    Sym->print(O, MAI);
    break;
  }
  }
}

/// PrintModifiedOperand - Print subregisters based on supplied modifier,
/// deferring to PrintOperand() if no modifier was supplied or if operand is not
/// a register.
void McasmAsmPrinter::PrintModifiedOperand(const MachineInstr *MI, unsigned OpNo,
                                         raw_ostream &O, StringRef Modifier) {
  const MachineOperand &MO = MI->getOperand(OpNo);
  if (Modifier.empty() || !MO.isReg())
    return PrintOperand(MI, OpNo, O);
  if (MI->getInlineAsmDialect() == InlineAsm::AD_ATT)
    O << '%';
  Register Reg = MO.getReg();
  if (Modifier.consume_front("subreg")) {
    unsigned Size = (Modifier == "64")   ? 64
                    : (Modifier == "32") ? 32
                    : (Modifier == "16") ? 16
                                         : 8;
    Reg = getMcasmSubSuperRegister(Reg, Size);
  }
  O << McasmATTInstPrinter::getRegisterName(Reg);
}

/// PrintPCRelImm - This is used to print an immediate value that ends up
/// being encoded as a pc-relative value.  These print slightly differently, for
/// example, a $ is not emitted.
void McasmAsmPrinter::PrintPCRelImm(const MachineInstr *MI, unsigned OpNo,
                                  raw_ostream &O) {
  const MachineOperand &MO = MI->getOperand(OpNo);
  switch (MO.getType()) {
  default: llvm_unreachable("Unknown pcrel immediate operand");
  case MachineOperand::MO_Register:
    // pc-relativeness was handled when computing the value in the reg.
    PrintOperand(MI, OpNo, O);
    return;
  case MachineOperand::MO_Immediate:
    O << MO.getImm();
    return;
  case MachineOperand::MO_GlobalAddress:
    PrintSymbolOperand(MO, O);
    return;
  }
}

void McasmAsmPrinter::PrintLeaMemReference(const MachineInstr *MI, unsigned OpNo,
                                         raw_ostream &O, StringRef Modifier) {
  const MachineOperand &BaseReg = MI->getOperand(OpNo + Mcasm::AddrBaseReg);
  const MachineOperand &IndexReg = MI->getOperand(OpNo + Mcasm::AddrIndexReg);
  const MachineOperand &DispSpec = MI->getOperand(OpNo + Mcasm::AddrDisp);

  // If we really don't want to print out (rip), don't.
  bool HasBaseReg = BaseReg.getReg() != 0;
  if (HasBaseReg && Modifier == "no-rip" && BaseReg.getReg() == Mcasm::RIP)
    HasBaseReg = false;

  // HasParenPart - True if we will print out the () part of the mem ref.
  bool HasParenPart = IndexReg.getReg() || HasBaseReg;

  switch (DispSpec.getType()) {
  default:
    llvm_unreachable("unknown operand type!");
  case MachineOperand::MO_Immediate: {
    int DispVal = DispSpec.getImm();
    if (DispVal || !HasParenPart)
      O << DispVal;
    break;
  }
  case MachineOperand::MO_GlobalAddress:
  case MachineOperand::MO_ConstantPoolIndex:
    PrintSymbolOperand(DispSpec, O);
    break;
  }

  if (Modifier == "H")
    O << "+8";

  if (HasParenPart) {
    assert(IndexReg.getReg() != Mcasm::ESP &&
           "Mcasm doesn't allow scaling by ESP");

    O << '(';
    if (HasBaseReg)
      PrintModifiedOperand(MI, OpNo + Mcasm::AddrBaseReg, O, Modifier);

    if (IndexReg.getReg()) {
      O << ',';
      PrintModifiedOperand(MI, OpNo + Mcasm::AddrIndexReg, O, Modifier);
      unsigned ScaleVal = MI->getOperand(OpNo + Mcasm::AddrScaleAmt).getImm();
      if (ScaleVal != 1)
        O << ',' << ScaleVal;
    }
    O << ')';
  }
}

static bool isSimpleReturn(const MachineInstr &MI) {
  // We exclude all tail calls here which set both isReturn and isCall.
  return MI.getDesc().isReturn() && !MI.getDesc().isCall();
}

static bool isIndirectBranchOrTailCall(const MachineInstr &MI) {
  unsigned Opc = MI.getOpcode();
  return MI.getDesc().isIndirectBranch() /*Make below code in a good shape*/ ||
         Opc == Mcasm::TAILJMPr || Opc == Mcasm::TAILJMPm ||
         Opc == Mcasm::TAILJMPr64 || Opc == Mcasm::TAILJMPm64 ||
         Opc == Mcasm::TCRETURNri || Opc == Mcasm::TCRETURN_WIN64ri ||
         Opc == Mcasm::TCRETURN_HIPE32ri || Opc == Mcasm::TCRETURNmi ||
         Opc == Mcasm::TCRETURN_WINmi64 || Opc == Mcasm::TCRETURNri64 ||
         Opc == Mcasm::TCRETURNmi64 || Opc == Mcasm::TCRETURNri64_ImpCall ||
         Opc == Mcasm::TAILJMPr64_REX || Opc == Mcasm::TAILJMPm64_REX;
}

void McasmAsmPrinter::emitBasicBlockEnd(const MachineBasicBlock &MBB) {
  if (Subtarget->hardenSlsRet() || Subtarget->hardenSlsIJmp()) {
    auto I = MBB.getLastNonDebugInstr();
    if (I != MBB.end()) {
      if ((Subtarget->hardenSlsRet() && isSimpleReturn(*I)) ||
          (Subtarget->hardenSlsIJmp() && isIndirectBranchOrTailCall(*I))) {
        MCInst TmpInst;
        TmpInst.setOpcode(Mcasm::INT3);
        EmitToStreamer(*OutStreamer, TmpInst);
      }
    }
  }
  if (SplitChainedAtEndOfBlock) {
    OutStreamer->emitWinCFISplitChained();
    // Splitting into a new unwind info implicitly starts a prolog. We have no
    // instructions to add to the prolog, so immediately end it.
    OutStreamer->emitWinCFIEndProlog();
    SplitChainedAtEndOfBlock = false;
  }
  AsmPrinter::emitBasicBlockEnd(MBB);
  SMShadowTracker.emitShadowPadding(*OutStreamer, getSubtargetInfo());
}

void McasmAsmPrinter::PrintMemReference(const MachineInstr *MI, unsigned OpNo,
                                      raw_ostream &O, StringRef Modifier) {
  assert(isMem(*MI, OpNo) && "Invalid memory reference!");
  const MachineOperand &Segment = MI->getOperand(OpNo + Mcasm::AddrSegmentReg);
  if (Segment.getReg()) {
    PrintModifiedOperand(MI, OpNo + Mcasm::AddrSegmentReg, O, Modifier);
    O << ':';
  }
  PrintLeaMemReference(MI, OpNo, O, Modifier);
}

void McasmAsmPrinter::PrintIntelMemReference(const MachineInstr *MI,
                                           unsigned OpNo, raw_ostream &O,
                                           StringRef Modifier) {
  const MachineOperand &BaseReg = MI->getOperand(OpNo + Mcasm::AddrBaseReg);
  unsigned ScaleVal = MI->getOperand(OpNo + Mcasm::AddrScaleAmt).getImm();
  const MachineOperand &IndexReg = MI->getOperand(OpNo + Mcasm::AddrIndexReg);
  const MachineOperand &DispSpec = MI->getOperand(OpNo + Mcasm::AddrDisp);
  const MachineOperand &SegReg = MI->getOperand(OpNo + Mcasm::AddrSegmentReg);

  // If we really don't want to print out (rip), don't.
  bool HasBaseReg = BaseReg.getReg() != 0;
  if (HasBaseReg && Modifier == "no-rip" && BaseReg.getReg() == Mcasm::RIP)
    HasBaseReg = false;

  // If we really just want to print out displacement.
  if ((DispSpec.isGlobal() || DispSpec.isSymbol()) && Modifier == "disp-only") {
    HasBaseReg = false;
  }

  // If this has a segment register, print it.
  if (SegReg.getReg()) {
    PrintOperand(MI, OpNo + Mcasm::AddrSegmentReg, O);
    O << ':';
  }

  O << '[';

  bool NeedPlus = false;
  if (HasBaseReg) {
    PrintOperand(MI, OpNo + Mcasm::AddrBaseReg, O);
    NeedPlus = true;
  }

  if (IndexReg.getReg()) {
    if (NeedPlus) O << " + ";
    if (ScaleVal != 1)
      O << ScaleVal << '*';
    PrintOperand(MI, OpNo + Mcasm::AddrIndexReg, O);
    NeedPlus = true;
  }

  if (!DispSpec.isImm()) {
    if (NeedPlus) O << " + ";
    // Do not add `offset` operator. Matches the behaviour of
    // McasmIntelInstPrinter::printMemReference.
    PrintSymbolOperand(DispSpec, O);
  } else {
    int64_t DispVal = DispSpec.getImm();
    if (DispVal || (!IndexReg.getReg() && !HasBaseReg)) {
      if (NeedPlus) {
        if (DispVal > 0)
          O << " + ";
        else {
          O << " - ";
          DispVal = -DispVal;
        }
      }
      O << DispVal;
    }
  }
  O << ']';
}

const MCSubtargetInfo *McasmAsmPrinter::getIFuncMCSubtargetInfo() const {
  assert(Subtarget);
  return Subtarget;
}

void McasmAsmPrinter::emitMachOIFuncStubBody(Module &M, const GlobalIFunc &GI,
                                           MCSymbol *LazyPointer) {
  // _ifunc:
  //   jmpq *lazy_pointer(%rip)

  OutStreamer->emitInstruction(
      MCInstBuilder(Mcasm::JMP32m)
          .addReg(Mcasm::RIP)
          .addImm(1)
          .addReg(0)
          .addOperand(MCOperand::createExpr(
              MCSymbolRefExpr::create(LazyPointer, OutContext)))
          .addReg(0),
      *Subtarget);
}

void McasmAsmPrinter::emitMachOIFuncStubHelperBody(Module &M,
                                                 const GlobalIFunc &GI,
                                                 MCSymbol *LazyPointer) {
  // _ifunc.stub_helper:
  //   push %rax
  //   push %rdi
  //   push %rsi
  //   push %rdx
  //   push %rcx
  //   push %r8
  //   push %r9
  //   callq foo
  //   movq %rax,lazy_pointer(%rip)
  //   pop %r9
  //   pop %r8
  //   pop %rcx
  //   pop %rdx
  //   pop %rsi
  //   pop %rdi
  //   pop %rax
  //   jmpq *lazy_pointer(%rip)

  for (int Reg :
       {Mcasm::RAX, Mcasm::RDI, Mcasm::RSI, Mcasm::RDX, Mcasm::RCX, Mcasm::R8, Mcasm::R9})
    OutStreamer->emitInstruction(MCInstBuilder(Mcasm::PUSH64r).addReg(Reg),
                                 *Subtarget);

  OutStreamer->emitInstruction(
      MCInstBuilder(Mcasm::CALL64pcrel32)
          .addOperand(MCOperand::createExpr(lowerConstant(GI.getResolver()))),
      *Subtarget);

  OutStreamer->emitInstruction(
      MCInstBuilder(Mcasm::MOV64mr)
          .addReg(Mcasm::RIP)
          .addImm(1)
          .addReg(0)
          .addOperand(MCOperand::createExpr(
              MCSymbolRefExpr::create(LazyPointer, OutContext)))
          .addReg(0)
          .addReg(Mcasm::RAX),
      *Subtarget);

  for (int Reg :
       {Mcasm::R9, Mcasm::R8, Mcasm::RCX, Mcasm::RDX, Mcasm::RSI, Mcasm::RDI, Mcasm::RAX})
    OutStreamer->emitInstruction(MCInstBuilder(Mcasm::POP64r).addReg(Reg),
                                 *Subtarget);

  OutStreamer->emitInstruction(
      MCInstBuilder(Mcasm::JMP32m)
          .addReg(Mcasm::RIP)
          .addImm(1)
          .addReg(0)
          .addOperand(MCOperand::createExpr(
              MCSymbolRefExpr::create(LazyPointer, OutContext)))
          .addReg(0),
      *Subtarget);
}

static bool printAsmMRegister(const McasmAsmPrinter &P, const MachineOperand &MO,
                              char Mode, raw_ostream &O) {
  Register Reg = MO.getReg();
  bool EmitPercent = MO.getParent()->getInlineAsmDialect() == InlineAsm::AD_ATT;

  if (!Mcasm::GR8RegClass.contains(Reg) &&
      !Mcasm::GR16RegClass.contains(Reg) &&
      !Mcasm::GR32RegClass.contains(Reg) &&
      !Mcasm::GR64RegClass.contains(Reg))
    return true;

  switch (Mode) {
  default: return true;  // Unknown mode.
  case 'b': // Print QImode register
    Reg = getMcasmSubSuperRegister(Reg, 8);
    break;
  case 'h': // Print QImode high register
    Reg = getMcasmSubSuperRegister(Reg, 8, true);
    if (!Reg.isValid())
      return true;
    break;
  case 'w': // Print HImode register
    Reg = getMcasmSubSuperRegister(Reg, 16);
    break;
  case 'k': // Print SImode register
    Reg = getMcasmSubSuperRegister(Reg, 32);
    break;
  case 'V':
    EmitPercent = false;
    [[fallthrough]];
  case 'q':
    // Print 64-bit register names if 64-bit integer registers are available.
    // Otherwise, print 32-bit register names.
    Reg = getMcasmSubSuperRegister(Reg, P.getSubtarget().is64Bit() ? 64 : 32);
    break;
  }

  if (EmitPercent)
    O << '%';

  O << McasmATTInstPrinter::getRegisterName(Reg);
  return false;
}

static bool printAsmVRegister(const MachineOperand &MO, char Mode,
                              raw_ostream &O) {
  Register Reg = MO.getReg();
  bool EmitPercent = MO.getParent()->getInlineAsmDialect() == InlineAsm::AD_ATT;

  unsigned Index;
  if (Mcasm::VR128XRegClass.contains(Reg))
    Index = Reg - Mcasm::XMM0;
  else if (Mcasm::VR256XRegClass.contains(Reg))
    Index = Reg - Mcasm::YMM0;
  else if (Mcasm::VR512RegClass.contains(Reg))
    Index = Reg - Mcasm::ZMM0;
  else
    return true;

  switch (Mode) {
  default: // Unknown mode.
    return true;
  case 'x': // Print V4SFmode register
    Reg = Mcasm::XMM0 + Index;
    break;
  case 't': // Print V8SFmode register
    Reg = Mcasm::YMM0 + Index;
    break;
  case 'g': // Print V16SFmode register
    Reg = Mcasm::ZMM0 + Index;
    break;
  }

  if (EmitPercent)
    O << '%';

  O << McasmATTInstPrinter::getRegisterName(Reg);
  return false;
}

/// PrintAsmOperand - Print out an operand for an inline asm expression.
///
bool McasmAsmPrinter::PrintAsmOperand(const MachineInstr *MI, unsigned OpNo,
                                    const char *ExtraCode, raw_ostream &O) {
  // Does this asm operand have a single letter operand modifier?
  if (ExtraCode && ExtraCode[0]) {
    if (ExtraCode[1] != 0) return true; // Unknown modifier.

    const MachineOperand &MO = MI->getOperand(OpNo);

    switch (ExtraCode[0]) {
    default:
      // See if this is a generic print operand
      return AsmPrinter::PrintAsmOperand(MI, OpNo, ExtraCode, O);
    case 'a': // This is an address.  Currently only 'i' and 'r' are expected.
      switch (MO.getType()) {
      default:
        return true;
      case MachineOperand::MO_Immediate:
        O << MO.getImm();
        return false;
      case MachineOperand::MO_ConstantPoolIndex:
      case MachineOperand::MO_JumpTableIndex:
      case MachineOperand::MO_ExternalSymbol:
        llvm_unreachable("unexpected operand type!");
      case MachineOperand::MO_GlobalAddress:
        PrintSymbolOperand(MO, O);
        if (Subtarget->is64Bit())
          O << "(%rip)";
        return false;
      case MachineOperand::MO_Register:
        O << '(';
        PrintOperand(MI, OpNo, O);
        O << ')';
        return false;
      }

    case 'c': // Don't print "$" before a global var name or constant.
      switch (MO.getType()) {
      default:
        PrintOperand(MI, OpNo, O);
        break;
      case MachineOperand::MO_Immediate:
        O << MO.getImm();
        break;
      case MachineOperand::MO_ConstantPoolIndex:
      case MachineOperand::MO_JumpTableIndex:
      case MachineOperand::MO_ExternalSymbol:
        llvm_unreachable("unexpected operand type!");
      case MachineOperand::MO_GlobalAddress:
        PrintSymbolOperand(MO, O);
        break;
      }
      return false;

    case 'A': // Print '*' before a register (it must be a register)
      if (MO.isReg()) {
        O << '*';
        PrintOperand(MI, OpNo, O);
        return false;
      }
      return true;

    case 'b': // Print QImode register
    case 'h': // Print QImode high register
    case 'w': // Print HImode register
    case 'k': // Print SImode register
    case 'q': // Print DImode register
    case 'V': // Print native register without '%'
      if (MO.isReg())
        return printAsmMRegister(*this, MO, ExtraCode[0], O);
      PrintOperand(MI, OpNo, O);
      return false;

    case 'x': // Print V4SFmode register
    case 't': // Print V8SFmode register
    case 'g': // Print V16SFmode register
      if (MO.isReg())
        return printAsmVRegister(MO, ExtraCode[0], O);
      PrintOperand(MI, OpNo, O);
      return false;

    case 'p': {
      const MachineOperand &MO = MI->getOperand(OpNo);
      if (MO.getType() != MachineOperand::MO_GlobalAddress)
        return true;
      PrintSymbolOperand(MO, O);
      return false;
    }

    case 'P': // This is the operand of a call, treat specially.
      PrintPCRelImm(MI, OpNo, O);
      return false;

    case 'n': // Negate the immediate or print a '-' before the operand.
      // Note: this is a temporary solution. It should be handled target
      // independently as part of the 'MC' work.
      if (MO.isImm()) {
        O << -MO.getImm();
        return false;
      }
      O << '-';
    }
  }

  PrintOperand(MI, OpNo, O);
  return false;
}

bool McasmAsmPrinter::PrintAsmMemoryOperand(const MachineInstr *MI, unsigned OpNo,
                                          const char *ExtraCode,
                                          raw_ostream &O) {
  if (ExtraCode && ExtraCode[0]) {
    if (ExtraCode[1] != 0) return true; // Unknown modifier.

    switch (ExtraCode[0]) {
    default: return true;  // Unknown modifier.
    case 'b': // Print QImode register
    case 'h': // Print QImode high register
    case 'w': // Print HImode register
    case 'k': // Print SImode register
    case 'q': // Print SImode register
      // These only apply to registers, ignore on mem.
      break;
    case 'H':
      if (MI->getInlineAsmDialect() == InlineAsm::AD_Intel) {
        return true;  // Unsupported modifier in Intel inline assembly.
      } else {
        PrintMemReference(MI, OpNo, O, "H");
      }
      return false;
   // Print memory only with displacement. The Modifer 'P' is used in inline
   // asm to present a call symbol or a global symbol which can not use base
   // reg or index reg.
    case 'P':
      if (MI->getInlineAsmDialect() == InlineAsm::AD_Intel) {
        PrintIntelMemReference(MI, OpNo, O, "disp-only");
      } else {
        PrintMemReference(MI, OpNo, O, "disp-only");
      }
      return false;
    }
  }
  if (MI->getInlineAsmDialect() == InlineAsm::AD_Intel) {
    PrintIntelMemReference(MI, OpNo, O);
  } else {
    PrintMemReference(MI, OpNo, O);
  }
  return false;
}

void McasmAsmPrinter::emitStartOfAsmFile(Module &M) {
  const Triple &TT = TM.getTargetTriple();

  if (TT.isOSBinFormatELF()) {
    // Assemble feature flags that may require creation of a note section.
    unsigned FeatureFlagsAnd = 0;
    if (M.getModuleFlag("cf-protection-branch"))
      FeatureFlagsAnd |= ELF::GNU_PROPERTY_Mcasm_FEATURE_1_IBT;
    if (M.getModuleFlag("cf-protection-return"))
      FeatureFlagsAnd |= ELF::GNU_PROPERTY_Mcasm_FEATURE_1_SHSTK;

    if (FeatureFlagsAnd) {
      // Emit a .note.gnu.property section with the flags.
      assert((TT.isMcasm_32() || TT.isMcasm_64()) &&
             "CFProtection used on invalid architecture!");
      MCSection *Cur = OutStreamer->getCurrentSectionOnly();
      MCSection *Nt = MMI->getContext().getELFSection(
          ".note.gnu.property", ELF::SHT_NOTE, ELF::SHF_ALLOC);
      OutStreamer->switchSection(Nt);

      // Emitting note header.
      const int WordSize = TT.isMcasm_64() && !TT.isX32() ? 8 : 4;
      emitAlignment(WordSize == 4 ? Align(4) : Align(8));
      OutStreamer->emitIntValue(4, 4 /*size*/); // data size for "GNU\0"
      OutStreamer->emitIntValue(8 + WordSize, 4 /*size*/); // Elf_Prop size
      OutStreamer->emitIntValue(ELF::NT_GNU_PROPERTY_TYPE_0, 4 /*size*/);
      OutStreamer->emitBytes(StringRef("GNU", 4)); // note name

      // Emitting an Elf_Prop for the CET properties.
      OutStreamer->emitInt32(ELF::GNU_PROPERTY_Mcasm_FEATURE_1_AND);
      OutStreamer->emitInt32(4);                          // data size
      OutStreamer->emitInt32(FeatureFlagsAnd);            // data
      emitAlignment(WordSize == 4 ? Align(4) : Align(8)); // padding

      OutStreamer->switchSection(Cur);
    }
  }

  if (TT.isOSBinFormatMachO())
    OutStreamer->switchSection(getObjFileLowering().getTextSection());

  if (TT.isOSBinFormatCOFF()) {
    emitCOFFFeatureSymbol(M);
    emitCOFFReplaceableFunctionData(M);

    if (M.getModuleFlag("import-call-optimization"))
      EnableImportCallOptimization = true;
  }

  // TODO: Support prefixed registers for the Intel syntax.
  const bool IntelSyntax = MAI->getAssemblerDialect() == InlineAsm::AD_Intel;
  OutStreamer->emitSyntaxDirective(IntelSyntax ? "intel" : "att",
                                   IntelSyntax ? "noprefix" : "");

  // If this is not inline asm and we're in 16-bit
  // mode prefix assembly with .code16.
  bool is16 = TT.getEnvironment() == Triple::CODE16;
  if (M.getModuleInlineAsm().empty() && is16) {
    auto *XTS =
        static_cast<McasmTargetStreamer *>(OutStreamer->getTargetStreamer());
    XTS->emitCode16();
  }
}

static void
emitNonLazySymbolPointer(MCStreamer &OutStreamer, MCSymbol *StubLabel,
                         MachineModuleInfoImpl::StubValueTy &MCSym) {
  // L_foo$stub:
  OutStreamer.emitLabel(StubLabel);
  //   .indirect_symbol _foo
  OutStreamer.emitSymbolAttribute(MCSym.getPointer(), MCSA_IndirectSymbol);

  if (MCSym.getInt())
    // External to current translation unit.
    OutStreamer.emitIntValue(0, 4/*size*/);
  else
    // Internal to current translation unit.
    //
    // When we place the LSDA into the TEXT section, the type info
    // pointers need to be indirect and pc-rel. We accomplish this by
    // using NLPs; however, sometimes the types are local to the file.
    // We need to fill in the value for the NLP in those cases.
    OutStreamer.emitValue(
        MCSymbolRefExpr::create(MCSym.getPointer(), OutStreamer.getContext()),
        4 /*size*/);
}

static void emitNonLazyStubs(MachineModuleInfo *MMI, MCStreamer &OutStreamer) {

  MachineModuleInfoMachO &MMIMacho =
      MMI->getObjFileInfo<MachineModuleInfoMachO>();

  // Output stubs for dynamically-linked functions.
  MachineModuleInfoMachO::SymbolListTy Stubs;

  // Output stubs for external and common global variables.
  Stubs = MMIMacho.GetGVStubList();
  if (!Stubs.empty()) {
    OutStreamer.switchSection(MMI->getContext().getMachOSection(
        "__IMPORT", "__pointers", MachO::S_NON_LAZY_SYMBOL_POINTERS,
        SectionKind::getMetadata()));

    for (auto &Stub : Stubs)
      emitNonLazySymbolPointer(OutStreamer, Stub.first, Stub.second);

    Stubs.clear();
    OutStreamer.addBlankLine();
  }
}

/// True if this module is being built for windows/msvc, and uses floating
/// point. This is used to emit an undefined reference to _fltused. This is
/// needed in Windows kernel or driver contexts to find and prevent code from
/// modifying non-GPR registers.
///
/// TODO: It would be better if this was computed from MIR by looking for
/// selected floating-point instructions.
static bool usesMSVCFloatingPoint(const Triple &TT, const Module &M) {
  // Only needed for MSVC
  if (!TT.isWindowsMSVCEnvironment())
    return false;

  for (const Function &F : M) {
    for (const Instruction &I : instructions(F)) {
      if (I.getType()->isFloatingPointTy())
        return true;

      for (const auto &Op : I.operands()) {
        if (Op->getType()->isFloatingPointTy())
          return true;
      }
    }
  }

  return false;
}

void McasmAsmPrinter::emitEndOfAsmFile(Module &M) {
  const Triple &TT = TM.getTargetTriple();

  if (TT.isOSBinFormatMachO()) {
    // Mach-O uses non-lazy symbol stubs to encode per-TU information into
    // global table for symbol lookup.
    emitNonLazyStubs(MMI, *OutStreamer);

    // Emit fault map information.
    FM.serializeToFaultMapSection();

    // This flag tells the linker that no global symbols contain code that fall
    // through to other global symbols (e.g. an implementation of multiple entry
    // points). If this doesn't occur, the linker can safely perform dead code
    // stripping. Since LLVM never generates code that does this, it is always
    // safe to set.
    OutStreamer->emitSubsectionsViaSymbols();
  } else if (TT.isOSBinFormatCOFF()) {
    // If import call optimization is enabled, emit the appropriate section.
    // We do this whether or not we recorded any items.
    if (EnableImportCallOptimization) {
      OutStreamer->switchSection(getObjFileLowering().getImportCallSection());

      // Section always starts with some magic.
      constexpr char ImpCallMagic[12] = "RetpolineV1";
      OutStreamer->emitBytes(StringRef{ImpCallMagic, sizeof(ImpCallMagic)});

      // Layout of this section is:
      // Per section that contains an item to record:
      //  uint32_t SectionSize: Size in bytes for information in this section.
      //  uint32_t Section Number
      //  Per call to imported function in section:
      //    uint32_t Kind: the kind of item.
      //    uint32_t InstOffset: the offset of the instr in its parent section.
      for (auto &[Section, CallsToImportedFuncs] :
           SectionToImportedFunctionCalls) {
        unsigned SectionSize =
            sizeof(uint32_t) * (2 + 2 * CallsToImportedFuncs.size());
        OutStreamer->emitInt32(SectionSize);
        OutStreamer->emitCOFFSecNumber(Section->getBeginSymbol());
        for (auto &[CallsiteSymbol, Kind] : CallsToImportedFuncs) {
          OutStreamer->emitInt32(Kind);
          OutStreamer->emitCOFFSecOffset(CallsiteSymbol);
        }
      }
    }

    if (usesMSVCFloatingPoint(TT, M)) {
      // In Windows' libcmt.lib, there is a file which is linked in only if the
      // symbol _fltused is referenced. Linking this in causes some
      // side-effects:
      //
      // 1. For x86-32, it will set the x87 rounding mode to 53-bit instead of
      // 64-bit mantissas at program start.
      //
      // 2. It links in support routines for floating-point in scanf and printf.
      //
      // MSVC emits an undefined reference to _fltused when there are any
      // floating point operations in the program (including calls). A program
      // that only has: `scanf("%f", &global_float);` may fail to trigger this,
      // but oh well...that's a documented issue.
      StringRef SymbolName =
          (TT.getArch() == Triple::x86) ? "__fltused" : "_fltused";
      MCSymbol *S = MMI->getContext().getOrCreateSymbol(SymbolName);
      OutStreamer->emitSymbolAttribute(S, MCSA_Global);
      return;
    }
  } else if (TT.isOSBinFormatELF()) {
    FM.serializeToFaultMapSection();
  }

  // Emit __morestack address if needed for indirect calls.
  if (TT.isMcasm_64() && TM.getCodeModel() == CodeModel::Large) {
    if (MCSymbol *AddrSymbol = OutContext.lookupSymbol("__morestack_addr")) {
      Align Alignment(1);
      MCSection *ReadOnlySection = getObjFileLowering().getSectionForConstant(
          getDataLayout(), SectionKind::getReadOnly(),
          /*C=*/nullptr, Alignment);
      OutStreamer->switchSection(ReadOnlySection);
      OutStreamer->emitLabel(AddrSymbol);

      unsigned PtrSize = MAI->getCodePointerSize();
      OutStreamer->emitSymbolValue(GetExternalSymbolSymbol("__morestack"),
                                   PtrSize);
    }
  }
}

char McasmAsmPrinter::ID = 0;

INITIALIZE_PASS(McasmAsmPrinter, "x86-asm-printer", "Mcasm Assembly Printer", false,
                false)

//===----------------------------------------------------------------------===//
// Target Registry Stuff
//===----------------------------------------------------------------------===//

// Force static initialization.
extern "C" LLVM_C_ABI void LLVMInitializeMcasmAsmPrinter() {
  RegisterAsmPrinter<McasmAsmPrinter> X(getTheMcasm_32Target());
  RegisterAsmPrinter<McasmAsmPrinter> Y(getTheMcasm_64Target());
}
