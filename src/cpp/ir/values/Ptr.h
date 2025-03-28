//
// Created by xia__mc on 2025/2/24.
//

#ifndef CLANG_MC_PTR_H
#define CLANG_MC_PTR_H

#include "Value.h"
#include "Register.h"

class Ptr : public Value {
protected:
    [[nodiscard]] std::string formatAddress() const noexcept {
        auto result = std::ostringstream("[");
        if (base != nullptr) {
            result << base->toString();
        }
        if (index != nullptr) {
            if (!result.str().empty()) {
                result << " + ";
            }
            result << index->toString();

            if (scale != 1) {
                result << " * " << scale;
            }
        }
        if (displacement != 0) {
            if (displacement > 0) {
                if (!result.str().empty()) {
                    result << " + ";
                }
                result << displacement;
            } else {
                if (!result.str().empty()) {
                    result << " - ";
                }
                result << -displacement;
            }
        }
        return result.str();
    }

public:
    const Register *base;
    const Register *index;
    const i32 scale;
    const i32 displacement;

    void setPtr(std::ostringstream &result, const std::string &fieldName) const {
        const auto addDisplacementToS0 = [&](){
            if (displacement != 0) {
                if (displacement > 0) {
                    result << fmt::format("scoreboard players add s0 vm_regs {}\n", displacement);
                } else {
                    result << fmt::format("scoreboard players remove s0 vm_regs {}\n", -displacement);
                }
            }
        };

        if (base == nullptr) {
            assert(scale != 1);

            result << fmt::format("scoreboard players operation s0 vm_regs = {} vm_regs\n", index->getName());
            addDisplacementToS0();
            result << fmt::format(
                    "execute store result storage std:vm s2.{} int {} run scoreboard players get s0 vm_regs\n",
                    fieldName, scale);
        } else if (index == nullptr) {
            assert(base != nullptr);
            assert(scale == 1);
            if (displacement == 0) {
                result << fmt::format(
                        "execute store result storage std:vm s2.{} int 1 run scoreboard players get {} vm_regs\n",
                        fieldName, base->getName());
            } else {
                result << fmt::format("scoreboard players operation s0 vm_regs = {} vm_regs\n", base->getName());
                addDisplacementToS0();
                result << fmt::format(
                        "execute store result storage std:vm s2.{} int 1 run scoreboard players get s0 vm_regs\n",
                        fieldName);
            }
        } else {
            // 标准实现
            result << fmt::format("scoreboard players set s0 vm_regs {}\n", scale);
            result << fmt::format(
                    "scoreboard players operation s0 vm_regs *= {} vm_regs\n", index->getName());
            result << fmt::format("scoreboard players operation s0 vm_regs += {} vm_regs\n", base->getName());
            addDisplacementToS0();
            result << fmt::format(
                    "execute store result storage std:vm s2.{} int 1 run scoreboard players get s0 vm_regs\n",
                    fieldName);
        }
    }

    explicit Ptr(const Register *base, const Register *index, const i32 scale, const i32 displacement) noexcept:
            base(base), index(index), scale(scale), displacement(displacement) {
        assert(!(index == nullptr && scale != 1));
        assert(!(base == nullptr && index != nullptr && scale == 1));
    }

    /**
     * 把指针位置的内存加载到寄存器reg
     */
    [[nodiscard]] virtual std::string loadTo(const Register &reg) const = 0;

    /**
     * 把寄存器reg的值存储到指针位置的内存
     */
    [[nodiscard]] virtual std::string storeFrom(const Register &reg) const = 0;

    /**
     * 把立即数存储到指针位置的内存
     */
    [[nodiscard]] virtual std::string storeFrom(const Immediate &immediate) const = 0;

    /**
     * 把入参指针位置的内存存储到指针位置的内存
     */
    [[nodiscard]] virtual std::string storeFrom(const Ptr &ptr) const = 0;
};

#endif //CLANG_MC_PTR_H
