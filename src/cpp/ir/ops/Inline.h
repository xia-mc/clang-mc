//
// Created by xia__mc on 2025/2/27.
//

#ifndef CLANG_MC_INLINE_H
#define CLANG_MC_INLINE_H

#include "Op.h"
#include "utils/StringUtils.h"
#include "utils/Common.h"

class Inline : public Op {
private:
    const std::string code;
public:
    explicit Inline(const ui64 lineNumber, std::string code) : Op("inline", lineNumber), code(std::move(code)) {
    }

    [[nodiscard]] std::string toString() const noexcept override {
        return fmt::format("inline {}", code);
    }

    [[nodiscard]] std::string compile() const override {
        return code;
    }
};

#endif //CLANG_MC_INLINE_H
