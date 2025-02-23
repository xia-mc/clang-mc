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
    std::string sourceCode;  // 维持sourceMap中的view
    HashMap<const Op *, std::string_view> sourceMap = HashMap<const Op *, std::string_view>();
    std::vector<OpPtr> values = std::vector<OpPtr>();
    NameGenerator nameGenerator = NameGenerator();

    std::string createForCall(const Label *labelOp);

    std::string createForJmp(const Label *labelOp);

    void initLabels(LabelMap &callLabels, LabelMap &jmpLabels);
public:
    explicit IR(const Logger &logger, const Config &config, const Path &file) : logger(logger), config(config), file(file) {
    }

    GETTER(File, file);

    GETTER(Values, values);

    void parse(std::string code);

    [[nodiscard]] McFunctions compile();

    [[nodiscard]] __forceinline std::string_view getSource(const Op *op) const noexcept {
        assert(!sourceCode.empty());
        assert(!sourceMap.empty());

        assert(sourceMap.contains(op));
        return sourceMap.at(op);
    }

    __forceinline void freeSource() {
        sourceCode.clear();
        sourceMap.clear();
    }
};

[[nodiscard]] static __forceinline McFunctions compileIR(IR &ir) {
    return ir.compile();
}

#endif //CLANG_MC_IR_H
