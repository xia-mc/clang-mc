//
// Created by xia__mc on 2025/2/16.
//

#ifndef CLANG_MC_IMMEDIATE_H
#define CLANG_MC_IMMEDIATE_H

#include "Value.h"

class Immediate : public Value {
private:
    const i32 value;
public:
    explicit Immediate(i32 value) : Value(), value(value) {
    }

    GETTER_POD(Value, value);

    std::string toString() override {
        return std::to_string(getValue());
    }
};

#endif //CLANG_MC_IMMEDIATE_H
