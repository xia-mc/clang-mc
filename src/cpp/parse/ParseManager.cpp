//
// Created by xia__mc on 2025/3/22.
//

#include "ParseManager.h"
#include "extern/PreProcessorAPI.h"
#include "extern/ResourceManager.h"

constexpr auto ERR_FMT = "error 0x{:x} while interacting with rust preprocesser";

[[noreturn]] static inline void handleError(PreProcessorC preprocessor, i32 err) {
    ClPreProcess_Free(preprocessor);
#ifndef NDEBUG
    printStacktrace(ParseException(fmt::format(ERR_FMT, err)));
#endif
    throw ParseException(fmt::format(ERR_FMT, err));
}

void ParseManager::loadSource() {
//    旧版parse
//    sources.reserve(config.getInput().size());
//    for (const auto &path: config.getInput()) {
//        sources.emplace(path, readFile(path));
//    }

    auto instance = ClPreProcess_New();
    i32 err;

    if ((err = ClPreProcess_AddIncludeDir(instance, absolute(INCLUDE_PATH).string().c_str()))) {
        handleError(instance, err);
    }
    if ((err = ClPreProcess_AddIncludeDir(instance,
                                          Path(getExecutableDir(getArgv0())).string().c_str()))) {
        handleError(instance, err);
    }
    for (const auto &path: config.getIncludes()) {
        if ((err = ClPreProcess_AddIncludeDir(instance, absolute(path).string().c_str()))) {
            handleError(instance, err);
        }
    }

    for (const auto &path: config.getInput()) {
        if ((err = ClPreProcess_AddTarget(instance, absolute(path).string().c_str()))) {
            handleError(instance, err);
        }
    }

    if ((err = ClPreProcess_Load(instance))) {
        handleError(instance, err);
    }
    if ((err = ClPreProcess_Process(instance))) {
        handleError(instance, err);
    }

    auto size = ClPreProcess_BeginGetSource(instance);
    auto paths = ClPreProcess_GetPaths(instance);
    auto codes = ClPreProcess_GetCodes(instance);
    if (paths == nullptr || codes == nullptr) {
        ClPreProcess_EndGetSource(instance, paths, codes, size);
        handleError(instance, INT_MAX);
    }
    sources.reserve(size);
    for (u32 i = 0; i < size; ++i) {
        sources.emplace(Path(paths[i]), std::string(codes[i]));
    }

    ClPreProcess_EndGetSource(instance, paths, codes, size);
    ClPreProcess_Free(instance);
}

void ParseManager::loadIR() {
    irs.reserve(sources.size());
    for (auto &item: sources) {
        irs.emplace_back(logger, config, std::move(item.first)).parse(std::move(item.second));
    }
    HashMap<Path, std::string>().swap(sources);
}

void ParseManager::freeSource() {
    for (auto &ir: irs) {
        HashMap<const Op *, std::string_view>().swap(ir.sourceMap);
        std::string().swap(ir.sourceCode);
    }
}

void ParseManager::freeIR() {
    std::vector<IR>().swap(irs);
}
