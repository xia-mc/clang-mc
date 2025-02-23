//
// Created by xia__mc on 2025/2/19.
//

#ifndef CLANG_MC_CALL_H
#define CLANG_MC_CALL_H

#include "Op.h"
#include "utils/StringUtils.h"
#include "OpCommon.h"

class Call : public CallLike {
public:
    explicit Call(const ui64 lineNumber, std::string label) noexcept : CallLike("call", lineNumber, std::move(label)) {
    }

    [[nodiscard]] std::string toString() const noexcept override {
        return fmt::format("call {}", label);
    }

    [[nodiscard]] std::string compile() const override {
        throw UnsupportedOperationException("Call op can't be compile normally.");
    }

    [[nodiscard]] virtual std::string compile(const LabelMap &callLabels) const {
        assert(callLabels.contains(hash(label)));
        return fmt::format("function {}", callLabels.at(hash(label)));
    }
};

#endif //CLANG_MC_CALL_H
