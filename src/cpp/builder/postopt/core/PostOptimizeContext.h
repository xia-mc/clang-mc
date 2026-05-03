//
// Created by Codex on 2026/5/1.
//

#ifndef CLANG_MC_POSTOPTIMIZECONTEXT_H
#define CLANG_MC_POSTOPTIMIZECONTEXT_H

#include "ir/IRCommon.h"

namespace postopt {

struct PendingFunction {
    Path path;
    std::string code;
};

class PostOptimizeContext {
private:
    McFunctions *functions = nullptr;
    std::vector<PendingFunction> pendingFunctions;

public:
    explicit PostOptimizeContext(McFunctions *functions = nullptr) : functions(functions) {
    }

    [[nodiscard]] bool hasFunctionMap() const noexcept {
        return functions != nullptr;
    }

    [[nodiscard]] bool containsFunction(const Path &path) const;

    void addFunction(Path path, std::string code);

    void flush();
};

}  // namespace postopt

#endif //CLANG_MC_POSTOPTIMIZECONTEXT_H
