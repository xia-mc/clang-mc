//
// Created by xia__mc on 2025/2/18.
//

#ifndef CLANG_MC_OOMHANDLER_H
#define CLANG_MC_OOMHANDLER_H

#include "stdio.h"

static inline void onOOM() {
    fprintf(stderr, "fatal: out of memory.\n");
    exit(1);
}

#endif //CLANG_MC_OOMHANDLER_H
