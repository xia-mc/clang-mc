//
// Created by xia__mc on 2025/2/16.
//

#ifndef CLANG_MC_REGISTER_H
#define CLANG_MC_REGISTER_H

#include "Value.h"
#include "i18n/I18n.h"
#include "utils/StringUtils.h"

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

    std::string toString() const noexcept override {
        return getName();
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
    static inline const auto T0 = create("t0");  // 临时寄存器1 caller-saved
    static inline const auto T1 = create("t1");  // 临时寄存器2 caller-saved
    static inline const auto T2 = create("t2");  // 临时寄存器3 caller-saved
    static inline const auto T3 = create("t3");  // 临时寄存器4 caller-saved

    // VM内部保留寄存器
    static inline const auto RIP = create("rip", false);  // 程序计数器
    static inline const auto RSP = create("rsp", false);  // 栈指针
    static inline const auto SHP = create("shp", false);  // 堆大小
    static inline const auto SPP = create("spp", false);  // 字符串堆大小
    static inline const auto SAP = create("sap", false);  // 字符串堆空闲空间指针
    static inline const auto S0 = create("s0", false);  // 标准库保留
    static inline const auto S1 = create("s1", false);  // 标准库保留

    static std::shared_ptr<Register> fromName(const std::string_view &name) {
        SWITCH_STR (string::toLowerCase(name)) {
            CASE_STR("rax"): return RAX;
            CASE_STR("r0"): return R0;
            CASE_STR("r1"): return R1;
            CASE_STR("r2"): return R2;
            CASE_STR("r3"): return R3;
            CASE_STR("t0"): return T0;
            CASE_STR("t1"): return T1;
            CASE_STR("t2"): return T2;
            CASE_STR("t3"): return T3;
            CASE_STR("rip"): return RIP;
            CASE_STR("rsp"): return RSP;
            CASE_STR("shp"): return SHP;
            CASE_STR("spp"): return SPP;
            CASE_STR("sap"): return SAP;
            CASE_STR("s0"): return S0;
            CASE_STR("s1"): return S1;
            default: [[unlikely]]
                throw ParseException(i18nFormat("ir.value.register.unknown_register", name));
        }
    }
};

#endif //CLANG_MC_REGISTER_H
