//
// Created by xia__mc on 2025/3/12.
//

#include "Builder.h"
#include "extern/ResourceManager.h"
#include "PostOptimizer.h"

static inline constexpr auto PACK_MCMETA = \
"{\n"
"    \"pack\": {\n"
"        \"description\": \"\",\n"
"        \"pack_format\": 61\n"
"    }\n"
"}";

void Builder::build() {
    for (auto &mcFunction: mcFunctions) {
        for (const auto &entry: mcFunction) {
            const auto &path = config.getBuildDir() / entry.first;
            const auto &data = entry.second;

            ensureParentDir(path);
            writeFile(path, data);
        }
        McFunctions().swap(mcFunction);
    }
}

void Builder::link() const {
    writeFileIfNotExist(config.getBuildDir() / "pack.mcmeta", PACK_MCMETA);

    // static link stdlib
    auto entries = std::vector<Path>();
    for (const auto& entry : std::filesystem::recursive_directory_iterator(STDLIB_PATH)) {
        entries.push_back(entry.path());
    }
//#pragma omp parallel for default(none) shared(entries, STDLIB_PATH)
    for (size_t i = 0; i < entries.size(); ++i) {  // NOLINT(modernize-loop-convert)
        const Path& path = entries[i];
        if (is_regular_file(path) && path.extension() != ".mcmeta") {
            auto target = config.getBuildDir() / relative(path, STDLIB_PATH);
            ensureParentDir(target);

            auto content = readFile(path);

            if (target.extension() == ".mcfunction") {
                PostOptimizer::doSingleOptimize(content);
            }

            writeFileIfNotExist(target, content);
        }
    }

    auto output = config.getOutput();
    output += ".zip";
    compressFolder(config.getBuildDir(), output);
}
