//
// Created by xia__mc on 2025/3/22.
//

#include "ParseManager.h"
#include "extern/PreProcessorAPI.h"
#include "extern/ResourceManager.h"

//constexpr auto EXTERN_ERR_MSG = "unexcepted while interacting with extern codes";

void ParseManager::loadSource() {
    sources.reserve(config.getInput().size());
    for (const auto &path: config.getInput()) {
        sources.emplace(path, readFile(path));
    }

//    // 遗憾的，C++没有goto，属于Microsoft扩展，clang-tidy不让我用
//    // 我不得不一遍又一遍地复制清理代码
//    auto preprocessor = ClPreProcess_New();
//
//    if (ClPreProcess_AddIncludeDir(preprocessor, absolute(STDLIB_PATH).string().c_str())) {
//        ClPreProcess_Free(preprocessor);
//        throw ParseException(EXTERN_ERR_MSG);
//    }
//    if (ClPreProcess_AddIncludeDir(preprocessor,
//                                   Path(getExecutableDir(getArgv0())).string().c_str())) {
//        ClPreProcess_Free(preprocessor);
//        return;
//    }
//    for (const auto &path: config.getIncludes()) {
//        if (ClPreProcess_AddIncludeDir(preprocessor, absolute(path).string().c_str())) {
//            ClPreProcess_Free(preprocessor);
//            throw ParseException(EXTERN_ERR_MSG);
//        }
//    }
//
//    for (const auto &path: config.getInput()) {
//        if (ClPreProcess_AddTarget(preprocessor, absolute(path).string().c_str())) {
//            ClPreProcess_Free(preprocessor);
//            throw ParseException(EXTERN_ERR_MSG);
//        }
//    }
//
//    if (ClPreProcess_Load(preprocessor)) {
//        ClPreProcess_Free(preprocessor);
//        throw ParseException(EXTERN_ERR_MSG);
//    }
//    if (ClPreProcess_Process(preprocessor)) {
//        ClPreProcess_Free(preprocessor);
//        throw ParseException(EXTERN_ERR_MSG);
//    }
//
//    auto size = ClPreProcess_BeginGetSource(preprocessor);
//    auto paths = ClPreProcess_GetPaths(preprocessor);
//    if (paths == nullptr) {
//        ClPreProcess_EndGetSource(preprocessor);
//        ClPreProcess_Free(preprocessor);
//        throw ParseException(EXTERN_ERR_MSG);
//    }
//    auto codes = ClPreProcess_GetCodes(preprocessor);
//    if (codes == nullptr) {
//        free(paths);
//        ClPreProcess_EndGetSource(preprocessor);
//        ClPreProcess_Free(preprocessor);
//        throw ParseException(EXTERN_ERR_MSG);
//    }
//    sources.reserve(size);
//    for (ui32 i = 0; i < size; ++i) {
//        sources.emplace(Path(paths[i]), std::string(codes[i]));
//    }
//
//    free(paths);
//    free(codes);
//    ClPreProcess_EndGetSource(preprocessor);
//    ClPreProcess_Free(preprocessor);
}

void ParseManager::loadIR() {
    irs.reserve(sources.size());
    for (auto &item: sources) {
        irs.emplace_back(logger, config, item.first).parse(std::move(item.second));
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
