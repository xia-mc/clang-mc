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
#include "objects/MatrixStack.h"
#include "ir/iops/Special.h"
#include "ir/ops/Static.h"

void IR::parse(std::string &&code) {
    this->sourceCode = std::move(code);
    auto lines = string::split(sourceCode, '\n');

    auto lineState = LineState(1, false, getFileDisplay(), nullptr);
    auto labelState = LabelState();
    auto lineStack = MatrixStack<LineState>();
    auto labelStack = MatrixStack<LabelState>();
    auto labelRenamer = NameGenerator();

    size_t errors = 0;
    for (size_t i = 0; i < lines.size(); ++i, ++lineState.lineNumber) {
        const auto str = string::trim(string::removeComment(lines[i]));
        if (UNLIKELY(str.empty())) {
            continue;
        }

        try {
            if (str[0] == '#') {
                auto splits = string::split(str.substr(1), ' ', 2);
                assert(!splits.empty());

                auto op = splits[0];
                auto param = splits.size() == 2 ? splits[1] : "";
                SWITCH_STR (op) {
                    CASE_STR("push"):
                        if (param.empty()) {
                            throw ParseException(i18nFormat("ir.invalid_pre_op", str));
                        }
                        SWITCH_STR (param) {
                            CASE_STR("line"):
                                lineStack.pushMatrix(lineState);
                                break;
                            CASE_STR("label"):
                                labelStack.pushMatrix(labelState);
                                break;
                            default:
                                throw ParseException(i18nFormat("ir.invalid_pre_op", str));
                        }
                        break;
                    CASE_STR("pop"):
                        if (param.empty()) {
                            throw ParseException(i18nFormat("ir.invalid_pre_op", str));
                        }
                        SWITCH_STR (param) {
                            CASE_STR("line"):
                                if (lineStack.isEmpty()) {
                                    throw ParseException(i18nFormat("ir.invalid_pop", param));
                                }
                                lineState = lineStack.popMatrix();
                                break;
                            CASE_STR("label"):
                                if (labelStack.isEmpty()) {
                                    throw ParseException(i18nFormat("ir.invalid_pop", param));
                                }
                                for (auto ptr : labelState.toRename) {
                                    if (labelState.renameMap.contains(ptr->getLabelHash())) {
                                        ptr->setLabel(labelState.renameMap.at(ptr->getLabelHash()));
                                    }
                                }
                                labelState = labelStack.popMatrix();
                                break;
                            default:
                                throw ParseException(i18nFormat("ir.invalid_pre_op", str));
                        }
                        break;
                    CASE_STR("line"): {
                        auto params = string::split(param, ' ', 2);
                        if (params.empty() || params.size() >= 3) {
                            throw ParseException(i18nFormat("ir.invalid_pre_op", str));
                        }

                        if (params.size() == 2) {
                            auto name = params[1];
                            if (name.size() < 2 || name.front() != '"' || name.back() != '"') {
                                throw ParseException(i18nFormat("ir.invalid_pre_op", str));
                            }
                            lineState.filename = name.substr(1, name.size() - 2);
                        }
                        lineState.lineNumber = parseToNumber(params[0]);
                        break;
                    }
                    CASE_STR("nowarn"):
                        if (!string::trim(param).empty()) {
                            throw ParseException(i18nFormat("ir.invalid_pre_op", str));
                        }
                        lineState.noWarn = true;
                        break;
                    default:
                        throw ParseException(i18nFormat("ir.invalid_pre_op", str));
                }
            } else {
                auto op = createOp(lineState, str);

                if (Label *ptr = INSTANCEOF(op, Label)) {
                    if (!labelStack.isEmpty() && !ptr->getExtern() && !ptr->getExport()) {
                        auto newLabel = fmt::format("__label_{}",  labelRenamer.generate());
                        labelState.renameMap.emplace(ptr->getLabelHash(), newLabel);
                        ptr->setLabel(std::move(newLabel));
                    }
                    if (!ptr->getLocal()) {
                        lineState.lastLabel = ptr;
                    }
                }
                if (CallLike *ptr = INSTANCEOF(op, CallLike)) {
                    if (!labelStack.isEmpty()) {
                        labelState.toRename.emplace_back(ptr);
                    }
                }

                this->sourceMap.emplace(op.get(), lines[i]);
                this->lineStateMap.emplace(op.get(), lineState);
                this->values.push_back(std::move(op));
            }
        } catch (const ParseException &e) {
            logger->error(createIRMessage(lineState, lines[i], e.what()));
            errors++;
        }
    }

    if (errors != 0) {
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

void IR::preCompile() {
    staticDataMap.clear();
    staticData.clear();
    staticData.reserve(256);

    for (const auto &op : this->values) {
        if (const auto staticOp = INSTANCEOF(op, Static)) {
            assert(!staticDataMap.contains(staticOp->getNameHash()));

            const auto &data = staticOp->getData();
            staticDataMap.emplace(staticOp->getNameHash(), staticData.size());
            staticData.insert(staticData.end(), data.begin(), data.end());
        }
    }

    for (const auto &op : this->values) {
        op->withIR(this);
    }
}

static inline constexpr std::string_view DEBUG_MSG_TEMPLATE = "#\n# file: \"{}\"\n# label: \"{}\"\n#\n\n";

[[nodiscard]] McFunctions IR::compile() {
    preCompile();

    auto result = McFunctions();
    if (UNLIKELY(this->values.empty())) {
        return result;
    }
    assert(INSTANCEOF(this->values[0], Label));

    auto labelMap = LabelMap();
    initLabels(labelMap);
    auto jmpTable = JmpTable(values, labelMap);
    jmpTable.make();
    const auto &jmpMap = jmpTable.getJmpMap();

    auto builder = StringBuilder();
    std::string debugMessage;

    if (config.getDebugInfo()) {
        debugMessage = fmt::format(DEBUG_MSG_TEMPLATE, getFileDisplay(), CAST_FAST(this->values[0], Label)->getLabel());
    }

    Label *labelOp = CAST_FAST(this->values[0], Label);
    Hash label = labelOp->getLabelHash();
    bool unreachable = false;
    for (size_t i = 1; i < this->values.size(); ++i) {
        const auto &op = this->values[i];
        if (INSTANCEOF(op, Nop) || INSTANCEOF(op, Special)) {
            continue;
        }

        if (INSTANCEOF(op, Label)) {
            auto lastLabelOp = labelOp;
            auto lastLabel = label;
            labelOp = CAST_FAST(op, Label);
            label = labelOp->getLabelHash();

            if (!unreachable) {
                // 因为实际上采用“代码块”模式编译，而不是label，所以每个代码块末尾都需要显式跳转到下个代码块
                auto jmp = std::make_unique<Jmp>(-1, labelOp->getLabel());
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
                debugMessage = fmt::format(DEBUG_MSG_TEMPLATE, getFileDisplay(), labelOp->getLabel());
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

        std::string compiled = op->compilePrefix();
        if (!compiled.empty()) {
            builder.appendLine(compiled);
        }

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

std::string createIRMessage(const IR &ir, const Op *op, const std::string_view &message) {
    auto source = ir.getSource(op);
    return createIRMessage(ir.getLine(op), UNLIKELY(source == "Unknown Source") ? fmt::format("(aka) {}", op->toString()) : source, message);
}
