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
    explicit Mov(ValuePtr left, ValuePtr right)
            : Op("mov"), left(std::move(left)), right(std::move(right)) {
        if (UNLIKELY(INSTANCEOF_SHARED(this->left, Immediate))) {
            throw ParseException(i18n("ir.op.mov.immediate_left"));
        }
    }

    std::string toString() const noexcept override {
        return fmt::format("mov {}, {}", left->toString(), right->toString());
    }

    [[nodiscard]] std::string compile() const override {
        if (UNLIKELY(!INSTANCEOF_SHARED(left, RegisterImpl))) {
            NOT_IMPLEMENTED();
        }
        auto result = CAST_SHARED(left, RegisterImpl)->getName();

        if (auto immediate = INSTANCEOF_SHARED(right, Immediate)) {
            return fmt::format("scoreboard players set {} vm_regs {}",
                               result, immediate->getValue());
        } else if (auto reg = INSTANCEOF_SHARED(right, RegisterImpl)) {
            return fmt::format("scoreboard players operation {} vm_regs = {} vm_regs",
                               result, reg->getName());
        } else [[unlikely]] {
            NOT_IMPLEMENTED();
        }
    }
};

#endif //CLANG_MC_MOV_H
