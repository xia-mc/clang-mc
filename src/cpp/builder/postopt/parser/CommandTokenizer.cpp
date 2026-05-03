//
// Created by Codex on 2026/5/1.
//

#include "CommandTokenizer.h"
#include "utils/string/StringUtils.h"

namespace postopt {

std::vector<TokenInfo> tokenizeCommand(std::string_view line) {
    auto tokens = std::vector<TokenInfo>();
    auto current = std::string();
    size_t start = std::string::npos;
    i32 depth = 0;
    bool inQuote = false;
    bool escaped = false;

    for (size_t i = 0; i < line.size(); ++i) {
        const char ch = line[i];
        if (start == std::string::npos && ch != ' ') {
            start = i;
        }

        if (escaped) {
            current.push_back(ch);
            escaped = false;
            continue;
        }

        if (ch == '\\' && inQuote) {
            current.push_back(ch);
            escaped = true;
            continue;
        }

        if (ch == '"') {
            inQuote = !inQuote;
            current.push_back(ch);
        } else if (!inQuote && (ch == '[' || ch == '{')) {
            depth++;
            current.push_back(ch);
        } else if (!inQuote && (ch == ']' || ch == '}')) {
            depth--;
            current.push_back(ch);
        } else if (!inQuote && depth == 0 && ch == ' ') {
            if (!current.empty()) {
                tokens.push_back({current, start, i});
                current.clear();
                start = std::string::npos;
            }
        } else {
            current.push_back(ch);
        }
    }

    if (!current.empty()) {
        tokens.push_back({current, start, line.size()});
    }
    return tokens;
}

std::vector<std::string> tokenTexts(const std::vector<TokenInfo> &tokens) {
    auto result = std::vector<std::string>();
    result.reserve(tokens.size());
    for (const auto &token: tokens) {
        result.push_back(token.text);
    }
    return result;
}

std::string joinTokens(std::span<const std::string> tokens, std::string_view separator) {
    auto builder = StringBuilder();
    bool first = true;
    for (const auto &token: tokens) {
        if (!first) {
            builder.append(separator);
        }
        builder.append(token);
        first = false;
    }
    return builder.toString();
}

}  // namespace postopt
