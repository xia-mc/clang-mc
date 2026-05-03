//
// Created by Codex on 2026/5/1.
//

#include "ExecuteGroupPass.h"
#include "builder/postopt/parser/CommandTokenizer.h"
#include "builder/postopt/parser/ExecuteParser.h"
#include "ir/IR.h"
#include "utils/string/StringUtils.h"
#include <array>
#include <fmt/format.h>
#include <iterator>
#include <optional>

namespace postopt {

struct ExecuteLine {
    size_t lineIndex = 0;
    std::string fullLine;
    std::vector<std::string> tokens;
};

struct ExecuteGroup {
    std::string commonPrefix;
    std::vector<std::string> suffixes;
    std::vector<size_t> lineIndices;
    bool hasReturn = false;
};

static bool suffixHasDirectReturn(std::string_view suffix) {
    return suffix.starts_with("return");
}

static bool suffixHasConditionalReturn(std::string_view suffix) {
    return !suffixHasDirectReturn(suffix) && suffix.find("run return") != std::string_view::npos;
}

static ExecuteGroup createGroupFromLines(const std::vector<ExecuteLine> &lines, const std::string &prefix,
                                         size_t commonTokenCount) {
    auto group = ExecuteGroup();
    group.commonPrefix = prefix;
    const bool prefixEndsWithRun = string::trim(prefix).ends_with("run");

    for (const auto &line: lines) {
        auto suffixTokens = std::vector<std::string>(line.tokens.begin() + static_cast<i64>(commonTokenCount), line.tokens.end());
        bool hadRun = prefixEndsWithRun;
        if (!suffixTokens.empty() && suffixTokens.front() == "run") {
            suffixTokens.erase(suffixTokens.begin());
            hadRun = true;
        }

        auto suffix = joinTokens(suffixTokens);
        if (!suffix.empty() && !hadRun) {
            const auto first = suffixTokens.empty() ? std::string() : suffixTokens.front();
            static constexpr auto EXECUTE_SUBCOMMANDS = std::array<std::string_view, 13>{
                    "as", "at", "positioned", "rotated", "facing", "align", "anchored",
                    "in", "summon", "on", "if", "unless", "store"
            };
            if (std::ranges::find(EXECUTE_SUBCOMMANDS, first) != EXECUTE_SUBCOMMANDS.end()) {
                suffix = "execute " + suffix;
            }
        }
        group.suffixes.push_back(std::move(suffix));
        group.lineIndices.push_back(line.lineIndex);
        group.hasReturn = group.hasReturn || suffixHasDirectReturn(group.suffixes.back());
    }
    return group;
}

static std::vector<ExecuteGroup> splitGroupForReturnHandling(const std::vector<ExecuteLine> &batch) {
    auto found = findCommonExecutePrefix([&] {
        auto tokens = std::vector<std::vector<std::string>>();
        for (const auto &line: batch) {
            tokens.push_back(line.tokens);
        }
        return tokens;
    }());
    if (!found.has_value()) {
        return {};
    }

    auto group = createGroupFromLines(batch, found->first, found->second);
    auto conditionalReturnIndices = HashSet<size_t>();
    for (size_t i = 0; i < group.suffixes.size(); ++i) {
        if (suffixHasConditionalReturn(group.suffixes[i])) {
            conditionalReturnIndices.insert(i);
        }
    }
    if (conditionalReturnIndices.empty()) {
        return {std::move(group)};
    }

    auto result = std::vector<ExecuteGroup>();
    auto current = std::vector<ExecuteLine>();
    auto flush = [&] {
        if (current.size() < 2) {
            current.clear();
            return;
        }
        auto tokens = std::vector<std::vector<std::string>>();
        for (const auto &line: current) {
            tokens.push_back(line.tokens);
        }
        auto common = findCommonExecutePrefix(tokens);
        if (common.has_value()) {
            result.push_back(createGroupFromLines(current, common->first, common->second));
        }
        current.clear();
    };

    for (size_t i = 0; i < batch.size(); ++i) {
        if (conditionalReturnIndices.contains(i)) {
            flush();
            continue;
        }
        current.push_back(batch[i]);
    }
    flush();
    return result;
}

static std::vector<ExecuteGroup> extractGroupsFromBlock(const std::vector<ExecuteLine> &lines) {
    auto result = std::vector<ExecuteGroup>();
    if (lines.size() < 2) {
        return result;
    }

    auto current = std::vector<ExecuteLine>{lines[0]};
    for (size_t i = 1; i < lines.size(); ++i) {
        auto test = current;
        test.push_back(lines[i]);
        auto tokens = std::vector<std::vector<std::string>>();
        for (const auto &line: test) {
            tokens.push_back(line.tokens);
        }
        if (findCommonExecutePrefix(tokens).has_value()) {
            current.push_back(lines[i]);
        } else {
            if (current.size() >= 2) {
                auto groups = splitGroupForReturnHandling(current);
                result.insert(result.end(), std::make_move_iterator(groups.begin()), std::make_move_iterator(groups.end()));
            }
            current = {lines[i]};
        }
    }

    if (current.size() >= 2) {
        auto groups = splitGroupForReturnHandling(current);
        result.insert(result.end(), std::make_move_iterator(groups.begin()), std::make_move_iterator(groups.end()));
    }
    return result;
}

static std::vector<ExecuteGroup> findExecuteGroups(const std::vector<std::string> &lines) {
    auto groups = std::vector<ExecuteGroup>();
    auto executeLines = std::vector<ExecuteLine>();

    auto flush = [&] {
        if (executeLines.size() >= 2) {
            auto extracted = extractGroupsFromBlock(executeLines);
            groups.insert(groups.end(), std::make_move_iterator(extracted.begin()), std::make_move_iterator(extracted.end()));
        }
        executeLines.clear();
    };

    for (size_t i = 0; i < lines.size(); ++i) {
        const auto trimmed = string::trim(lines[i]);
        if (trimmed.empty() || trimmed.front() == '#') {
            continue;
        }
        if (trimmed.starts_with("execute ")) {
            executeLines.push_back({i, std::string(trimmed), tokenizeExecuteNormalized(trimmed)});
        } else {
            flush();
        }
    }
    flush();
    return groups;
}

static std::optional<std::string> functionRefFromPath(const Path &path) {
    const auto generic = path.generic_string();
    const auto marker = std::string("/data/");
    auto dataPos = generic.find("data/");
    if (dataPos == std::string::npos) {
        dataPos = generic.find(marker);
        if (dataPos != std::string::npos) {
            dataPos++;
        }
    }
    if (dataPos == std::string::npos) {
        return std::nullopt;
    }
    auto rest = std::string_view(generic).substr(dataPos + std::string_view("data/").size());
    const auto slash = rest.find('/');
    if (slash == std::string_view::npos) {
        return std::nullopt;
    }
    auto ns = rest.substr(0, slash);
    rest.remove_prefix(slash + 1);
    if (!rest.starts_with("function/")) {
        return std::nullopt;
    }
    rest.remove_prefix(std::string_view("function/").size());
    if (!rest.ends_with(".mcfunction")) {
        return std::nullopt;
    }
    rest.remove_suffix(std::string_view(".mcfunction").size());
    return fmt::format("{}:{}", ns, rest);
}

static Path makeHelperPath(FunctionView &view) {
    Path helper;
    do {
        helper = view.path.parent_path() / fmt::format("_postopt_{}.mcfunction", IR::generateName());
    } while (view.context.containsFunction(helper));
    return helper;
}

static std::string buildFunctionText(const std::vector<std::string> &lines) {
    auto builder = StringBuilder();
    for (size_t i = 0; i < lines.size(); ++i) {
        if (i != 0) {
            builder.append('\n');
        }
        builder.append(lines[i]);
    }
    return builder.toString();
}

void applyExecuteGroupPass(FunctionView view) {
    if (!view.context.hasFunctionMap() || view.code.empty()) {
        return;
    }

    auto linesView = string::split(view.code, '\n');
    auto lines = std::vector<std::string>();
    lines.reserve(linesView.size());
    for (const auto &line: linesView) {
        lines.emplace_back(line);
    }

    auto groups = findExecuteGroups(lines);
    if (groups.empty()) {
        return;
    }

    auto consumed = HashSet<size_t>();
    for (const auto &group: groups) {
        if (group.lineIndices.size() < 2) {
            continue;
        }
        if (std::ranges::any_of(group.lineIndices, [&](size_t line) { return consumed.contains(line); })) {
            continue;
        }

        auto helperPath = makeHelperPath(view);
        auto helperRef = functionRefFromPath(helperPath);
        if (!helperRef.has_value()) {
            continue;
        }

        auto helperContent = buildFunctionText(group.suffixes);
        view.context.addFunction(std::move(helperPath), std::move(helperContent));

        auto prefix = group.commonPrefix;
        if (!string::trim(prefix).ends_with("run")) {
            prefix += "run ";
        }
        const auto replacement = group.hasReturn
                                 ? fmt::format("{}return run function {}", prefix, *helperRef)
                                 : fmt::format("{}function {}", prefix, *helperRef);

        const auto firstLine = group.lineIndices.front();
        lines[firstLine] = replacement;
        consumed.insert(firstLine);
        for (size_t i = 1; i < group.lineIndices.size(); ++i) {
            lines[group.lineIndices[i]].clear();
            consumed.insert(group.lineIndices[i]);
        }
    }

    auto builder = StringBuilder();
    bool first = true;
    for (const auto &line: lines) {
        if (line.empty()) {
            continue;
        }
        if (!first) {
            builder.append('\n');
        }
        builder.append(line);
        first = false;
    }
    view.code = builder.toString();
}

}  // namespace postopt
