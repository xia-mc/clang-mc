//
// Created by xia__mc on 2025/5/25.
//

#ifndef CLANG_MC_INT_H
#define CLANG_MC_INT_H


#include "utils/Common.h"

class Int {
private:
    i32 value;
public:
    Int() = delete;

    __forceinline constexpr Int(i32 value) noexcept: value(value) { // NOLINT(*-explicit-constructor)
    }

    [[nodiscard]] __forceinline constexpr bool checkAdd(Int rhs) const noexcept {
        return LIKELY((rhs.value >= 0)
                      ? value <= (INT32_MAX - rhs.value)
                      : value >= (INT32_MIN - rhs.value));
    }

    [[nodiscard]] __forceinline constexpr bool checkSub(Int rhs) const noexcept {
        return LIKELY((rhs.value >= 0)
                      ? value >= (INT32_MIN + rhs.value)
                      : value <= (INT32_MAX + (-rhs.value)));
    }

    [[nodiscard]] inline constexpr bool checkMul(Int rhs) const noexcept {
        if (value == 0 || rhs.value == 0) return true;
        if (value == -1) return rhs.value != INT32_MIN;
        if (rhs.value == -1) return value != INT32_MIN;
        i32 result = value * rhs.value;
        return LIKELY(result / rhs.value == value);
    }

    [[nodiscard]] __forceinline constexpr bool checkDiv(Int rhs) const noexcept {
        return LIKELY(!(value == INT32_MIN && rhs.value == -1) && rhs.value != 0);
    }

    __forceinline constexpr bool operator==(Int rhs) const noexcept {
        return value == rhs.value;
    }

    __forceinline constexpr bool operator==(i32 rhs) const noexcept {
        return operator==(Int(rhs));
    }

    __forceinline constexpr Int operator+(Int rhs) const noexcept {
        if (checkAdd(rhs)) return value + rhs.value;
        return {static_cast<i32>(
                        static_cast<u32>(value) + static_cast<u32>(rhs.value))};
    }

    __forceinline constexpr Int operator-(Int rhs) const noexcept {
        if (checkSub(rhs)) return value - rhs.value;
        return static_cast<i32>(
                static_cast<u32>(value) - static_cast<u32>(rhs.value));
    }

    __forceinline constexpr Int operator*(Int rhs) const noexcept {
        if (checkMul(rhs)) return value * rhs.value;
        return static_cast<i32>(
                static_cast<i64>(value) * static_cast<i64>(rhs.value));

    }

    __forceinline constexpr Int operator/(Int rhs) const noexcept {
        if (checkDiv(rhs)) return value / rhs.value;
        // UB：INT_MIN / -1 或除以 0
        return INT32_MAX;
    }

    __forceinline constexpr i32 operator+(i32 rhs) const noexcept {
        return operator+(Int(rhs));
    }

    __forceinline constexpr i32 operator-(i32 rhs) const noexcept {
        return operator-(Int(rhs));
    }

    __forceinline constexpr i32 operator*(i32 rhs) const noexcept {
        return operator*(Int(rhs));
    }

    __forceinline constexpr i32 operator/(i32 rhs) const noexcept {
        return operator/(Int(rhs));
    }

    __forceinline constexpr operator i32() const noexcept { return value; } // NOLINT(*-explicit-constructor)
};


#endif //CLANG_MC_INT_H
