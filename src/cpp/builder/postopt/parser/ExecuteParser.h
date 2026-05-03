//
// Created by Codex on 2026/5/1.
//

#ifndef CLANG_MC_EXECUTEPARSER_H
#define CLANG_MC_EXECUTEPARSER_H

#include "CommandTokenizer.h"
#include <optional>
#include <string>
#include <vector>

namespace postopt {

struct ExecuteToken {
    std::string subcommand;
    std::string args;
    std::string raw;
    size_t index = 0;
    size_t start = 0;
    size_t end = 0;
};

[[nodiscard]] std::vector<ExecuteToken> parseExecuteTokens(std::string_view line);

[[nodiscard]] std::string removeRedundantExecuteSubcommands(std::string_view line);

[[nodiscard]] std::vector<std::string> tokenizeExecuteNormalized(std::string_view line);

[[nodiscard]] std::optional<std::pair<std::string, size_t>> findCommonExecutePrefix(
        const std::vector<std::vector<std::string>> &allTokens);

}  // namespace postopt

#endif //CLANG_MC_EXECUTEPARSER_H
