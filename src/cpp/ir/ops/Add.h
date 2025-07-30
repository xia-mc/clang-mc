//
// Created by xia__mc on 2025/2/24.
//

#ifndef CLANG_MC_ADD_H
#define CLANG_MC_ADD_H

#include "ir/iops/Op.h"
#include "utils/string/StringUtils.h"
#include "ir/OpCommon.h"
#include "Mov.h"

class Add : public CmpLike {
public:
    explicit Add(const i32 lineNumber, ValuePtr &&left, ValuePtr &&right) :
            Op("add", lineNumber), CmpLike(std::move(left), std::move(right)) {
        if (INSTANCEOF_SHARED(left, Immediate)) {
            throw ParseException(i18n("ir.op.immediate_left"));
        }
    }

    void withIR(IR *context) override {
        CmpLike::withIR(context);
        if (INSTANCEOF_SHARED(this->left, Ptr) && INSTANCEOF_SHARED(this->right, Ptr)) {
            throw ParseException(i18n("ir.op.memory_operands"));
        }
    }

    [[nodiscard]] std::string toString() const noexcept override {
        return fmt::format("add {}, {}", left->toString(), right->toString());
    }

    [[nodiscard]] std::string compile() const override {
        if (const auto &value = INSTANCEOF_SHARED(right, Immediate)) {
            if (const auto &result = INSTANCEOF_SHARED(left, Register)) {
                return fmt::format("scoreboard players add {} vm_regs {}",
                                   result->getName(), static_cast<i32>(value->getValue()));
            }

            // 与x86不同，mc不支持直接对storage（内存）中的值做计算
            return fmt::format("{}\nscoreboard players add s1 vm_regs {}\n{}",
                               CAST_FAST(left, Ptr)->loadTo(*Registers::S1),
                               static_cast<i32>(value->getValue()),
                               CAST_FAST(left, Ptr)->storeFrom(*Registers::S1));
        }
        if (const auto &value = INSTANCEOF_SHARED(right, Register)) {
            if (const auto &result = INSTANCEOF_SHARED(left, Register)) {
                return fmt::format("scoreboard players operation {} vm_regs += {} vm_regs",
                                   result->getName(), value->getName());
            }

            assert(INSTANCEOF_SHARED(left, Ptr));

            // 与x86不同，mc不支持直接对storage（内存）中的值做计算
            return fmt::format("{}\nscoreboard players operation s1 vm_regs += {} vm_regs\n{}",
                               CAST_FAST(left, Ptr)->loadTo(*Registers::S1),
                               value->getName(),
                               CAST_FAST(left, Ptr)->storeFrom(*Registers::S1));
        }

        assert(INSTANCEOF_SHARED(right, Ptr));
        assert(INSTANCEOF_SHARED(left, Register));

        // 与x86不同，mc不支持直接对storage（内存）中的值做计算
        return fmt::format("{}\nscoreboard players operation {} vm_regs += s1 vm_regs",
                           CAST_FAST(right, Ptr)->loadTo(*Registers::S1),
                           CAST_FAST(left, Register)->getName());
    }
};

#endif //CLANG_MC_ADD_H
