//===-- McasmFilteredStream.h - Filter ELF directives ----------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file defines a filtered output stream that removes ELF-specific
// directives from mcasm assembly output.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_MCASM_MCTARGETDESC_MCASMFILTEREDSTREAM_H
#define LLVM_LIB_TARGET_MCASM_MCTARGETDESC_MCASMFILTEREDSTREAM_H

#include "llvm/Support/raw_ostream.h"
#include <optional>
#include <string>

namespace llvm {

/// McasmFilteredStream - A raw_ostream that filters out ELF directives
/// that are not supported by the mcasm assembler.
class McasmFilteredStream : public raw_ostream {
  raw_ostream &OS;           // Underlying output stream
  std::string LineBuffer;    // Buffer for current line
  bool AtLineStart;          // Are we at the start of a line?

  void write_impl(const char *Ptr, size_t Size) override;
  uint64_t current_pos() const override { return OS.tell(); }

  /// Transform a complete line - return transformed line or nullopt to discard
  std::optional<std::string> transformLine(const std::string &Line) const;

public:
  explicit McasmFilteredStream(raw_ostream &UnderlyingStream)
      : OS(UnderlyingStream), AtLineStart(true) {
    SetUnbuffered();
  }

  ~McasmFilteredStream() override {
    flush();
  }

  // Flush any remaining buffered content
  void flush_line();
};

} // end namespace llvm

#endif
