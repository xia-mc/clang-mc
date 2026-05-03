//
// Created by Codex on 2026/5/1.
//

#ifndef CLANG_MC_EXECUTEGROUPPASS_H
#define CLANG_MC_EXECUTEGROUPPASS_H

#include "builder/postopt/core/FunctionView.h"

namespace postopt {

void applyExecuteGroupPass(FunctionView view);

}  // namespace postopt

#endif //CLANG_MC_EXECUTEGROUPPASS_H
