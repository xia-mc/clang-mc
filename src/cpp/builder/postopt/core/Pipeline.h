//
// Created by Codex on 2026/5/1.
//

#ifndef CLANG_MC_POSTOPT_PIPELINE_H
#define CLANG_MC_POSTOPT_PIPELINE_H

#include "FunctionView.h"

namespace postopt {

void optimizeSingleFunction(std::string &code);

void optimizeFunction(FunctionView view);

}  // namespace postopt

#endif //CLANG_MC_POSTOPT_PIPELINE_H
