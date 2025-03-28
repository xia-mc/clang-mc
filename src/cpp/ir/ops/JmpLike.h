//
// Created by xia__mc on 2025/2/22.
//

#ifndef CLANG_MC_JMPLIKE_H
#define CLANG_MC_JMPLIKE_H

#include <utility>

#include "Op.h"
#include "utils/string/StringUtils.h"
#include "OpCommon.h"
#include "CallLike.h"

class JmpLike : public virtual CallLike {
public:
    explicit JmpLike() noexcept = default;

    [[nodiscard]] std::string compile() const override {
        throw UnsupportedOperationException("Op can't be compile normally.");
    }

    [[nodiscard]] virtual std::string compile(const JmpMap &jmpMap) const = 0;
};

#endif //CLANG_MC_JMPLIKE_H
