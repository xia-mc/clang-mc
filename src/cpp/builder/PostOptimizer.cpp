//
// Created by xia__mc on 2025/3/14.
//

#include "PostOptimizer.h"

void PostOptimizer::doSingleOptimize(std::string &code) {
    if (code.empty()) return;
    auto splits = string::split(code, '\n');

    bool first = true;
    auto builder = StringBuilder();
    for (const auto &line : splits) {
        if (line.empty() || line.front() == '#') continue;

        if (!first) builder.append('\n');
        builder.append(string::trim(string::removeFromFirst(line, "#")));
        first = false;
    }

    code = builder.toString();
}

void PostOptimizer::optimize() {
#pragma omp parallel for
    for (size_t i = 0; i < mcFunctions.size(); i++) {  // NOLINT(modernize-loop-convert)
        auto &mcFunction = mcFunctions[i].values();

#pragma omp parallel for
        for (size_t j = 0; j < mcFunction.size(); j++) {  // NOLINT(modernize-loop-convert)
            doSingleOptimize(mcFunction[j].second);
        }
    }
}
