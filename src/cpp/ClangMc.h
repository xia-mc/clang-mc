//
// Created by xia__mc on 2025/2/13.
//

#ifndef CLANG_MC_CLANGMC_H
#define CLANG_MC_CLANGMC_H

#include "config/Config.h"
#include "utils/Common.h"

class ClangMc {
public:
    static inline constexpr std::string NAME = "clang-mc";
    static inline constexpr std::string VERSION = "0.0.0-dev";

    [[maybe_unused]] static ClangMc *INSTANCE;

    const Config &config;
    Logger logger;

    explicit ClangMc(const Config &config);

    ~ClangMc();

    void start();

private:
    void ensureValidConfig();

    __attribute__((noreturn))
    static inline void exit();
};

#endif //CLANG_MC_CLANGMC_H
