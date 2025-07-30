//
// Created by xia__mc on 2025/2/13.
//

#ifndef CLANG_MC_ARGPARSER_H
#define CLANG_MC_ARGPARSER_H

#include "Config.h"
#include "string"
#include "unordered_set"
#include "utils/string/StringUtils.h"
#include "utils/Common.h"

// 需要额外参数的参数项
static inline const HashSet<Hash> DATA_ARGS = {
        hash("--output"), hash("-o"),
        hash("--build-dir"), hash("-B"),
        hash("--namespace"), hash("-N"),
        hash("-I"),
        hash("--data-dir"), hash("-D")
};

class ArgParser {
private:
    Config &config;
    std::string lastString;
    bool required = false;

    void setNameSpace(const std::string &arg);

public:
    explicit ArgParser(Config &config);

    void next(const std::string &string);

    void end();

    GETTER(Config, config);
};

#endif //CLANG_MC_ARGPARSER_H
