//
// Created by xia__mc on 2025/2/27.
//

#ifndef CLANG_MC_PUSH_H
#define CLANG_MC_PUSH_H

#include "ir/iops/Op.h"
#include "ir/values/Register.h"
#include "utils/string/StringUtils.h"
#include "utils/Common.h"

class Push : public Op {
private:
    const Register *reg;
    const i32 repeat;
public:
    explicit Push(const i32 lineNumber, Register *reg) : Op("push", lineNumber), reg(reg), repeat(1) {
        assert(reg != nullptr);
        if (!reg->getPushable()) {
            throw ParseException(i18n("ir.invalid_op"));
        }
    }

    explicit Push(const i32 lineNumber, const i32 repeat) : Op("push", lineNumber), reg(nullptr), repeat(repeat) {
    }

    explicit Push(const i32 lineNumber) : Push(lineNumber, 1) {
    }

    [[nodiscard]] std::string toString() const noexcept override {
        if (reg != nullptr) {
            return fmt::format("push {}", reg->toString());
        }
        return fmt::format("push {}", repeat);
    }

    [[nodiscard]] std::string compile() const override {
        if (reg != nullptr) {
            return fmt::format("scoreboard players remove rsp vm_regs 1\n"
                               "\n"
                               "data modify storage std:vm s2 set value {{name: \"{}\", rsp: -1}}\n"
                               "execute store result storage std:vm s2.rsp int 1 run scoreboard players get rsp vm_regs\n"
                               "\n"
                               "function std:_internal/push with storage std:vm s2", reg->getName());
        }
        return string::repeat("scoreboard players remove rsp vm_regs 1\n"
                              "\n"
                              "data modify storage std:vm s2 set value {{rsp: -1}}\n"
                              "execute store result storage std:vm s2.rsp int 1 run scoreboard players get rsp vm_regs\n"
                              "function std:_internal/push_zero with storage std:vm s2", repeat, '\n');
    }
};

#endif //CLANG_MC_PUSH_H
