//
// Created by xia__mc on 2025/3/14.
//

#ifndef CLANG_MC_POSTOPTIMIZER_H
#define CLANG_MC_POSTOPTIMIZER_H


#include "ir/IRCommon.h"
#include "config/Config.h"
#include <ranges>

class PostOptimizer {
private:
    std::vector<McFunctions> &mcFunctions;
public:
    explicit PostOptimizer(std::vector<McFunctions> &mcFunctions) : mcFunctions(mcFunctions) {
    }

    static void doSingleOptimize(std::string &code);

    void optimize();
};


#endif //CLANG_MC_POSTOPTIMIZER_H
