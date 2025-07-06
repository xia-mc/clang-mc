//
// Created by xia__mc on 2025/2/17.
//

#ifndef CLANG_MC_IRCOMMON_H
#define CLANG_MC_IRCOMMON_H

#include "utils/Common.h"
#include "OpCommon.h"

struct LineState;

using McFunctions = HashMap<Path, std::string>;

PURE OpPtr createOp(const LineState &line, const std::string_view &string);

PURE bool isTerminate(const OpPtr &op);

#endif //CLANG_MC_IRCOMMON_H
