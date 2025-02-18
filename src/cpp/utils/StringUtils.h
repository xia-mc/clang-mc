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

        auto result = std::vector<std::string_view>();
        size_t start = 0, end;

        while (LIKELY((end = str.find(delimiter, start)) != std::string_view::npos&& maxCount-- > 1)) {
            assert(end != start);
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
        if (UNLIKELY(start == std::string_view::npos)) {
            return str;
        }

        const auto end = str.find_last_not_of(' ');
        return str.substr(start, end - start + 1);
    }

    PURE static inline constexpr std::string_view removeComment(const std::string_view &str) noexcept {
        if (UNLIKELY(str.empty())) {
            return "";
        }

        const auto start = str.find_first_of("//");
        if (LIKELY(start == std::string_view::npos)) {
            return str;
        } else {
            return str.substr(0, start);
        }
    }

    template<typename T>
    PURE static __forceinline constexpr bool contains(const std::string_view &str, const T &substr) noexcept {
        return str.find(substr) != std::string_view::npos;
    }

    PURE static __forceinline constexpr std::string &replaceFast(std::string &str, const std::string& from, const std::string& to) {
        if (UNLIKELY(from.empty() || to.empty() || from == to)) {
            return str;
        }

        size_t start = 0;
        while (LIKELY((start = str.find(from, start)) != std::string::npos)) {
            str.replace(start, from.length(), to);
            start += to.length();
        }
        return str;
    }

    PURE static __forceinline constexpr std::string &replaceFast(std::string &str, const char from, const char to) {
        if (UNLIKELY(from == to)) {
            return str;
        }

        for (char &c : str) {
            if (UNLIKELY(c == from)) {
                c = to;
            }
        }
        return str;
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

    std::cerr << fmt::format("Exception in thread \"{}\" with an unknown exception.", threadName);

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
