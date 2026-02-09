//===-- McasmSelectionDAGInfo.cpp - Mcasm SelectionDAG Info --------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file implements the McasmSelectionDAGInfo class.
//
// MCASM NOTE: Minimal stub implementation for mcasm backend.
// No memcpy/memset optimizations - LLVM will lower these to simple loops.
//
//===----------------------------------------------------------------------===//

#include "McasmSelectionDAGInfo.h"

using namespace llvm;

#define DEBUG_TYPE "mcasm-selectiondag-info"

// Mcasm does not have custom memory opcodes
bool McasmSelectionDAGInfo::isTargetMemoryOpcode(unsigned Opcode) const {
  return false;
}

// Mcasm does not support strict FP
bool McasmSelectionDAGInfo::isTargetStrictFPOpcode(unsigned Opcode) const {
  return false;
}

// No custom memset lowering for mcasm - let LLVM handle it
SDValue McasmSelectionDAGInfo::EmitTargetCodeForMemset(
    SelectionDAG &DAG, const SDLoc &dl, SDValue Chain, SDValue Dst,
    SDValue Val, SDValue Size, Align Alignment, bool isVolatile, bool AlwaysInline,
    MachinePointerInfo DstPtrInfo) const {
  // Return empty SDValue to let LLVM use default lowering
  return SDValue();
}

// No custom memcpy lowering for mcasm - let LLVM handle it
SDValue McasmSelectionDAGInfo::EmitTargetCodeForMemcpy(
    SelectionDAG &DAG, const SDLoc &dl, SDValue Chain, SDValue Dst,
    SDValue Src, SDValue Size, Align Alignment, bool isVolatile, bool AlwaysInline,
    MachinePointerInfo DstPtrInfo, MachinePointerInfo SrcPtrInfo) const {
  // Return empty SDValue to let LLVM use default lowering
  return SDValue();
}
