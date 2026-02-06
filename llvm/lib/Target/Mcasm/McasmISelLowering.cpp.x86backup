//===-- McasmISelLowering.cpp - Mcasm DAG Lowering Implementation -----------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file implements the McasmTargetLowering class.
//
// MCASM NOTE: This is a minimal rewrite for the mcasm backend.
// - 32-bit only, integer-only architecture
// - Calling convention: first 8 args in r0-r7, rest on stack
// - Return value in rax
// - Memory offsets in mcasm units (4 bytes = 1 unit)
//
//===----------------------------------------------------------------------===//

#include "McasmISelLowering.h"
#include "Mcasm.h"
#include "McasmCallingConv.h"
#include "McasmMachineFunctionInfo.h"
#include "McasmSubtarget.h"
#include "McasmTargetMachine.h"
#include "llvm/CodeGen/CallingConvLower.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/CodeGen/SelectionDAG.h"
#include "llvm/CodeGen/TargetLoweringObjectFileImpl.h"
#include "llvm/CodeGen/ValueTypes.h"
#include "llvm/IR/CallingConv.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalAlias.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

#define DEBUG_TYPE "mcasm-lower"

McasmTargetLowering::McasmTargetLowering(const McasmTargetMachine &TM,
                                         const McasmSubtarget &STI)
    : TargetLowering(TM), Subtarget(STI) {

  // Set up the register classes.
  addRegisterClass(MVT::i32, &Mcasm::GR32RegClass);

  // Compute derived properties from the register classes
  computeRegisterProperties(STI.getRegisterInfo());

  // Mcasm is 32-bit only
  setStackPointerRegisterToSaveRestore(Mcasm::rsp);
  setMinFunctionAlignment(Align(4));
  setMinStackArgumentAlignment(Align(4));

  // Set operation actions
  // i32 is legal
  setOperationAction(ISD::BR_CC, MVT::i32, Expand);
  setOperationAction(ISD::SELECT_CC, MVT::i32, Expand);
  setOperationAction(ISD::SIGN_EXTEND_INREG, MVT::i1, Expand);
  setOperationAction(ISD::SIGN_EXTEND_INREG, MVT::i8, Expand);
  setOperationAction(ISD::SIGN_EXTEND_INREG, MVT::i16, Expand);

  // Expand these to use CMP + BRCOND
  setOperationAction(ISD::SETCC, MVT::i32, Expand);
  setOperationAction(ISD::SELECT, MVT::i32, Expand);

  // Mcasm doesn't have native mul/div, will need to expand or use library
  setOperationAction(ISD::MUL, MVT::i32, Expand);
  setOperationAction(ISD::SDIV, MVT::i32, Expand);
  setOperationAction(ISD::UDIV, MVT::i32, Expand);
  setOperationAction(ISD::SREM, MVT::i32, Expand);
  setOperationAction(ISD::UREM, MVT::i32, Expand);
  setOperationAction(ISD::MULHS, MVT::i32, Expand);
  setOperationAction(ISD::MULHU, MVT::i32, Expand);

  // No shift operations yet
  setOperationAction(ISD::SHL, MVT::i32, Expand);
  setOperationAction(ISD::SRL, MVT::i32, Expand);
  setOperationAction(ISD::SRA, MVT::i32, Expand);

  // Bitwise operations - expand for now
  setOperationAction(ISD::AND, MVT::i32, Expand);
  setOperationAction(ISD::OR, MVT::i32, Expand);
  setOperationAction(ISD::XOR, MVT::i32, Expand);

  // Control flow
  setOperationAction(ISD::BR_JT, MVT::Other, Expand);
  setOperationAction(ISD::BRIND, MVT::Other, Expand);

  // Variable argument handling - for now, disable
  setOperationAction(ISD::VASTART, MVT::Other, Expand);
  setOperationAction(ISD::VAARG, MVT::Other, Expand);
  setOperationAction(ISD::VACOPY, MVT::Other, Expand);
  setOperationAction(ISD::VAEND, MVT::Other, Expand);

  // Stack operations
  setOperationAction(ISD::STACKSAVE, MVT::Other, Expand);
  setOperationAction(ISD::STACKRESTORE, MVT::Other, Expand);
  setOperationAction(ISD::DYNAMIC_STACKALLOC, MVT::i32, Expand);

  // Atomics - not supported
  setMaxAtomicSizeInBitsSupported(0);

  // Function alignment
  setMaxBytesForAlignment(0);
  setPrefFunctionAlignment(Align(4));
  setPrefLoopAlignment(Align(4));
}

const char *McasmTargetLowering::getTargetNodeName(unsigned Opcode) const {
  switch (Opcode) {
  default:
    return nullptr;
  case McasmISD::CALL:
    return "McasmISD::CALL";
  case McasmISD::RET_GLUE:
    return "McasmISD::RET_GLUE";
  case McasmISD::CMP:
    return "McasmISD::CMP";
  case McasmISD::BRCOND:
    return "McasmISD::BRCOND";
  case McasmISD::Wrapper:
    return "McasmISD::Wrapper";
  case McasmISD::WrapperPIC:
    return "McasmISD::WrapperPIC";
  }
}

SDValue McasmTargetLowering::LowerOperation(SDValue Op,
                                            SelectionDAG &DAG) const {
  switch (Op.getOpcode()) {
  default:
    llvm_unreachable("Should not custom lower this!");
  case ISD::GlobalAddress:
    return LowerGlobalAddress(Op, DAG);
  }
}

SDValue McasmTargetLowering::LowerGlobalAddress(SDValue Op,
                                                SelectionDAG &DAG) const {
  SDLoc DL(Op);
  const GlobalValue *GV = cast<GlobalAddressSDNode>(Op)->getGlobal();
  int64_t Offset = cast<GlobalAddressSDNode>(Op)->getOffset();

  // Create the TargetGlobalAddress node.
  SDValue Result = DAG.getTargetGlobalAddress(GV, DL, MVT::i32, Offset);
  return DAG.getNode(McasmISD::Wrapper, DL, MVT::i32, Result);
}

//===----------------------------------------------------------------------===//
//                  Call Calling Convention Implementation
//===----------------------------------------------------------------------===//

#include "McasmGenCallingConv.inc"

SDValue McasmTargetLowering::LowerFormalArguments(
    SDValue Chain, CallingConv::ID CallConv, bool isVarArg,
    const SmallVectorImpl<ISD::InputArg> &Ins, const SDLoc &dl,
    SelectionDAG &DAG, SmallVectorImpl<SDValue> &InVals) const {

  MachineFunction &MF = DAG.getMachineFunction();
  MachineFrameInfo &MFI = MF.getFrameInfo();
  MachineRegisterInfo &RegInfo = MF.getRegInfo();

  // Analyze the arguments according to the calling convention
  SmallVector<CCValAssign, 16> ArgLocs;
  CCState CCInfo(CallConv, isVarArg, MF, ArgLocs, *DAG.getContext());

  // Use our calling convention
  CCInfo.AnalyzeArguments(Ins, CC_Mcasm_32);

  for (unsigned i = 0, e = ArgLocs.size(); i != e; ++i) {
    CCValAssign &VA = ArgLocs[i];
    SDValue ArgValue;

    if (VA.isRegLoc()) {
      // Argument passed in register
      EVT RegVT = VA.getLocVT();
      const TargetRegisterClass *RC = &Mcasm::GR32RegClass;

      Register VReg = RegInfo.createVirtualRegister(RC);
      RegInfo.addLiveIn(VA.getLocReg(), VReg);
      ArgValue = DAG.getCopyFromReg(Chain, dl, VReg, RegVT);

      // Handle any size extension
      if (VA.getLocInfo() == CCValAssign::SExt)
        ArgValue = DAG.getNode(ISD::AssertSext, dl, RegVT, ArgValue,
                               DAG.getValueType(VA.getValVT()));
      else if (VA.getLocInfo() == CCValAssign::ZExt)
        ArgValue = DAG.getNode(ISD::AssertZext, dl, RegVT, ArgValue,
                               DAG.getValueType(VA.getValVT()));

      if (VA.getLocInfo() != CCValAssign::Full)
        ArgValue = DAG.getNode(ISD::TRUNCATE, dl, VA.getValVT(), ArgValue);

    } else {
      // Argument passed on stack
      assert(VA.isMemLoc());

      // CRITICAL: Stack offsets are in BYTES from CCState,
      // but mcasm uses 4-byte units. Convert here.
      int ByteOffset = VA.getLocMemOffset();
      assert(ByteOffset % 4 == 0 && "Stack offset must be 4-byte aligned");

      // NOTE: We store the BYTE offset in FrameInfo, which will be converted
      // to mcasm units during frame index elimination
      int FI = MFI.CreateFixedObject(4, ByteOffset, true);

      SDValue FIPtr = DAG.getFrameIndex(FI, MVT::i32);
      ArgValue = DAG.getLoad(VA.getValVT(), dl, Chain, FIPtr,
                             MachinePointerInfo::getFixedStack(MF, FI));
    }

    InVals.push_back(ArgValue);
  }

  return Chain;
}

SDValue McasmTargetLowering::LowerCall(TargetLowering::CallLoweringInfo &CLI,
                                       SmallVectorImpl<SDValue> &InVals) const {
  SelectionDAG &DAG = CLI.DAG;
  SDLoc &DL = CLI.DL;
  SmallVectorImpl<ISD::OutputArg> &Outs = CLI.Outs;
  SmallVectorImpl<SDValue> &OutVals = CLI.OutVals;
  SmallVectorImpl<ISD::InputArg> &Ins = CLI.Ins;
  SDValue Chain = CLI.Chain;
  SDValue Callee = CLI.Callee;
  CallingConv::ID CallConv = CLI.CallConv;
  bool isVarArg = CLI.IsVarArg;

  MachineFunction &MF = DAG.getMachineFunction();

  // Analyze outgoing arguments
  SmallVector<CCValAssign, 16> ArgLocs;
  CCState CCInfo(CallConv, isVarArg, MF, ArgLocs, *DAG.getContext());

  CCInfo.AnalyzeArguments(Outs, CC_Mcasm_32);

  // Get the size of the outgoing arguments stack space
  unsigned NumBytes = CCInfo.getStackSize();

  // CRITICAL: NumBytes is in BYTES, need to convert to mcasm units
  assert(NumBytes % 4 == 0 && "Stack size must be 4-byte aligned");

  Chain = DAG.getCALLSEQ_START(Chain, NumBytes, 0, DL);

  SmallVector<std::pair<unsigned, SDValue>, 8> RegsToPass;
  SmallVector<SDValue, 8> MemOpChains;

  // Walk through arguments and prepare them for passing
  for (unsigned i = 0, e = ArgLocs.size(); i != e; ++i) {
    CCValAssign &VA = ArgLocs[i];
    SDValue Arg = OutVals[i];

    // Promote the value if needed
    switch (VA.getLocInfo()) {
    default:
      llvm_unreachable("Unknown loc info!");
    case CCValAssign::Full:
      break;
    case CCValAssign::SExt:
      Arg = DAG.getNode(ISD::SIGN_EXTEND, DL, VA.getLocVT(), Arg);
      break;
    case CCValAssign::ZExt:
      Arg = DAG.getNode(ISD::ZERO_EXTEND, DL, VA.getLocVT(), Arg);
      break;
    case CCValAssign::AExt:
      Arg = DAG.getNode(ISD::ANY_EXTEND, DL, VA.getLocVT(), Arg);
      break;
    }

    if (VA.isRegLoc()) {
      // Argument goes in a register
      RegsToPass.push_back(std::make_pair(VA.getLocReg(), Arg));
    } else {
      // Argument goes on the stack
      assert(VA.isMemLoc());

      // CRITICAL: VA.getLocMemOffset() returns BYTE offset
      // Stack pointer (rsp) in mcasm uses 4-byte units
      int ByteOffset = VA.getLocMemOffset();
      assert(ByteOffset % 4 == 0 && "Stack offset must be 4-byte aligned");

      // NOTE: The offset will be converted to mcasm units during
      // frame index elimination
      SDValue PtrOff = DAG.getIntPtrConstant(ByteOffset, DL);
      PtrOff = DAG.getNode(ISD::ADD, DL, MVT::i32,
                          DAG.getRegister(Mcasm::rsp, MVT::i32), PtrOff);

      MemOpChains.push_back(
          DAG.getStore(Chain, DL, Arg, PtrOff, MachinePointerInfo()));
    }
  }

  // Emit all stores before the call
  if (!MemOpChains.empty())
    Chain = DAG.getNode(ISD::TokenFactor, DL, MVT::Other, MemOpChains);

  // Build a sequence of copy-to-reg nodes chained together with token chain
  SDValue InGlue;
  for (auto &Reg : RegsToPass) {
    Chain = DAG.getCopyToReg(Chain, DL, Reg.first, Reg.second, InGlue);
    InGlue = Chain.getValue(1);
  }

  // Prepare the target call operand
  if (GlobalAddressSDNode *G = dyn_cast<GlobalAddressSDNode>(Callee))
    Callee = DAG.getTargetGlobalAddress(G->getGlobal(), DL, MVT::i32);

  // Build the operand list for the call
  SmallVector<SDValue, 8> Ops;
  Ops.push_back(Chain);
  Ops.push_back(Callee);

  // Add argument registers to the end of the list so that they are known live
  // into the call
  for (auto &Reg : RegsToPass)
    Ops.push_back(DAG.getRegister(Reg.first, Reg.second.getValueType()));

  // Add a register mask operand representing the call-preserved registers
  const TargetRegisterInfo *TRI = Subtarget.getRegisterInfo();
  const uint32_t *Mask = TRI->getCallPreservedMask(MF, CallConv);
  Ops.push_back(DAG.getRegisterMask(Mask));

  if (InGlue.getNode())
    Ops.push_back(InGlue);

  // Emit the call
  SDVTList NodeTys = DAG.getVTList(MVT::Other, MVT::Glue);
  Chain = DAG.getNode(McasmISD::CALL, DL, NodeTys, Ops);
  InGlue = Chain.getValue(1);

  // CALLSEQ_END
  Chain = DAG.getCALLSEQ_END(Chain, NumBytes, 0, InGlue, DL);
  InGlue = Chain.getValue(1);

  // Handle return values
  SmallVector<CCValAssign, 16> RVLocs;
  CCState RetCCInfo(CallConv, isVarArg, MF, RVLocs, *DAG.getContext());
  RetCCInfo.AnalyzeCallResult(Ins, RetCC_Mcasm_32);

  // Copy returned values from their registers
  for (unsigned i = 0; i != RVLocs.size(); ++i) {
    CCValAssign &VA = RVLocs[i];
    assert(VA.isRegLoc() && "Can only return in registers!");

    Chain = DAG.getCopyFromReg(Chain, DL, VA.getLocReg(), VA.getValVT(),
                               InGlue)
                .getValue(1);
    InVals.push_back(Chain.getValue(0));
    InGlue = Chain.getValue(2);
  }

  return Chain;
}

SDValue McasmTargetLowering::LowerReturn(
    SDValue Chain, CallingConv::ID CallConv, bool isVarArg,
    const SmallVectorImpl<ISD::OutputArg> &Outs,
    const SmallVectorImpl<SDValue> &OutVals, const SDLoc &dl,
    SelectionDAG &DAG) const {

  MachineFunction &MF = DAG.getMachineFunction();

  // Analyze return values
  SmallVector<CCValAssign, 16> RVLocs;
  CCState CCInfo(CallConv, isVarArg, MF, RVLocs, *DAG.getContext());
  CCInfo.AnalyzeReturn(Outs, RetCC_Mcasm_32);

  SDValue Glue;
  SmallVector<SDValue, 4> RetOps;
  RetOps.push_back(Chain);

  // Copy return values to their assigned registers
  for (unsigned i = 0, e = RVLocs.size(); i != e; ++i) {
    CCValAssign &VA = RVLocs[i];
    assert(VA.isRegLoc() && "Can only return in registers!");

    Chain = DAG.getCopyToReg(Chain, dl, VA.getLocReg(), OutVals[i], Glue);
    Glue = Chain.getValue(1);
    RetOps.push_back(DAG.getRegister(VA.getLocReg(), VA.getLocVT()));
  }

  RetOps[0] = Chain;

  if (Glue.getNode())
    RetOps.push_back(Glue);

  return DAG.getNode(McasmISD::RET_GLUE, dl, MVT::Other, RetOps);
}
