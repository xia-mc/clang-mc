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
    const std::string name;
public:
    explicit Label(std::string name) noexcept: Op("label"), name(std::move(name)) {
    }

    std::string toString() override {
        return fmt::format("{}:", name);
    }

    std::string compile() override {
        throw UnsupportedOperationException("Label op can't be compile normally.");
    }
};

#endif //CLANG_MC_LABEL_H
