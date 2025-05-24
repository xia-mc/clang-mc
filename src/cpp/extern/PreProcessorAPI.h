//
// Created by xia__mc on 2025/3/22.
//

#ifndef CLANG_MC_PREPROCESSORAPI_H
#define CLANG_MC_PREPROCESSORAPI_H

#include "../utils/Common.h"

typedef void *PreProcessorC;

#ifdef __cplusplus
extern "C" {
#endif

PreProcessorC ClPreProcess_New(void);

void ClPreProcess_Free(PreProcessorC instance);

PreProcessorC ClPreProcess_Clone(PreProcessorC instance);

i32 ClPreProcess_AddIncludeDir(PreProcessorC instance, const char *path);

i32 ClPreProcess_AddTarget(PreProcessorC instance, const char *path);

i32 ClPreProcess_Load(PreProcessorC instance);

i32 ClPreProcess_Process(PreProcessorC instance);

u32 ClPreProcess_BeginGetSource(PreProcessorC instance);

const char *const *ClPreProcess_GetPaths(PreProcessorC instance);

const char *const *ClPreProcess_GetCodes(PreProcessorC instance);

void ClPreProcess_EndGetSource(PreProcessorC instance, const char *const *paths, const char *const *codes, u32 size);

#ifdef __cplusplus
}
#endif

#endif //CLANG_MC_PREPROCESSORAPI_H
