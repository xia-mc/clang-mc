//
// Created by xia__mc on 2025/3/14.
//

#include "PostOptimizer.h"
#include "builder/postopt/core/Pipeline.h"

void PostOptimizer::doSingleOptimize(std::string &code) {
    postopt::optimizeSingleFunction(code);
}

void PostOptimizer::optimize() {
    for (auto &functionMap: mcFunctions) {
        auto keys = std::vector<Path>();
        keys.reserve(functionMap.size());
        for (const auto &entry: functionMap) {
            keys.push_back(entry.first);
        }

        auto context = postopt::PostOptimizeContext(&functionMap);
        for (const auto &key: keys) {
            auto found = functionMap.find(key);
            if (found == functionMap.end()) {
                continue;
            }
            auto view = postopt::FunctionView{found->first, found->second, context};
            postopt::optimizeFunction(view);
        }
        context.flush();
    }
}
