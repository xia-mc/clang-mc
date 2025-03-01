//
// Created by xia__mc on 2025/2/16.
//

#include "IR.h"
#include "utils/StringUtils.h"
#include "ir/ops/Label.h"
#include "ir/ops/Jmp.h"

void IR::parse(std::string &&code) {
    this->sourceCode = std::move(code);
    auto lines = string::split(sourceCode, '\n');

    size_t errors = 0;
    for (size_t i = 0; i < lines.size(); ++i) {
        const auto line = string::trim(string::removeComment(lines[i]));
        if (UNLIKELY(line.empty())) {
            continue;
        }

        const ui64 lineNumber = i + 1;  // ui64防止+1后溢出

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

    return fmt::format("{}{}", config.getNameSpace(), generateName());
}

__forceinline std::string IR::createForJmp(const Label *labelOp) {
    assert(!labelOp->getExtern());
    return fmt::format("{}{}", config.getNameSpace(), generateName());
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

__forceinline void IR::initLabels(LabelMap &callLabels, LabelMap &jmpLabels) {
    auto labelOp = CAST_FAST(this->values[0], Label);
    Hash label = hash(labelOp->getLabel());
    callLabels.emplace(label, createForCall(labelOp));
    if (!labelOp->getExtern()) {
        jmpLabels.emplace(label, createForJmp(labelOp));
    }

    for (size_t i = 1; i < this->values.size(); ++i) {
        const auto &op = this->values[i];
        if (op->getName() != "label") {
            continue;
        }

        labelOp = CAST_FAST(op, Label);
        label = hash(labelOp->getLabel());

        assert(!callLabels.contains(label));
        assert(!jmpLabels.contains(label));
        callLabels.emplace(label, createForCall(labelOp));
        if (!labelOp->getExtern()) {
            jmpLabels.emplace(label, createForJmp(labelOp));
        }
    }
}

static inline constexpr std::string_view JMP_LAST_TEMPLATE = "return run function {}";
static inline constexpr std::string_view JMP_TEMPLATE = "execute if function {} run return 1\nfunction {}";

[[nodiscard]] McFunctions IR::compile() {
    auto result = McFunctions();
    if (UNLIKELY(this->values.empty())) {
        return result;
    }
    assert(INSTANCEOF(this->values[0], Label));

    Hash label = CAST_FAST(this->values[0], Label)->getLabelHash();
    auto callLabels = LabelMap();
    auto jmpLabels = LabelMap();
    initLabels(callLabels, jmpLabels);

    auto builder = std::ostringstream();
    std::string debugMessage;

    if (config.getDebugInfo()) {
        debugMessage = fmt::format("# file: '{}'\n# label: '{}'\n",
                                   file.string(), CAST_FAST(this->values[0], Label)->getLabel());
    }

    bool unreachable = false;
    for (size_t i = 1; i < this->values.size(); ++i) {
        const auto &op = this->values[i];
        if (const auto &labelOp = INSTANCEOF(op, Label)) {
            auto lastLabel = label;
            label = labelOp->getLabelHash();

            if (!unreachable) {
                // 因为实际上采用“代码块”模式编译，而不是label，所以每个代码块末尾都需要显式跳转到下个代码块
                auto jmp = std::make_unique<Jmp>(0, labelOp->getLabel());
                builder << jmp->compile(callLabels, jmpLabels) << '\n';
            }

            if (jmpLabels.contains(lastLabel)) {  // 不是extern
                auto callTarget = toPath(callLabels[lastLabel]);
                result.emplace(callTarget, builder.str());

                auto jmpTarget = toPath(jmpLabels[lastLabel]);
                result.emplace(jmpTarget, fmt::format(JMP_TEMPLATE,
                                                      callLabels[lastLabel], callLabels[label]));
                if (config.getDebugInfo()) {
                    result[jmpTarget] = debugMessage + "# type: jmp\n\n" + result[jmpTarget];
                    result[callTarget] = debugMessage + "# type: call\n\n" + result[callTarget];
                }
            }

            if (config.getDebugInfo()) {
                debugMessage = fmt::format("# file: '{}'\n# label: '{}'\n",
                                           file.string(), labelOp->getLabel());
            }

            builder.str("");
            builder.clear();
            unreachable = false;
            continue;
        }

        if (config.getDebugInfo()) {
            const auto source = string::trim(getSource(op.get()));
            const auto strEval = op->toString();
            builder << "# " << source << '\n';
            if (source != strEval) {
                builder << "# aka '" << strEval << "'\n";
            }
        }

        std::string compiled;
        if (const auto &callLike = INSTANCEOF(op, CallLike)) {
            compiled = callLike->compile(callLabels, jmpLabels);
        } else {
            compiled = op->compile();
        }
        if (!compiled.empty()) {
            builder << compiled << '\n';
        }

        if (isTerminate(op)) {
            unreachable = true;
        }
    }

    if (jmpLabels.contains(label)) {
        auto callTarget = toPath(callLabels[label]);
        result.emplace(callTarget, builder.str());
        auto jmpTarget = toPath(jmpLabels[label]);
        result.emplace(jmpTarget, fmt::format(JMP_LAST_TEMPLATE, callLabels[label]));

        if (config.getDebugInfo()) {
            result[jmpTarget] = debugMessage + "# type: jmp\n\n" + result[jmpTarget] + "\n# undefined from here";
            result[callTarget] = debugMessage + "# type: call\n\n" + result[callTarget];
        }
    }

    return result;
}
