//===-- McasmISelLowering.cpp - Mcasm DAG Lowering Implementation --------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file implements the McasmTargetLowering class.
//
// MCASM NOTE: Minimal stub implementation for mcasm backend.
//
//===----------------------------------------------------------------------===//

#include "McasmISelLowering.h"
#include "Mcasm.h"
#include "McasmSubtarget.h"
#include "McasmTargetMachine.h"
#include "llvm/CodeGen/CallingConvLower.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/CodeGen/SelectionDAG.h"

using namespace llvm;

#define DEBUG_TYPE "mcasm-lower"

// Include TableGen-generated files
#define GET_REGINFO_ENUM
#include "McasmGenRegisterInfo.inc"

#include "McasmGenCallingConv.inc"

McasmTargetLowering::McasmTargetLowering(const McasmTargetMachine &TM,
                                         const McasmSubtarget &STI)
    : TargetLowering(TM, STI), Subtarget(STI) {

  // Set up the register classes
  addRegisterClass(MVT::i32, &Mcasm::GR32RegClass);

  // Compute derived properties
  computeRegisterProperties(STI.getRegisterInfo());

  // Stack configuration
  setStackPointerRegisterToSaveRestore(Mcasm::rsp);
  setMinFunctionAlignment(Align(4));
  setMinStackArgumentAlignment(Align(4));

  // Basic arithmetic operations - legal by default for i32
  setOperationAction(ISD::ADD, MVT::i32, Legal);
  setOperationAction(ISD::SUB, MVT::i32, Legal);
  setOperationAction(ISD::MUL, MVT::i32, Legal);

  // Division/Remainder - expand to library calls for now
  setOperationAction(ISD::SDIV, MVT::i32, Expand);
  setOperationAction(ISD::UDIV, MVT::i32, Expand);
  setOperationAction(ISD::SREM, MVT::i32, Expand);
  setOperationAction(ISD::UREM, MVT::i32, Expand);

  // Shifts and rotates
  setOperationAction(ISD::SHL, MVT::i32, Legal);
  setOperationAction(ISD::SRA, MVT::i32, Legal);
  setOperationAction(ISD::SRL, MVT::i32, Legal);
  setOperationAction(ISD::ROTL, MVT::i32, Expand);
  setOperationAction(ISD::ROTR, MVT::i32, Expand);

  // Logical operations
  setOperationAction(ISD::AND, MVT::i32, Legal);
  setOperationAction(ISD::OR, MVT::i32, Legal);
  setOperationAction(ISD::XOR, MVT::i32, Legal);

  // Comparison operations
  setOperationAction(ISD::SETCC, MVT::i32, Legal);

  // Control flow operations
  setOperationAction(ISD::BR_JT, MVT::Other, Expand);
  setOperationAction(ISD::BR_CC, MVT::i32, Expand);
  setOperationAction(ISD::SELECT_CC, MVT::i32, Expand);
  setOperationAction(ISD::SELECT, MVT::i32, Expand);
  setOperationAction(ISD::BRCOND, MVT::Other, Custom);

  // Global addresses and constants
  setOperationAction(ISD::GlobalAddress, MVT::i32, Custom);
  setOperationAction(ISD::BlockAddress, MVT::i32, Custom);
  setOperationAction(ISD::ConstantPool, MVT::i32, Custom);
  setOperationAction(ISD::JumpTable, MVT::i32, Custom);

  // Stack operations
  setOperationAction(ISD::DYNAMIC_STACKALLOC, MVT::i32, Expand);
  setOperationAction(ISD::STACKSAVE, MVT::Other, Expand);
  setOperationAction(ISD::STACKRESTORE, MVT::Other, Expand);

  // Expand unsupported operations
  setOperationAction(ISD::VASTART, MVT::Other, Custom);
  setOperationAction(ISD::VAARG, MVT::Other, Expand);
  setOperationAction(ISD::VACOPY, MVT::Other, Expand);
  setOperationAction(ISD::VAEND, MVT::Other, Expand);
}

SDValue McasmTargetLowering::LowerFormalArguments(
    SDValue Chain, CallingConv::ID CallConv, bool isVarArg,
    const SmallVectorImpl<ISD::InputArg> &Ins, const SDLoc &dl,
    SelectionDAG &DAG, SmallVectorImpl<SDValue> &InVals) const {
  MachineFunction &MF = DAG.getMachineFunction();
  MachineFrameInfo &MFI = MF.getFrameInfo();

  // Analyze incoming arguments according to calling convention
  SmallVector<CCValAssign, 16> ArgLocs;
  CCState CCInfo(CallConv, isVarArg, MF, ArgLocs, *DAG.getContext());
  CCInfo.AnalyzeFormalArguments(Ins, CC_Mcasm_32);

  for (unsigned i = 0, e = ArgLocs.size(); i != e; ++i) {
    CCValAssign &VA = ArgLocs[i];

    if (VA.isRegLoc()) {
      // Argument passed in register
      const TargetRegisterClass *RC = &Mcasm::GR32RegClass;
      unsigned VReg = MF.getRegInfo().createVirtualRegister(RC);
      MF.getRegInfo().addLiveIn(VA.getLocReg(), VReg);
      SDValue ArgValue = DAG.getCopyFromReg(Chain, dl, VReg, MVT::i32);
      InVals.push_back(ArgValue);
    } else {
      // Argument passed on stack
      assert(VA.isMemLoc() && "Expected memory location");
      int FI = MFI.CreateFixedObject(4, VA.getLocMemOffset(), true);
      SDValue FINode = DAG.getFrameIndex(FI, MVT::i32);
      SDValue Load = DAG.getLoad(MVT::i32, dl, Chain, FINode,
                                  MachinePointerInfo::getFixedStack(MF, FI));
      InVals.push_back(Load);
    }
  }

  return Chain;
}

SDValue McasmTargetLowering::LowerCall(
    CallLoweringInfo &CLI, SmallVectorImpl<SDValue> &InVals) const {
  SelectionDAG &DAG = CLI.DAG;
  SDLoc &dl = CLI.DL;
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
  CCInfo.AnalyzeCallOperands(Outs, CC_Mcasm_32);

  // Get the size of the outgoing arguments stack space
  unsigned NumBytes = CCInfo.getStackSize();

  // Adjust stack if needed
  if (NumBytes > 0) {
    Chain = DAG.getCALLSEQ_START(Chain, NumBytes, 0, dl);
  }

  SmallVector<std::pair<unsigned, SDValue>, 8> RegsToPass;
  SmallVector<SDValue, 8> MemOpChains;

  // Walk the register/memloc assignments
  for (unsigned i = 0, e = ArgLocs.size(); i != e; ++i) {
    CCValAssign &VA = ArgLocs[i];
    SDValue Arg = OutVals[i];

    if (VA.isRegLoc()) {
      // Queue up register to pass
      RegsToPass.push_back(std::make_pair(VA.getLocReg(), Arg));
    } else {
      // Stack argument
      assert(VA.isMemLoc() && "Expected memory location");
      SDValue PtrOff = DAG.getIntPtrConstant(VA.getLocMemOffset(), dl);
      PtrOff = DAG.getNode(ISD::ADD, dl, MVT::i32,
                           DAG.getRegister(Mcasm::rsp, MVT::i32), PtrOff);
      MemOpChains.push_back(DAG.getStore(Chain, dl, Arg, PtrOff,
                                         MachinePointerInfo()));
    }
  }

  // Emit copies for argument registers
  if (!MemOpChains.empty())
    Chain = DAG.getNode(ISD::TokenFactor, dl, MVT::Other, MemOpChains);

  // Build register list for CopyToReg
  SDValue Glue;
  for (unsigned i = 0, e = RegsToPass.size(); i != e; ++i) {
    Chain = DAG.getCopyToReg(Chain, dl, RegsToPass[i].first,
                             RegsToPass[i].second, Glue);
    Glue = Chain.getValue(1);
  }

  // Emit call instruction
  SmallVector<SDValue, 8> Ops;
  Ops.push_back(Chain);
  Ops.push_back(Callee);

  // Add register operands
  for (unsigned i = 0, e = RegsToPass.size(); i != e; ++i)
    Ops.push_back(DAG.getRegister(RegsToPass[i].first,
                                   RegsToPass[i].second.getValueType()));

  if (Glue.getNode())
    Ops.push_back(Glue);

  Chain = DAG.getNode(McasmISD::CALL, dl, DAG.getVTList(MVT::Other, MVT::Glue),
                      Ops);
  Glue = Chain.getValue(1);

  // Handle return values
  SmallVector<CCValAssign, 16> RVLocs;
  CCState RVInfo(CallConv, isVarArg, MF, RVLocs, *DAG.getContext());
  RVInfo.AnalyzeCallResult(Ins, RetCC_Mcasm_32);

  for (unsigned i = 0; i != RVLocs.size(); ++i) {
    Chain = DAG.getCopyFromReg(Chain, dl, RVLocs[i].getLocReg(),
                                RVLocs[i].getValVT(), Glue).getValue(1);
    Glue = Chain.getValue(2);
    InVals.push_back(Chain.getValue(0));
  }

  // Clean up stack if needed
  if (NumBytes > 0) {
    Chain = DAG.getCALLSEQ_END(Chain, NumBytes, 0, Glue, dl);
    Glue = Chain.getValue(1);
  }

  return Chain;
}

SDValue McasmTargetLowering::LowerReturn(
    SDValue Chain, CallingConv::ID CallConv, bool isVarArg,
    const SmallVectorImpl<ISD::OutputArg> &Outs,
    const SmallVectorImpl<SDValue> &OutVals, const SDLoc &dl,
    SelectionDAG &DAG) const {
  MachineFunction &MF = DAG.getMachineFunction();

  SmallVector<CCValAssign, 16> RVLocs;
  CCState CCInfo(CallConv, isVarArg, MF, RVLocs, *DAG.getContext());
  CCInfo.AnalyzeReturn(Outs, RetCC_Mcasm_32);

  SDValue Glue;
  SmallVector<SDValue, 4> RetOps;
  RetOps.push_back(Chain);  // Operand 0: Chain

  // NOTE: mcasm RET instruction has NO parameters
  // Caller cleanup is done by caller using ADD rsp or POP after CALL
  // (see ZH_Calling-Convention.md: "调用者清理")

  // Copy return values to their assigned locations
  for (unsigned i = 0, e = RVLocs.size(); i != e; ++i) {
    CCValAssign &VA = RVLocs[i];
    assert(VA.isRegLoc() && "Only register returns are supported");

    // Use VA.getValNo() — RVLocs entries can be multiple for a single original value
    SDValue Val = OutVals[VA.getValNo()];

    // Type conversion if needed
    if (Val.getValueType() != VA.getLocVT()) {
      Val = DAG.getZExtOrTrunc(Val, dl, VA.getLocVT());
    }

    Chain = DAG.getCopyToReg(Chain, dl, VA.getLocReg(), Val, Glue);
    Glue = Chain.getValue(1);
    RetOps.push_back(DAG.getRegister(VA.getLocReg(), VA.getLocVT()));
  }

  RetOps[0] = Chain;  // Update chain

  // Add glue if present
  if (Glue.getNode())
    RetOps.push_back(Glue);

  return DAG.getNode(McasmISD::RET_GLUE, dl, MVT::Other, RetOps);
}

const char *McasmTargetLowering::getTargetNodeName(unsigned Opcode) const {
  switch (Opcode) {
  default: return nullptr;
  case McasmISD::CALL:            return "McasmISD::CALL";
  case McasmISD::RET_GLUE:        return "McasmISD::RET_GLUE";
  case McasmISD::CMP:             return "McasmISD::CMP";
  case McasmISD::BRCOND:          return "McasmISD::BRCOND";
  case McasmISD::Wrapper:         return "McasmISD::Wrapper";
  case McasmISD::WrapperPIC:      return "McasmISD::WrapperPIC";
  }
}

SDValue McasmTargetLowering::LowerOperation(SDValue Op, SelectionDAG &DAG) const {
  switch (Op.getOpcode()) {
  case ISD::GlobalAddress:
  case ISD::BlockAddress:
  case ISD::ConstantPool:
  case ISD::JumpTable:
    // For now, just return the operand wrapped as-is
    // A full implementation would handle PIC relocation models
    return Op;

  case ISD::VASTART:
    // Minimal varargs support - expand to nothing for now
    return SDValue();

  default:
    // Operation not supported - return unchanged
    return Op;
  }
}
