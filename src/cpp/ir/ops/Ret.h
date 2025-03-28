//
// Created by xia__mc on 2025/2/19.
//

#ifndef CLANG_MC_RET_H
#define CLANG_MC_RET_H

#include "Op.h"
#include "utils/string/StringUtils.h"
#include "utils/Common.h"

class Ret : public Op {
public:
    explicit Ret(const i32 lineNumber) : Op("ret", lineNumber) {
    }

    [[nodiscard]] std::string toString() const noexcept override {
        return "ret";
    }

    [[nodiscard]] std::string compile() const override {
        return "return 1";
    }
};

#endif //CLANG_MC_RET_H
