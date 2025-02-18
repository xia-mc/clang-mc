//
// Created by xia__mc on 2025/2/13.
//

#ifndef CLANG_MC_ARGPARSER_H
#define CLANG_MC_ARGPARSER_H

#include "Config.h"
#include "string"
#include "unordered_set"
#include "utils/StringUtils.h"
#include "utils/Common.h"

// 需要额外参数的参数项
static inline const std::unordered_set<ui64> DATA_ARGS = {
        hash("--output"), hash("-o"),
        hash("--build-dir"), hash("-B")
};

class ArgParser {
private:
    Config &config;
    std::string lastString;
    bool required = false;

public:
    explicit ArgParser(Config &config);

    void next(const std::string &string);

    void end();

    GETTER(Config, config);
};

#endif //CLANG_MC_ARGPARSER_H
