//
// Created by xia__mc on 2025/3/1.
//

#ifndef CLANG_MC_STRINGBUILDER_H
#define CLANG_MC_STRINGBUILDER_H

#include "StringUtils.h"
#include "utils/Common.h"
#include "utils/Native.h"
#include "cmath"

class StringBuilder {
private:
    std::stringbuf buffer = std::stringbuf(std::ios::in | std::ios::out | std::ios::app);
public:
    explicit StringBuilder() = default;

    template<class StrLike>
    explicit StringBuilder(const StrLike &string) {
        append(string);
    }

    ~StringBuilder() = default;

    [[nodiscard]] __forceinline std::string toString() const {
        return buffer.str();
    }

    __forceinline void clear() noexcept {
        buffer.str("");
    }

    __forceinline bool isEmpty() {
        return buffer.str().empty();
    }

    __forceinline u32 size() {
        return buffer.str().size();
    }

    __forceinline u32 length() {
        return buffer.str().length();
    }

    template<class StrLike>
    __forceinline void append(const StrLike &string) noexcept {
        try {
            buffer.sputn(string.data(), string.length());
        } catch (const std::bad_alloc &) {
            onOOM();
        }
    }

    __forceinline void append(const char * __restrict const string) noexcept {
        append(string, strlen(string));
    }

    __forceinline void append(const char * __restrict const string, size_t length) noexcept {
        try {
            buffer.sputn(string, static_cast<i64>(length));
        } catch (const std::bad_alloc &) {
            onOOM();
        }
    }

    __forceinline void append(const char ch) noexcept {
        try {
            buffer.sputn(&ch, 1);
        } catch (const std::bad_alloc &) {
            onOOM();
        }
    }

    template<class StrLike>
    __forceinline void appendLine(const StrLike &string) noexcept {
        append(string);
        append('\n');
    }

    __forceinline void appendLine(const char ch) noexcept {
        append(ch);
        append('\n');
    }

    // std::move支持
    StringBuilder(StringBuilder &&other) noexcept
            : buffer(std::move(other.buffer)) {
    }

    StringBuilder &operator=(StringBuilder &&other) noexcept {
        if (this != &other) {
            buffer = std::move(other.buffer);
        }
        return *this;
    }
};

#endif //CLANG_MC_STRINGBUILDER_H
