//
// Created by xia__mc on 2025/2/17.
//

#ifndef CLANG_MC_LABEL_H
#define CLANG_MC_LABEL_H

#include "Op.h"
#include "ir/values/Value.h"
#include "utils/StringUtils.h"

class Label : public Op {
private:
    const std::string label;
    [[maybe_unused]] const bool export_;
    [[maybe_unused]] const bool extern_;
public:
    explicit Label(std::string label, const bool export_, const bool extern_) noexcept:
            Op("label"), label(std::move(label)), export_(export_), extern_(extern_) {
    }

    GETTER(Label, label);

    std::string toString() override {
        return fmt::format("{}:", label);
    }

    std::string compile() override {
        throw UnsupportedOperationException("Label op can't be compile normally.");
    }
};

#endif //CLANG_MC_LABEL_H
