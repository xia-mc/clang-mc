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

  // High multiplication results - not supported, forces LLVM to use native DIV
  setOperationAction(ISD::MULHS, MVT::i32, Expand);
  setOperationAction(ISD::MULHU, MVT::i32, Expand);
  setOperationAction(ISD::SMUL_LOHI, MVT::i32, Expand);
  setOperationAction(ISD::UMUL_LOHI, MVT::i32, Expand);

  // Division - mcasm has native signed division
  setOperationAction(ISD::SDIV, MVT::i32, Legal);

  // Unsigned division and remainder - expand to library calls
  setOperationAction(ISD::UDIV, MVT::i32, Expand);
  setOperationAction(ISD::SREM, MVT::i32, Expand);
  setOperationAction(ISD::UREM, MVT::i32, Expand);

  // Shifts and rotates - mcasm does not support bit operations
  // Expand to library calls or scalar code
  setOperationAction(ISD::SHL, MVT::i32, Expand);
  setOperationAction(ISD::SRA, MVT::i32, Expand);
  setOperationAction(ISD::SRL, MVT::i32, Expand);
  setOperationAction(ISD::ROTL, MVT::i32, Expand);
  setOperationAction(ISD::ROTR, MVT::i32, Expand);

  // Logical operations - mcasm does not support bit operations, expand to library calls
  setOperationAction(ISD::AND, MVT::i32, Expand);
  setOperationAction(ISD::OR, MVT::i32, Expand);
  setOperationAction(ISD::XOR, MVT::i32, Expand);
  setOperationAction(ISD::CTPOP, MVT::i32, Expand);
  setOperationAction(ISD::CTLZ, MVT::i32, Expand);
  setOperationAction(ISD::CTTZ, MVT::i32, Expand);

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

  // Vector operations - mcasm does not support SIMD/vector operations
  // Expand all vector operations to scalar operations
  setOperationAction(ISD::BUILD_VECTOR, MVT::Other, Custom);
  setOperationAction(ISD::EXTRACT_VECTOR_ELT, MVT::Other, Expand);
  setOperationAction(ISD::INSERT_VECTOR_ELT, MVT::Other, Expand);
  setOperationAction(ISD::SCALAR_TO_VECTOR, MVT::Other, Expand);
  setOperationAction(ISD::VECTOR_SHUFFLE, MVT::Other, Expand);
  setOperationAction(ISD::CONCAT_VECTORS, MVT::Other, Expand);

  // Explicitly mark that we don't support any vector types
  for (MVT VT : MVT::fixedlen_vector_valuetypes()) {
    setOperationAction(ISD::BUILD_VECTOR, VT, Expand);
    setOperationAction(ISD::EXTRACT_VECTOR_ELT, VT, Expand);
    setOperationAction(ISD::INSERT_VECTOR_ELT, VT, Expand);
    setOperationAction(ISD::SCALAR_TO_VECTOR, VT, Expand);
    setOperationAction(ISD::VECTOR_SHUFFLE, VT, Expand);
    setOperationAction(ISD::CONCAT_VECTORS, VT, Expand);
    setOperationAction(ISD::EXTRACT_SUBVECTOR, VT, Expand);
    setOperationAction(ISD::SELECT, VT, Expand);

    // Arithmetic operations on vectors
    setOperationAction(ISD::ADD, VT, Expand);
    setOperationAction(ISD::SUB, VT, Expand);
    setOperationAction(ISD::MUL, VT, Expand);
    setOperationAction(ISD::SDIV, VT, Expand);
    setOperationAction(ISD::UDIV, VT, Expand);
    setOperationAction(ISD::SREM, VT, Expand);
    setOperationAction(ISD::UREM, VT, Expand);

    // Bitwise operations on vectors
    setOperationAction(ISD::AND, VT, Expand);
    setOperationAction(ISD::OR, VT, Expand);
    setOperationAction(ISD::XOR, VT, Expand);

    // Shift operations on vectors
    setOperationAction(ISD::SHL, VT, Expand);
    setOperationAction(ISD::SRA, VT, Expand);
    setOperationAction(ISD::SRL, VT, Expand);

    // Load/store operations on vectors
    setOperationAction(ISD::LOAD, VT, Expand);
    setOperationAction(ISD::STORE, VT, Expand);
  }
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
  bool &IsTailCall = CLI.IsTailCall;
  MachineFunction &MF = DAG.getMachineFunction();

  // Analyze outgoing arguments
  SmallVector<CCValAssign, 16> ArgLocs;
  CCState CCInfo(CallConv, isVarArg, MF, ArgLocs, *DAG.getContext());
  CCInfo.AnalyzeCallOperands(Outs, CC_Mcasm_32);

  // Get the size of the outgoing arguments stack space
  unsigned NumBytes = CCInfo.getStackSize();

  // Check if tail call is possible
  // For now, only allow tail calls with no stack arguments
  if (IsTailCall && NumBytes > 0) {
    IsTailCall = false;  // Cannot tail call with stack arguments
  }

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

  // Convert GlobalAddress/ExternalSymbol to TargetGlobalAddress/TargetExternalSymbol
  // Direct calls will use CALL instruction, indirect calls will use CALLD
  if (GlobalAddressSDNode *G = dyn_cast<GlobalAddressSDNode>(Callee)) {
    Callee = DAG.getTargetGlobalAddress(G->getGlobal(), dl, MVT::i32,
                                         G->getOffset());
  } else if (ExternalSymbolSDNode *E = dyn_cast<ExternalSymbolSDNode>(Callee)) {
    Callee = DAG.getTargetExternalSymbol(E->getSymbol(), MVT::i32);
  }
  // If Callee is already a register (indirect call via function pointer),
  // it will be matched by CALLD pattern

  // Emit call or tail call instruction
  SmallVector<SDValue, 8> Ops;
  Ops.push_back(Chain);
  Ops.push_back(Callee);

  // Add register operands
  for (unsigned i = 0, e = RegsToPass.size(); i != e; ++i)
    Ops.push_back(DAG.getRegister(RegsToPass[i].first,
                                   RegsToPass[i].second.getValueType()));

  if (Glue.getNode())
    Ops.push_back(Glue);

  if (IsTailCall) {
    // Tail call: JMP directly to the callee, no return value handling needed
    return DAG.getNode(McasmISD::TC_RETURN, dl, MVT::Other, Ops);
  }

  // Regular call
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
  case McasmISD::TC_RETURN:       return "McasmISD::TC_RETURN";
  case McasmISD::RET_GLUE:        return "McasmISD::RET_GLUE";
  case McasmISD::CMP:             return "McasmISD::CMP";
  case McasmISD::BRCOND:          return "McasmISD::BRCOND";
  case McasmISD::BR_CC:           return "McasmISD::BR_CC";
  case McasmISD::Wrapper:         return "McasmISD::Wrapper";
  case McasmISD::WrapperPIC:      return "McasmISD::WrapperPIC";
  case McasmISD::FunctionWrapper: return "McasmISD::FunctionWrapper";
  }
}

SDValue McasmTargetLowering::LowerOperation(SDValue Op, SelectionDAG &DAG) const {
  switch (Op.getOpcode()) {
  case ISD::GlobalAddress:
    return lowerGlobalAddress(Op, DAG);
  case ISD::BlockAddress:
    return lowerBlockAddress(Op, DAG);
  case ISD::ConstantPool:
    return lowerConstantPool(Op, DAG);
  case ISD::JumpTable:
    return lowerJumpTable(Op, DAG);
  case ISD::BRCOND:
    return lowerBRCOND(Op, DAG);

  case ISD::BUILD_VECTOR:
    // mcasm does not support vector operations - return SDValue() to let LLVM expand
    return SDValue();

  case ISD::VASTART:
    // Minimal varargs support - expand to nothing for now
    return SDValue();

  default:
    // Operation not supported - return unchanged
    return Op;
  }
}

SDValue McasmTargetLowering::lowerGlobalAddress(SDValue Op,
                                                SelectionDAG &DAG) const {
  SDLoc DL(Op);
  EVT Ty = Op.getValueType();
  GlobalAddressSDNode *N = cast<GlobalAddressSDNode>(Op);
  const GlobalValue *GV = N->getGlobal();
  int64_t Offset = N->getOffset();

  // Create a TargetGlobalAddress node
  SDValue TargetAddr = DAG.getTargetGlobalAddress(GV, DL, Ty, Offset);

  // Check if this is a function address
  // Functions require MOVD (more expensive, should be cached)
  // Data addresses use regular MOV
  bool isFunction = isa<Function>(GV);
  fprintf(stderr, "DEBUG lowerGlobalAddress: GV=%s, isFunction=%d\n",
          GV->getName().str().c_str(), isFunction);
  fflush(stderr);

  if (isFunction) {
    // Function address - use FunctionWrapper -> will match MOVD32ri
    fprintf(stderr, "DEBUG: Using FunctionWrapper for %s\n", GV->getName().str().c_str());
    fflush(stderr);
    return DAG.getNode(McasmISD::FunctionWrapper, DL, Ty, TargetAddr);
  } else {
    // Data address - use regular Wrapper -> will match MOV32ri
    fprintf(stderr, "DEBUG: Using Wrapper for %s\n", GV->getName().str().c_str());
    fflush(stderr);
    return DAG.getNode(McasmISD::Wrapper, DL, Ty, TargetAddr);
  }
}

SDValue McasmTargetLowering::lowerBlockAddress(SDValue Op,
                                               SelectionDAG &DAG) const {
  SDLoc DL(Op);
  EVT Ty = Op.getValueType();
  BlockAddressSDNode *N = cast<BlockAddressSDNode>(Op);
  const BlockAddress *BA = N->getBlockAddress();
  int64_t Offset = N->getOffset();

  SDValue TargetAddr = DAG.getTargetBlockAddress(BA, Ty, Offset);
  return DAG.getNode(McasmISD::Wrapper, DL, Ty, TargetAddr);
}

SDValue McasmTargetLowering::lowerConstantPool(SDValue Op,
                                               SelectionDAG &DAG) const {
  SDLoc DL(Op);
  EVT Ty = Op.getValueType();
  ConstantPoolSDNode *N = cast<ConstantPoolSDNode>(Op);
  const Constant *C = N->getConstVal();
  int64_t Offset = N->getOffset();

  SDValue TargetAddr = DAG.getTargetConstantPool(C, Ty, N->getAlign(), Offset);
  return DAG.getNode(McasmISD::Wrapper, DL, Ty, TargetAddr);
}

SDValue McasmTargetLowering::lowerJumpTable(SDValue Op,
                                            SelectionDAG &DAG) const {
  SDLoc DL(Op);
  EVT Ty = Op.getValueType();
  JumpTableSDNode *N = cast<JumpTableSDNode>(Op);
  int JTI = N->getIndex();

  SDValue TargetAddr = DAG.getTargetJumpTable(JTI, Ty);
  return DAG.getNode(McasmISD::Wrapper, DL, Ty, TargetAddr);
}

SDValue McasmTargetLowering::lowerBRCOND(SDValue Op, SelectionDAG &DAG) const {
  SDLoc DL(Op);
  SDValue Chain = Op.getOperand(0);
  SDValue Cond = Op.getOperand(1);
  SDValue Dest = Op.getOperand(2);

  // If the condition is a setcc node, we can directly use its operands
  if (Cond.getOpcode() == ISD::SETCC) {
    SDValue LHS = Cond.getOperand(0);
    SDValue RHS = Cond.getOperand(1);
    ISD::CondCode CC = cast<CondCodeSDNode>(Cond.getOperand(2))->get();

    // Create BR_CC node: chain, lhs, rhs, cc, dest
    return DAG.getNode(McasmISD::BR_CC, DL, MVT::Other, Chain, LHS, RHS,
                       DAG.getCondCode(CC), Dest);
  }

  // Otherwise, fall back to default expansion
  return SDValue();
}
