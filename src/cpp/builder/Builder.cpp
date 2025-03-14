//
// Created by xia__mc on 2025/3/12.
//

#include "Builder.h"
#include "utils/FileUtils.h"
#include "utils/CLIUtils.h"
#include "PostOptimizer.h"

static inline Path ASSETS_PATH;

static inline Path STDLIB_PATH;

static inline constexpr auto PACK_MCMETA = \
"{\n"
"    \"pack\": {\n"
"        \"description\": \"\",\n"
"        \"pack_format\": 61\n"
"    }\n"
"}";

bool Builder::checkResources() {
    ASSETS_PATH = Path(getExecutableDir(getArgv0())) / "assets";
    STDLIB_PATH = ASSETS_PATH / "stdlib";
#pragma unroll
    for (const auto &path : {ASSETS_PATH, STDLIB_PATH}) {
        if (!exists(path) || !is_directory(path)) return false;
    }
    return true;
}

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
#pragma omp parallel for
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
