//
// Created by Codex on 2026/5/1.
//

#include "ExecuteParser.h"
#include "SelectorParser.h"
#include "utils/string/StringUtils.h"
#include <array>

namespace postopt {

static constexpr auto EXECUTE_SUBCOMMANDS = std::array<std::string_view, 13>{
        "as", "at", "positioned", "rotated", "facing", "align", "anchored",
        "in", "summon", "on", "if", "unless", "store"
};

static bool isExecuteSubcommand(std::string_view token) {
    return std::ranges::find(EXECUTE_SUBCOMMANDS, token) != EXECUTE_SUBCOMMANDS.end();
}

std::vector<ExecuteToken> parseExecuteTokens(std::string_view line) {
    auto result = std::vector<ExecuteToken>();
    const auto words = tokenizeCommand(line);
    if (words.empty() || words[0].text != "execute") {
        return result;
    }

    size_t i = 1;
    while (i < words.size()) {
        const auto &word = words[i];
        if (word.text == "run") {
            break;
        }
        if (!isExecuteSubcommand(word.text)) {
            i++;
            continue;
        }

        auto subcommand = word.text;
        size_t argsStart = i + 1;
        const size_t startChar = word.start;
        if ((word.text == "positioned" || word.text == "rotated") && argsStart < words.size() && words[argsStart].text == "as") {
            subcommand += " as";
            argsStart = i + 2;
        } else if (word.text == "facing" && argsStart < words.size() && words[argsStart].text == "entity") {
            subcommand = "facing entity";
            argsStart = i + 2;
        }

        size_t argsEnd = argsStart;
        while (argsEnd < words.size() && !isExecuteSubcommand(words[argsEnd].text) && words[argsEnd].text != "run") {
            argsEnd++;
        }

        auto argsBuilder = StringBuilder();
        for (size_t j = argsStart; j < argsEnd; ++j) {
            if (j != argsStart) {
                argsBuilder.append(' ');
            }
            argsBuilder.append(words[j].text);
        }
        const size_t endChar = argsEnd > argsStart ? words[argsEnd - 1].end : words[i].end;
        result.push_back({
                subcommand,
                argsBuilder.toString(),
                std::string(line.substr(startChar, endChar - startChar)),
                result.size(),
                startChar,
                endChar
        });
        i = argsEnd;
    }
    return result;
}

using StateComponent = std::string_view;

static bool hasRelativeCoordinate(std::string_view args) {
    return args.find('~') != std::string_view::npos || args.find('^') != std::string_view::npos;
}

static bool hasLocalCoordinate(std::string_view args) {
    return args.find('^') != std::string_view::npos;
}

static bool containsWordLike(std::string_view args, std::string_view text) {
    return args.find(text) != std::string_view::npos;
}

static bool hasNearestSelector(std::string_view args) {
    return containsWordLike(args, "@p") || containsWordLike(args, "@n")
           || containsWordLike(args, "sort=nearest") || containsWordLike(args, "sort=furthest");
}

static bool hasNearestSelectorDependency(const std::vector<ExecuteToken> &tokens, size_t index) {
    const auto &token = tokens[index];
    if (!hasNearestSelector(token.args)) {
        return false;
    }
    if (index == 0) {
        return true;
    }
    const auto &previous = tokens[index - 1];
    if (previous.subcommand != "positioned as" && previous.subcommand != "at") {
        return true;
    }
    return hasNearestSelectorDependency(tokens, index - 1);
}

static std::vector<StateComponent> getSubcommandSets(std::string_view subcommand) {
    if (subcommand == "as" || subcommand == "on") {
        return {"executor"};
    }
    if (subcommand == "at") {
        return {"position", "rotation", "dimension"};
    }
    if (subcommand == "positioned" || subcommand == "positioned as") {
        return {"position"};
    }
    if (subcommand == "rotated" || subcommand == "rotated as" || subcommand == "facing" || subcommand == "facing entity") {
        return {"rotation"};
    }
    if (subcommand == "align") {
        return {"position"};
    }
    if (subcommand == "anchored") {
        return {"anchor"};
    }
    if (subcommand == "in") {
        return {"dimension"};
    }
    if (subcommand == "summon") {
        return {"executor", "position", "rotation", "dimension"};
    }
    return {};
}

static bool setContains(const HashSet<std::string> &set, std::string_view value) {
    return set.contains(std::string(value));
}

struct RedundantToken {
    ExecuteToken token;
};

static std::vector<RedundantToken> findRedundantSubcommands(const std::vector<ExecuteToken> &tokens) {
    auto redundant = std::vector<RedundantToken>();
    auto required = HashSet<std::string>{"executor", "position", "rotation", "dimension", "anchor"};
    auto seenSubcommands = HashSet<std::string>();

    for (size_t rev = tokens.size(); rev > 0; --rev) {
        const size_t i = rev - 1;
        const auto &token = tokens[i];
        const auto &sub = token.subcommand;
        const auto &args = token.args;

        if (sub == "summon") {
            break;
        }

        auto uses = std::vector<StateComponent>();
        if (sub == "positioned") {
            if (std::string_view(args).starts_with("over ") || hasRelativeCoordinate(args)) {
                uses.push_back("position");
                if (hasLocalCoordinate(args)) {
                    uses.push_back("rotation");
                }
            }
        } else if (sub == "rotated") {
            if (hasRelativeCoordinate(args)) {
                uses.push_back("rotation");
            }
        } else {
            if (args.find('~') != std::string::npos) {
                uses.push_back("position");
            }
            if (args.find('^') != std::string::npos) {
                uses.push_back("position");
                uses.push_back("rotation");
            }
        }

        if (args.find("@s") != std::string::npos) {
            uses.push_back("executor");
        }
        const bool hasSelfSelector = args.find("@s") != std::string::npos;
        if (!hasSelfSelector && (args.find("distance=") != std::string::npos || args.find("dx=") != std::string::npos
                                 || args.find("dy=") != std::string::npos || args.find("dz=") != std::string::npos
                                 || args.find("x=") != std::string::npos || args.find("y=") != std::string::npos
                                 || args.find("z=") != std::string::npos)) {
            uses.push_back("position");
            uses.push_back("dimension");
        }
        if (!hasSelfSelector && hasNearestSelectorDependency(tokens, i)) {
            uses.push_back("position");
            uses.push_back("dimension");
        }

        if (sub == "facing entity" || sub == "align") {
            uses.push_back("position");
        } else if (sub == "positioned as" || sub == "rotated as" || sub == "on") {
            uses.push_back("executor");
        }

        const auto sets = getSubcommandSets(sub);
        bool valid = sets.empty();
        if (!sets.empty()) {
            valid = std::ranges::any_of(sets, [&](StateComponent component) {
                return setContains(required, component);
            });
        }

        if (valid) {
            for (StateComponent component: sets) {
                required.erase(std::string(component));
            }
            for (StateComponent component: uses) {
                required.insert(std::string(component));
            }
            seenSubcommands.insert(sub);
        } else {
            redundant.push_back({token});
        }
    }

    std::ranges::reverse(redundant);
    return redundant;
}

std::string removeRedundantExecuteSubcommands(std::string_view line) {
    auto tokens = parseExecuteTokens(line);
    const auto redundant = findRedundantSubcommands(tokens);
    if (redundant.empty()) {
        return std::string(line);
    }

    auto redundantIndices = HashSet<size_t>();
    for (const auto &item: redundant) {
        redundantIndices.insert(item.token.index);
    }

    auto newTokens = std::vector<std::string>();
    for (const auto &token: tokens) {
        if (!redundantIndices.contains(token.index)) {
            newTokens.push_back(token.raw);
            continue;
        }
        auto selector = std::string();
        if (token.subcommand == "at" || token.subcommand == "as"
            || token.subcommand == "positioned as" || token.subcommand == "rotated as") {
            selector = token.args;
        } else if (token.subcommand == "facing entity") {
            auto parts = tokenizeCommand(token.args);
            if (!parts.empty()) {
                selector = parts[0].text;
            }
        }
        if (!selector.empty()) {
            newTokens.push_back("if entity " + selector);
        }
    }

    auto allWords = tokenizeCommand(line);
    auto runPart = std::string();
    for (size_t i = 0; i < allWords.size(); ++i) {
        if (allWords[i].text == "run") {
            runPart = " run " + std::string(line.substr(allWords[i].end));
            break;
        }
    }

    auto builder = StringBuilder("execute");
    if (!newTokens.empty()) {
        builder.append(' ');
        for (size_t i = 0; i < newTokens.size(); ++i) {
            if (i != 0) {
                builder.append(' ');
            }
            builder.append(newTokens[i]);
        }
    }
    builder.append(runPart);
    return builder.toString();
}

static std::string normalizeSelector(std::string_view selector) {
    if (selector.size() <= 3 || selector[0] != '@' || selector[2] != '[' || selector.back() != ']') {
        return std::string(selector);
    }
    auto args = parseSelectorArgs(selector.substr(3, selector.size() - 4));
    std::ranges::sort(args, [](const SelectorArg &left, const SelectorArg &right) {
        const bool leftIsType = left.raw.starts_with("type=") || left.raw.starts_with("type!=") || left.raw.starts_with("type=!");
        const bool rightIsType = right.raw.starts_with("type=") || right.raw.starts_with("type!=") || right.raw.starts_with("type=!");
        if (leftIsType != rightIsType) {
            return !leftIsType;
        }
        return left.raw < right.raw;
    });

    auto builder = StringBuilder();
    builder.append(selector.substr(0, 2));
    builder.append('[');
    for (size_t i = 0; i < args.size(); ++i) {
        if (i != 0) {
            builder.append(',');
        }
        builder.append(args[i].raw);
    }
    builder.append(']');
    return builder.toString();
}

std::vector<std::string> tokenizeExecuteNormalized(std::string_view line) {
    auto result = std::vector<std::string>();
    for (const auto &token: tokenizeCommand(line)) {
        if (token.text.starts_with('@')) {
            result.push_back(normalizeSelector(token.text));
        } else {
            result.push_back(token.text);
        }
    }
    return result;
}

static i64 findLastRunIndex(std::span<const std::string> tokens) {
    for (i64 i = static_cast<i64>(tokens.size()) - 1; i >= 0; --i) {
        if (tokens[static_cast<size_t>(i)] == "run") {
            return i;
        }
    }
    return -1;
}

std::optional<std::pair<std::string, size_t>> findCommonExecutePrefix(
        const std::vector<std::vector<std::string>> &allTokens) {
    if (allTokens.empty()) {
        return std::nullopt;
    }

    size_t commonLength = 0;
    size_t minLength = allTokens[0].size();
    for (const auto &tokens: allTokens) {
        minLength = std::min(minLength, tokens.size());
    }

    for (size_t i = 0; i < minLength; ++i) {
        const auto &token = allTokens[0][i];
        if (std::ranges::all_of(allTokens, [&](const auto &tokens) { return tokens[i] == token; })) {
            commonLength = i + 1;
        } else {
            break;
        }
    }

    while (commonLength > 0) {
        auto commonTokens = std::vector<std::string>(allTokens[0].begin(), allTokens[0].begin() + static_cast<i64>(commonLength));
        const i64 lastRunIndex = findLastRunIndex(commonTokens);
        if (lastRunIndex != -1) {
            auto prefixTokens = std::vector<std::string>(commonTokens.begin(), commonTokens.begin() + lastRunIndex + 1);
            auto summonIt = std::ranges::find(prefixTokens, "summon");
            if (summonIt != prefixTokens.end()) {
                auto summonIndex = static_cast<size_t>(std::distance(prefixTokens.begin(), summonIt));
                if (summonIndex >= 2) {
                    auto truncated = std::span<const std::string>(prefixTokens.data(), summonIndex);
                    return std::pair{joinTokens(truncated) + " ", summonIndex};
                }
                return std::nullopt;
            }
            return std::pair{joinTokens(prefixTokens) + " ", static_cast<size_t>(lastRunIndex + 1)};
        }

        bool valid = true;
        for (const auto &tokens: allTokens) {
            if (tokens.size() <= commonLength) {
                valid = false;
                break;
            }
            const auto &nextToken = tokens[commonLength];
            if (!isExecuteSubcommand(nextToken) && nextToken != "run") {
                valid = false;
                break;
            }
        }

        if (valid) {
            const auto &lastToken = commonTokens.back();
            if (lastToken == "positioned" || lastToken == "rotated") {
                bool allAs = std::ranges::all_of(allTokens, [&](const auto &tokens) {
                    return commonLength < tokens.size() && tokens[commonLength] == "as";
                });
                if (allAs) {
                    bool sameSelector = true;
                    const auto &selector = allTokens[0][commonLength + 1];
                    for (const auto &tokens: allTokens) {
                        if (commonLength + 1 >= tokens.size() || tokens[commonLength + 1] != selector) {
                            sameSelector = false;
                            break;
                        }
                    }
                    valid = sameSelector;
                }
            }

            if (valid && commonLength >= 2) {
                auto summonIt = std::ranges::find(commonTokens, "summon");
                if (summonIt != commonTokens.end()) {
                    auto summonIndex = static_cast<size_t>(std::distance(commonTokens.begin(), summonIt));
                    if (summonIndex >= 2) {
                        auto truncated = std::span<const std::string>(commonTokens.data(), summonIndex);
                        return std::pair{joinTokens(truncated) + " ", summonIndex};
                    }
                    return std::nullopt;
                }
                return std::pair{joinTokens(commonTokens) + " ", commonLength};
            }
        }

        commonLength--;
    }

    return std::nullopt;
}

}  // namespace postopt
