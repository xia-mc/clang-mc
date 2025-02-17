//
// Created by xia__mc on 2025/2/13.
//

#ifndef CLANG_MC_COMMON_H
#define CLANG_MC_COMMON_H

#pragma clang diagnostic push
#pragma ide diagnostic ignored "bugprone-reserved-identifier"
#pragma ide diagnostic ignored "OCUnusedMacroInspection"
#ifndef _MSC_VER
// 我不知道为什么，就算是spdlog-mingw-static也会用这个MSVC特有的函数导致我编译失败
#define _fwrite_nolock fwrite
#endif
#pragma clang diagnostic pop


#include "filesystem"
#include "spdlog/spdlog.h"
#include "cstdint"

using Path = std::filesystem::path;
using Logger = std::shared_ptr<spdlog::logger>;
using i32 = int32_t;
using ui64 = uint64_t;

class ParseException : public std::runtime_error {
public:
    explicit ParseException(const std::string &string) : std::runtime_error(string) {
    }
};

class UnsupportedOperationException : public std::runtime_error {
public:
    explicit UnsupportedOperationException(const std::string &string) : std::runtime_error(string) {
    }
};

class NotImplementedException : public UnsupportedOperationException {
public:
    explicit NotImplementedException() : UnsupportedOperationException("Not implemented.") {
    }
};

static inline constexpr ui64 hash(std::string_view str) {
    ui64 hash = 14695981039346656037ULL;
    for (char c : str) {
        hash ^= static_cast<uint64_t>(c);
        hash *= 1099511628211ULL;
    }
    return hash;
}

#define GETTER(name, field) __forceinline auto &get##name() noexcept { return field; } const auto &get##name() const noexcept { return field; }
#define GETTER_POD(name, field) __forceinline auto get##name() const noexcept { return field; }
#define SETTER(name, field) __forceinline void set##name(const auto &value) noexcept { field = value; }
#define SETTER_POD(name, field) __forceinline void set##name(auto value) noexcept { field = value; }

#define DATA(name, field) GETTER(name, field) SETTER(name, field)
#define DATA_POD(name, field) GETTER_POD(name, field) SETTER_POD(name, field)

#define CAST_SHARED(sharedPtr, type) (dynamic_pointer_cast<type>(sharedPtr))
#define INSTANCEOF_SHARED(sharedPtr, type) (CAST_SHARED(sharedPtr, type) != nullptr)

#define NOT_IMPLEMENTED() throw NotImplementedException()
#define LIKELY(x)   __builtin_expect(!!(x), 1)
#define UNLIKELY(x) __builtin_expect(!!(x), 0)
#define UNREACHABLE() __builtin_unreachable()

#endif //CLANG_MC_COMMON_H
