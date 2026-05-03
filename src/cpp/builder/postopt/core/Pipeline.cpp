//
// Created by Codex on 2026/5/1.
//

#include "Pipeline.h"
#include "builder/postopt/passes/function/ExecuteGroupPass.h"
#include "builder/postopt/passes/generated/SpecialFunctionPass.h"
#include "builder/postopt/passes/line/LineCleanupPass.h"
#include "builder/postopt/passes/line/SafeLineTransforms.h"

namespace postopt {

void optimizeSingleFunction(std::string &code) {
    if (code.empty()) {
        return;
    }
    if (replaceGeneratedSpecialFunction(code)) {
        return;
    }
    code = cleanupFunctionText(code);
    code = optimizeLines(code);
}

void optimizeFunction(FunctionView view) {
    optimizeSingleFunction(view.code);
    applyExecuteGroupPass(view);
}

}  // namespace postopt
