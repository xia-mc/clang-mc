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

    [[nodiscard]] FORCEINLINE std::string toString() const {
        return buffer.str();
    }

    FORCEINLINE void clear() noexcept {
        buffer.str("");
    }

    FORCEINLINE bool isEmpty() {
        return buffer.str().empty();
    }

    FORCEINLINE u64 size() {
        return buffer.str().size();
    }

    FORCEINLINE u64 length() {
        return buffer.str().length();
    }

    template<class StrLike>
    FORCEINLINE void append(const StrLike &string) noexcept {
        try {
            buffer.sputn(string.data(), (i64) string.length());
        } catch (const std::bad_alloc &) {
            onOOM();
        }
    }

    FORCEINLINE void append(const char * __restrict const string) noexcept {
        append(string, std::char_traits<char>::length(string));
    }

    FORCEINLINE void append(const char * __restrict const string, size_t length) noexcept {
        try {
            buffer.sputn(string, static_cast<i64>(length));
        } catch (const std::bad_alloc &) {
            onOOM();
        }
    }

    FORCEINLINE void append(const char ch) noexcept {
        try {
            buffer.sputn(&ch, 1);
        } catch (const std::bad_alloc &) {
            onOOM();
        }
    }

    template<class StrLike>
    FORCEINLINE void appendLine(const StrLike &string) noexcept {
        append(string);
        append('\n');
    }

    FORCEINLINE void appendLine(const char ch) noexcept {
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
