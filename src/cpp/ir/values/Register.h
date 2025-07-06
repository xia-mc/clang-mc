//
// Created by xia__mc on 2025/2/16.
//

#ifndef CLANG_MC_REGISTER_H
#define CLANG_MC_REGISTER_H

#include "Value.h"
#include "i18n/I18n.h"
#include "utils/string/StringUtils.h"

class Registers;

class Register : public Value {
private:
    const std::string name;
    const bool pushable;

    explicit Register(std::string name, bool pushable) noexcept: name(std::move(name)), pushable(pushable) {
    }

    friend class Registers;

public:
    explicit Register() = delete;

    GETTER(Name, name);

    GETTER_POD(Pushable, pushable)

    [[nodiscard]] std::string toString() const noexcept override {
        return getName();
    }

    [[nodiscard]] __forceinline bool operator==(const Register &target) const noexcept {
        return this == &target;
    }
};

class Registers {
private:
    static std::shared_ptr<Register> create(const std::string &name, const bool pushable) {
        return std::shared_ptr<Register>(new Register(name, pushable));
    }

    static std::shared_ptr<Register> create(const std::string &name) {
        return create(name, true);
    }

public:
    Registers() = delete;

    // 通用寄存器
    static inline const auto RAX = create("rax");  // 函数返回值 caller-saved
    static inline const auto R0 = create("r0");  // 参数1或临时寄存器 caller-saved
    static inline const auto R1 = create("r1");  // 参数2或临时寄存器 caller-saved
    static inline const auto R2 = create("r2");  // 参数3或临时寄存器 caller-saved
    static inline const auto R3 = create("r3");  // 参数4或临时寄存器 caller-saved
    static inline const auto R4 = create("r4");  // 参数5或临时寄存器 caller-saved
    static inline const auto R5 = create("r5");  // 参数6或临时寄存器 caller-saved
    static inline const auto R6 = create("r6");  // 参数7或临时寄存器 caller-saved
    static inline const auto R7 = create("r7");  // 参数8或临时寄存器 caller-saved
    static inline const auto T0 = create("t0");  // 临时寄存器1 caller-saved
    static inline const auto T1 = create("t1");  // 临时寄存器2 caller-saved
    static inline const auto T2 = create("t2");  // 临时寄存器3 caller-saved
    static inline const auto T3 = create("t3");  // 临时寄存器4 caller-saved
    static inline const auto T4 = create("t4");  // 临时寄存器5 caller-saved
    static inline const auto T5 = create("t5");  // 临时寄存器6 caller-saved
    static inline const auto T6 = create("t6");  // 临时寄存器7 caller-saved
    static inline const auto T7 = create("t7");  // 临时寄存器8 caller-saved
    static inline const auto X0 = create("x0");  // 保存寄存器1 callee-saved
    static inline const auto X1 = create("x1");  // 保存寄存器2 callee-saved
    static inline const auto X2 = create("x2");  // 保存寄存器3 callee-saved
    static inline const auto X3 = create("x3");  // 保存寄存器4 callee-saved
    static inline const auto X4 = create("x4");  // 保存寄存器5 callee-saved
    static inline const auto X5 = create("x5");  // 保存寄存器6 callee-saved
    static inline const auto X6 = create("x6");  // 保存寄存器7 callee-saved
    static inline const auto X7 = create("x7");  // 保存寄存器8 callee-saved
    static inline const auto X8 = create("x8");  // 保存寄存器9 callee-saved
    static inline const auto X9 = create("x9");  // 保存寄存器10 callee-saved
    static inline const auto X10 = create("x10");  // 保存寄存器11 callee-saved
    static inline const auto X11 = create("x11");  // 保存寄存器12 callee-saved
    static inline const auto X12 = create("x12");  // 保存寄存器13 callee-saved
    static inline const auto X13 = create("x13");  // 保存寄存器14 callee-saved
    static inline const auto X14 = create("x14");  // 保存寄存器15 callee-saved
    static inline const auto X15 = create("x15");  // 保存寄存器16 callee-saved

    // VM内部保留寄存器
    static inline const auto RSP = create("rsp", false);  // 栈指针
    static inline const auto SHP = create("shp", false);  // 堆大小
    static inline const auto SBP = create("sbp", false);  // 静态数据基址指针
    static inline const auto S0 = create("s0", false);  // 编译器保留
    static inline const auto S1 = create("s1", false);  // 编译器保留
    static inline const auto S2 = create("s2", false);  // 编译器保留
    static inline const auto S3 = create("s3", false);  // 编译器保留
    static inline const auto S4 = create("s4", false);  // 编译器保留

    static std::shared_ptr<Register> fromName(const std::string_view &name) {
        SWITCH_STR (string::toLowerCase(name)) {
            CASE_STR("rax"): return RAX;
            CASE_STR("r0"): return R0;
            CASE_STR("r1"): return R1;
            CASE_STR("r2"): return R2;
            CASE_STR("r3"): return R3;
            CASE_STR("r4"): return R4;
            CASE_STR("r5"): return R5;
            CASE_STR("r6"): return R6;
            CASE_STR("r7"): return R7;
            CASE_STR("t0"): return T0;
            CASE_STR("t1"): return T1;
            CASE_STR("t2"): return T2;
            CASE_STR("t3"): return T3;
            CASE_STR("t4"): return T4;
            CASE_STR("t5"): return T5;
            CASE_STR("t6"): return T6;
            CASE_STR("t7"): return T7;
            CASE_STR("x0"): return X0;
            CASE_STR("x1"): return X1;
            CASE_STR("x2"): return X2;
            CASE_STR("x3"): return X3;
            CASE_STR("x4"): return X4;
            CASE_STR("x5"): return X5;
            CASE_STR("x6"): return X6;
            CASE_STR("x7"): return X7;
            CASE_STR("x8"): return X8;
            CASE_STR("x9"): return X9;
            CASE_STR("x10"): return X10;
            CASE_STR("x11"): return X11;
            CASE_STR("x12"): return X12;
            CASE_STR("x13"): return X13;
            CASE_STR("x14"): return X14;
            CASE_STR("x15"): return X15;
            CASE_STR("rsp"): return RSP;
            CASE_STR("shp"): return SHP;
            CASE_STR("sbp"): return SBP;
            default: [[unlikely]]
                throw ParseException(i18nFormat("ir.value.register.unknown_register", name));
        }
    }
};

#endif //CLANG_MC_REGISTER_H
