//
// Created by xia__mc on 2025/2/24.
//

#ifndef CLANG_MC_NATIVE_H
#define CLANG_MC_NATIVE_H

#ifdef __cplusplus
extern "C" {
#endif

void initNative();

void onOOM();

void onTerminate();

#ifdef __cplusplus
}
#endif

#endif //CLANG_MC_NATIVE_H
