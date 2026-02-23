//
// Created by xia__mc on 2025/2/17.
//

#ifndef CLANG_MC_OPCOMMON_H
#define CLANG_MC_OPCOMMON_H

#include <span>
#include "utils/Common.h"
#include "ir/iops/Op.h"
#include "ir/values/Value.h"
#include "ir/values/Immediate.h"
#include "ir/values/Register.h"
#include "ir/values/Ptr.h"
#include "i18n/I18n.h"
#include "State.h"

using ValuePtr = std::shared_ptr<Value>;
using OpPtr = std::unique_ptr<Op>;
using LabelMap = HashMap<Hash, std::string>;
using JmpMap = HashMap<Hash, std::span<std::string_view>>;

static inline bool isLocalSymbol(const std::string_view &rawLabel) {
    if (string::contains(rawLabel, ' ')) {
        throw ParseException(i18n("ir.invalid_symbol"));
    }
    return rawLabel[0] == '.';
}

static inline std::string fixSymbol(const LineState &line, const std::string_view &rawSymbol) {
    if (isLocalSymbol(rawSymbol)) {
        if (line.lastLabel == nullptr) {
            throw ParseException(i18n("ir.invalid_local_symbol"));
        }
        return fmt::format("{}{}", line.lastLabel->getLabel(), rawSymbol);  // rawSymbol已经包含一个.了
    }
    return std::string(rawSymbol);
}

PURE i32 parseToNumber(std::string_view string);

PURE ValuePtr createValue(const LineState &line, const std::string &string);

#endif //CLANG_MC_OPCOMMON_H
