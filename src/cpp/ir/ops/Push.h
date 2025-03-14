//
// Created by xia__mc on 2025/2/27.
//

#ifndef CLANG_MC_PUSH_H
#define CLANG_MC_PUSH_H

#include "Op.h"
#include "ir/values/Register.h"
#include "utils/string/StringUtils.h"
#include "utils/Common.h"

class Push : public Op {
private:
    const Register *reg;
    const i32 repeat;
public:
    explicit Push(const ui32 lineNumber, Register *reg) : Op("push", lineNumber), reg(reg), repeat(1) {
        assert(reg != nullptr);
        if (!reg->getPushable()) {
            throw ParseException(i18n("ir.invalid_op"));
        }
    }

    explicit Push(const ui32 lineNumber, const i32 repeat) : Op("push", lineNumber), reg(nullptr), repeat(repeat) {
    }

    explicit Push(const ui32 lineNumber) : Push(lineNumber, 1) {
    }

    [[nodiscard]] std::string toString() const noexcept override {
        if (reg != nullptr) {
            return fmt::format("push {}", reg->toString());
        }
        return fmt::format("push {}", repeat);
    }

    [[nodiscard]] std::string compile() const override {
        if (reg != nullptr) {
            return fmt::format("function std:stack/push_{}", reg->getName());
        }
        return string::repeat("function std:stack/push_zero", repeat, '\n');
    }
};

#endif //CLANG_MC_PUSH_H
