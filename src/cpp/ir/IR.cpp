//
// Created by xia__mc on 2025/2/16.
//

#include "IR.h"
#include "ops/Nop.h"
#include "utils/string/StringUtils.h"
#include "ir/ops/Label.h"
#include "ir/ops/Jmp.h"
#include "utils/string/StringBuilder.h"
#include "ir/ops/Call.h"
#include "ir/controlFlow/JmpTable.h"

void IR::parse(std::string &&code) {
    this->sourceCode = std::move(code);
    auto lines = string::split(sourceCode, '\n');

    size_t errors = 0;
    for (size_t i = 0; i < lines.size(); ++i) {
        const auto line = string::trim(string::removeComment(lines[i]));
        if (UNLIKELY(line.empty())) {
            continue;
        }

        const i32 lineNumber = static_cast<i32>(i) + 1;

        try {
            auto op = createOp(lineNumber, line);
            this->sourceMap.emplace(op.get(), lines[i]);
            this->values.push_back(std::move(op));
        } catch (const ParseException &e) {
            logger->error(createIRMessage(file, lineNumber, lines[i], e.what()));
            errors++;
        }
    }

    if (UNLIKELY(errors != 0)) {
        throw ParseException(i18nFormat("ir.errors_generated", errors));
    }
}

__forceinline std::string IR::createForCall(const Label *labelOp) {
    if (labelOp->getExport() || labelOp->getExtern()) {
        assert(string::count(labelOp->getLabel(), ':') == 1);
        return labelOp->getLabel();
    }

    const auto name = generateName();
    return fmt::format("{}{}", config.getNameSpace(), name);
}

static inline Path toPath(const std::string &mcPath) {
    static const auto data = Path("data");
    static const auto function = Path("function");
    static const auto mcfunction = Path(".mcfunction");

    assert(string::count(mcPath, ':') == 1);
    auto splits = string::split(mcPath, ':', 2);
    auto result = data / splits[0] / function / splits[1];
    result += mcfunction;
    return result;
}

__forceinline void IR::initLabels(LabelMap &labelMap) {
    auto labelOp = CAST_FAST(this->values[0], Label);
    Hash label = labelOp->getLabelHash();
    labelMap.emplace(label, createForCall(labelOp));

    for (size_t i = 1; i < this->values.size(); ++i) {
        const auto &op = this->values[i];
        if (!INSTANCEOF(op, Label)) {
            continue;
        }

        labelOp = CAST_FAST(op, Label);
        label = labelOp->getLabelHash();

        assert(!labelMap.contains(label));
        auto a = createForCall(labelOp);
        labelMap.emplace(label, a);
    }
}

static inline constexpr std::string_view DEBUG_MSG_TEMPLATE = "#\n# file: '{}'\n# label: '{}'\n#\n\n";

[[nodiscard]] McFunctions IR::compile() {
    auto result = McFunctions();
    if (UNLIKELY(this->values.empty())) {
        return result;
    }
    assert(INSTANCEOF(this->values[0], Label));

    Label *labelOp = CAST_FAST(this->values[0], Label);
    Hash label = labelOp->getLabelHash();
    auto labelMap = LabelMap();
    initLabels(labelMap);
    auto jmpTable = JmpTable(values, labelMap);
    jmpTable.make();
    const auto &jmpMap = jmpTable.getJmpMap();

    auto builder = StringBuilder();
    std::string debugMessage;

    if (config.getDebugInfo()) {
        debugMessage = fmt::format(DEBUG_MSG_TEMPLATE, file.string(), CAST_FAST(this->values[0], Label)->getLabel());
    }

    bool unreachable = false;
    for (size_t i = 1; i < this->values.size(); ++i) {
        const auto &op = this->values[i];
        if (INSTANCEOF(op, Nop)) {
            continue;
        }

        if (INSTANCEOF(op, Label)) {
            auto lastLabelOp = labelOp;
            auto lastLabel = label;
            labelOp = CAST_FAST(op, Label);
            label = labelOp->getLabelHash();

            if (!unreachable) {
                // 因为实际上采用“代码块”模式编译，而不是label，所以每个代码块末尾都需要显式跳转到下个代码块
                auto jmp = std::make_unique<Jmp>(0, labelOp->getLabel());
                builder.appendLine(jmp->compile(jmpMap));
            }

            if (!lastLabelOp->getExtern()) {
                auto target = toPath(labelMap[lastLabel]);
                result.emplace(target, builder.toString());

                if (config.getDebugInfo()) {
                    result[target] = debugMessage + result[target];
                }
            }
            builder.clear();

            if (config.getDebugInfo()) {
                debugMessage = fmt::format(DEBUG_MSG_TEMPLATE, file.string(), labelOp->getLabel());
            }

            unreachable = false;
            continue;
        }

        if (config.getDebugInfo()) {
            const auto source = string::trim(getSource(op.get()));
            const auto strEval = op->toString();
            builder.append("# ");
            builder.appendLine(source);
            if (source != strEval) {
                builder.append("# aka '");
                builder.append(strEval);
                builder.appendLine('\'');
            }
        }

        std::string compiled;
        if (const auto &call = INSTANCEOF(op, Call)) {
            compiled = call->compile(labelMap);
        } else if (const auto &jmpLike = INSTANCEOF(op, JmpLike)) {
            compiled = jmpLike->compile(jmpMap);
        } else {
            compiled = op->compile();
        }
        if (!compiled.empty()) {
            builder.appendLine(compiled);
        }

        if (isTerminate(op)) {
            unreachable = true;
        }
    }

    auto target = toPath(labelMap[label]);
    result.emplace(target, builder.toString());

    if (config.getDebugInfo()) {
        result[target] = debugMessage + result[target];
    }

    return result;
}
