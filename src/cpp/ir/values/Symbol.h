//
// Created by xia__mc on 2025/7/5.
//

#ifndef CLANG_MC_SYMBOL_H
#define CLANG_MC_SYMBOL_H

#include <utility>

#include "Value.h"

class Symbol : public Value {
private:
    const std::string name;
    const Hash nameHash;
public:
    explicit Symbol(std::string name) : Value(), name(std::move(name)), nameHash(hash(this->name)) {
    }

    GETTER(Name, name);

    GETTER_POD(NameHash, nameHash);

    [[nodiscard]] std::string toString() const noexcept override {
        return getName();
    }
};

#endif //CLANG_MC_SYMBOL_H
