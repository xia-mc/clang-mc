//
// Created by xia__mc on 2025/2/13.
//

#ifndef CLANG_MC_CLANGMC_H
#define CLANG_MC_CLANGMC_H

#include "config/Config.h"

class ClangMc {
public:
    static ClangMc *INSTANCE;
    Config config;

    explicit ClangMc(const Config &config);

    void start();
};

#endif //CLANG_MC_CLANGMC_H
