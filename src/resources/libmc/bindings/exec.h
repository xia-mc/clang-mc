#pragma once

#include "assert.h"
#include "util/String.h"

static inline int exec(String cmd)
{
    McfString mcf;

    assert(cmd != NULL);
    if (String_EnsureMcf(cmd) != 0) {
        return -1;
    }
    mcf = _String_GetMcf(cmd);
    return McfString_Exec(mcf);
}

static inline int
String_Exec(String s)
{
    return exec(s);
}
