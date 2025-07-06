//
// Created by xia__mc on 2025/2/19.
//

#ifndef CLANG_MC_CALL_H
#define CLANG_MC_CALL_H

#include "ir/iops/Op.h"
#include "ir/iops/CallLike.h"
#include "utils/string/StringUtils.h"
#include "ir/OpCommon.h"

class Call : public CallLike {
public:
    explicit Call(const i32 lineNumber, std::string label) noexcept:
        Op("call", lineNumber), CallLike(std::move(label)) {
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
