//
// Created by xia__mc on 2025/7/21.
//

#ifndef CLANG_MC_STATE_H
#define CLANG_MC_STATE_H

#include "utils/Common.h"
#include "ir/ops/Label.h"
#include "ir/iops/CallLike.h"

struct LineState {
    i32 lineNumber = -1;
    bool noWarn = false;
    std::string_view filename = "Unknown Source";
    const Label *lastLabel = nullptr;
};

struct LabelState {
    HashMap<Hash, std::string> renameLabelMap = HashMap<Hash, std::string>();
    std::vector<CallLike *> toRenameLabel = std::vector<CallLike *>();
};

#endif //CLANG_MC_STATE_H
