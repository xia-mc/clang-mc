//
// Created by xia__mc on 2025/2/22.
//

#ifndef CLANG_MC_CALLLIKE_H
#define CLANG_MC_CALLLIKE_H

#include <utility>

#include "Op.h"
#include "utils/StringUtils.h"
#include "OpCommon.h"

class CallLike : public Op {
protected:
    const std::string label;
    const Hash labelHash;
public:
    explicit CallLike(const std::string &name, ui64 lineNumber, std::string label) noexcept:
            Op(name, lineNumber), label(std::move(label)), labelHash(hash(this->label)) {
    }

    GETTER(Label, label);

    GETTER_POD(LabelHash, labelHash);
};

#endif //CLANG_MC_CALLLIKE_H
