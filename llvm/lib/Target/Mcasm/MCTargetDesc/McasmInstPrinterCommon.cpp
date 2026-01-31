//===--- McasmInstPrinterCommon.cpp - Mcasm assembly instruction printing -----===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file includes common code for rendering MCInst instances as Intel-style
// and Intel-style assembly.
//
//===----------------------------------------------------------------------===//

#include "McasmInstPrinterCommon.h"
#include "McasmBaseInfo.h"
#include "llvm/MC/MCAsmInfo.h"
#include "llvm/MC/MCExpr.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCInstrDesc.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/MC/MCSubtargetInfo.h"
#include "llvm/Support/Casting.h"
#include "llvm/Support/raw_ostream.h"
#include <cassert>
#include <cstdint>

using namespace llvm;

void McasmInstPrinterCommon::printExprOperand(raw_ostream &OS, const MCExpr &E) {
  MAI.printExpr(OS, E);
}

void McasmInstPrinterCommon::printCondCode(const MCInst *MI, unsigned Op,
                                         raw_ostream &O) {
  int64_t Imm = MI->getOperand(Op).getImm();
  unsigned Opc = MI->getOpcode();
  bool IsCCMPOrCTEST = Mcasm::isCCMPCC(Opc) || Mcasm::isCTESTCC(Opc);

  // clang-format off
  switch (Imm) {
  default: llvm_unreachable("Invalid condcode argument!");
  case    0: O << "o";  break;
  case    1: O << "no"; break;
  case    2: O << "b";  break;
  case    3: O << "ae"; break;
  case    4: O << "e";  break;
  case    5: O << "ne"; break;
  case    6: O << "be"; break;
  case    7: O << "a";  break;
  case    8: O << "s";  break;
  case    9: O << "ns"; break;
  case  0xa: O << (IsCCMPOrCTEST ? "t" : "p");  break;
  case  0xb: O << (IsCCMPOrCTEST ? "f" : "np"); break;
  case  0xc: O << "l";  break;
  case  0xd: O << "ge"; break;
  case  0xe: O << "le"; break;
  case  0xf: O << "g";  break;
  }
  // clang-format on
}

void McasmInstPrinterCommon::printCondFlags(const MCInst *MI, unsigned Op,
                                          raw_ostream &O) {
  // +----+----+----+----+
  // | OF | SF | ZF | CF |
  // +----+----+----+----+
  int64_t Imm = MI->getOperand(Op).getImm();
  assert(Imm >= 0 && Imm < 16 && "Invalid condition flags");
  O << "{dfv=";
  std::string Flags;
  if (Imm & 0x8)
    Flags += "of,";
  if (Imm & 0x4)
    Flags += "sf,";
  if (Imm & 0x2)
    Flags += "zf,";
  if (Imm & 0x1)
    Flags += "cf,";
  StringRef SimplifiedFlags = StringRef(Flags).rtrim(",");
  O << SimplifiedFlags << "}";
}

void McasmInstPrinterCommon::printSSEAVXCC(const MCInst *MI, unsigned Op,
                                         raw_ostream &O) {
  int64_t Imm = MI->getOperand(Op).getImm();
  switch (Imm) {
  default: llvm_unreachable("Invalid ssecc/avxcc argument!");
  case    0: O << "eq"; break;
  case    1: O << "lt"; break;
  case    2: O << "le"; break;
  case    3: O << "unord"; break;
  case    4: O << "neq"; break;
  case    5: O << "nlt"; break;
  case    6: O << "nle"; break;
  case    7: O << "ord"; break;
  case    8: O << "eq_uq"; break;
  case    9: O << "nge"; break;
  case  0xa: O << "ngt"; break;
  case  0xb: O << "false"; break;
  case  0xc: O << "neq_oq"; break;
  case  0xd: O << "ge"; break;
  case  0xe: O << "gt"; break;
  case  0xf: O << "true"; break;
  case 0x10: O << "eq_os"; break;
  case 0x11: O << "lt_oq"; break;
  case 0x12: O << "le_oq"; break;
  case 0x13: O << "unord_s"; break;
  case 0x14: O << "neq_us"; break;
  case 0x15: O << "nlt_uq"; break;
  case 0x16: O << "nle_uq"; break;
  case 0x17: O << "ord_s"; break;
  case 0x18: O << "eq_us"; break;
  case 0x19: O << "nge_uq"; break;
  case 0x1a: O << "ngt_uq"; break;
  case 0x1b: O << "false_os"; break;
  case 0x1c: O << "neq_os"; break;
  case 0x1d: O << "ge_oq"; break;
  case 0x1e: O << "gt_oq"; break;
  case 0x1f: O << "true_us"; break;
  }
}

void McasmInstPrinterCommon::printVPCOMMnemonic(const MCInst *MI,
                                              raw_ostream &OS) {
  OS << "vpcom";

  int64_t Imm = MI->getOperand(MI->getNumOperands() - 1).getImm();
  switch (Imm) {
  default: llvm_unreachable("Invalid vpcom argument!");
  case 0: OS << "lt"; break;
  case 1: OS << "le"; break;
  case 2: OS << "gt"; break;
  case 3: OS << "ge"; break;
  case 4: OS << "eq"; break;
  case 5: OS << "neq"; break;
  case 6: OS << "false"; break;
  case 7: OS << "true"; break;
  }

  switch (MI->getOpcode()) {
  default: llvm_unreachable("Unexpected opcode!");
  case Mcasm::VPCOMBmi:  case Mcasm::VPCOMBri:  OS << "b\t";  break;
  case Mcasm::VPCOMDmi:  case Mcasm::VPCOMDri:  OS << "d\t";  break;
  case Mcasm::VPCOMQmi:  case Mcasm::VPCOMQri:  OS << "q\t";  break;
  case Mcasm::VPCOMUBmi: case Mcasm::VPCOMUBri: OS << "ub\t"; break;
  case Mcasm::VPCOMUDmi: case Mcasm::VPCOMUDri: OS << "ud\t"; break;
  case Mcasm::VPCOMUQmi: case Mcasm::VPCOMUQri: OS << "uq\t"; break;
  case Mcasm::VPCOMUWmi: case Mcasm::VPCOMUWri: OS << "uw\t"; break;
  case Mcasm::VPCOMWmi:  case Mcasm::VPCOMWri:  OS << "w\t";  break;
  }
}

void McasmInstPrinterCommon::printVPCMPMnemonic(const MCInst *MI,
                                              raw_ostream &OS) {
  OS << "vpcmp";

  printSSEAVXCC(MI, MI->getNumOperands() - 1, OS);

  switch (MI->getOpcode()) {
  default: llvm_unreachable("Unexpected opcode!");
  case Mcasm::VPCMPBZ128rmi:  case Mcasm::VPCMPBZ128rri:
  case Mcasm::VPCMPBZ256rmi:  case Mcasm::VPCMPBZ256rri:
  case Mcasm::VPCMPBZrmi:     case Mcasm::VPCMPBZrri:
  case Mcasm::VPCMPBZ128rmik: case Mcasm::VPCMPBZ128rrik:
  case Mcasm::VPCMPBZ256rmik: case Mcasm::VPCMPBZ256rrik:
  case Mcasm::VPCMPBZrmik:    case Mcasm::VPCMPBZrrik:
    OS << "b\t";
    break;
  case Mcasm::VPCMPDZ128rmi:  case Mcasm::VPCMPDZ128rri:
  case Mcasm::VPCMPDZ256rmi:  case Mcasm::VPCMPDZ256rri:
  case Mcasm::VPCMPDZrmi:     case Mcasm::VPCMPDZrri:
  case Mcasm::VPCMPDZ128rmik: case Mcasm::VPCMPDZ128rrik:
  case Mcasm::VPCMPDZ256rmik: case Mcasm::VPCMPDZ256rrik:
  case Mcasm::VPCMPDZrmik:    case Mcasm::VPCMPDZrrik:
  case Mcasm::VPCMPDZ128rmbi: case Mcasm::VPCMPDZ128rmbik:
  case Mcasm::VPCMPDZ256rmbi: case Mcasm::VPCMPDZ256rmbik:
  case Mcasm::VPCMPDZrmbi:    case Mcasm::VPCMPDZrmbik:
    OS << "d\t";
    break;
  case Mcasm::VPCMPQZ128rmi:  case Mcasm::VPCMPQZ128rri:
  case Mcasm::VPCMPQZ256rmi:  case Mcasm::VPCMPQZ256rri:
  case Mcasm::VPCMPQZrmi:     case Mcasm::VPCMPQZrri:
  case Mcasm::VPCMPQZ128rmik: case Mcasm::VPCMPQZ128rrik:
  case Mcasm::VPCMPQZ256rmik: case Mcasm::VPCMPQZ256rrik:
  case Mcasm::VPCMPQZrmik:    case Mcasm::VPCMPQZrrik:
  case Mcasm::VPCMPQZ128rmbi: case Mcasm::VPCMPQZ128rmbik:
  case Mcasm::VPCMPQZ256rmbi: case Mcasm::VPCMPQZ256rmbik:
  case Mcasm::VPCMPQZrmbi:    case Mcasm::VPCMPQZrmbik:
    OS << "q\t";
    break;
  case Mcasm::VPCMPUBZ128rmi:  case Mcasm::VPCMPUBZ128rri:
  case Mcasm::VPCMPUBZ256rmi:  case Mcasm::VPCMPUBZ256rri:
  case Mcasm::VPCMPUBZrmi:     case Mcasm::VPCMPUBZrri:
  case Mcasm::VPCMPUBZ128rmik: case Mcasm::VPCMPUBZ128rrik:
  case Mcasm::VPCMPUBZ256rmik: case Mcasm::VPCMPUBZ256rrik:
  case Mcasm::VPCMPUBZrmik:    case Mcasm::VPCMPUBZrrik:
    OS << "ub\t";
    break;
  case Mcasm::VPCMPUDZ128rmi:  case Mcasm::VPCMPUDZ128rri:
  case Mcasm::VPCMPUDZ256rmi:  case Mcasm::VPCMPUDZ256rri:
  case Mcasm::VPCMPUDZrmi:     case Mcasm::VPCMPUDZrri:
  case Mcasm::VPCMPUDZ128rmik: case Mcasm::VPCMPUDZ128rrik:
  case Mcasm::VPCMPUDZ256rmik: case Mcasm::VPCMPUDZ256rrik:
  case Mcasm::VPCMPUDZrmik:    case Mcasm::VPCMPUDZrrik:
  case Mcasm::VPCMPUDZ128rmbi: case Mcasm::VPCMPUDZ128rmbik:
  case Mcasm::VPCMPUDZ256rmbi: case Mcasm::VPCMPUDZ256rmbik:
  case Mcasm::VPCMPUDZrmbi:    case Mcasm::VPCMPUDZrmbik:
    OS << "ud\t";
    break;
  case Mcasm::VPCMPUQZ128rmi:  case Mcasm::VPCMPUQZ128rri:
  case Mcasm::VPCMPUQZ256rmi:  case Mcasm::VPCMPUQZ256rri:
  case Mcasm::VPCMPUQZrmi:     case Mcasm::VPCMPUQZrri:
  case Mcasm::VPCMPUQZ128rmik: case Mcasm::VPCMPUQZ128rrik:
  case Mcasm::VPCMPUQZ256rmik: case Mcasm::VPCMPUQZ256rrik:
  case Mcasm::VPCMPUQZrmik:    case Mcasm::VPCMPUQZrrik:
  case Mcasm::VPCMPUQZ128rmbi: case Mcasm::VPCMPUQZ128rmbik:
  case Mcasm::VPCMPUQZ256rmbi: case Mcasm::VPCMPUQZ256rmbik:
  case Mcasm::VPCMPUQZrmbi:    case Mcasm::VPCMPUQZrmbik:
    OS << "uq\t";
    break;
  case Mcasm::VPCMPUWZ128rmi:  case Mcasm::VPCMPUWZ128rri:
  case Mcasm::VPCMPUWZ256rri:  case Mcasm::VPCMPUWZ256rmi:
  case Mcasm::VPCMPUWZrmi:     case Mcasm::VPCMPUWZrri:
  case Mcasm::VPCMPUWZ128rmik: case Mcasm::VPCMPUWZ128rrik:
  case Mcasm::VPCMPUWZ256rrik: case Mcasm::VPCMPUWZ256rmik:
  case Mcasm::VPCMPUWZrmik:    case Mcasm::VPCMPUWZrrik:
    OS << "uw\t";
    break;
  case Mcasm::VPCMPWZ128rmi:  case Mcasm::VPCMPWZ128rri:
  case Mcasm::VPCMPWZ256rmi:  case Mcasm::VPCMPWZ256rri:
  case Mcasm::VPCMPWZrmi:     case Mcasm::VPCMPWZrri:
  case Mcasm::VPCMPWZ128rmik: case Mcasm::VPCMPWZ128rrik:
  case Mcasm::VPCMPWZ256rmik: case Mcasm::VPCMPWZ256rrik:
  case Mcasm::VPCMPWZrmik:    case Mcasm::VPCMPWZrrik:
    OS << "w\t";
    break;
  }
}

void McasmInstPrinterCommon::printCMPMnemonic(const MCInst *MI, bool IsVCmp,
                                            raw_ostream &OS) {
  OS << (IsVCmp ? "vcmp" : "cmp");

  printSSEAVXCC(MI, MI->getNumOperands() - 1, OS);

  switch (MI->getOpcode()) {
  default: llvm_unreachable("Unexpected opcode!");
  case Mcasm::CMPPDrmi:       case Mcasm::CMPPDrri:
  case Mcasm::VCMPPDrmi:      case Mcasm::VCMPPDrri:
  case Mcasm::VCMPPDYrmi:     case Mcasm::VCMPPDYrri:
  case Mcasm::VCMPPDZ128rmi:  case Mcasm::VCMPPDZ128rri:
  case Mcasm::VCMPPDZ256rmi:  case Mcasm::VCMPPDZ256rri:
  case Mcasm::VCMPPDZrmi:     case Mcasm::VCMPPDZrri:
  case Mcasm::VCMPPDZ128rmik: case Mcasm::VCMPPDZ128rrik:
  case Mcasm::VCMPPDZ256rmik: case Mcasm::VCMPPDZ256rrik:
  case Mcasm::VCMPPDZrmik:    case Mcasm::VCMPPDZrrik:
  case Mcasm::VCMPPDZ128rmbi: case Mcasm::VCMPPDZ128rmbik:
  case Mcasm::VCMPPDZ256rmbi: case Mcasm::VCMPPDZ256rmbik:
  case Mcasm::VCMPPDZrmbi:    case Mcasm::VCMPPDZrmbik:
  case Mcasm::VCMPPDZrrib:    case Mcasm::VCMPPDZrribk:
    OS << "pd\t";
    break;
  case Mcasm::CMPPSrmi:       case Mcasm::CMPPSrri:
  case Mcasm::VCMPPSrmi:      case Mcasm::VCMPPSrri:
  case Mcasm::VCMPPSYrmi:     case Mcasm::VCMPPSYrri:
  case Mcasm::VCMPPSZ128rmi:  case Mcasm::VCMPPSZ128rri:
  case Mcasm::VCMPPSZ256rmi:  case Mcasm::VCMPPSZ256rri:
  case Mcasm::VCMPPSZrmi:     case Mcasm::VCMPPSZrri:
  case Mcasm::VCMPPSZ128rmik: case Mcasm::VCMPPSZ128rrik:
  case Mcasm::VCMPPSZ256rmik: case Mcasm::VCMPPSZ256rrik:
  case Mcasm::VCMPPSZrmik:    case Mcasm::VCMPPSZrrik:
  case Mcasm::VCMPPSZ128rmbi: case Mcasm::VCMPPSZ128rmbik:
  case Mcasm::VCMPPSZ256rmbi: case Mcasm::VCMPPSZ256rmbik:
  case Mcasm::VCMPPSZrmbi:    case Mcasm::VCMPPSZrmbik:
  case Mcasm::VCMPPSZrrib:    case Mcasm::VCMPPSZrribk:
    OS << "ps\t";
    break;
  case Mcasm::CMPSDrmi:        case Mcasm::CMPSDrri:
  case Mcasm::CMPSDrmi_Int:    case Mcasm::CMPSDrri_Int:
  case Mcasm::VCMPSDrmi:       case Mcasm::VCMPSDrri:
  case Mcasm::VCMPSDrmi_Int:   case Mcasm::VCMPSDrri_Int:
  case Mcasm::VCMPSDZrmi:      case Mcasm::VCMPSDZrri:
  case Mcasm::VCMPSDZrmi_Int:  case Mcasm::VCMPSDZrri_Int:
  case Mcasm::VCMPSDZrmik_Int: case Mcasm::VCMPSDZrrik_Int:
  case Mcasm::VCMPSDZrrib_Int: case Mcasm::VCMPSDZrribk_Int:
    OS << "sd\t";
    break;
  case Mcasm::CMPSSrmi:        case Mcasm::CMPSSrri:
  case Mcasm::CMPSSrmi_Int:    case Mcasm::CMPSSrri_Int:
  case Mcasm::VCMPSSrmi:       case Mcasm::VCMPSSrri:
  case Mcasm::VCMPSSrmi_Int:   case Mcasm::VCMPSSrri_Int:
  case Mcasm::VCMPSSZrmi:      case Mcasm::VCMPSSZrri:
  case Mcasm::VCMPSSZrmi_Int:  case Mcasm::VCMPSSZrri_Int:
  case Mcasm::VCMPSSZrmik_Int: case Mcasm::VCMPSSZrrik_Int:
  case Mcasm::VCMPSSZrrib_Int: case Mcasm::VCMPSSZrribk_Int:
    OS << "ss\t";
    break;
  case Mcasm::VCMPPHZ128rmi:  case Mcasm::VCMPPHZ128rri:
  case Mcasm::VCMPPHZ256rmi:  case Mcasm::VCMPPHZ256rri:
  case Mcasm::VCMPPHZrmi:     case Mcasm::VCMPPHZrri:
  case Mcasm::VCMPPHZ128rmik: case Mcasm::VCMPPHZ128rrik:
  case Mcasm::VCMPPHZ256rmik: case Mcasm::VCMPPHZ256rrik:
  case Mcasm::VCMPPHZrmik:    case Mcasm::VCMPPHZrrik:
  case Mcasm::VCMPPHZ128rmbi: case Mcasm::VCMPPHZ128rmbik:
  case Mcasm::VCMPPHZ256rmbi: case Mcasm::VCMPPHZ256rmbik:
  case Mcasm::VCMPPHZrmbi:    case Mcasm::VCMPPHZrmbik:
  case Mcasm::VCMPPHZrrib:    case Mcasm::VCMPPHZrribk:
    OS << "ph\t";
    break;
  case Mcasm::VCMPSHZrmi:      case Mcasm::VCMPSHZrri:
  case Mcasm::VCMPSHZrmi_Int:  case Mcasm::VCMPSHZrri_Int:
  case Mcasm::VCMPSHZrrib_Int: case Mcasm::VCMPSHZrribk_Int:
  case Mcasm::VCMPSHZrmik_Int: case Mcasm::VCMPSHZrrik_Int:
    OS << "sh\t";
    break;
  case Mcasm::VCMPBF16Z128rmi:  case Mcasm::VCMPBF16Z128rri:
  case Mcasm::VCMPBF16Z256rmi:  case Mcasm::VCMPBF16Z256rri:
  case Mcasm::VCMPBF16Zrmi:     case Mcasm::VCMPBF16Zrri:
  case Mcasm::VCMPBF16Z128rmik: case Mcasm::VCMPBF16Z128rrik:
  case Mcasm::VCMPBF16Z256rmik: case Mcasm::VCMPBF16Z256rrik:
  case Mcasm::VCMPBF16Zrmik:    case Mcasm::VCMPBF16Zrrik:
  case Mcasm::VCMPBF16Z128rmbi: case Mcasm::VCMPBF16Z128rmbik:
  case Mcasm::VCMPBF16Z256rmbi: case Mcasm::VCMPBF16Z256rmbik:
  case Mcasm::VCMPBF16Zrmbi:    case Mcasm::VCMPBF16Zrmbik:
    OS << "bf16\t";
    break;
  }
}

void McasmInstPrinterCommon::printRoundingControl(const MCInst *MI, unsigned Op,
                                                raw_ostream &O) {
  int64_t Imm = MI->getOperand(Op).getImm();
  switch (Imm) {
  default:
    llvm_unreachable("Invalid rounding control!");
  case Mcasm::TO_NEAREST_INT:
    O << "{rn-sae}";
    break;
  case Mcasm::TO_NEG_INF:
    O << "{rd-sae}";
    break;
  case Mcasm::TO_POS_INF:
    O << "{ru-sae}";
    break;
  case Mcasm::TO_ZERO:
    O << "{rz-sae}";
    break;
  }
}

/// value (e.g. for jumps and calls). In Intel-style these print slightly
/// differently than normal immediates. For example, a $ is not emitted.
///
/// \p Address The address of the next instruction.
/// \see MCInstPrinter::printInst
void McasmInstPrinterCommon::printPCRelImm(const MCInst *MI, uint64_t Address,
                                         unsigned OpNo, raw_ostream &O) {
  // Do not print the numberic target address when symbolizing.
  if (SymbolizeOperands)
    return;

  const MCOperand &Op = MI->getOperand(OpNo);
  if (Op.isImm()) {
    if (PrintBranchImmAsAddress) {
      uint64_t Target = Address + Op.getImm();
      if (MAI.getCodePointerSize() == 4)
        Target &= 0xffffffff;
      markup(O, Markup::Target) << formatHex(Target);
    } else
      markup(O, Markup::Immediate) << formatImm(Op.getImm());
  } else {
    assert(Op.isExpr() && "unknown pcrel immediate operand");
    // If a symbolic branch target was added as a constant expression then print
    // that address in hex.
    const MCConstantExpr *BranchTarget = dyn_cast<MCConstantExpr>(Op.getExpr());
    int64_t Address;
    if (BranchTarget && BranchTarget->evaluateAsAbsolute(Address)) {
      markup(O, Markup::Immediate) << formatHex((uint64_t)Address);
    } else {
      // Otherwise, just print the expression.
      printExprOperand(O, *Op.getExpr());
    }
  }
}

void McasmInstPrinterCommon::printOptionalSegReg(const MCInst *MI, unsigned OpNo,
                                               raw_ostream &O) {
  if (MI->getOperand(OpNo).getReg()) {
    printOperand(MI, OpNo, O);
    O << ':';
  }
}

void McasmInstPrinterCommon::printInstFlags(const MCInst *MI, raw_ostream &O,
                                          const MCSubtargetInfo &STI) {
  const MCInstrDesc &Desc = MII.get(MI->getOpcode());
  uint64_t TSFlags = Desc.TSFlags;
  unsigned Flags = MI->getFlags();

  if ((TSFlags & McasmII::LOCK) || (Flags & Mcasm::IP_HAS_LOCK))
    O << "\tlock\t";

  if ((TSFlags & McasmII::NOTRACK) || (Flags & Mcasm::IP_HAS_NOTRACK))
    O << "\tnotrack\t";

  if (Flags & Mcasm::IP_HAS_REPEAT_NE)
    O << "\trepne\t";
  else if (Flags & Mcasm::IP_HAS_REPEAT)
    O << "\trep\t";

  if (TSFlags & McasmII::EVEX_NF && !Mcasm::isCFCMOVCC(MI->getOpcode()))
    O << "\t{nf}";

  // These all require a pseudo prefix
  if ((Flags & Mcasm::IP_USE_VEX) ||
      (TSFlags & McasmII::ExplicitOpPrefixMask) == McasmII::ExplicitVEXPrefix)
    O << "\t{vex}";
  else if (Flags & Mcasm::IP_USE_VEX2)
    O << "\t{vex2}";
  else if (Flags & Mcasm::IP_USE_VEX3)
    O << "\t{vex3}";
  else if ((Flags & Mcasm::IP_USE_EVEX) ||
           (TSFlags & McasmII::ExplicitOpPrefixMask) == McasmII::ExplicitEVEXPrefix)
    O << "\t{evex}";

  if (Flags & Mcasm::IP_USE_DISP8)
    O << "\t{disp8}";
  else if (Flags & Mcasm::IP_USE_DISP32)
    O << "\t{disp32}";

  // Determine where the memory operand starts, if present
  int MemoryOperand = McasmII::getMemoryOperandNo(TSFlags);
  if (MemoryOperand != -1)
    MemoryOperand += McasmII::getOperandBias(Desc);

  // Address-Size override prefix
  if (Flags & Mcasm::IP_HAS_AD_SIZE &&
      !Mcasm_MC::needsAddressSizeOverride(*MI, STI, MemoryOperand, TSFlags)) {
    if (STI.hasFeature(Mcasm::Is16Bit) || STI.hasFeature(Mcasm::Is64Bit))
      O << "\taddr32\t";
    else if (STI.hasFeature(Mcasm::Is32Bit))
      O << "\taddr16\t";
  }
}

void McasmInstPrinterCommon::printVKPair(const MCInst *MI, unsigned OpNo,
                                       raw_ostream &OS) {
  // In assembly listings, a pair is represented by one of its members, any
  // of the two.  Here, we pick k0, k2, k4, k6, but we could as well
  // print K2_K3 as "k3".  It would probably make a lot more sense, if
  // the assembly would look something like:
  // "vp2intersect %zmm5, %zmm7, {%k2, %k3}"
  // but this can work too.
  switch (MI->getOperand(OpNo).getReg().id()) {
  case Mcasm::K0_K1:
    printRegName(OS, Mcasm::K0);
    return;
  case Mcasm::K2_K3:
    printRegName(OS, Mcasm::K2);
    return;
  case Mcasm::K4_K5:
    printRegName(OS, Mcasm::K4);
    return;
  case Mcasm::K6_K7:
    printRegName(OS, Mcasm::K6);
    return;
  }
  llvm_unreachable("Unknown mask pair register name");
}
