//
// Created by xia__mc on 2025/2/27.
//

#ifndef CLANG_MC_JE_H
#define CLANG_MC_JE_H

#include "Op.h"
#include "CallLike.h"
#include "CmpLike.h"
#include "utils/StringUtils.h"
#include "OpCommon.h"

class Je : public CallLike, public CmpLike {
private:
    inline std::string cmp(const LabelMap &jmpLabels, Register *left, Register *right) const {
        return fmt::format("execute if score {} vm_regs = {} vm_regs run return run function {}",
                           left->getName(), right->getName(), jmpLabels.at(hash(label)));
    }

    inline std::string cmp(const LabelMap &jmpLabels, Register *left, Immediate *right) const {
        return fmt::format("execute if score {} vm_regs matches {} run return run function {}",
                           left->getName(), right->getValue(), jmpLabels.at(hash(label)));
    }

    inline std::string cmp(const LabelMap &jmpLabels, Register *left, Ptr *right) const {
        return fmt::format("{}\n{}",
                           right->load(*Registers::S1),
                           cmp(jmpLabels, left, Registers::S1.get()));
    }

    inline std::string cmp(const LabelMap &jmpLabels, Immediate *left, Ptr *right) const {
        return fmt::format("{}\nexecute if score s1 vm_regs matches {} run return run function {}",
                           right->load(*Registers::S1), left->getValue(),
                           jmpLabels.at(hash(label)));
    }

public:
    explicit Je(const ui64 lineNumber, ValuePtr &&left, ValuePtr &&right, std::string label) :
            Op("je", lineNumber), CallLike(std::move(label)), CmpLike(std::move(left), std::move(right)) {
        if (INSTANCEOF_SHARED(left, Ptr) && INSTANCEOF_SHARED(right, Ptr)) {
            throw ParseException(i18n("ir.op.memory_operands"));
        }
    }

    [[nodiscard]] std::string toString() const noexcept override {
        return fmt::format("je {}, {}, {}", left->toString(), right->toString(), label);
    }

    [[nodiscard]] std::string compile() const override {
        return CallLike::compile();
    }

    [[nodiscard]] std::string compile([[maybe_unused]] const LabelMap &callLabels,
                                      [[maybe_unused]] const LabelMap &jmpLabels) const override {
        assert(jmpLabels.contains(hash(label)));

        if (const auto &left = INSTANCEOF_SHARED(this->left, Register)) {
            if (const auto &right = INSTANCEOF_SHARED(this->right, Register)) {
                return cmp(jmpLabels, left.get(), right.get());
            }
            if (const auto &right = INSTANCEOF_SHARED(this->right, Immediate)) {
                return cmp(jmpLabels, left.get(), right.get());
            }
            assert(INSTANCEOF_SHARED(this->right, Ptr));
            return cmp(jmpLabels, left.get(), CAST_FAST(this->right, Ptr));
        }
        if (const auto &left = INSTANCEOF_SHARED(this->left, Immediate)) {
            if (const auto &right = INSTANCEOF_SHARED(this->right, Register)) {
                return cmp(jmpLabels, right.get(), left.get());
            }
            if (const auto &right = INSTANCEOF_SHARED(this->right, Immediate)) {
                // 两个立即数比较直接编译时计算掉。因为mcfunction原生不支持比较两个立即数。多一条存储到寄存器就因噎废食了。
                if (left->getValue() != right->getValue()) return "";
                return fmt::format("return run function {}", jmpLabels.at(hash(label)));
            }
            assert(INSTANCEOF_SHARED(this->right, Ptr));
            return cmp(jmpLabels, left.get(), CAST_FAST(this->right, Ptr));
        }
        assert(INSTANCEOF_SHARED(this->left, Ptr));
        const auto &left = CAST_FAST(this->left, Ptr);
        if (const auto &right = INSTANCEOF_SHARED(this->right, Register)) {
            return cmp(jmpLabels, right.get(), left);
        }
        assert(INSTANCEOF_SHARED(this->right, Immediate));
        return cmp(jmpLabels, CAST_FAST(this->right, Immediate), left);
    }
};

#endif //CLANG_MC_JE_H
