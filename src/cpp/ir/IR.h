//
// Created by xia__mc on 2025/2/16.
//

#ifndef CLANG_MC_IR_H
#define CLANG_MC_IR_H

#include "config/Config.h"
#include "vector"
#include "IRCommon.h"
#include "objects/NameGenerator.h"
#include "ir/ops/Label.h"
#include "extern/ResourceManager.h"

class ParseManager;

struct Line {
    i32 lineNumber;
    std::string_view filename;
};

class IR {
private:
    const Logger &logger;
    const Config &config;
    Path file;
    std::string fileDisplay;
    std::string sourceCode;  // 维持sourceMap中的view
    HashMap<const Op *, std::string_view> sourceMap = HashMap<const Op *, std::string_view>();
    HashMap<const Op *, Line> lineMap = HashMap<const Op *, Line>();
    std::vector<OpPtr> values = std::vector<OpPtr>();

    std::string createForCall(const Label *labelOp);

    void initLabels(LabelMap &labelMap);

    friend class ParseManager;
public:
    explicit IR(const Logger &logger, const Config &config, Path &&file) : logger(logger), config(config),
        file(std::move(file)), fileDisplay(string::getPrettyPath(this->file)) {
    }

    [[nodiscard]] __forceinline std::string_view getFileDisplay() const {
        return fileDisplay;
    }

    GETTER(Values, values);

    void parse(std::string &&code);

    [[nodiscard]] McFunctions compile();

    [[nodiscard]] std::string_view getSource(const Op *op) const {
        assert(!sourceMap.empty());

        const auto result = sourceMap.find(op);
        if (result != sourceMap.end()) {
            return result->second;
        }
        return "Unknown Source";
    }

    [[nodiscard]] Line getLine(const Op *op) const {
        assert(!lineMap.empty());

        const auto result = lineMap.find(op);
        if (result != lineMap.end()) {
            return result->second;
        }
        return Line(-1, "Unknown Source");
    }

    static inline std::string generateName() {
        return NameGenerator::getInstance().generate();
    }
};

PURE static inline std::string createIRMessage(const Line &line, const std::string_view &source, const std::string_view &message) {
    std::string lineNumber;
    if (line.lineNumber == -1) {
        lineNumber = "?";
    } else {
        lineNumber = std::to_string(line.lineNumber);
    }

    return fmt::format("{}:{}: {}\n    {} | {}",
                       line.filename, lineNumber, message, lineNumber, source);
}

PURE static inline std::string createIRMessage(const IR &ir, const Op *op, const std::string_view &message) {
    auto source = ir.getSource(op);
    return createIRMessage(ir.getLine(op), UNLIKELY(source == "Unknown Source") ? fmt::format("(aka) {}", op->toString()) : source, message);
}

PURE static __forceinline std::string createIRMessage(const Line &line, const std::string_view &message) {
    return createIRMessage(line, "Unknown Source", message);
}

#endif //CLANG_MC_IR_H
