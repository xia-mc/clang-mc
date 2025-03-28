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

void ClPreProcess_Free(PreProcessorC);

i32 ClPreProcess_AddIncludeDir(PreProcessorC, const char *);

i32 ClPreProcess_AddTarget(PreProcessorC, const char *);

i32 ClPreProcess_Load(PreProcessorC);

i32 ClPreProcess_Process(PreProcessorC);

ui32 ClPreProcess_BeginGetSource(PreProcessorC);

const char **ClPreProcess_GetCodes(PreProcessorC);

const char **ClPreProcess_GetPaths(PreProcessorC);

void ClPreProcess_EndGetSource(PreProcessorC);

#ifdef __cplusplus
}
#endif

#endif //CLANG_MC_PREPROCESSORAPI_H
