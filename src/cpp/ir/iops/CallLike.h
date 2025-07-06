//
// Created by xia__mc on 2025/2/22.
//

#ifndef CLANG_MC_CALLLIKE_H
#define CLANG_MC_CALLLIKE_H

#include <utility>

#include "Op.h"
#include "utils/string/StringUtils.h"
#include "ir/OpCommon.h"

class CallLike : public virtual Op {
protected:
    std::string label;
    Hash labelHash;
public:
    explicit CallLike(std::string label) noexcept: label(std::move(label)), labelHash(hash(this->label)) {
    }

    GETTER(Label, label);

    GETTER_POD(LabelHash, labelHash);

    void setLabel(std::string newLabel) {
        label = std::move(newLabel);
        labelHash = hash(this->label);
    }
};

#endif //CLANG_MC_CALLLIKE_H
