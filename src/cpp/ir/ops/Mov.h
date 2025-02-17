//
// Created by xia__mc on 2025/2/16.
//

#ifndef CLANG_MC_MOV_H
#define CLANG_MC_MOV_H

#include "Op.h"
#include "ir/values/Value.h"
#include "utils/StringUtils.h"

class Mov : public Op {
private:
    const ValuePtr left;
    const ValuePtr right;
public:
    explicit Mov(ValuePtr left, ValuePtr right)
            : Op("mov"), left(std::move(left)), right(std::move(right)) {
        if (INSTANCEOF_SHARED(this->left, Immediate)) {
            throw ParseException("The left value of mov can't be an immediate value.");
        }
    }

    std::string toString() override {
        return fmt::format("mov {}, {}", left->toString(), right->toString());
    }

    McFunction compile() override {
        if (!INSTANCEOF_SHARED(left, RegisterImpl)) {
            NOT_IMPLEMENTED();
        }
        auto result = CAST_SHARED(left, RegisterImpl)->getName();

        if (INSTANCEOF_SHARED(right, Immediate)) {
            return fmt::format("scoreboard players set {} vm_regs {}",
                               result, CAST_SHARED(right, Immediate)->getValue());
        } else if (INSTANCEOF_SHARED(right, RegisterImpl)) {
            return fmt::format("scoreboard players operation {} vm_regs = {} vm_regs",
                               result, CAST_SHARED(right, RegisterImpl)->getName());
        } else {
            NOT_IMPLEMENTED();
        }
    }
};

#endif //CLANG_MC_MOV_H
