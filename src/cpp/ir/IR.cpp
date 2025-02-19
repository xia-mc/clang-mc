//
// Created by xia__mc on 2025/2/16.
//

#include "IR.h"
#include "utils/StringUtils.h"
#include "ops/Op.h"
#include "ir/ops/Label.h"

void IR::parse(const std::string &code) {
    auto lines = string::split(code, '\n');

    size_t errors = 0;
    bool first = true;
    for (size_t i = 0; i < lines.size(); ++i) {
        const auto &line = string::trim(string::removeComment(lines[i]));
        if (UNLIKELY(line.empty())) {
            continue;
        }

        try {
            auto op = createOp(line);
            if (first && !INSTANCEOF(op, Label)) {
                // TODO 也许未来改成警告而不是错误
                throw ParseException(i18n("ir.unreachable"));
            }
            first = false;
            this->values.push_back(std::move(op));
        } catch (const ParseException &e) {
            const ui64 lineNumber = i + 1;  // ui64防止+1后溢出
            logger->error(fmt::format("{}:{}: {}\n    {} | {}",
                                      file.string(), lineNumber, e.what(), lineNumber, line));
            errors++;
        }
    }

    if (UNLIKELY(errors != 0)) {
        throw ParseException(i18nFormat("ir.errors_generated", file.string(), errors));
    }
}

std::string IR::createFunction() {
    return fmt::format("{}{}", config.getNameSpace(), nameGenerator.generate());
}

static inline constexpr std::string_view JMP_TEMPLATE = "function {}\nfunction {}";

static inline Path toPath(const std::string &mcPath) {
    assert(string::count(mcPath, ':') == 1);
    auto splits = string::split(mcPath, ':', 2);
    return Path("data") / splits[0] / splits[1];
}

__forceinline void IR::initLabels(LabelMap &callLabels, LabelMap &jmpLabels) {
    ui64 label = hash(CAST_FAST(this->values[0], Label)->getLabel());
    callLabels.emplace(label, createFunction());
    jmpLabels.emplace(label, createFunction());

    for (size_t i = 1; i < this->values.size(); ++i) {
        const auto &op = this->values[i];
        if (op->getName() != "label") {
            continue;
        }

        label = hash(CAST_FAST(op, Label)->getLabel());

        if (callLabels.contains(label)) {
            // TODO label重复定义
        }

        assert(!jmpLabels.contains(label));
        callLabels.emplace(label, createFunction());
        jmpLabels.emplace(label, createFunction());
    }
}

[[nodiscard]] McFunctions IR::compile() {
    auto result = McFunctions();
    if (UNLIKELY(this->values.empty())) {
        return result;
    }
    assert(INSTANCEOF(this->values[0], Label));

    ui64 label = hash(CAST_FAST(this->values[0], Label)->getLabel());
    auto callLabels = LabelMap();
    auto jmpLabels = LabelMap();
    initLabels(callLabels, jmpLabels);

    auto builder = std::ostringstream();
    std::string debugMessage;

    if (config.getDebugInfo()) {
        debugMessage = fmt::format("# file: '{}'\n# label: '{}'\n\n",
                                   file.string(), CAST_FAST(this->values[0], Label)->getLabel());
    }

    for (size_t i = 1; i < this->values.size(); ++i) {
        const auto &op = this->values[i];
        if (op->getName() == "label") {
            auto lastLabel = label;
            label = hash(CAST_FAST(op, Label)->getLabel());

            result.emplace(toPath(callLabels[lastLabel]), debugMessage + builder.str());
            result.emplace(toPath(jmpLabels[lastLabel]), fmt::format(
                    JMP_TEMPLATE,callLabels[lastLabel], callLabels[label]));

            if (config.getDebugInfo()) {
                debugMessage = fmt::format("# file: '{}'\n# label: '{}'\n\n",
                                           file.string(), CAST_FAST(op, Label)->getLabel());
            }

            builder.str("");
            builder.clear();
            continue;
        }

        if (config.getDebugInfo()) {
            builder << "# " << op->toString() << '\n';
        }
        builder << op->compile() << '\n';
    }

    result.emplace(toPath(callLabels[label]), debugMessage + builder.str());
    result.emplace(toPath(jmpLabels[label]), fmt::format("function {}", callLabels[label]));

    return result;
}
