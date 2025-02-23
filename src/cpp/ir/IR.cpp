//
// Created by xia__mc on 2025/2/16.
//

#include "IR.h"
#include "utils/StringUtils.h"
#include "ir/ops/Label.h"
#include "ir/ops/Jmp.h"
#include "ir/ops/Call.h"

void IR::parse(std::string code) {
    auto lines = string::split(code, '\n');
    this->sourceCode = std::move(code);

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
            logger->error(createIRMessage(file, lineNumber, line, e.what()));
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

    return fmt::format("{}{}", config.getNameSpace(), nameGenerator.generate());
}

__forceinline std::string IR::createForJmp(const Label *labelOp) {
    assert(!labelOp->getExtern());
    return fmt::format("{}{}", config.getNameSpace(), nameGenerator.generate());
}

static inline Path toPath(const std::string &mcPath) {
    static const auto data = Path("data");
    static const auto function = Path("function");
    static const auto mcfunction = Path(".mcfunction");

    assert(string::count(mcPath, ':') == 1);
    auto splits = string::split(mcPath, ':', 2);
    return data / splits[0] / function / splits[1] / mcfunction;
}

__forceinline void IR::initLabels(LabelMap &callLabels, LabelMap &jmpLabels) {
    auto labelOp = CAST_FAST(this->values[0], Label);
    Hash label = hash(labelOp->getLabel());
    callLabels.emplace(label, createForCall(labelOp));
    jmpLabels.emplace(label, createForJmp(labelOp));

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
        jmpLabels.emplace(label, createForJmp(labelOp));
    }
}

static inline constexpr std::string_view JMP_LAST_TEMPLATE = "execute if function {} run return 0";
static inline constexpr std::string_view JMP_TEMPLATE = "execute if function {} run return 0\nfunction {}";

[[nodiscard]] McFunctions IR::compile() {
    auto result = McFunctions();
    if (UNLIKELY(this->values.empty())) {
        return result;
    }
    assert(INSTANCEOF(this->values[0], Label));

    auto labelOp = CAST_FAST(this->values[0], Label);
    Hash label = labelOp->getLabelHash();
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
        if (op->getName() == "label") {
            auto lastLabel = label;
            label = CAST_FAST(op, Label)->getLabelHash();

            if (!unreachable) {
                // 因为实际上采用“代码块”模式编译，而不是label，所以每个代码块末尾都需要显式跳转到下个代码块
                builder << std::make_unique<Jmp>(0, CAST_FAST(op, Label)->getLabel())
                        ->compile(jmpLabels) << '\n';
            }

            auto callTarget = toPath(callLabels[lastLabel]);
            auto jmpTarget = toPath(jmpLabels[lastLabel]);
            result.emplace(callTarget, builder.str());
            result.emplace(jmpTarget, fmt::format(JMP_TEMPLATE,
                                                  callLabels[lastLabel], callLabels[label]));

            if (config.getDebugInfo()) {
                result[callTarget] = debugMessage + "# type: call\n\n" + result[callTarget];
                result[jmpTarget] = debugMessage + "# type: jmp\n\n" + result[jmpTarget];
                debugMessage = fmt::format("# file: '{}'\n# label: '{}'\n",
                                           file.string(), CAST_FAST(op, Label)->getLabel());
            }

            builder.str("");
            builder.clear();
            unreachable = false;
            continue;
        }

        if (config.getDebugInfo()) {
            builder << "# " << op->toString() << '\n';
        }

        SWITCH_STR (op->getName()) {
            CASE_STR("jmp"):
                builder << CAST_FAST(op, Jmp)->compile(jmpLabels) << '\n';
                break;
            CASE_STR("call"):
                builder << CAST_FAST(op, Call)->compile(callLabels) << '\n';
                break;
            default:
                builder << op->compile() << '\n';
                break;
        }

        if (isTerminate(op)) {
            unreachable = true;
        }
    }

    auto callTarget = toPath(callLabels[label]);
    auto jmpTarget = toPath(jmpLabels[label]);
    result.emplace(callTarget, builder.str());
    result.emplace(jmpTarget, fmt::format(JMP_LAST_TEMPLATE, callLabels[label]));

    if (config.getDebugInfo()) {
        result[callTarget] = debugMessage + "# type: call\n\n" + result[callTarget];
        result[jmpTarget] = debugMessage + "# type: jmp\n\n" + result[jmpTarget] + "\n# undefined from here";
    }

    return result;
}
