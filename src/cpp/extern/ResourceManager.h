//
// Created by xia__mc on 2025/3/17.
//

#ifndef CLANG_MC_RESOURCEMANAGER_H
#define CLANG_MC_RESOURCEMANAGER_H

#include "utils/FileUtils.h"
#include "utils/CLIUtils.h"

inline Path INSTALL_PATH;

inline Path BIN_PATH;

inline Path ASSETS_PATH;

inline Path STDLIB_PATH;

inline Path INCLUDE_PATH;

static inline bool initResources() {
    try {
        BIN_PATH = Path(getExecutableDir(getArgv0()));
        if (!BIN_PATH.has_parent_path()) {
            return false;
        }
        INSTALL_PATH = BIN_PATH.parent_path();
        if (BIN_PATH != INSTALL_PATH / "bin") {
            return false;
        }
        ASSETS_PATH = INSTALL_PATH / "assets";
        STDLIB_PATH = ASSETS_PATH / "stdlib";
        INCLUDE_PATH = INSTALL_PATH / "include";

        for (const auto &path : {ASSETS_PATH, STDLIB_PATH, INCLUDE_PATH}) {  // NOLINT(*-use-anyofallof)
            if (!exists(path) || !is_directory(path)) return false;
        }
        return true;
    } catch (...) {
        return false;
    }
}

#endif //CLANG_MC_RESOURCEMANAGER_H
