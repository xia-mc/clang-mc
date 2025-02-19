//
// Created by xia__mc on 2025/2/16.
//

#ifndef CLANG_MC_IR_H
#define CLANG_MC_IR_H

#include "config/Config.h"
#include "vector"
#include "IRCommon.h"
#include "utils/NameGenerator.h"
#include "ir/ops/Label.h"

class IR {
private:
    const Logger &logger;
    const Config &config;
    const Path &file;
    std::vector<OpPtr> values = std::vector<OpPtr>();
    NameGenerator nameGenerator = NameGenerator();

    std::string createForCall(const Label *labelOp);

    std::string createForJmp(const Label *labelOp);

    void initLabels(LabelMap &callLabels, LabelMap &jmpLabels);
public:
    explicit IR(const Logger &logger, const Config &config, const Path &file) : logger(logger), config(config), file(file) {
    }

    GETTER(Values, values);

    void parse(const std::string &code);

    [[nodiscard]] McFunctions compile();
};

[[nodiscard]] static __forceinline McFunctions compileIR(IR &ir) {
    return ir.compile();
}

#endif //CLANG_MC_IR_H
