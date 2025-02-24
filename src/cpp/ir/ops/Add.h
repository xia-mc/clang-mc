//
// Created by xia__mc on 2025/2/24.
//

#ifndef CLANG_MC_ADD_H
#define CLANG_MC_ADD_H

#include "Op.h"
#include "utils/StringUtils.h"
#include "OpCommon.h"

class Add : public Op {
private:
    const ValuePtr left;
    const ValuePtr right;
public:
    explicit Add(const ui64 lineNumber, ValuePtr &&left, ValuePtr &&right) noexcept :
            Op("add", lineNumber), left(std::move(left)), right(std::move(right)) {
    }

    [[nodiscard]] std::string toString() const noexcept override {
        return fmt::format("add {}, {}", left->toString(), right->toString());
    }

    [[nodiscard]] std::string compile() const override {

    }
};

#endif //CLANG_MC_ADD_H
