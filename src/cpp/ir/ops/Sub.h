//
// Created by xia__mc on 2025/2/24.
//

#ifndef CLANG_MC_SUB_H
#define CLANG_MC_SUB_H

#include "ir/iops/Op.h"
#include "utils/string/StringUtils.h"
#include "ir/OpCommon.h"
#include "Mov.h"

class Sub : public CmpLike {
public:
    explicit Sub(const i32 lineNumber, ValuePtr &&left, ValuePtr &&right) :
            Op("sub", lineNumber), CmpLike(std::move(left), std::move(right)) {
        if (INSTANCEOF_SHARED(left, Immediate)) {
            throw ParseException(i18n("ir.op.immediate_left"));
        }
        if (INSTANCEOF_SHARED(left, Ptr) && INSTANCEOF_SHARED(right, Ptr)) {
            throw ParseException(i18n("ir.op.memory_operands"));
        }
    }

    [[nodiscard]] std::string toString() const noexcept override {
        return fmt::format("sub {}, {}", left->toString(), right->toString());
    }

    [[nodiscard]] std::string compile() const override {
        if (const auto &immediate = INSTANCEOF_SHARED(right, Immediate)) {
            if (const auto &result = INSTANCEOF_SHARED(left, Register)) {
                return fmt::format("scoreboard players remove {} vm_regs {}",
                                   result->getName(), static_cast<i32>(immediate->getValue()));
            } else {
                assert(INSTANCEOF_SHARED(left, Ptr));

                // 与x86不同，mc不支持直接对storage（内存）中的值做计算
                return fmt::format("{}\nscoreboard players remove s1 vm_regs {}\n{}",
                                   CAST_FAST(left, Ptr)->loadTo(*Registers::S1),
                                   static_cast<i32>(immediate->getValue()),
                                   CAST_FAST(left, Ptr)->storeFrom(*Registers::S1));
            }
        } else if (const auto &reg = INSTANCEOF_SHARED(right, Register)) {
            if (const auto &result = INSTANCEOF_SHARED(left, Register)) {
                return fmt::format("scoreboard players operation {} vm_regs -= {} vm_regs",
                                   result->getName(), reg->getName());
            } else {
                assert(INSTANCEOF_SHARED(left, Ptr));

                // 与x86不同，mc不支持直接对storage（内存）中的值做计算
                return fmt::format("{}\nscoreboard players operation s1 vm_regs -= {} vm_regs\n{}",
                                   CAST_FAST(left, Ptr)->loadTo(*Registers::S1),
                                   reg->getName(),
                                   CAST_FAST(left, Ptr)->storeFrom(*Registers::S1));
            }
        } else {
            assert(INSTANCEOF_SHARED(right, Ptr));
            assert(INSTANCEOF_SHARED(left, Register));

            // 与x86不同，mc不支持直接对storage（内存）中的值做计算
            return fmt::format("{}\nscoreboard players operation {} vm_regs -= s1 vm_regs",
                               CAST_FAST(right, Ptr)->loadTo(*Registers::S1),
                               CAST_FAST(left, Register)->getName());
        }
    }
};

#endif //CLANG_MC_SUB_H
