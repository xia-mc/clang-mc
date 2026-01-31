//===-- McasmWinCOFFStreamer.cpp - Mcasm Target WinCOFF Streamer ----*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "McasmMCTargetDesc.h"
#include "McasmTargetStreamer.h"
#include "llvm/MC/MCAsmBackend.h"
#include "llvm/MC/MCAssembler.h"
#include "llvm/MC/MCCodeEmitter.h"
#include "llvm/MC/MCObjectWriter.h"
#include "llvm/MC/MCWin64EH.h"
#include "llvm/MC/MCWinCOFFStreamer.h"

using namespace llvm;

namespace {
class McasmWinCOFFStreamer : public MCWinCOFFStreamer {
  Win64EH::UnwindEmitter EHStreamer;
public:
  McasmWinCOFFStreamer(MCContext &C, std::unique_ptr<MCAsmBackend> AB,
                     std::unique_ptr<MCCodeEmitter> CE,
                     std::unique_ptr<MCObjectWriter> OW)
      : MCWinCOFFStreamer(C, std::move(AB), std::move(CE), std::move(OW)) {}

  void emitInstruction(const MCInst &Inst, const MCSubtargetInfo &STI) override;
  void emitWinEHHandlerData(SMLoc Loc) override;
  void emitWindowsUnwindTables(WinEH::FrameInfo *Frame) override;
  void emitWindowsUnwindTables() override;
  void emitCVFPOData(const MCSymbol *ProcSym, SMLoc Loc) override;
  void finishImpl() override;
};

void McasmWinCOFFStreamer::emitInstruction(const MCInst &Inst,
                                         const MCSubtargetInfo &STI) {
  Mcasm_MC::emitInstruction(*this, Inst, STI);
}

void McasmWinCOFFStreamer::emitWinEHHandlerData(SMLoc Loc) {
  MCStreamer::emitWinEHHandlerData(Loc);

  // We have to emit the unwind info now, because this directive
  // actually switches to the .xdata section.
  if (WinEH::FrameInfo *CurFrame = getCurrentWinFrameInfo()) {
    // Handlers are always associated with the parent frame.
    CurFrame = CurFrame->ChainedParent ? CurFrame->ChainedParent : CurFrame;
    EHStreamer.EmitUnwindInfo(*this, CurFrame, /* HandlerData = */ true);
  }
}

void McasmWinCOFFStreamer::emitWindowsUnwindTables(WinEH::FrameInfo *Frame) {
  EHStreamer.EmitUnwindInfo(*this, Frame, /* HandlerData = */ false);
}

void McasmWinCOFFStreamer::emitWindowsUnwindTables() {
  if (!getNumWinFrameInfos())
    return;
  EHStreamer.Emit(*this);
}

void McasmWinCOFFStreamer::emitCVFPOData(const MCSymbol *ProcSym, SMLoc Loc) {
  McasmTargetStreamer *XTS =
      static_cast<McasmTargetStreamer *>(getTargetStreamer());
  XTS->emitFPOData(ProcSym, Loc);
}

void McasmWinCOFFStreamer::finishImpl() {
  emitFrames();
  emitWindowsUnwindTables();

  MCWinCOFFStreamer::finishImpl();
}
} // namespace

MCStreamer *
llvm::createMcasmWinCOFFStreamer(MCContext &C, std::unique_ptr<MCAsmBackend> &&AB,
                               std::unique_ptr<MCObjectWriter> &&OW,
                               std::unique_ptr<MCCodeEmitter> &&CE) {
  return new McasmWinCOFFStreamer(C, std::move(AB), std::move(CE), std::move(OW));
}
