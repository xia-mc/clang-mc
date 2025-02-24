//
// Created by xia__mc on 2025/2/13.
//

#ifndef CLANG_MC_STRINGUTILS_H
#define CLANG_MC_STRINGUTILS_H

#include <vector>
#include "iostream"
#include "string"
#include "algorithm"
#include "Stacktrace.h"

namespace string {
    PURE static inline constexpr std::vector<std::string_view> split(const std::string_view &str, const char delimiter,
                                                                     size_t maxCount = SIZE_MAX) noexcept {
        if (UNLIKELY(str.empty())) {
            return {};
        }
        WARN(maxCount > 1, "Are you sure to split a str with 1 count?");

        auto result = std::vector<std::string_view>();
        size_t start = 0, end;

        while (LIKELY((end = str.find(delimiter, start)) != std::string_view::npos && maxCount-- > 1)) {
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

        const auto start = str.find_first_of(substr);
        if (start == std::string_view::npos) {
            return str;
        } else {
            return str.substr(0, start);
        }
    }

    PURE static inline constexpr std::string_view removeComment(const std::string_view &str) noexcept {
        return removeFromFirst(str, "//");
    }

    template<typename T>
    PURE static __forceinline constexpr bool contains(const std::string_view &str, const T &substr) noexcept {
        return str.find(substr) != std::string_view::npos;
    }

    PURE static __forceinline constexpr std::string &replaceFast(std::string &str, const char from, const char to) {
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

    PURE static __forceinline constexpr std::string replace(std::string str, const char from, const char to) {
        return replaceFast(str, from, to);
    }

    PURE static __forceinline std::string replace(const std::string_view &str,
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


    PURE static __forceinline constexpr size_t count(const std::string_view &str, const char ch) {
        size_t result = 0;

        for (const char c: str) {
            if (UNLIKELY(c == ch)) {
                result++;
            }
        }

        return result;
    }

    PURE static __forceinline constexpr bool isValidMCNamespace(const std::string_view &str) {
        if (UNLIKELY(str.empty() || str == "minecraft")) {
            return false;
        }

        return std::ranges::all_of(str.begin(), str.end(), [](const char c) -> bool {
            return LIKELY(LIKELY(c >= 'a' && c <= 'z') || (c >= '0' && c <= '9') || c == '_' || c == '-');
        });
    }

    PURE static __forceinline constexpr std::string toLowerCase(std::string str) noexcept {
        for (auto &c: str) {
            c = (char) tolower(c);
        }
        return str;
    }

    PURE static __forceinline constexpr std::string toLowerCase(const std::string_view &str) noexcept {
        return toLowerCase(std::string(str));
    }

    PURE static __forceinline std::string join(const std::vector<std::string_view> &parts,
                                               const std::string &delimiter) {
        auto result = std::ostringstream();
        for (size_t i = 0; i < parts.size(); ++i) {
            if (i > 0) result << delimiter;
            result << parts[i];
        }
        return result.str();
    }
}

static inline void printStacktrace(const std::exception &exception) noexcept {
    const auto threadName = getThreadName();
    const auto stacktrace = getStacktrace();

    std::cerr << fmt::format("Exception in thread \"{}\" {}: {}\n",
                             threadName, typeid(exception).name(), exception.what());

    size_t unknownCount = 0;
    for (const auto &element: stacktrace) {
        if (element.empty()) {
            unknownCount++;
            continue;
        }

        if (unknownCount > 0) {
            std::cerr << fmt::format("        Suppressed {} unknown stack traces.\n", unknownCount);
            unknownCount = 0;
        }

        std::cerr << fmt::format("        at {}\n", element);
    }
    std::flush(std::cerr);
}

static inline void printStacktrace() noexcept {
    const auto threadName = getThreadName();
    const auto stacktrace = getStacktrace();

    std::cerr << fmt::format("Exception in thread \"{}\" with an unknown exception.\n", threadName);

    size_t unknownCount = 0;
    for (const auto &element: stacktrace) {
        if (element.empty()) {
            unknownCount++;
            continue;
        }

        if (unknownCount > 0) {
            std::cerr << fmt::format("        Suppressed {} unknown stack traces.\n", unknownCount);
            unknownCount = 0;
        }

        std::cerr << fmt::format("        at {}\n", element);
    }
    std::flush(std::cerr);
}

#endif //CLANG_MC_STRINGUTILS_H
