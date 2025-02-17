//
// Created by xia__mc on 2025/2/16.
//

#ifndef CLANG_MC_IR_H
#define CLANG_MC_IR_H

#include "vector"
#include "IRCommon.h"
#include "ClangMc.h"

class IR {
private:
    const Logger &logger;
    const Path &file;
    std::vector<OpPtr> values = std::vector<OpPtr>();
public:
    explicit IR(const Path &file) : file(file), logger(ClangMc::INSTANCE->logger) {
    }

    void parse(const std::string &code);

    std::unordered_map<Path, std::string> compile();

    GETTER(Values, values);
};


#endif //CLANG_MC_IR_H
