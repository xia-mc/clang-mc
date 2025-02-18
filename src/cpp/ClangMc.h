//
// Created by xia__mc on 2025/2/13.
//

#ifndef CLANG_MC_CLANGMC_H
#define CLANG_MC_CLANGMC_H

#include "config/Config.h"
#include "utils/Common.h"
#include "ir/IR.h"

class ClangMc {
public:
    static inline constexpr auto NAME = "clang-mc";
    static inline constexpr auto VERSION = "0.0.0-dev";

    const Config &config;
    Logger logger;

    explicit ClangMc(const Config &config);

    ~ClangMc();

    void start();

    [[noreturn]] static void exit();
private:

    void ensureValidConfig();

    void ensureBuildDir();

    [[nodiscard]] std::vector<IR> loadIRCode();
};

#endif //CLANG_MC_CLANGMC_H
