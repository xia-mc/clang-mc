//
// Created by xia__mc on 2025/2/13.
//

#ifndef CLANG_MC_COMMON_H
#define CLANG_MC_COMMON_H

#ifndef _MSC_VER
// 我不知道为什么，就算是spdlog-mingw-static也会用这个MSVC特有的函数导致我编译失败
#define _fwrite_nolock fwrite
#endif

#include "filesystem"
#include "spdlog/spdlog.h"
#include "cstdint"
#include "utils/include/UnorderedDense.h"

using Path = std::filesystem::path;
using Logger = std::shared_ptr<spdlog::logger>;
template <typename K, typename V>
using HashMap = ankerl::unordered_dense::map<K, V>;
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

class IOException : public std::runtime_error {
public:
    explicit IOException(const std::string &string) : std::runtime_error(string) {
    }
};

#define GETTER(name, field) __forceinline auto &get##name() noexcept { return field; } __forceinline const auto &get##name() const noexcept { return field; } // NOLINT(*-macro-parentheses)
#define GETTER_POD(name, field) __forceinline auto get##name() const noexcept { return field; }
#define SETTER(name, field) __forceinline void set##name(const auto &value) noexcept { field = value; }
#define SETTER_POD(name, field) __forceinline void set##name(auto value) noexcept { field = value; }

#define DATA(name, field) GETTER(name, field) SETTER(name, field)
#define DATA_POD(name, field) GETTER_POD(name, field) SETTER_POD(name, field)

#define CAST_SHARED(sharedPtr, type) (dynamic_pointer_cast<type>(sharedPtr))
#define CAST_FAST(ptr, type) ((type *) ptr.get())
#define INSTANCEOF(ptr, type) (dynamic_cast<type *>(ptr.get()))
#define INSTANCEOF_SHARED(sharedPtr, type) CAST_SHARED(sharedPtr, type)

#define NOT_IMPLEMENTED() throw NotImplementedException()
#define LIKELY(x)   __builtin_expect(!!(x), 1)
#define UNLIKELY(x) __builtin_expect(!!(x), 0)
#define UNREACHABLE() __builtin_unreachable()
#define PURE [[nodiscard]] [[gnu::const]]

PURE static inline constexpr ui64 hash(const std::string_view &str) noexcept {
    ui64 hash = 14695981039346656037ULL;
    for (const char c: str) {
        hash ^= static_cast<uint64_t>(c);
        hash *= 1099511628211ULL;
    }
    return hash;
}

#define SWITCH_STR(string) switch (hash(string))
#define CASE_STR(string) case hash(string)

#define warn(condition, message) \
    do { \
        if (!(condition)) { \
            std::cerr << "Warning: " << message << " (" << __FILE__ << ":" << __LINE__ << ")\n"; \
        } \
    } while (0)

#endif //CLANG_MC_COMMON_H
