//
// Created by xia__mc on 2025/2/27.
//

#ifndef CLANG_MC_CMPLIKE_H
#define CLANG_MC_CMPLIKE_H

#include <utility>

#include "Op.h"
#include "utils/StringUtils.h"
#include "OpCommon.h"

class CmpLike : public virtual Op {
protected:
    const ValuePtr left;
    const ValuePtr right;
public:
    explicit CmpLike(ValuePtr &&left, ValuePtr &&right) noexcept: left(std::move(left)), right(std::move(right)) {
    }

    GETTER(Left, left);

    GETTER(Right, right);
};

#endif //CLANG_MC_CMPLIKE_H
