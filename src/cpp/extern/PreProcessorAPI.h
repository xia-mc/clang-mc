//
// Created by xia__mc on 2025/3/22.
//

#ifndef CLANG_MC_PREPROCESSORAPI_H
#define CLANG_MC_PREPROCESSORAPI_H

#include "../utils/Common.h"

typedef void *PreProcessorC;
typedef struct {
    char *path;
    char *code;
} Target;
typedef struct {
    Target **targets;
    u32 size;
} Targets;
typedef struct {
    char *key;
    char *value;
} Define;
typedef struct {
    char *path;
    Define **values;
    u32 size;
} Defines;
typedef struct {
    Defines **defines;
    u32 size;
} DefineMap;

#ifdef __cplusplus
extern "C" {
#endif

PreProcessorC ClPreProcess_New(void);

void ClPreProcess_Free(PreProcessorC instance);

PreProcessorC ClPreProcess_Clone(PreProcessorC instance);

i32 ClPreProcess_AddIncludeDir(PreProcessorC instance, const char *path);

i32 ClPreProcess_AddTarget(PreProcessorC instance, const char *path);

i32 ClPreProcess_AddTargetString(PreProcessorC instance, const char *code);

i32 ClPreProcess_Load(PreProcessorC instance);

i32 ClPreProcess_Process(PreProcessorC instance);

i32 ClPreProcess_GetTargets(PreProcessorC instance, Targets **result);

i32 ClPreProcess_GetDefines(PreProcessorC instance, DefineMap **result);

void ClPreProcess_FreeTargets(PreProcessorC instance, Targets *targets);

void ClPreProcess_FreeDefines(PreProcessorC instance, DefineMap *defineMap);

#ifdef __cplusplus
}
#endif

#endif //CLANG_MC_PREPROCESSORAPI_H
