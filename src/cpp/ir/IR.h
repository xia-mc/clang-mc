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
#include "extern/ResourceManager.h"

class ParseManager;

class IR {
private:
    const Logger &logger;
    const Config &config;
    Path file;
    std::string sourceCode;  // 维持sourceMap中的view
    HashMap<const Op *, std::string_view> sourceMap = HashMap<const Op *, std::string_view>();
    std::vector<OpPtr> values = std::vector<OpPtr>();

    std::string createForCall(const Label *labelOp);

    void initLabels(LabelMap &labelMap);

    friend class ParseManager;
public:
    explicit IR(const Logger &logger, const Config &config, Path &&file) : logger(logger), config(config), file(std::move(file)) {
    }

    [[nodiscard]] std::string getFileDisplay() const {
        auto result = file.lexically_relative(BIN_PATH);
        if (!result.empty() && result.native()[0] != '.') {
            return result.string();
        }
        result = file.lexically_relative(std::filesystem::current_path());
        if (!result.empty() && result.native()[0] != '.') {
            return result.string();
        }
        return file.string();
    }

    GETTER(Values, values);

    void parse(std::string &&code);

    [[nodiscard]] McFunctions compile();

    [[nodiscard]] __forceinline std::string_view getSource(const Op *op) const noexcept {
        assert(!sourceMap.empty());

        const auto result = sourceMap.find(op);
        if (result != sourceMap.end()) {
            return result->second;
        }
        return "Unknown Source";
    }

    static inline std::string generateName() {
        return NameGenerator::getInstance().generate();
    }
};

#endif //CLANG_MC_IR_H
