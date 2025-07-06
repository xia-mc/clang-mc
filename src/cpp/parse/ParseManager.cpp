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

    Targets *targets;
    if ((err = ClPreProcess_GetTargets(instance, &targets))) {
        handleError(instance, err);
    }
    sources.reserve(targets->size);
    for (u32 i = 0; i < targets->size; ++i) {
        auto target = targets->targets[i];
        sources.emplace(target->path, target->code);
    }
    ClPreProcess_FreeTargets(instance, targets);
    targets = nullptr;

    DefineMap *defineMap;
    if ((err = ClPreProcess_GetDefines(instance, &defineMap))) {
        handleError(instance, err);
    }
    defines.reserve(defineMap->size);
    for (u32 i = 0; i < defineMap->size; ++i) {
        auto cDefines = defineMap->defines[i];
        auto map = HashMap<std::string, std::string>(cDefines->size);
        for (u32 j = 0; j < cDefines->size; ++j) {
            auto define = cDefines->values[j];
            map.emplace(define->key, define->value);
        }

        defines.emplace(cDefines->path, map);
    }
    ClPreProcess_FreeDefines(instance, defineMap);
    defineMap = nullptr;

    ClPreProcess_Free(instance);
}

void ParseManager::loadIR() {
    irs.reserve(sources.size());
    for (auto &[path, code]: sources) {
        auto iter = defines.find(path);
        auto defines_ = iter == defines.end() ? HashMap<std::string, std::string>() : iter->second;
        irs.emplace_back(logger, config, std::move(path), std::move(defines_)).parse(std::move(code));
    }
    HashMap<Path, std::string>().swap(sources);
    HashMap<Path, HashMap<std::string, std::string>>().swap(defines);
}

void ParseManager::freeSource() {
    for (auto &ir: irs) {
        HashMap<const Op *, std::string_view>().swap(ir.sourceMap);
        HashMap<const Op *, LineState>().swap(ir.lineStateMap);
        std::string().swap(ir.sourceCode);
    }
}

void ParseManager::freeIR() {
    std::vector<IR>().swap(irs);
}
