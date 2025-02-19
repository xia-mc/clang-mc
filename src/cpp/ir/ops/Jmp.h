//
// Created by xia__mc on 2025/2/19.
//

#ifndef CLANG_MC_JMP_H
#define CLANG_MC_JMP_H

#include "Op.h"
#include "utils/StringUtils.h"
#include "OpCommon.h"

class Jmp : public Op {
private:
    const std::string label;
public:
    explicit Jmp(std::string label) noexcept : Op("jmp"), label(std::move(label)) {
    }

    std::string toString() const noexcept override {
        return fmt::format("jmp {}", label);
    }

    [[nodiscard]] std::string compile() const override {
        throw UnsupportedOperationException("Jmp op can't be compile normally.");
    }

    [[nodiscard]] virtual std::string compile(const LabelMap &jmpLabels) const {
        assert(jmpLabels.contains(hash(label)));
        return fmt::format("function {}", jmpLabels.at(hash(label)));
    }
};

#endif //CLANG_MC_JMP_H
