//
// Created by xia__mc on 2025/2/27.
//

#ifndef CLANG_MC_POP_H
#define CLANG_MC_POP_H

#include "Op.h"
#include "ir/values/Register.h"
#include "utils/StringUtils.h"
#include "utils/Common.h"

class Pop : public Op {
private:
    const Register *reg;
public:
    explicit Pop(const ui64 lineNumber, Register *reg) : Op("pop", lineNumber), reg(reg) {
        assert(reg != nullptr);
        if (!reg->getPushable()) {
            throw ParseException(i18n("ir.invalid_op"));
        }
    }

    [[nodiscard]] std::string toString() const noexcept override {
        return fmt::format("pop {}", reg->toString());
    }

    [[nodiscard]] std::string compile() const override {
        return fmt::format("function std:stack/pop_{}", reg->getName());
    }
};

#endif //CLANG_MC_POP_H
