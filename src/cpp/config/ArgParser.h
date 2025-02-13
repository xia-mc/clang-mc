//
// Created by xia__mc on 2025/2/13.
//

#ifndef CLANG_MC_ARGPARSER_H
#define CLANG_MC_ARGPARSER_H

#include "Config.h"
#include "string"
#include "utils/StringUtils.h"

class ParseException : std::runtime_error {
public:
    explicit ParseException(const std::string &string) : std::runtime_error(string) {
    }

    [[nodiscard]] const char *what() const noexcept override {
        return std::runtime_error::what();
    }
};

class ArgParser {
private:
    Config config;
    std::string lastString;
    bool required = false;

public:
    explicit ArgParser(const Config &config);

    void next(const std::string &string);

    void end();

    GETTER(Config, Config, config);
};

#endif //CLANG_MC_ARGPARSER_H
