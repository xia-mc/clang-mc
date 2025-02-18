//
// Created by xia__mc on 2025/2/18.
//

#ifndef CLANG_MC_OOMHANDLER_H
#define CLANG_MC_OOMHANDLER_H

#include "stdio.h"

inline const char *OOM_MSG = "\\033[31mfatal error:\\033[97m out of memory, even before initialization. WTF?";
inline void *EMERGENCY_MEMORY = NULL;

inline void initOOMHandler() {
    EMERGENCY_MEMORY = malloc(128);
    OOM_MSG = i18nC("oom.oom");
}

inline void onOOM() {
    free(EMERGENCY_MEMORY);
    EMERGENCY_MEMORY = NULL;

    fprintf(stderr, "%s\n", OOM_MSG);
    fflush(stderr);
    _exit(1);
}

#endif //CLANG_MC_OOMHANDLER_H
