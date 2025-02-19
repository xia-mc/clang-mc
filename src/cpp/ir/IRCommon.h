//
// Created by xia__mc on 2025/2/17.
//

#ifndef CLANG_MC_IRCOMMON_H
#define CLANG_MC_IRCOMMON_H

#include "utils/Common.h"
#include "ops/OpCommon.h"

using McFunctions = HashMap<Path, std::string>;

OpPtr createOp(const std::string_view &string);

#endif //CLANG_MC_IRCOMMON_H
