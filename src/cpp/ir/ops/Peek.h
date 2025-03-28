//
// Created by xia__mc on 2025/2/27.
//

#ifndef CLANG_MC_PEEK_H
#define CLANG_MC_PEEK_H

#include "Op.h"
#include "ir/values/Register.h"
#include "utils/string/StringUtils.h"
#include "utils/Common.h"

class Peek : public Op {
private:
    const Register *reg;
public:
    explicit Peek(const i32 lineNumber, Register *reg) : Op("peek", lineNumber), reg(reg) {
        assert(reg != nullptr);
        if (!reg->getPushable()) {
            throw ParseException(i18n("ir.invalid_op"));
        }
    }

    [[nodiscard]] std::string toString() const noexcept override {
        return fmt::format("peek {}", reg->toString());
    }

    [[nodiscard]] std::string compile() const override {
        return fmt::format("function std:stack/peek_{}", reg->getName());
    }
};

#endif //CLANG_MC_PEEK_H
