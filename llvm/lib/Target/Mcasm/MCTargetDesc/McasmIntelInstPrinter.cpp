//===-- McasmIntelInstPrinter.cpp - Intel assembly instruction printing -----===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file includes code for rendering MCInst instances as Intel-style
// assembly.
//
//===----------------------------------------------------------------------===//

#include "McasmIntelInstPrinter.h"
#include "McasmBaseInfo.h"
#include "McasmInstComments.h"
#include "llvm/MC/MCAsmInfo.h"
#include "llvm/MC/MCExpr.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCInstrAnalysis.h"
#include "llvm/MC/MCInstrDesc.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/MC/MCSubtargetInfo.h"
#include "llvm/Support/ErrorHandling.h"
#include <cassert>
#include <cstdint>

using namespace llvm;

#define DEBUG_TYPE "asm-printer"

// Include the auto-generated portion of the assembly writer.
#define PRINT_ALIAS_INSTR
#include "McasmGenAsmWriter1.inc"

void McasmIntelInstPrinter::printRegName(raw_ostream &OS, MCRegister Reg) {
  markup(OS, Markup::Register) << getRegisterName(Reg);
}

void McasmIntelInstPrinter::printInst(const MCInst *MI, uint64_t Address,
                                    StringRef Annot, const MCSubtargetInfo &STI,
                                    raw_ostream &OS) {
  printInstFlags(MI, OS, STI);

  // In 16-bit mode, print data16 as data32.
  if (MI->getOpcode() == Mcasm::DATA16_PREFIX &&
      STI.hasFeature(Mcasm::Is16Bit)) {
    OS << "\tdata32";
  } else if (!printAliasInstr(MI, Address, OS) && !printVecCompareInstr(MI, OS))
    printInstruction(MI, Address, OS);

  // Next always print the annotation.
  printAnnotation(OS, Annot);

  // If verbose assembly is enabled, we can print some informative comments.
  if (CommentStream)
    EmitAnyMcasmInstComments(MI, *CommentStream, MII);
}

bool McasmIntelInstPrinter::printVecCompareInstr(const MCInst *MI, raw_ostream &OS) {
  if (MI->getNumOperands() == 0 ||
      !MI->getOperand(MI->getNumOperands() - 1).isImm())
    return false;

  int64_t Imm = MI->getOperand(MI->getNumOperands() - 1).getImm();

  const MCInstrDesc &Desc = MII.get(MI->getOpcode());

  // Custom print the vector compare instructions to get the immediate
  // translated into the mnemonic.
  switch (MI->getOpcode()) {
  case Mcasm::CMPPDrmi:     case Mcasm::CMPPDrri:
  case Mcasm::CMPPSrmi:     case Mcasm::CMPPSrri:
  case Mcasm::CMPSDrmi:     case Mcasm::CMPSDrri:
  case Mcasm::CMPSDrmi_Int: case Mcasm::CMPSDrri_Int:
  case Mcasm::CMPSSrmi:     case Mcasm::CMPSSrri:
  case Mcasm::CMPSSrmi_Int: case Mcasm::CMPSSrri_Int:
    if (Imm >= 0 && Imm <= 7) {
      OS << '\t';
      printCMPMnemonic(MI, /*IsVCMP*/false, OS);
      printOperand(MI, 0, OS);
      OS << ", ";
      // Skip operand 1 as its tied to the dest.

      if ((Desc.TSFlags & McasmII::FormMask) == McasmII::MRMSrcMem) {
        if ((Desc.TSFlags & McasmII::OpPrefixMask) == McasmII::XS)
          printdwordmem(MI, 2, OS);
        else if ((Desc.TSFlags & McasmII::OpPrefixMask) == McasmII::XD)
          printqwordmem(MI, 2, OS);
        else
          printxmmwordmem(MI, 2, OS);
      } else
        printOperand(MI, 2, OS);

      return true;
    }
    break;

  case Mcasm::VCMPPDrmi:       case Mcasm::VCMPPDrri:
  case Mcasm::VCMPPDYrmi:      case Mcasm::VCMPPDYrri:
  case Mcasm::VCMPPDZ128rmi:   case Mcasm::VCMPPDZ128rri:
  case Mcasm::VCMPPDZ256rmi:   case Mcasm::VCMPPDZ256rri:
  case Mcasm::VCMPPDZrmi:      case Mcasm::VCMPPDZrri:
  case Mcasm::VCMPPSrmi:       case Mcasm::VCMPPSrri:
  case Mcasm::VCMPPSYrmi:      case Mcasm::VCMPPSYrri:
  case Mcasm::VCMPPSZ128rmi:   case Mcasm::VCMPPSZ128rri:
  case Mcasm::VCMPPSZ256rmi:   case Mcasm::VCMPPSZ256rri:
  case Mcasm::VCMPPSZrmi:      case Mcasm::VCMPPSZrri:
  case Mcasm::VCMPSDrmi:       case Mcasm::VCMPSDrri:
  case Mcasm::VCMPSDZrmi:      case Mcasm::VCMPSDZrri:
  case Mcasm::VCMPSDrmi_Int:   case Mcasm::VCMPSDrri_Int:
  case Mcasm::VCMPSDZrmi_Int:  case Mcasm::VCMPSDZrri_Int:
  case Mcasm::VCMPSSrmi:       case Mcasm::VCMPSSrri:
  case Mcasm::VCMPSSZrmi:      case Mcasm::VCMPSSZrri:
  case Mcasm::VCMPSSrmi_Int:   case Mcasm::VCMPSSrri_Int:
  case Mcasm::VCMPSSZrmi_Int:  case Mcasm::VCMPSSZrri_Int:
  case Mcasm::VCMPPDZ128rmik:  case Mcasm::VCMPPDZ128rrik:
  case Mcasm::VCMPPDZ256rmik:  case Mcasm::VCMPPDZ256rrik:
  case Mcasm::VCMPPDZrmik:     case Mcasm::VCMPPDZrrik:
  case Mcasm::VCMPPSZ128rmik:  case Mcasm::VCMPPSZ128rrik:
  case Mcasm::VCMPPSZ256rmik:  case Mcasm::VCMPPSZ256rrik:
  case Mcasm::VCMPPSZrmik:     case Mcasm::VCMPPSZrrik:
  case Mcasm::VCMPSDZrmik_Int: case Mcasm::VCMPSDZrrik_Int:
  case Mcasm::VCMPSSZrmik_Int: case Mcasm::VCMPSSZrrik_Int:
  case Mcasm::VCMPPDZ128rmbi:  case Mcasm::VCMPPDZ128rmbik:
  case Mcasm::VCMPPDZ256rmbi:  case Mcasm::VCMPPDZ256rmbik:
  case Mcasm::VCMPPDZrmbi:     case Mcasm::VCMPPDZrmbik:
  case Mcasm::VCMPPSZ128rmbi:  case Mcasm::VCMPPSZ128rmbik:
  case Mcasm::VCMPPSZ256rmbi:  case Mcasm::VCMPPSZ256rmbik:
  case Mcasm::VCMPPSZrmbi:     case Mcasm::VCMPPSZrmbik:
  case Mcasm::VCMPPDZrrib:     case Mcasm::VCMPPDZrribk:
  case Mcasm::VCMPPSZrrib:     case Mcasm::VCMPPSZrribk:
  case Mcasm::VCMPSDZrrib_Int: case Mcasm::VCMPSDZrribk_Int:
  case Mcasm::VCMPSSZrrib_Int: case Mcasm::VCMPSSZrribk_Int:
  case Mcasm::VCMPPHZ128rmi:   case Mcasm::VCMPPHZ128rri:
  case Mcasm::VCMPPHZ256rmi:   case Mcasm::VCMPPHZ256rri:
  case Mcasm::VCMPPHZrmi:      case Mcasm::VCMPPHZrri:
  case Mcasm::VCMPSHZrmi:      case Mcasm::VCMPSHZrri:
  case Mcasm::VCMPSHZrmi_Int:  case Mcasm::VCMPSHZrri_Int:
  case Mcasm::VCMPPHZ128rmik:  case Mcasm::VCMPPHZ128rrik:
  case Mcasm::VCMPPHZ256rmik:  case Mcasm::VCMPPHZ256rrik:
  case Mcasm::VCMPPHZrmik:     case Mcasm::VCMPPHZrrik:
  case Mcasm::VCMPSHZrmik_Int: case Mcasm::VCMPSHZrrik_Int:
  case Mcasm::VCMPPHZ128rmbi:  case Mcasm::VCMPPHZ128rmbik:
  case Mcasm::VCMPPHZ256rmbi:  case Mcasm::VCMPPHZ256rmbik:
  case Mcasm::VCMPPHZrmbi:     case Mcasm::VCMPPHZrmbik:
  case Mcasm::VCMPPHZrrib:     case Mcasm::VCMPPHZrribk:
  case Mcasm::VCMPSHZrrib_Int: case Mcasm::VCMPSHZrribk_Int:
  case Mcasm::VCMPBF16Z128rmi:  case Mcasm::VCMPBF16Z128rri:
  case Mcasm::VCMPBF16Z256rmi:  case Mcasm::VCMPBF16Z256rri:
  case Mcasm::VCMPBF16Zrmi:     case Mcasm::VCMPBF16Zrri:
  case Mcasm::VCMPBF16Z128rmik: case Mcasm::VCMPBF16Z128rrik:
  case Mcasm::VCMPBF16Z256rmik: case Mcasm::VCMPBF16Z256rrik:
  case Mcasm::VCMPBF16Zrmik:    case Mcasm::VCMPBF16Zrrik:
  case Mcasm::VCMPBF16Z128rmbi: case Mcasm::VCMPBF16Z128rmbik:
  case Mcasm::VCMPBF16Z256rmbi: case Mcasm::VCMPBF16Z256rmbik:
  case Mcasm::VCMPBF16Zrmbi:    case Mcasm::VCMPBF16Zrmbik:
    if (Imm >= 0 && Imm <= 31) {
      OS << '\t';
      printCMPMnemonic(MI, /*IsVCMP*/true, OS);

      unsigned CurOp = 0;
      printOperand(MI, CurOp++, OS);

      if (Desc.TSFlags & McasmII::EVEX_K) {
        // Print mask operand.
        OS << " {";
        printOperand(MI, CurOp++, OS);
        OS << "}";
      }
      OS << ", ";
      printOperand(MI, CurOp++, OS);
      OS << ", ";

      if ((Desc.TSFlags & McasmII::FormMask) == McasmII::MRMSrcMem) {
        if (Desc.TSFlags & McasmII::EVEX_B) {
          // Broadcast form.
          // Load size is word for TA map. Otherwise it is based on W-bit.
          if ((Desc.TSFlags & McasmII::OpMapMask) == McasmII::TA) {
            assert(!(Desc.TSFlags & McasmII::REX_W) && "Unknown W-bit value!");
            printwordmem(MI, CurOp++, OS);
          } else if (Desc.TSFlags & McasmII::REX_W) {
            printqwordmem(MI, CurOp++, OS);
          } else {
            printdwordmem(MI, CurOp++, OS);
          }

          // Print the number of elements broadcasted.
          unsigned NumElts;
          if (Desc.TSFlags & McasmII::EVEX_L2)
            NumElts = (Desc.TSFlags & McasmII::REX_W) ? 8 : 16;
          else if (Desc.TSFlags & McasmII::VEX_L)
            NumElts = (Desc.TSFlags & McasmII::REX_W) ? 4 : 8;
          else
            NumElts = (Desc.TSFlags & McasmII::REX_W) ? 2 : 4;
          if ((Desc.TSFlags & McasmII::OpMapMask) == McasmII::TA) {
            assert(!(Desc.TSFlags & McasmII::REX_W) && "Unknown W-bit value!");
            NumElts *= 2;
          }
          OS << "{1to" << NumElts << "}";
        } else {
          if ((Desc.TSFlags & McasmII::OpPrefixMask) == McasmII::XS) {
            if ((Desc.TSFlags & McasmII::OpMapMask) == McasmII::TA)
              printwordmem(MI, CurOp++, OS);
            else
              printdwordmem(MI, CurOp++, OS);
          } else if ((Desc.TSFlags & McasmII::OpPrefixMask) == McasmII::XD &&
                     (Desc.TSFlags & McasmII::OpMapMask) != McasmII::TA) {
            printqwordmem(MI, CurOp++, OS);
          } else if (Desc.TSFlags & McasmII::EVEX_L2) {
            printzmmwordmem(MI, CurOp++, OS);
          } else if (Desc.TSFlags & McasmII::VEX_L) {
            printymmwordmem(MI, CurOp++, OS);
          } else {
            printxmmwordmem(MI, CurOp++, OS);
          }
        }
      } else {
        printOperand(MI, CurOp++, OS);
        if (Desc.TSFlags & McasmII::EVEX_B)
          OS << ", {sae}";
      }

      return true;
    }
    break;

  case Mcasm::VPCOMBmi:  case Mcasm::VPCOMBri:
  case Mcasm::VPCOMDmi:  case Mcasm::VPCOMDri:
  case Mcasm::VPCOMQmi:  case Mcasm::VPCOMQri:
  case Mcasm::VPCOMUBmi: case Mcasm::VPCOMUBri:
  case Mcasm::VPCOMUDmi: case Mcasm::VPCOMUDri:
  case Mcasm::VPCOMUQmi: case Mcasm::VPCOMUQri:
  case Mcasm::VPCOMUWmi: case Mcasm::VPCOMUWri:
  case Mcasm::VPCOMWmi:  case Mcasm::VPCOMWri:
    if (Imm >= 0 && Imm <= 7) {
      OS << '\t';
      printVPCOMMnemonic(MI, OS);
      printOperand(MI, 0, OS);
      OS << ", ";
      printOperand(MI, 1, OS);
      OS << ", ";
      if ((Desc.TSFlags & McasmII::FormMask) == McasmII::MRMSrcMem)
        printxmmwordmem(MI, 2, OS);
      else
        printOperand(MI, 2, OS);
      return true;
    }
    break;

  case Mcasm::VPCMPBZ128rmi:   case Mcasm::VPCMPBZ128rri:
  case Mcasm::VPCMPBZ256rmi:   case Mcasm::VPCMPBZ256rri:
  case Mcasm::VPCMPBZrmi:      case Mcasm::VPCMPBZrri:
  case Mcasm::VPCMPDZ128rmi:   case Mcasm::VPCMPDZ128rri:
  case Mcasm::VPCMPDZ256rmi:   case Mcasm::VPCMPDZ256rri:
  case Mcasm::VPCMPDZrmi:      case Mcasm::VPCMPDZrri:
  case Mcasm::VPCMPQZ128rmi:   case Mcasm::VPCMPQZ128rri:
  case Mcasm::VPCMPQZ256rmi:   case Mcasm::VPCMPQZ256rri:
  case Mcasm::VPCMPQZrmi:      case Mcasm::VPCMPQZrri:
  case Mcasm::VPCMPUBZ128rmi:  case Mcasm::VPCMPUBZ128rri:
  case Mcasm::VPCMPUBZ256rmi:  case Mcasm::VPCMPUBZ256rri:
  case Mcasm::VPCMPUBZrmi:     case Mcasm::VPCMPUBZrri:
  case Mcasm::VPCMPUDZ128rmi:  case Mcasm::VPCMPUDZ128rri:
  case Mcasm::VPCMPUDZ256rmi:  case Mcasm::VPCMPUDZ256rri:
  case Mcasm::VPCMPUDZrmi:     case Mcasm::VPCMPUDZrri:
  case Mcasm::VPCMPUQZ128rmi:  case Mcasm::VPCMPUQZ128rri:
  case Mcasm::VPCMPUQZ256rmi:  case Mcasm::VPCMPUQZ256rri:
  case Mcasm::VPCMPUQZrmi:     case Mcasm::VPCMPUQZrri:
  case Mcasm::VPCMPUWZ128rmi:  case Mcasm::VPCMPUWZ128rri:
  case Mcasm::VPCMPUWZ256rmi:  case Mcasm::VPCMPUWZ256rri:
  case Mcasm::VPCMPUWZrmi:     case Mcasm::VPCMPUWZrri:
  case Mcasm::VPCMPWZ128rmi:   case Mcasm::VPCMPWZ128rri:
  case Mcasm::VPCMPWZ256rmi:   case Mcasm::VPCMPWZ256rri:
  case Mcasm::VPCMPWZrmi:      case Mcasm::VPCMPWZrri:
  case Mcasm::VPCMPBZ128rmik:  case Mcasm::VPCMPBZ128rrik:
  case Mcasm::VPCMPBZ256rmik:  case Mcasm::VPCMPBZ256rrik:
  case Mcasm::VPCMPBZrmik:     case Mcasm::VPCMPBZrrik:
  case Mcasm::VPCMPDZ128rmik:  case Mcasm::VPCMPDZ128rrik:
  case Mcasm::VPCMPDZ256rmik:  case Mcasm::VPCMPDZ256rrik:
  case Mcasm::VPCMPDZrmik:     case Mcasm::VPCMPDZrrik:
  case Mcasm::VPCMPQZ128rmik:  case Mcasm::VPCMPQZ128rrik:
  case Mcasm::VPCMPQZ256rmik:  case Mcasm::VPCMPQZ256rrik:
  case Mcasm::VPCMPQZrmik:     case Mcasm::VPCMPQZrrik:
  case Mcasm::VPCMPUBZ128rmik: case Mcasm::VPCMPUBZ128rrik:
  case Mcasm::VPCMPUBZ256rmik: case Mcasm::VPCMPUBZ256rrik:
  case Mcasm::VPCMPUBZrmik:    case Mcasm::VPCMPUBZrrik:
  case Mcasm::VPCMPUDZ128rmik: case Mcasm::VPCMPUDZ128rrik:
  case Mcasm::VPCMPUDZ256rmik: case Mcasm::VPCMPUDZ256rrik:
  case Mcasm::VPCMPUDZrmik:    case Mcasm::VPCMPUDZrrik:
  case Mcasm::VPCMPUQZ128rmik: case Mcasm::VPCMPUQZ128rrik:
  case Mcasm::VPCMPUQZ256rmik: case Mcasm::VPCMPUQZ256rrik:
  case Mcasm::VPCMPUQZrmik:    case Mcasm::VPCMPUQZrrik:
  case Mcasm::VPCMPUWZ128rmik: case Mcasm::VPCMPUWZ128rrik:
  case Mcasm::VPCMPUWZ256rmik: case Mcasm::VPCMPUWZ256rrik:
  case Mcasm::VPCMPUWZrmik:    case Mcasm::VPCMPUWZrrik:
  case Mcasm::VPCMPWZ128rmik:  case Mcasm::VPCMPWZ128rrik:
  case Mcasm::VPCMPWZ256rmik:  case Mcasm::VPCMPWZ256rrik:
  case Mcasm::VPCMPWZrmik:     case Mcasm::VPCMPWZrrik:
  case Mcasm::VPCMPDZ128rmbi:  case Mcasm::VPCMPDZ128rmbik:
  case Mcasm::VPCMPDZ256rmbi:  case Mcasm::VPCMPDZ256rmbik:
  case Mcasm::VPCMPDZrmbi:     case Mcasm::VPCMPDZrmbik:
  case Mcasm::VPCMPQZ128rmbi:  case Mcasm::VPCMPQZ128rmbik:
  case Mcasm::VPCMPQZ256rmbi:  case Mcasm::VPCMPQZ256rmbik:
  case Mcasm::VPCMPQZrmbi:     case Mcasm::VPCMPQZrmbik:
  case Mcasm::VPCMPUDZ128rmbi: case Mcasm::VPCMPUDZ128rmbik:
  case Mcasm::VPCMPUDZ256rmbi: case Mcasm::VPCMPUDZ256rmbik:
  case Mcasm::VPCMPUDZrmbi:    case Mcasm::VPCMPUDZrmbik:
  case Mcasm::VPCMPUQZ128rmbi: case Mcasm::VPCMPUQZ128rmbik:
  case Mcasm::VPCMPUQZ256rmbi: case Mcasm::VPCMPUQZ256rmbik:
  case Mcasm::VPCMPUQZrmbi:    case Mcasm::VPCMPUQZrmbik:
    if ((Imm >= 0 && Imm <= 2) || (Imm >= 4 && Imm <= 6)) {
      OS << '\t';
      printVPCMPMnemonic(MI, OS);

      unsigned CurOp = 0;
      printOperand(MI, CurOp++, OS);

      if (Desc.TSFlags & McasmII::EVEX_K) {
        // Print mask operand.
        OS << " {";
        printOperand(MI, CurOp++, OS);
        OS << "}";
      }
      OS << ", ";
      printOperand(MI, CurOp++, OS);
      OS << ", ";

      if ((Desc.TSFlags & McasmII::FormMask) == McasmII::MRMSrcMem) {
        if (Desc.TSFlags & McasmII::EVEX_B) {
          // Broadcast form.
          // Load size is based on W-bit as only D and Q are supported.
          if (Desc.TSFlags & McasmII::REX_W)
            printqwordmem(MI, CurOp++, OS);
          else
            printdwordmem(MI, CurOp++, OS);

          // Print the number of elements broadcasted.
          unsigned NumElts;
          if (Desc.TSFlags & McasmII::EVEX_L2)
            NumElts = (Desc.TSFlags & McasmII::REX_W) ? 8 : 16;
          else if (Desc.TSFlags & McasmII::VEX_L)
            NumElts = (Desc.TSFlags & McasmII::REX_W) ? 4 : 8;
          else
            NumElts = (Desc.TSFlags & McasmII::REX_W) ? 2 : 4;
          OS << "{1to" << NumElts << "}";
        } else {
          if (Desc.TSFlags & McasmII::EVEX_L2)
            printzmmwordmem(MI, CurOp++, OS);
          else if (Desc.TSFlags & McasmII::VEX_L)
            printymmwordmem(MI, CurOp++, OS);
          else
            printxmmwordmem(MI, CurOp++, OS);
        }
      } else {
        printOperand(MI, CurOp++, OS);
      }

      return true;
    }
    break;
  }

  return false;
}

void McasmIntelInstPrinter::printOperand(const MCInst *MI, unsigned OpNo,
                                       raw_ostream &O) {
  const MCOperand &Op = MI->getOperand(OpNo);
  if (Op.isReg()) {
    printRegName(O, Op.getReg());
  } else if (Op.isImm()) {
    markup(O, Markup::Immediate) << formatImm(Op.getImm());
  } else {
    assert(Op.isExpr() && "unknown operand kind in printOperand");
    O << "offset ";
    MAI.printExpr(O, *Op.getExpr());
  }
}

void McasmIntelInstPrinter::printMemReference(const MCInst *MI, unsigned Op,
                                            raw_ostream &O) {
  // Do not print the exact form of the memory operand if it references a known
  // binary object.
  if (SymbolizeOperands && MIA) {
    uint64_t Target;
    if (MIA->evaluateBranch(*MI, 0, 0, Target))
      return;
    if (MIA->evaluateMemoryOperandAddress(*MI, /*STI=*/nullptr, 0, 0))
      return;
  }
  const MCOperand &BaseReg  = MI->getOperand(Op+Mcasm::AddrBaseReg);
  unsigned ScaleVal         = MI->getOperand(Op+Mcasm::AddrScaleAmt).getImm();
  const MCOperand &IndexReg = MI->getOperand(Op+Mcasm::AddrIndexReg);
  const MCOperand &DispSpec = MI->getOperand(Op+Mcasm::AddrDisp);

  // If this has a segment register, print it.
  printOptionalSegReg(MI, Op + Mcasm::AddrSegmentReg, O);

  WithMarkup M = markup(O, Markup::Memory);
  O << '[';

  bool NeedPlus = false;
  if (BaseReg.getReg()) {
    printOperand(MI, Op+Mcasm::AddrBaseReg, O);
    NeedPlus = true;
  }

  if (IndexReg.getReg()) {
    if (NeedPlus) O << " + ";
    if (ScaleVal != 1 || !BaseReg.getReg())
      O << ScaleVal << '*';
    printOperand(MI, Op+Mcasm::AddrIndexReg, O);
    NeedPlus = true;
  }

  if (!DispSpec.isImm()) {
    if (NeedPlus) O << " + ";
    assert(DispSpec.isExpr() && "non-immediate displacement for LEA?");
    MAI.printExpr(O, *DispSpec.getExpr());
  } else {
    int64_t DispVal = DispSpec.getImm();
    if (DispVal || (!IndexReg.getReg() && !BaseReg.getReg())) {
      if (NeedPlus) {
        if (DispVal > 0)
          O << " + ";
        else {
          O << " - ";
          DispVal = -DispVal;
        }
      }
      markup(O, Markup::Immediate) << formatImm(DispVal);
    }
  }

  O << ']';
}

void McasmIntelInstPrinter::printSrcIdx(const MCInst *MI, unsigned Op,
                                      raw_ostream &O) {
  // If this has a segment register, print it.
  printOptionalSegReg(MI, Op + 1, O);

  WithMarkup M = markup(O, Markup::Memory);
  O << '[';
  printOperand(MI, Op, O);
  O << ']';
}

void McasmIntelInstPrinter::printDstIdx(const MCInst *MI, unsigned Op,
                                      raw_ostream &O) {
  // DI accesses are always ES-based.
  O << "es:";

  WithMarkup M = markup(O, Markup::Memory);
  O << '[';
  printOperand(MI, Op, O);
  O << ']';
}

void McasmIntelInstPrinter::printMemOffset(const MCInst *MI, unsigned Op,
                                         raw_ostream &O) {
  const MCOperand &DispSpec = MI->getOperand(Op);

  // If this has a segment register, print it.
  printOptionalSegReg(MI, Op + 1, O);

  WithMarkup M = markup(O, Markup::Memory);
  O << '[';

  if (DispSpec.isImm()) {
    markup(O, Markup::Immediate) << formatImm(DispSpec.getImm());
  } else {
    assert(DispSpec.isExpr() && "non-immediate displacement?");
    MAI.printExpr(O, *DispSpec.getExpr());
  }

  O << ']';
}

void McasmIntelInstPrinter::printU8Imm(const MCInst *MI, unsigned Op,
                                     raw_ostream &O) {
  if (MI->getOperand(Op).isExpr())
    return MAI.printExpr(O, *MI->getOperand(Op).getExpr());

  markup(O, Markup::Immediate) << formatImm(MI->getOperand(Op).getImm() & 0xff);
}

void McasmIntelInstPrinter::printSTiRegOperand(const MCInst *MI, unsigned OpNo,
                                            raw_ostream &OS) {
  MCRegister Reg = MI->getOperand(OpNo).getReg();
  // Override the default printing to print st(0) instead st.
  if (Reg == Mcasm::ST0)
    OS << "st(0)";
  else
    printRegName(OS, Reg);
}
