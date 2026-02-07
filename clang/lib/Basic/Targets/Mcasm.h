//===--- Mcasm.h - Declare Mcasm target feature support ---------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file declares Mcasm TargetInfo objects.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_CLANG_LIB_BASIC_TARGETS_MCASM_H
#define LLVM_CLANG_LIB_BASIC_TARGETS_MCASM_H

#include "clang/Basic/TargetInfo.h"
#include "clang/Basic/TargetOptions.h"
#include "llvm/Support/Compiler.h"
#include "llvm/TargetParser/Triple.h"

namespace clang {
namespace targets {

class LLVM_LIBRARY_VISIBILITY McasmTargetInfo : public TargetInfo {
  // Class for Mcasm (32-bit Minecraft assembly)
  static const TargetInfo::GCCRegAlias GCCRegAliases[];
  static const char *const GCCRegNames[];

public:
  McasmTargetInfo(const llvm::Triple &Triple, const TargetOptions &)
      : TargetInfo(Triple) {
    // Mcasm data layout: 32-bit pointers, 32-bit alignment for everything
    // e-p:32:32-i8:32-i16:32-i32:32-f32:32-a:0:32-n32
    resetDataLayout("e-p:32:32-i8:32-i16:32-i32:32-f32:32-a:0:32-n32");

    // Mcasm uses 8 parameter registers (r0-r7)
    RegParmMax = 8;

    // All types are 32-bit aligned in mcasm
    MinGlobalAlign = 32;

    // Pointer characteristics
    PointerWidth = PointerAlign = 32;
    IntWidth = IntAlign = 32;
    LongWidth = LongAlign = 32;
    LongLongWidth = LongLongAlign = 32;

    // Size types
    SizeType = UnsignedInt;
    PtrDiffType = SignedInt;
    IntPtrType = SignedInt;
  }

  void getTargetDefines(const LangOptions &Opts,
                        MacroBuilder &Builder) const override;

  bool isValidCPUName(StringRef Name) const override {
    return Name == "generic";
  }

  void fillValidCPUList(SmallVectorImpl<StringRef> &Values) const override {
    Values.emplace_back("generic");
  }

  bool setCPU(const std::string &Name) override {
    return Name == "generic";
  }

  bool hasFeature(StringRef Feature) const override {
    return false;  // Mcasm has no additional features
  }

  ArrayRef<const char *> getGCCRegNames() const override;

  ArrayRef<TargetInfo::GCCRegAlias> getGCCRegAliases() const override;

  BuiltinVaListKind getBuiltinVaListKind() const override {
    return TargetInfo::VoidPtrBuiltinVaList;
  }

  llvm::SmallVector<Builtin::InfosShard> getTargetBuiltins() const override {
    return {};
  }

  bool validateAsmConstraint(const char *&Name,
                             TargetInfo::ConstraintInfo &info) const override {
    return false;
  }

  std::string_view getClobbers() const override { return ""; }

  bool hasBitIntType() const override { return true; }
};
} // namespace targets
} // namespace clang

#endif // LLVM_CLANG_LIB_BASIC_TARGETS_MCASM_H
