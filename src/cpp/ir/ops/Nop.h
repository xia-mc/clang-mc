//
// Created by xia__mc on 2025/3/2.
//

#ifndef CLANG_MC_NOP_H
#define CLANG_MC_NOP_H

#include "ir/iops/Op.h"
#include "ir/OpCommon.h"

class Nop : public Op {
public:
    explicit Nop(i32 lineNumber) noexcept : Op("nop", lineNumber) {
    }

    [[nodiscard]] std::string toString() const noexcept override {
        return "nop";
    }

    [[nodiscard]] std::string compile() const override {
        return "";
    }
};

#endif //CLANG_MC_NOP_H
