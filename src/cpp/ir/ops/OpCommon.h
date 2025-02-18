//
// Created by xia__mc on 2025/2/17.
//

#ifndef CLANG_MC_OPCOMMON_H
#define CLANG_MC_OPCOMMON_H

#include "utils/Common.h"
#include "Op.h"
#include "ir/values/Value.h"
#include "ir/values/Immediate.h"
#include "ir/values/Register.h"
#include "i18n/I18n.h"

using ValuePtr = std::shared_ptr<Value>;
using OpPtr = std::unique_ptr<Op>;

static inline ValuePtr createValue(const std::string &string) {
    if (string.empty()) {
        throw ParseException(i18n("ir.op.empty_value"));
    }

    auto firstChar = string[0];
    if (isdigit(firstChar)) {
        try {
            return std::make_shared<Immediate>(std::stoi(string));
        } catch (const std::out_of_range &e) {
            throw ParseException(i18n("ir.op.out_of_range"));
        }
    } else {
        return Register::fromName(string);
    }
}

#endif //CLANG_MC_OPCOMMON_H
