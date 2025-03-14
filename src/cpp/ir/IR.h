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

    std::string createForCall(const Label *labelOp);

    void initLabels(LabelMap &labelMap);
public:
    explicit IR(const Logger &logger, const Config &config, const Path &file) : logger(logger), config(config), file(file) {
    }

    GETTER(File, file);

    GETTER(Values, values);

    void parse(std::string &&code);

    [[nodiscard]] McFunctions compile();

    [[nodiscard]] __forceinline std::string_view getSource(const Op *op) const noexcept {
        assert(!sourceCode.empty());
        assert(!sourceMap.empty());

        const auto result = sourceMap.find(op);
        if (result != sourceMap.end()) {
            return result->second;
        }
        return "Unknown Source";
    }

    __forceinline void freeSource() {
        sourceCode.clear();
        sourceMap.clear();
    }

    static inline std::string generateName() {
        return NameGenerator::getInstance().generate();
    }
};

#endif //CLANG_MC_IR_H
