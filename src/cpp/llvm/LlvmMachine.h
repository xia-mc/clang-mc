//
// Created by xia__mc on 2025/3/13.
//

#ifndef CLANG_MC_LLVMMACHINE_H
#define CLANG_MC_LLVMMACHINE_H

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-parameter"
#include "llvm/Target/TargetMachine.h"
#pragma clang diagnostic pop


class LLVMMachine : public llvm::TargetMachine {
public:
    LLVMMachine(const llvm::Target &T, const llvm::Triple &TT, llvm::StringRef CPU, llvm::StringRef FS,
                const llvm::TargetOptions &Options)
            : TargetMachine(T, "e-m:e-p:32:32-i32:32-n32-S32", TT, CPU, FS, Options) {
    }

    const llvm::TargetSubtargetInfo *getSubtargetImpl(const llvm::Function &) const noexcept override {
        return nullptr;
    }
};


#endif //CLANG_MC_LLVMMACHINE_H
