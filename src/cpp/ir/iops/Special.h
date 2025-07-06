//
// Created by xia__mc on 2025/7/4.
//

#ifndef CLANG_MC_SPECIAL_H
#define CLANG_MC_SPECIAL_H

#include <utility>

#include "Op.h"
#include "utils/string/StringUtils.h"
#include "ir/OpCommon.h"

class Special : public virtual Op {
public:
    explicit Special() noexcept = default;

    [[nodiscard]] std::string compile() const final {
        throw UnsupportedOperationException("Op can't be compile normally.");
    }
};

#endif //CLANG_MC_SPECIAL_H
