//
// Created by xia__mc on 2025/2/19.
//

#ifndef CLANG_MC_CALL_H
#define CLANG_MC_CALL_H

#include "Op.h"
#include "JmpLike.h"
#include "utils/string/StringUtils.h"
#include "OpCommon.h"

class Call : public Op {
protected:
    const std::string label;
    const Hash labelHash;
public:
    explicit Call(const ui32 lineNumber, std::string label) noexcept:
        Op("call", lineNumber), label(std::move(label)), labelHash(hash(this->label)) {
    }

    [[nodiscard]] std::string toString() const noexcept override {
        return fmt::format("call {}", label);
    }

    [[nodiscard]] std::string compile() const override {
        throw UnsupportedOperationException("Op can't be compile normally.");
    }

    [[nodiscard]] std::string compile(const LabelMap &labelMap) const {
        assert(labelMap.contains(labelHash));
        return fmt::format("function {}", labelMap.at(labelHash));
    }
};

#endif //CLANG_MC_CALL_H
