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
    const Hash labelHash;
    const bool export_;
    const bool extern_;
public:
    explicit Label(const ui64 lineNumber, std::string label, const bool export_, const bool extern_) noexcept:
            Op("label", lineNumber), label(std::move(label)), labelHash(hash(this->label)),
            export_(export_), extern_(extern_) {
    }

    GETTER(Label, label);

    GETTER_POD(LabelHash, labelHash);

    GETTER_POD(Export, export_);

    GETTER_POD(Extern, extern_);

    [[nodiscard]] std::string toString() const noexcept override {
        return fmt::format("{}:", label);
    }

    [[nodiscard]] std::string compile() const override {
        throw UnsupportedOperationException("Label op can't be compile normally.");
    }
};

#endif //CLANG_MC_LABEL_H
