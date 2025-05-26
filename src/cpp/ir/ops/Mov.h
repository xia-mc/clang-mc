//
// Created by xia__mc on 2025/2/16.
//

#ifndef CLANG_MC_MOV_H
#define CLANG_MC_MOV_H

#include "Op.h"
#include "ir/values/Value.h"
#include "utils/string/StringUtils.h"
#include "i18n/I18n.h"
#include "CmpLike.h"

class Mov : public CmpLike {
public:
    explicit Mov(const i32 lineNumber, ValuePtr &&left, ValuePtr &&right)
            : Op("mov", lineNumber), CmpLike(std::move(left), std::move(right)) {
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
                                   result->getName(), static_cast<i32>(immediate->getValue()));
            } else {
                assert(INSTANCEOF_SHARED(left, Ptr));

                return CAST_FAST(left, Ptr)->storeFrom(*immediate);
            }
        } else if (const auto &reg = INSTANCEOF_SHARED(right, Register)) {
            if (const auto &result = INSTANCEOF_SHARED(left, Register)) {
                return fmt::format("scoreboard players operation {} vm_regs = {} vm_regs",
                                   result->getName(), reg->getName());
            } else {
                assert(INSTANCEOF_SHARED(left, Ptr));

                return CAST_FAST(left, Ptr)->storeFrom(*reg);
            }
        } else {
            assert(INSTANCEOF_SHARED(right, Ptr));

            if (const auto &result = INSTANCEOF_SHARED(left, Register)) {
                return CAST_FAST(right, Ptr)->loadTo(*result);
            } else {
                assert(INSTANCEOF_SHARED(left, Ptr));

                return CAST_FAST(left, Ptr)->storeFrom(*CAST_FAST(right, Ptr));
            }
        }
    }
};

#endif //CLANG_MC_MOV_H
