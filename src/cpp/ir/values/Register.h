//
// Created by xia__mc on 2025/2/16.
//

#ifndef CLANG_MC_REGISTER_H
#define CLANG_MC_REGISTER_H

#include "Value.h"
#include "i18n/I18n.h"

class Register;

class RegisterImpl : public Value {
private:
    const std::string name;

    explicit RegisterImpl(std::string name) noexcept: name(std::move(name)) {
    }

    friend class Register;

public:
    explicit RegisterImpl() = delete;

    GETTER(Name, name);

    std::string toString() const noexcept override {
        return getName();
    }
};

class Register {
private:
    static std::shared_ptr<RegisterImpl> create(const std::string &name) {
        return std::shared_ptr<RegisterImpl>(new RegisterImpl(name));
    }

public:
    Register() = delete;

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
    static inline const auto RIP = create("rip");  // 程序计数器
    static inline const auto RSP = create("rsp");  // 栈指针
    static inline const auto SHP = create("shp");  // 堆大小
    static inline const auto SPP = create("spp");  // 字符串堆大小
    static inline const auto SAP = create("sap");  // 字符串堆空闲空间指针
    static inline const auto S0 = create("s0");  // 标准库保留
    static inline const auto S1 = create("s1");  // 标准库保留

    static std::shared_ptr<RegisterImpl> fromName(const std::string &name) {
        if (name == "rax") return RAX;
        if (name == "r0") return R0;
        if (name == "r1") return R1;
        if (name == "r2") return R2;
        if (name == "r3") return R3;
        if (name == "t0") return T0;
        if (name == "t1") return T1;
        if (name == "t2") return T2;
        if (name == "t3") return T3;
        if (name == "rip") return RIP;
        if (name == "rsp") return RSP;
        if (name == "shp") return SHP;
        if (name == "spp") return SPP;
        if (name == "sap") return SAP;
        if (name == "s0") return S0;
        if (name == "s1") return S1;

        throw ParseException(i18nFormat("ir.value.register.unknown_register", name));
    }
};

#endif //CLANG_MC_REGISTER_H
