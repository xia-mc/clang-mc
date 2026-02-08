//===-- McasmFilteredStream.cpp - Filter ELF directives ---------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "McasmFilteredStream.h"
#include "llvm/ADT/StringRef.h"

using namespace llvm;

std::optional<std::string> McasmFilteredStream::transformLine(const std::string &Line) const {
  StringRef LineRef(Line);

  // DEBUG: Print every line to see what's being processed
  // fprintf(stderr, "FILTER DEBUG: [%s]\n", Line.c_str());

  // Trim leading whitespace for comparison
  StringRef Trimmed = LineRef.ltrim();

  // Filter out ELF directives that mcasm assembler doesn't understand
  // Use simple startswith checks - no regex to avoid complexity and bugs
  // BUT: If the line contains "-- Begin/End function" comment, preserve the comment

  // Check if this line contains an important comment that should be preserved
  size_t BeginEndCommentPos = Line.find("// -- Begin function");
  if (BeginEndCommentPos == std::string::npos)
    BeginEndCommentPos = Line.find("// -- End function");

  if (Trimmed.starts_with(".file")) {
    if (BeginEndCommentPos != std::string::npos)
      return std::optional<std::string>(Line.substr(BeginEndCommentPos));
    return std::nullopt;
  }

  if (Trimmed.starts_with(".text")) {
    if (BeginEndCommentPos != std::string::npos)
      return std::optional<std::string>(Line.substr(BeginEndCommentPos));
    return std::nullopt;
  }

  if (Trimmed.starts_with(".data")) {
    if (BeginEndCommentPos != std::string::npos)
      return std::optional<std::string>(Line.substr(BeginEndCommentPos));
    return std::nullopt;
  }

  if (Trimmed.starts_with(".bss")) {
    if (BeginEndCommentPos != std::string::npos)
      return std::optional<std::string>(Line.substr(BeginEndCommentPos));
    return std::nullopt;
  }

  if (Trimmed.starts_with(".p2align")) {
    if (BeginEndCommentPos != std::string::npos)
      return std::optional<std::string>(Line.substr(BeginEndCommentPos));
    return std::nullopt;
  }

  if (Trimmed.starts_with(".section")) {
    if (BeginEndCommentPos != std::string::npos)
      return std::optional<std::string>(Line.substr(BeginEndCommentPos));
    return std::nullopt;
  }

  if (Trimmed.starts_with(".note.GNU-stack")) {
    if (BeginEndCommentPos != std::string::npos)
      return std::optional<std::string>(Line.substr(BeginEndCommentPos));
    return std::nullopt;
  }

  if (Trimmed.starts_with(".addrsig")) {
    if (BeginEndCommentPos != std::string::npos)
      return std::optional<std::string>(Line.substr(BeginEndCommentPos));
    return std::nullopt;
  }

  // Special handling for preprocessor directives (#include, #define, etc.)
  // mcasm uses # for preprocessor, so we must not modify these lines
  if (Trimmed.starts_with("#")) {
    return Line;  // Keep preprocessor directives as-is
  }

  // Handle lines with "// -- Begin function" or "// -- End function"
  // (Note: CommentString is already "//" so LLVM generates // comments)
  // These lines often have a label before the comment that we want to remove
  size_t CommentPos = Line.find("//");
  if (CommentPos != std::string::npos) {
    StringRef Comment = StringRef(Line).substr(CommentPos);

    // Check if this is a Begin/End function comment
    if (Comment.contains("-- Begin function") || Comment.contains("-- End function")) {
      // Only keep the comment part (label before comment is removed)
      return Comment.str();
    }

    // Other comments are kept as-is
    return Line;
  }

  // Keep all other lines unchanged
  return Line;
}

void McasmFilteredStream::write_impl(const char *Ptr, size_t Size) {
  for (size_t i = 0; i < Size; ++i) {
    char C = Ptr[i];

    if (C == '\n') {
      // End of line - process the buffered line
      if (auto Transformed = transformLine(LineBuffer)) {
        OS << *Transformed << '\n';
      }
      LineBuffer.clear();
      AtLineStart = true;
    } else {
      // Add character to line buffer
      LineBuffer += C;
      AtLineStart = false;
    }
  }
}

void McasmFilteredStream::flush_line() {
  // Flush any remaining content in the line buffer
  if (!LineBuffer.empty()) {
    if (auto Transformed = transformLine(LineBuffer)) {
      OS << *Transformed;
    }
    LineBuffer.clear();
  }
  OS.flush();
}
