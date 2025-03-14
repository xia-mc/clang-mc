//
// Created by xia__mc on 2025/2/22.
//

#ifndef CLANG_MC_JMPLIKE_H
#define CLANG_MC_JMPLIKE_H

#include <utility>

#include "Op.h"
#include "utils/string/StringUtils.h"
#include "OpCommon.h"

class JmpLike : public virtual Op {
protected:
    const std::string label;
    const Hash labelHash;
public:
    explicit JmpLike(std::string label) noexcept: label(std::move(label)), labelHash(hash(this->label)) {
    }

    GETTER(Label, label);

    GETTER_POD(LabelHash, labelHash);

    [[nodiscard]] std::string compile() const override {
        throw UnsupportedOperationException("Op can't be compile normally.");
    }

    [[nodiscard]] virtual std::string compile(const JmpMap &jmpMap) const = 0;
};

#endif //CLANG_MC_JMPLIKE_H
