//
// Created by xia__mc on 2025/2/27.
//

#ifndef CLANG_MC_POP_H
#define CLANG_MC_POP_H

#include "ir/iops/Op.h"
#include "ir/values/Register.h"
#include "utils/string/StringUtils.h"
#include "utils/Common.h"

class Pop : public Op {
private:
    const Register *reg;
    const i32 repeat;
public:
    explicit Pop(const i32 lineNumber, Register *reg) : Op("pop", lineNumber), reg(reg), repeat(1) {
        assert(reg != nullptr);
        if (!reg->getPushable()) {
            throw ParseException(i18n("ir.invalid_op"));
        }
    }

    explicit Pop(const i32 lineNumber, const i32 repeat) : Op("pop", lineNumber), reg(nullptr), repeat(repeat) {
    }

    explicit Pop(const i32 lineNumber) : Pop(lineNumber, 1) {
    }

    [[nodiscard]] std::string toString() const noexcept override {
        if (reg != nullptr) {
            return fmt::format("pop {}", reg->toString());
        }
        return fmt::format("pop {}", repeat);
    }

    [[nodiscard]] std::string compile() const override {
        if (reg != nullptr) {
            return fmt::format("scoreboard players add rsp vm_regs 1\n"
                               "\n"
                               "data modify storage std:vm s2 set value {{name: \"{}\", rsp: -1}}\n"
                               "execute store result storage std:vm s2.rsp int 1 run scoreboard players get rsp vm_regs\n"
                               "\n"
                               "function std:_internal/pop with storage std:vm s2", reg->getName());
        }
        return string::repeat("scoreboard players add rsp vm_regs 1", repeat, '\n');
    }
};

#endif //CLANG_MC_POP_H
