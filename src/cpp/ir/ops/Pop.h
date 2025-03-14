//
// Created by xia__mc on 2025/2/27.
//

#ifndef CLANG_MC_POP_H
#define CLANG_MC_POP_H

#include "Op.h"
#include "ir/values/Register.h"
#include "utils/string/StringUtils.h"
#include "utils/Common.h"

class Pop : public Op {
private:
    const Register *reg;
    const i32 repeat;
public:
    explicit Pop(const ui32 lineNumber, Register *reg) : Op("pop", lineNumber), reg(reg), repeat(1) {
        assert(reg != nullptr);
        if (!reg->getPushable()) {
            throw ParseException(i18n("ir.invalid_op"));
        }
    }

    explicit Pop(const ui32 lineNumber, const i32 repeat) : Op("pop", lineNumber), reg(nullptr), repeat(repeat) {
    }

    explicit Pop(const ui32 lineNumber) : Pop(lineNumber, 1) {
    }

    [[nodiscard]] std::string toString() const noexcept override {
        if (reg != nullptr) {
            return fmt::format("pop {}", reg->toString());
        }
        return fmt::format("pop {}", repeat);
    }

    [[nodiscard]] std::string compile() const override {
        if (reg != nullptr) {
            return fmt::format("function std:stack/pop_{}", reg->getName());
        }
        return string::repeat("function std:stack/pop_ignore", repeat, '\n');
    }
};

#endif //CLANG_MC_POP_H
