//
// Created by Codex on 2026/5/1.
//

#ifndef CLANG_MC_FUNCTIONVIEW_H
#define CLANG_MC_FUNCTIONVIEW_H

#include "PostOptimizeContext.h"

namespace postopt {

struct FunctionView {
    const Path &path;
    std::string &code;
    PostOptimizeContext &context;
};

}  // namespace postopt

#endif //CLANG_MC_FUNCTIONVIEW_H
