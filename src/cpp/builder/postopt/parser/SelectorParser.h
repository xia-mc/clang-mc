//
// Created by Codex on 2026/5/1.
//

#ifndef CLANG_MC_SELECTORPARSER_H
#define CLANG_MC_SELECTORPARSER_H

#include <string>
#include <string_view>
#include <vector>
#include <optional>

namespace postopt {

struct SelectorArg {
    std::string key;
    std::string raw;
};

struct SelectorMatch {
    std::string raw;
    size_t start = 0;
    size_t end = 0;
};

[[nodiscard]] std::vector<SelectorArg> parseSelectorArgs(std::string_view args);

[[nodiscard]] std::optional<SelectorMatch> extractSelector(std::string_view line, size_t startIndex);

[[nodiscard]] std::vector<SelectorMatch> findSelectors(std::string_view line, std::string_view selectorTypes);

[[nodiscard]] std::string reorderPositiveTypeLast(std::string_view line);

[[nodiscard]] std::string mergeAsSelectorWithSelfCondition(std::string_view line);

}  // namespace postopt

#endif //CLANG_MC_SELECTORPARSER_H
