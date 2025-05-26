//
// Created by xia__mc on 2025/3/2.
//

#ifndef CLANG_MC_SYSCALL_H
#define CLANG_MC_SYSCALL_H

#include "Op.h"
#include "OpCommon.h"

class Syscall : public Op {
private:
    const std::string target;
    const Json params;
public:
    explicit Syscall(i32 lineNumber, std::string &&target, Json &&params) noexcept :
        Op("syscall", lineNumber), target(target), params(params) {
    }

    [[nodiscard]] std::string toString() const noexcept override {
        return fmt::format("syscall {}, {}", target, params.dump());
    }

    [[nodiscard]] std::string compile() const override {
        return fmt::format("function {} {}", target, params.dump());
    }
};

#endif //CLANG_MC_SYSCALL_H
