//
// Created by xia__mc on 2025/3/17.
//

#ifndef CLANG_MC_RESOURCEMANAGER_H
#define CLANG_MC_RESOURCEMANAGER_H

#include "utils/FileUtils.h"
#include "utils/CLIUtils.h"

extern Path BIN_PATH;

extern Path ASSETS_PATH;

extern Path STDLIB_PATH;

extern Path INCLUDE_PATH;

static inline bool initResources() {
    BIN_PATH = Path(getExecutableDir(getArgv0()));
    ASSETS_PATH = BIN_PATH / "assets";
    STDLIB_PATH = ASSETS_PATH / "stdlib";
    INCLUDE_PATH = BIN_PATH / "include";

#pragma unroll
    for (const auto &path : {ASSETS_PATH, STDLIB_PATH, INCLUDE_PATH}) {
        if (!exists(path) || !is_directory(path)) return false;
    }
    return true;
}

#endif //CLANG_MC_RESOURCEMANAGER_H
