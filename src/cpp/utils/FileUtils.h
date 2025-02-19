//
// Created by xia__mc on 2025/2/17.
//

#ifndef CLANG_MC_FILEUTILS_H
#define CLANG_MC_FILEUTILS_H

#include <fstream>
#include "Common.h"

[[nodiscard]] static inline std::string readFile(const Path& filePath) {
    if (!exists(filePath)) {
        throw IOException(i18nFormat("file.no_such_file_or_directory", filePath.string()));
    }

    auto file = std::ifstream(filePath);
    if (!file) {
        throw IOException(i18nFormat("file.failed_to_open", filePath.string()));
    }

    std::ostringstream buffer;
    buffer << file.rdbuf();
    return buffer.str();
}

static inline void writeFile(const Path& filePath, const std::string& content) {
    auto file = std::ofstream(filePath);
    if (!file) {
        throw IOException(i18nFormat("file.failed_to_open", filePath.string()));
    }

    file << content;
    if (!file) {  // 确保写入成功
        throw IOException(i18nFormat("file.failed_to_open", filePath.string()));
    }
}

static inline void ensureDirectory(const Path &dir) {
    try {
        if (!exists(dir)) {
            if (dir.has_parent_path()) {
                ensureDirectory(dir.parent_path());
            }
            create_directory(dir);
        }
    } catch (const std::filesystem::filesystem_error &e) {
        throw IOException(i18nFormat("file.failed_to_create", dir.string()));
    }
}

static inline void ensureParentDir(const Path &file) {
    ensureDirectory(file.parent_path());
}

#endif //CLANG_MC_FILEUTILS_H
