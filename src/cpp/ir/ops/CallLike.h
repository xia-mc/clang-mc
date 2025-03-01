//
// Created by xia__mc on 2025/2/22.
//

#ifndef CLANG_MC_CALLLIKE_H
#define CLANG_MC_CALLLIKE_H

#include <utility>

#include "Op.h"
#include "utils/StringUtils.h"
#include "OpCommon.h"

class CallLike : public virtual Op {
protected:
    const std::string label;
    const Hash labelHash;
public:
    explicit CallLike(std::string label) noexcept: label(std::move(label)), labelHash(hash(this->label)) {
    }

    GETTER(Label, label);

    GETTER_POD(LabelHash, labelHash);

    [[nodiscard]] std::string compile() const override {
        throw UnsupportedOperationException("Op can't be compile normally.");
    }

    [[nodiscard]] virtual std::string compile([[maybe_unused]] const LabelMap &callLabels,
                                              [[maybe_unused]] const LabelMap &jmpLabels) const = 0;
};

#endif //CLANG_MC_CALLLIKE_H
