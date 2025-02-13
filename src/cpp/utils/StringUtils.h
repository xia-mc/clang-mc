//
// Created by xia__mc on 2025/2/13.
//

#ifndef CLANG_MC_STRINGUTILS_H
#define CLANG_MC_STRINGUTILS_H

#include <vector>
#include "string"
#include "algorithm"

constexpr inline std::vector<std::string_view> split(const std::string_view &str, const char delimiter) {
    if (str.empty()) {
        return {};
    }

    auto result = std::vector<std::string_view>();
    size_t start = 0, end;

    while ((end = str.find(delimiter, start)) != std::string_view::npos) {
        // assert end != start;
        result.emplace_back(str.substr(start, end - start));
        start = end + 1;
    }

    if (start < str.size()) {
        result.emplace_back(str.substr(start));  // 最后一个部分
    }
    return result;
}

#endif //CLANG_MC_STRINGUTILS_H
