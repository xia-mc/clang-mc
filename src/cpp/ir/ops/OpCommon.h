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
#include "ir/values/Ptr.h"
#include "i18n/I18n.h"

using ValuePtr = std::shared_ptr<Value>;
using OpPtr = std::unique_ptr<Op>;
using LabelMap = HashMap<Hash, std::string>;

PURE ValuePtr createValue(const std::string &string);

#endif //CLANG_MC_OPCOMMON_H
