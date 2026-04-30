#pragma once

#include "McfString.h"

typedef struct _String _String;
typedef _String *String;

struct _String {
    size_t    refcnt;
    size_t    len;
    size_t    cap;
    char     *data;
    int       flags;
    McfString mcf;
};

static inline int
_String_EnsureCapacity(String s, size_t want)
{
    char  *buf;
    size_t cap;

    if (s == NULL) {
        return -1;
    }
    if (want <= s->cap) {
        return 0;
    }

    cap = s->cap ? s->cap : 1u;
    while (cap < want) {
        size_t next = cap << 1u;
        if (next <= cap) {
            cap = want;
            break;
        }
        cap = next;
    }

    buf = (char *)realloc(s->data, cap);
    if (buf == NULL) {
        return -1;
    }
    s->data = buf;
    s->cap = cap;
    return 0;
}

static inline void
_String_InvalidateMcf(String s)
{
    if (s != NULL && s->mcf != NULL) {
        McfString_Release(s->mcf);
        s->mcf = NULL;
    }
}

static inline String
String_New(void)
{
    String s;

    s = (String)malloc(sizeof(_String));
    if (s == NULL) {
        return NULL;
    }

    s->data = (char *)malloc(1u);
    if (s->data == NULL) {
        free(s);
        return NULL;
    }

    s->refcnt = 1u;
    s->len = 0u;
    s->cap = 1u;
    s->data[0] = '\0';
    s->flags = 0;
    s->mcf = NULL;
    return s;
}

static inline String
String_FromCString(const char *src)
{
    String s;
    size_t len;

    s = String_New();
    if (s == NULL) {
        return NULL;
    }

    len = src ? strlen(src) : 0u;
    if (_String_EnsureCapacity(s, len + 1u) != 0) {
        free(s->data);
        free(s);
        return NULL;
    }

    if (len != 0u) {
        memcpy(s->data, src, len);
    }
    s->data[len] = '\0';
    s->len = len;
    return s;
}

static inline String
String_FromLiteral(const char *src)
{
    /* TODO: switch to compiler-backed literal pool when available. */
    return String_FromCString(src);
}

static inline String
String_IncRef(String s)
{
    if (s != NULL) {
        s->refcnt++;
    }
    return s;
}

static inline void
String_DecRef(String s)
{
    if (s == NULL) {
        return;
    }

    assert(s->refcnt != 0u);
    s->refcnt--;
    if (s->refcnt == 0u) {
        _String_InvalidateMcf(s);
        free(s->data);
        free(s);
    }
}

#define String_INCREF(s) ((void)String_IncRef((s)))
#define String_DECREF(s) String_DecRef((s))

static inline const char *
String_CStr(String s)
{
    return s ? s->data : NULL;
}

static inline size_t
String_Length(String s)
{
    return s ? s->len : 0u;
}

static inline int
String_Clear(String s)
{
    if (s == NULL) {
        return -1;
    }
    _String_InvalidateMcf(s);
    s->len = 0u;
    if (s->data != NULL) {
        s->data[0] = '\0';
    }
    return 0;
}

static inline int
String_AssignCString(String s, const char *src)
{
    size_t len;

    if (s == NULL) {
        return -1;
    }

    len = src ? strlen(src) : 0u;
    if (_String_EnsureCapacity(s, len + 1u) != 0) {
        return -1;
    }

    _String_InvalidateMcf(s);
    if (len != 0u) {
        memcpy(s->data, src, len);
    }
    s->data[len] = '\0';
    s->len = len;
    return 0;
}

static inline int
String_AppendCString(String s, const char *suffix)
{
    size_t suffix_len;
    size_t total_len;

    if (s == NULL) {
        return -1;
    }
    if (suffix == NULL || suffix[0] == '\0') {
        return 0;
    }

    suffix_len = strlen(suffix);
    total_len = s->len + suffix_len;
    if (_String_EnsureCapacity(s, total_len + 1u) != 0) {
        return -1;
    }

    _String_InvalidateMcf(s);
    memcpy(s->data + s->len, suffix, suffix_len + 1u);
    s->len = total_len;
    return 0;
}

static inline int
String_AppendLiteral(String s, const char *suffix)
{
    /* TODO: switch to compiler-backed literal pool when available. */
    return String_AppendCString(s, suffix);
}

static inline int
String_EnsureMcf(String s)
{
    if (s == NULL) {
        return -1;
    }
    if (s->mcf == NULL) {
        s->mcf = McfString_FromCString(s->data);
        if (s->mcf == NULL) {
            return -1;
        }
    }
    return _McfString_EnsureSlot(s->mcf);
}

static inline McfString
_String_GetMcf(String s)
{
    return s ? s->mcf : NULL;
}

static inline int String_Exec(String s);
