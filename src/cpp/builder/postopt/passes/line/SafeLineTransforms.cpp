//
// Created by Codex on 2026/5/1.
//

#include "SafeLineTransforms.h"
#include "builder/postopt/parser/CommandTokenizer.h"
#include "builder/postopt/parser/ExecuteParser.h"
#include "builder/postopt/parser/SelectorParser.h"
#include "utils/string/StringUtils.h"
#include <array>

namespace postopt {

static constexpr auto REPLACES = std::array{
        std::pair<std::string_view, std::string_view>{"return run return", "return"},
        std::pair<std::string_view, std::string_view>{"char2str_map[$(a)]", "char2str_map.\"$(a)\""}
};

static bool isWordBoundary(char ch) {
    return ch == ' ' || ch == '\t' || ch == '\r' || ch == '\n';
}

static bool containsWord(std::string_view line, std::string_view word, size_t start = 0) {
    size_t pos = line.find(word, start);
    while (pos != std::string_view::npos) {
        const bool leftOk = pos == 0 || isWordBoundary(line[pos - 1]);
        const auto end = pos + word.size();
        const bool rightOk = end >= line.size() || isWordBoundary(line[end]);
        if (leftOk && rightOk) {
            return true;
        }
        pos = line.find(word, pos + 1);
    }
    return false;
}

static std::string applyLiteralReplaces(std::string_view line) {
    auto current = std::string(line);
    auto tmp = std::string();
    for (const auto &replace: REPLACES) {
        if (string::replaceFast(current, tmp, replace.first, replace.second)) {
            current = tmp;
        }
    }
    return current;
}

static std::string removeOuterReturnRunDuplicate(std::string_view line) {
    auto result = std::string(line);
    const auto pos = result.find("return run ");
    if (pos == std::string::npos) {
        return result;
    }
    const auto after = pos + std::string_view("return run ").size();
    if (!containsWord(result, "return", after)) {
        return result;
    }
    result.erase(pos, std::string_view("return run ").size());
    return result;
}

static std::string collapseExecuteRun(std::string_view line) {
    auto result = std::string(line);
    if (std::string_view(result).starts_with("execute run ")) {
        result.erase(0, std::string_view("execute run ").size());
    }

    size_t pos = 0;
    while ((pos = result.find("run execute run ", pos)) != std::string::npos) {
        result.replace(pos, std::string_view("run execute run ").size(), "run ");
        pos += std::string_view("run ").size();
    }

    pos = 0;
    while ((pos = result.find("run execute ", pos)) != std::string::npos) {
        const bool precededByReturn = pos >= std::string_view("return ").size()
                                      && result.substr(pos - std::string_view("return ").size(),
                                                       std::string_view("return ").size()) == "return ";
        if (precededByReturn) {
            pos += std::string_view("run execute ").size();
            continue;
        }
        result.erase(pos, std::string_view("run execute ").size());
    }
    return result;
}

static std::string removeAsSelf(std::string_view line) {
    auto tokens = parseExecuteTokens(line);
    if (tokens.empty()) {
        return std::string(line);
    }
    auto result = std::string(line);
    for (auto it = tokens.rbegin(); it != tokens.rend(); ++it) {
        if (it->subcommand == "as" && it->args == "@s") {
            size_t eraseStart = it->start;
            size_t eraseEnd = it->end;
            while (eraseEnd < result.size() && result[eraseEnd] == ' ') {
                eraseEnd++;
            }
            if (eraseStart > 0 && eraseEnd == result.size() && result[eraseStart - 1] == ' ') {
                eraseStart--;
            }
            result.erase(eraseStart, eraseEnd - eraseStart);
        }
    }
    return result;
}

static std::string normalizeTokenSpacing(std::string_view line) {
    auto tokens = tokenizeCommand(line);
    if (tokens.empty()) {
        return {};
    }
    auto builder = StringBuilder();
    for (size_t i = 0; i < tokens.size(); ++i) {
        if (i != 0) {
            builder.append(' ');
        }
        builder.append(tokens[i].text);
    }
    return builder.toString();
}

std::string optimizeLine(std::string_view line) {
    auto current = std::string(line);
    for (size_t i = 0; i < 8; ++i) {
        auto next = applyLiteralReplaces(current);
        next = removeOuterReturnRunDuplicate(next);
        next = reorderPositiveTypeLast(next);
        next = mergeAsSelectorWithSelfCondition(next);
        next = removeAsSelf(next);
        next = collapseExecuteRun(next);
        next = removeRedundantExecuteSubcommands(next);
        next = collapseExecuteRun(next);
        next = normalizeTokenSpacing(next);
        if (next == current) {
            break;
        }
        current = std::move(next);
    }
    return current;
}

std::string optimizeLines(std::string_view code) {
    if (code.empty()) {
        return {};
    }

    const auto lines = string::split(code, '\n');
    auto builder = StringBuilder();
    bool first = true;
    for (const auto &line: lines) {
        if (!first) {
            builder.append('\n');
        }
        builder.append(optimizeLine(line));
        first = false;
    }
    return builder.toString();
}

}  // namespace postopt
