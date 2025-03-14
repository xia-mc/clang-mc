//
// Created by xia__mc on 2025/2/17.
//

#ifndef CLANG_MC_IRCOMMON_H
#define CLANG_MC_IRCOMMON_H

#include "utils/Common.h"
#include "ops/OpCommon.h"

using McFunctions = HashMap<Path, std::string>;

PURE OpPtr createOp(ui32 lineNumber, const std::string_view &string);

PURE bool isTerminate(const OpPtr &op);

PURE static __forceinline std::string createIRMessage(const Path &file, ui32 lineNumber, const std::string_view &line,
                                                      const std::string_view &message) {
    return fmt::format("{}:{}: {}\n    {} | {}",
                       file.string(), lineNumber, message, lineNumber, line);
}


#endif //CLANG_MC_IRCOMMON_H
