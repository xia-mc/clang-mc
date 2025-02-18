//
// Created by xia__mc on 2025/2/16.
//

#ifndef CLANG_MC_IR_H
#define CLANG_MC_IR_H

#include "vector"
#include "IRCommon.h"

class IR {
private:
    const Logger &logger;
    const Path &file;
    std::vector<OpPtr> values = std::vector<OpPtr>();
public:
    explicit IR(const Path &file, const Logger &logger) : logger(logger), file(file) {
    }

    GETTER(Values, values);

    void parse(const std::string &code);

    [[nodiscard]] McFunctions compile() const;
};

[[nodiscard]] static __forceinline McFunctions compileIR(const IR &ir) {
    return ir.compile();
}

#endif //CLANG_MC_IR_H
