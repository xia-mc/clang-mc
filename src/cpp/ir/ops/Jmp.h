//
// Created by xia__mc on 2025/2/19.
//

#ifndef CLANG_MC_JMP_H
#define CLANG_MC_JMP_H

#include "Op.h"
#include "CallLike.h"
#include "utils/StringUtils.h"
#include "OpCommon.h"

class Jmp : public CallLike {
public:
    explicit Jmp(const ui64 lineNumber, std::string label) noexcept:
            Op("jmp", lineNumber), CallLike(std::move(label)) {
    }

    [[nodiscard]] std::string toString() const noexcept override {
        return fmt::format("jmp {}", label);
    }

    [[nodiscard]] std::string compile([[maybe_unused]] const LabelMap &callLabels,
                                      [[maybe_unused]] const LabelMap &jmpLabels) const override {
        assert(jmpLabels.contains(hash(label)));
        return fmt::format("return run function {}", jmpLabels.at(hash(label)));
    }
};

#endif //CLANG_MC_JMP_H
