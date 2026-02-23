//
// Created by xia__mc on 2025/2/17.
//

#ifndef CLANG_MC_FILEUTILS_H
#define CLANG_MC_FILEUTILS_H

#include <fstream>
#include "Common.h"
#include <zip.h>
#include "i18n/I18n.h"

[[nodiscard]] static inline std::string readFile(const Path &filePath) {
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

static inline void writeFile(const Path &filePath, const std::string_view &content) {
    auto file = std::ofstream(filePath);
    if (!file) {
        throw IOException(i18nFormat("file.failed_to_open", filePath.string()));
    }

    file << content;
    if (!file) {  // 确保写入成功
        throw IOException(i18nFormat("file.failed_to_open", filePath.string()));
    }
}

static inline void writeFileIfNotExist(const Path &filePath, const std::string_view &content) {
    if (exists(filePath)) {
        return;
    }

    writeFile(filePath, content);
}

static inline void ensureDirectory(const Path &dir) { // NOLINT(*-no-recursion)
    try {
        if (!exists(dir)) {
            if (dir.has_parent_path()) {
                ensureDirectory(dir.parent_path());
            }
            create_directory(dir);
        }
    } catch (const std::filesystem::filesystem_error &) {
        throw IOException(i18nFormat("file.failed_to_create", dir.string()));
    }
}

static inline void ensureParentDir(const Path &file) {
    ensureDirectory(file.parent_path());
}

static inline void compressFolder(const Path &folder, const Path &zip) {
    const auto zipFilename = zip.string();
    int error = 0;
    zip_t *archive = zip_open(zipFilename.c_str(), ZIP_CREATE | ZIP_TRUNCATE, &error);
    if (!archive) {
        throw IOException(i18nFormat("file.failed_to_create", zipFilename));
    }

    for (const auto &entry : std::filesystem::recursive_directory_iterator(folder)) {
        if (std::filesystem::is_regular_file(entry.path())) {
            const auto &filePath = entry.path();
            std::string relativePath = std::filesystem::relative(filePath, folder).generic_string();

            zip_source_t *source = zip_source_file(archive, filePath.string().c_str(), 0, 0);
            if (!source) {
                zip_close(archive);
                throw IOException(i18nFormat("file.failed_to_create", zipFilename));
            }

            if (zip_file_add(archive, relativePath.c_str(), source, ZIP_FL_OVERWRITE | ZIP_FL_ENC_UTF_8) < 0) {
                zip_source_free(source);
                zip_close(archive);
                throw IOException(i18nFormat("file.failed_to_create", zipFilename));
            }
        }
    }

    if (zip_close(archive) < 0) {
        throw IOException(i18nFormat("file.failed_to_close", zipFilename));
    }
}


#endif //CLANG_MC_FILEUTILS_H
