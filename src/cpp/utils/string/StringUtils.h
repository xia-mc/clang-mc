//
// Created by xia__mc on 2025/2/13.
//

#ifndef CLANG_MC_STRINGUTILS_H
#define CLANG_MC_STRINGUTILS_H

#include <vector>
#include <span>
#include "iostream"
#include "xstring"
#include "xmemory"
#include "algorithm"
#include "StringBuilder.h"

namespace string {
    template<class Str = std::string_view, class Collection = std::vector<Str>>
    PURE static inline constexpr Collection split(const std::string_view &str, const char delimiter,
                                                                     size_t maxCount = SIZE_MAX) noexcept {
        if (UNLIKELY(str.empty())) {
            return {};
        }
        WARN(maxCount > 1, "Are you sure to split a str with 1 count?");

        auto result = Collection();
        size_t start = 0, end;

        while (LIKELY((end = str.find(delimiter, start)) != Str::npos && maxCount-- > 1)) {
            result.emplace_back(str.substr(start, end - start));
            start = end + 1;
        }

        if (LIKELY(start < str.size())) {
            result.emplace_back(str.substr(start));  // 最后一个部分
        }
        return result;
    }

    PURE static inline constexpr std::string_view trim(const std::string_view &str) noexcept {
        if (UNLIKELY(str.empty())) {
            return "";
        }

        const auto start = str.find_first_not_of(' ');
        if (start == std::string_view::npos) {
            if (str[0] == ' ') {
                return "";
            }
            return str;
        }

        const auto end = str.find_last_not_of(' ');
        return str.substr(start, end - start + 1);
    }

    PURE static inline constexpr std::string_view removeFromFirst(const std::string_view &str,
                                                                  const std::string_view &substr) noexcept {
        if (UNLIKELY(str.empty())) {
            return "";
        }
        if (UNLIKELY(substr.empty())) {
            return "";
        }

        char first = substr.front();
        for (size_t i = 0; i < str.length(); ++i) {
            if (str[i] == first) {
                if (str.substr(i, substr.length()) == substr) {
                    return str.substr(0, i);
                }
            }
        }
        return str;
    }

    PURE static inline constexpr std::string_view removeComment(const std::string_view &str) noexcept {
        return removeFromFirst(str, "//");
    }

    template<typename T>
    PURE static inline constexpr bool contains(const std::string_view &str, const T &substr) noexcept {
        return str.find(substr) != std::string_view::npos;
    }

    PURE static inline constexpr std::string &replaceFast(std::string &str, const char from, const char to) {
        if (UNLIKELY(from == to)) {
            return str;
        }

        for (char &c: str) {
            if (UNLIKELY(c == from)) {
                c = to;
            }
        }
        return str;
    }

    PURE static inline constexpr std::string replace(std::string str, const char from, const char to) {
        return replaceFast(str, from, to);
    }

    PURE static inline std::string replace(const std::string_view &str,
                                                  const std::string_view &from, const std::string_view &to) {
        if (UNLIKELY(str.empty() || from.empty())) {
            return std::string(str);
        }

        auto result = std::ostringstream();
        size_t start = 0, end;

        while (LIKELY((end = str.find(from, start)) != std::string_view::npos)) {
            result << str.substr(start, end - start) << to;
            start = end + from.size();
        }

        result << str.substr(start);  // 追加剩余部分
        return result.str();
    }


    PURE static inline constexpr size_t count(const std::string_view &str, const char ch) {
        size_t result = 0;

        for (const char c: str) {
            if (UNLIKELY(c == ch)) {
                result++;
            }
        }

        return result;
    }

    PURE static inline constexpr bool isValidMCNamespace(const std::string_view &str) {
        if (UNLIKELY(str.empty() || str == "minecraft")) {
            return false;
        }

        return std::ranges::all_of(str.begin(), str.end(), [](const char c) -> bool {
            return LIKELY(LIKELY(c >= 'a' && c <= 'z') || (c >= '0' && c <= '9') || c == '_' || c == '-');
        });
    }

    PURE static inline constexpr std::string toLowerCase(std::string str) noexcept {
        for (auto &c: str) {
            c = (char) tolower(c);
        }
        return str;
    }

    PURE static inline constexpr std::string toLowerCase(const std::string_view &str) noexcept {
        return toLowerCase(std::string(str));
    }

    template<class VectorLike, class StrLike>
    PURE static inline std::string join(const VectorLike &parts,
                                        const StrLike &delimiter) {
        if (parts.empty()) {
            return "";
        }
        if (parts.size() == 1) {
            return std::string(parts.front());
        }

        auto iter = parts.begin();
        auto result = StringBuilder(*iter++);
        for (; iter != parts.end(); ++iter) {
            result.append(delimiter);
            result.append(*iter);
        }
        return result.toString();
    }

    PURE static inline std::string repeat(const std::string &str, const i32 repeat, const char delimiter) {
        if (repeat <= 0) return "";
        if (repeat == 1) return str;

        auto builder = StringBuilder(str);
        for (i32 i = 1; i < repeat; ++i) {
            builder.append(delimiter);
            builder.append(str);
        }

        return builder.toString();
    }
}

static __forceinline void printStacktrace(const std::exception &exception) noexcept {
    auto excName = typeid(exception).name();
    auto nameSplits = string::split(typeid(exception).name(), ' ', 2);
    if (nameSplits.empty()) {
        printStacktraceMsg(exception.what());
        return;
    }
    if (nameSplits[0] == "class") {
        printStacktraceMsg(fmt::format("{}: {}", nameSplits[1], exception.what()).c_str());
        return;
    }
    printStacktraceMsg(fmt::format("{}: {}", excName, exception.what()).c_str());
}

#endif //CLANG_MC_STRINGUTILS_H
