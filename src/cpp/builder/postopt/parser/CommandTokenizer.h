//
// Created by Codex on 2026/5/1.
//

#ifndef CLANG_MC_COMMANDTOKENIZER_H
#define CLANG_MC_COMMANDTOKENIZER_H

#include "utils/Common.h"
#include <span>
#include <string>
#include <string_view>
#include <vector>

namespace postopt {

struct TokenInfo {
    std::string text;
    size_t start = 0;
    size_t end = 0;
};

[[nodiscard]] std::vector<TokenInfo> tokenizeCommand(std::string_view line);

[[nodiscard]] std::vector<std::string> tokenTexts(const std::vector<TokenInfo> &tokens);

[[nodiscard]] std::string joinTokens(std::span<const std::string> tokens, std::string_view separator = " ");

}  // namespace postopt

#endif //CLANG_MC_COMMANDTOKENIZER_H
