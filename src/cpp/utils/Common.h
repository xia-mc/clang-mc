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
#include <nlohmann/json.hpp>

using Path = std::filesystem::path;
using Logger = std::shared_ptr<spdlog::logger>;
template <typename K, typename V, class Hash = ankerl::unordered_dense::hash<K>>
using HashMap = ankerl::unordered_dense::map<K, V, Hash>;
template <typename T>
using HashSet = ankerl::unordered_dense::set<T>;
using i8 = int8_t;
using i16 = int16_t;
using i32 = int32_t;
using i64 = int64_t;
using u8 = uint8_t;
using u16 = uint16_t;
using u32 = uint32_t;
using u64 = uint64_t;
using Hash = u64;
template <typename T>
using Supplier = std::function<T()>;
using Json = nlohmann::json;

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

#define CAST_FAST(ptr, type) ((type *) ptr.get())
#define CAST_SHARED(sharedPtr, type) (dynamic_pointer_cast<type>(sharedPtr))
#define INSTANCEOF(ptr, type) (dynamic_cast<type *>((ptr).get()))
#define INSTANCEOF_SHARED(sharedPtr, type) CAST_SHARED(sharedPtr, type)
#define FUNC_THIS(method) ([this](auto&&... args) { return this->method(std::forward<decltype(args)>(args)...); })
#define FUNC_ARG0(method) ([](auto &object, auto&&... args) { return object.method(std::forward<decltype(args)>(args)...); })
#define UNUSED(expr) ((void) (expr))

#define NOT_IMPLEMENTED() throw NotImplementedException()
#define LIKELY(x)   __builtin_expect(!!(x), 1)
#define UNLIKELY(x) __builtin_expect(!!(x), 0)
#define UNREACHABLE() __builtin_unreachable()
#define PURE [[nodiscard]]

PURE static __forceinline constexpr Hash hash(const std::string_view &str) noexcept {
    Hash hash = 14695981039346656037U;
    for (const char c: str) {
        hash ^= static_cast<Hash>(c);
        hash *= 1099511628211U;
    }
    return hash;
}

#define SWITCH_STR(string) switch (hash(string))
#define CASE_STR(string) case hash(string)


#ifndef NDEBUG
#define WARN(condition, message) \
    do { \
        if (!(condition)) { \
            std::cerr << "Warning: " << message << " (" << __FILE__ << ":" << __LINE__ << ")\n"; \
        } \
    } while (0)
#else
#undef assert
#define assert(expression) \
    do { \
        break; \
    } while (expression)
#define WARN(condition, message) UNUSED(condition); UNUSED(message)
#endif

#endif //CLANG_MC_COMMON_H
