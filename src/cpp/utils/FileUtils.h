//
// Created by xia__mc on 2025/2/17.
//

#ifndef CLANG_MC_FILEUTILS_H
#define CLANG_MC_FILEUTILS_H

#include <fstream>
#include "Common.h"

[[nodiscard]] static inline std::string readFile(const Path& filePath) {
    if (!exists(filePath)) {
        throw IOException(fmt::format("no such file or directory: '{}'", filePath.string()));
    }

    auto file = std::ifstream(filePath);
    if (!file) {
        throw IOException(fmt::format("failed to open file: '{}'", filePath.string()));
    }

    std::ostringstream buffer;
    buffer << file.rdbuf();
    return buffer.str();
}

#endif //CLANG_MC_FILEUTILS_H
