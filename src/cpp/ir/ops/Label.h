//
// Created by xia__mc on 2025/2/17.
//

#ifndef CLANG_MC_LABEL_H
#define CLANG_MC_LABEL_H

#include "Op.h"
#include "ir/values/Value.h"
#include "utils/string/StringUtils.h"

class Label : public Op {
private:
    const std::string label;
    const Hash labelHash;
    const bool export_;
    const bool extern_;
public:
    explicit Label(const i32 lineNumber, std::string label, const bool export_, const bool extern_) noexcept:
            Op("label", lineNumber), label(std::move(label)), labelHash(hash(this->label)),
            export_(export_), extern_(extern_) {
    }

    GETTER(Label, label);

    GETTER_POD(LabelHash, labelHash);

    GETTER_POD(Export, export_);

    GETTER_POD(Extern, extern_);

    [[nodiscard]] std::string toString() const noexcept override {
        if (export_) {
            return fmt::format("export {}:", label);
        }
        if (extern_) {
            return fmt::format("extern {}:", label);
        }
        return fmt::format("{}:", label);
    }

    [[nodiscard]] std::string compile() const override {
        throw UnsupportedOperationException("Label op can't be compile normally.");
    }
};

#define LABEL_RET "__internel_ret"
inline Label labelRet = Label(-1, LABEL_RET, false, false);

#endif //CLANG_MC_LABEL_H
