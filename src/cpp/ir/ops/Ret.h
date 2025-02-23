//
// Created by xia__mc on 2025/2/19.
//

#ifndef CLANG_MC_RET_H
#define CLANG_MC_RET_H

#include "Op.h"
#include "utils/StringUtils.h"

class Ret : public Op {
public:
    explicit Ret(const ui64 lineNumber) : Op("ret", lineNumber) {
    }

    [[nodiscard]] std::string toString() const noexcept override {
        return "ret";
    }

    [[nodiscard]] std::string compile() const override {
        return "return 1";
    }
};

#endif //CLANG_MC_RET_H
