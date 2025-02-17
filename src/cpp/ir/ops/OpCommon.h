//
// Created by xia__mc on 2025/2/17.
//

#ifndef CLANG_MC_OPCOMMON_H
#define CLANG_MC_OPCOMMON_H

#include "utils/Common.h"
#include "ir/values/Value.h"
#include "ir/values/Immediate.h"
#include "ir/values/Register.h"

class Op;

using McFunction = std::string;
using ValuePtr = std::shared_ptr<Value>;
using OpPtr = std::unique_ptr<Op>;

static ValuePtr createValue(const std::string &string) {
    if (string.empty()) {
        throw ParseException("Value can't be empty.");
    }

    auto firstChar = string[0];
    if (isdigit(firstChar)) {
        return std::make_shared<Immediate>(std::stoi(string));
    } else {
        return Register::fromName(string);
    }
}

#endif //CLANG_MC_OPCOMMON_H
