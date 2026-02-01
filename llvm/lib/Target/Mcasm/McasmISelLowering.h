//===-- McasmISelLowering.h - Mcasm DAG Lowering Interface ------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file defines the interfaces that Mcasm uses to lower LLVM code into a
// selection DAG.
//
// MCASM NOTE: This is a minimal rewrite for the mcasm backend, which is a
// simplified 32-bit integer-only architecture. Most x86-specific optimizations
// and features have been removed.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_MCASM_MCASMISELLOWERING_H
#define LLVM_LIB_TARGET_MCASM_MCASMISELLOWERING_H

#include "Mcasm.h"
#include "llvm/CodeGen/TargetLowering.h"

namespace llvm {
class McasmSubtarget;
class McasmTargetMachine;

namespace McasmISD {
// Mcasm Specific DAG Nodes
enum NodeType : unsigned {
  // Start the numbering where the builtin ops leave off.
  FIRST_NUMBER = ISD::BUILTIN_OP_END,

  /// Mcasm call instruction.
  CALL,

  /// Return with a glue operand. Operand 0 is the chain operand.
  RET_GLUE,

  /// Mcasm compare instruction.
  CMP,

  /// Mcasm conditional branches. Operand 0 is the chain operand, operand 1
  /// is the block to branch if condition is true, operand 2 is the
  /// condition code, and operand 3 is the flag operand produced by a CMP
  /// instruction.
  BRCOND,

  /// Wrapper for a global address.
  Wrapper,

  /// Wrapper for a global address - used for PIC.
  WrapperPIC
};
} // namespace McasmISD

class McasmTargetLowering : public TargetLowering {
public:
  explicit McasmTargetLowering(const McasmTargetMachine &TM,
                               const McasmSubtarget &STI);

  /// getTargetNodeName - This method returns the name of a target specific
  /// DAG node.
  const char *getTargetNodeName(unsigned Opcode) const override;

  SDValue LowerOperation(SDValue Op, SelectionDAG &DAG) const override;

  /// LowerFormalArguments - This hook must be implemented to lower the
  /// incoming (formal) arguments, described by the Ins array, into the
  /// specified DAG. The implementation should fill in the InVals array
  /// with legal-type argument values, and return the resulting token
  /// chain value.
  SDValue LowerFormalArguments(
      SDValue Chain, CallingConv::ID CallConv, bool isVarArg,
      const SmallVectorImpl<ISD::InputArg> &Ins, const SDLoc &dl,
      SelectionDAG &DAG, SmallVectorImpl<SDValue> &InVals) const override;

  /// LowerCall - This hook must be implemented to lower calls into the
  /// specified DAG.
  SDValue LowerCall(TargetLowering::CallLoweringInfo &CLI,
                    SmallVectorImpl<SDValue> &InVals) const override;

  /// LowerReturn - This hook must be implemented to lower outgoing
  /// return values, described by the Outs array, into the specified
  /// DAG. The implementation should return the resulting token chain
  /// value.
  SDValue LowerReturn(SDValue Chain, CallingConv::ID CallConv, bool isVarArg,
                      const SmallVectorImpl<ISD::OutputArg> &Outs,
                      const SmallVectorImpl<SDValue> &OutVals, const SDLoc &dl,
                      SelectionDAG &DAG) const override;

private:
  const McasmSubtarget &Subtarget;

  SDValue LowerGlobalAddress(SDValue Op, SelectionDAG &DAG) const;
};

} // namespace llvm

#endif
