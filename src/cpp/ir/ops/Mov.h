//
// Created by xia__mc on 2025/2/16.
//

#ifndef CLANG_MC_MOV_H
#define CLANG_MC_MOV_H

#include "Op.h"
#include "ir/values/Value.h"
#include "utils/StringUtils.h"
#include "i18n/I18n.h"

class Mov : public Op {
private:
    const ValuePtr left;
    const ValuePtr right;
public:
    explicit Mov(const ui64 lineNumber, ValuePtr &&left, ValuePtr &&right)
            : Op("mov", lineNumber), left(std::move(left)), right(std::move(right)) {
        if (INSTANCEOF_SHARED(this->left, Immediate)) {
            throw ParseException(i18n("ir.op.immediate_left"));
        }
    }

    [[nodiscard]] std::string toString() const noexcept override {
        return fmt::format("mov {}, {}", left->toString(), right->toString());
    }

    [[nodiscard]] std::string compile() const override {
        if (const auto &immediate = INSTANCEOF_SHARED(right, Immediate)) {
            if (const auto &result = INSTANCEOF_SHARED(left, Register)) {
                return fmt::format("scoreboard players set {} vm_regs {}",
                                   result->getName(), immediate->getValue());
            } else {
                assert(INSTANCEOF_SHARED(left, Ptr));

                return CAST_FAST(left, Ptr)->store(*immediate);
            }
        } else if (const auto &reg = INSTANCEOF_SHARED(right, Register)) {
            if (const auto &result = INSTANCEOF_SHARED(left, Register)) {
                return fmt::format("scoreboard players operation {} vm_regs = {} vm_regs",
                                   result->getName(), reg->getName());
            } else {
                assert(INSTANCEOF_SHARED(left, Ptr));

                return CAST_FAST(left, Ptr)->store(*reg);
            }
        } else {
            assert(INSTANCEOF_SHARED(right, Ptr));

            if (const auto &result = INSTANCEOF_SHARED(left, Register)) {
                return CAST_FAST(right, Ptr)->load(*result);
            } else {
                assert(INSTANCEOF_SHARED(left, Ptr));

                return CAST_FAST(left, Ptr)->store(*CAST_FAST(right, Ptr));
            }
        }
    }
};

#endif //CLANG_MC_MOV_H
