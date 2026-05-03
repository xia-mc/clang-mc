//
// Created by Codex on 2026/5/1.
//

#include "PostOptimizeContext.h"

namespace postopt {

bool PostOptimizeContext::containsFunction(const Path &path) const {
    if (functions == nullptr) {
        return false;
    }
    if (functions->contains(path)) {
        return true;
    }
    return std::ranges::any_of(pendingFunctions, [&](const PendingFunction &function) {
        return function.path == path;
    });
}

void PostOptimizeContext::addFunction(Path path, std::string code) {
    if (functions == nullptr) {
        return;
    }
    pendingFunctions.emplace_back(std::move(path), std::move(code));
}

void PostOptimizeContext::flush() {
    if (functions == nullptr) {
        pendingFunctions.clear();
        return;
    }
    for (auto &function: pendingFunctions) {
        functions->insert_or_assign(std::move(function.path), std::move(function.code));
    }
    pendingFunctions.clear();
}

}  // namespace postopt
