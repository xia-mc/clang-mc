//
// Created by xia__mc on 2025/8/11.
//

#ifndef CLANG_MC_SYSCALL_H
#define CLANG_MC_SYSCALL_H

#include "ir/iops/Op.h"
#include "utils/string/StringUtils.h"
#include "utils/Common.h"

class Syscall : public Op {
public:
    explicit Syscall(const i32 lineNumber) : Op("syscall", lineNumber) {
    }

    [[nodiscard]] std::string toString() const noexcept override {
        return "syscall";
    }

    [[nodiscard]] std::string compile() const override {
        return "mcfp syscall";
    }
};

#endif //CLANG_MC_SYSCALL_H
