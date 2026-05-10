#pragma once

#include <assert.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <mcstr.h>

#include "Ref.h"

typedef struct _McfString _McfString;
typedef _McfString *McfString;

struct _McfString {
    McRefHeader rc;
    size_t      len;
    size_t      cap;
    int         slot_id;
    int         flags;
    char       *data;
};

#define MCFSTRING_FLAG_BORROWED_DATA 1

/* McfString_New/From* return owned objects. Pair them with McfString_Release(). */
static void _McfString_Destroy(void *obj);
static inline int _McfString_EnsureSlot(McfString s);
static inline int _McfString_RuntimeNextSlotId(void);
static inline int _McfString_HasValidCachedSlot(McfString s);
static inline int _McfString_GetOrAllocSlotId(McfString s, int *out_slot_id);
static inline int _McfString_AllocSlot(McfString s);
static inline int _McfString_PrepareSlotUpdateById(int slot_id);
static inline int _McfString_SetSlotRefcntById(int slot_id, int refcnt);
static inline int _McfString_PrepareSlotUpdate(McfString s);
static inline int _McfString_CommitScratchToSlotById(int slot_id, int refcnt);
static inline int _McfString_CommitScratchToSlot(McfString s);
static inline int _McfString_SyncSlotValueFromSource(McfString s, const char *src, size_t len);

static const McRefOps _MCFSTRING_REF_OPS = {
    _McfString_Destroy,
    "McfString",
};

static inline int
_McfString_RuntimeNextSlotId(void)
{
    int next_id;

    __asm volatile (
        "inline execute store result score %0 vm_regs run data get storage std:vm mcstr.next_id 1"
        : "=r"(next_id)
    );
    return next_id;
}

static inline int
_McfString_HasValidCachedSlot(McfString s)
{
    int next_id;

    if (s == NULL || s->slot_id < 0) {
        return 0;
    }
    next_id = _McfString_RuntimeNextSlotId();
    if (s->slot_id >= 0 && s->slot_id < next_id) {
        return 1;
    }
    s->slot_id = -1;
    return 0;
}

static inline int
_McfString_GetSlotId(McfString s)
{
    if (s == NULL) {
        return -1;
    }
    if (!_McfString_HasValidCachedSlot(s) && _McfString_EnsureSlot(s) != 0) {
        return -1;
    }
    return s->slot_id;
}

static inline void
_McfString_AttachSlot(McfString s, int id)
{
    if (s != NULL) {
        s->slot_id = id;
    }
}

static inline void
_McfString_InvalidateCachedSlot(McfString s)
{
    if (s != NULL) {
        s->slot_id = -1;
    }
}

static inline int
_McfString_EnsureCapacity(McfString s, size_t want)
{
    char  *buf;
    size_t cap;

    if (s == NULL) {
        return -1;
    }
    if ((s->flags & MCFSTRING_FLAG_BORROWED_DATA) != 0) {
        cap = want;
        if (cap < s->len + 1u) {
            cap = s->len + 1u;
        }
        if (cap == 0u) {
            cap = 1u;
        }
        buf = (char *)malloc(cap);
        if (buf == NULL) {
            return -1;
        }
        if (s->data != NULL && s->len != 0u) {
            memcpy(buf, s->data, s->len);
        }
        buf[s->len] = '\0';
        s->data = buf;
        s->cap = cap;
        s->flags &= ~MCFSTRING_FLAG_BORROWED_DATA;
        return 0;
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

static inline __attribute__((always_inline)) void
_McfString_BeginScratchValueFromCString(const char *src, size_t len)
{
    if (src == NULL || len == 0u) {
        __asm volatile (
            "inline data modify storage std:vm s1 set value {str: \"\", next: \"\"}"
        );
        return;
    }
    __mc_string_begin(src);
}

static inline __attribute__((always_inline)) void
_McfString_AppendScratchValueFromCString(const char *src, size_t len)
{
    if (src == NULL || len == 0u) {
        return;
    }
    __mc_string_append(src);
}

static inline __attribute__((always_inline)) void
_McfString_LoadScratchValueFromCString(const char *src, size_t len)
{
    _McfString_BeginScratchValueFromCString(src, len);
    __asm volatile (
        "inline data modify storage std:vm s6.value set from storage std:vm s1.str"
    );
}

static inline void
_McfString_LoadScratchSlotNameFromCString(const char *src)
{
    size_t len;
    char   c;

    len = src ? strlen(src) : 0u;
    if (len == 0u) {
        __asm volatile (
            "inline data modify storage std:vm s6.slot_name set value \"\""
        );
        return;
    }

    __asm volatile (
        "inline data modify storage std:vm s1 set value {str: \"\", next: \"\"}\n"
        "inline data modify storage std:vm s1.str set from storage std:vm char2str_map.\"%0\""
        :
        : "r"(*src)
    );
    while (--len != 0u && (c = *++src) != '\0') {
        __asm volatile (
            "inline data modify storage std:vm s1.next set from storage std:vm char2str_map.\"%0\"\n"
            "inline function std:_internal/merge_string with storage std:vm s1"
            :
            : "r"(c)
        );
    }
    __asm volatile (
        "inline data modify storage std:vm s6.slot_name set from storage std:vm s1.str"
    );
}

static inline int
_McfString_SetSlotRefcnt(McfString s)
{
    if (s == NULL || s->slot_id < 0) {
        return 0;
    }
    return _McfString_SetSlotRefcntById(s->slot_id, (int)s->rc.refcnt);
}

static inline int
_McfString_SetSlotRefcntById(int slot_id, int refcnt)
{
    __asm volatile (
        "inline data modify storage std:vm s6 set value %{id: -1, refcnt: -1%}\n"
        "inline data modify storage std:vm s6.id set value %0\n"
        "inline data modify storage std:vm s6.refcnt set value %1\n"
        "inline function std:_internal/mcstr_set_slot_refcnt with storage std:vm s6"
        :
        : "r"(slot_id), "r"(refcnt)
    );
    return 0;
}

static inline int
_McfString_GetOrAllocSlotId(McfString s, int *out_slot_id)
{
    int slot_id;

    if (s == NULL || out_slot_id == NULL) {
        return -1;
    }
    if (_McfString_HasValidCachedSlot(s)) {
        *out_slot_id = s->slot_id;
        return 0;
    }

    __asm volatile (
        "inline data modify storage std:vm s6 set value %{id: -1%}\n"
        "inline function std:_internal/mcstr_alloc with storage std:vm s6\n"
        "inline scoreboard players operation %0 vm_regs = rax vm_regs"
        : "=r"(slot_id)
    );
    s->slot_id = slot_id;
    *out_slot_id = slot_id;
    return 0;
}

static inline int
_McfString_AllocSlot(McfString s)
{
    int slot_id;

    if (_McfString_GetOrAllocSlotId(s, &slot_id) != 0) {
        return -1;
    }
    return 0;
}

static inline __attribute__((always_inline)) int
_McfString_PrepareSlotUpdate(McfString s)
{
    int slot_id;

    if (_McfString_GetOrAllocSlotId(s, &slot_id) != 0) {
        return -1;
    }
    return _McfString_PrepareSlotUpdateById(slot_id);
}

static inline int
_McfString_PrepareSlotUpdateById(int slot_id)
{
    __asm volatile (
        "inline data modify storage std:vm s6 set value %{id: -1, value: \"\", next: \"\"%}\n"
        "inline data modify storage std:vm s6.id set value %0"
        :
        : "r"(slot_id)
    );
    return 0;
}

static inline __attribute__((always_inline)) int
_McfString_CommitScratchToSlot(McfString s)
{
    if (s == NULL || s->slot_id < 0) {
        return -1;
    }
    return _McfString_CommitScratchToSlotById(s->slot_id, (int)s->rc.refcnt);
}

static inline int
_McfString_CommitScratchToSlotById(int slot_id, int refcnt)
{
    __asm volatile (
        "inline data modify storage std:vm s6.value set from storage std:vm s1.str\n"
        "inline function std:_internal/mcstr_set_slot_value with storage std:vm s6"
    );
    return _McfString_SetSlotRefcntById(slot_id, refcnt);
}

static inline __attribute__((always_inline)) int
_McfString_SyncSlotValueFromSource(McfString s, const char *src, size_t len)
{
    int slot_id;
    int refcnt;

    if (s == NULL) {
        return -1;
    }
    if (_McfString_GetOrAllocSlotId(s, &slot_id) != 0) {
        return -1;
    }
    if (_McfString_PrepareSlotUpdateById(slot_id) != 0) {
        return -1;
    }
    refcnt = (int)s->rc.refcnt;
    _McfString_BeginScratchValueFromCString(src, len);
    return _McfString_CommitScratchToSlotById(slot_id, refcnt);
}

static inline int
_McfString_SyncSlotValue(McfString s)
{
    if (s == NULL || s->slot_id < 0) {
        return 0;
    }
    return _McfString_SyncSlotValueFromSource(s, s->data, s->len);
}

static inline int
_McfString_EnsureSlot(McfString s)
{
    if (s == NULL) {
        return -1;
    }
    if (_McfString_HasValidCachedSlot(s)) {
        return 0;
    }
    return _McfString_SyncSlotValueFromSource(s, s->data, s->len);
}

static inline McfString
McfString_New(void)
{
    McfString s;

    s = (McfString)malloc(sizeof(_McfString));
    if (s == NULL) {
        return NULL;
    }

    s->data = (char *)malloc(1u);
    if (s->data == NULL) {
        free(s);
        return NULL;
    }

    MC_REF_INIT_DYNAMIC(s, &_MCFSTRING_REF_OPS);
    s->len = 0u;
    s->cap = 1u;
    s->data[0] = '\0';
    s->slot_id = -1;
    s->flags = 0;
    return s;
}

static inline McfString
McfString_FromCString(const char *src)
{
    McfString s;
    size_t    len;

    s = McfString_New();
    if (s == NULL) {
        return NULL;
    }

    len = src ? strlen(src) : 0u;
    if (_McfString_EnsureCapacity(s, len + 1u) != 0) {
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

static inline McfString
McfString_FromLiteral(const char *src)
{
    McfString s;
    size_t    len;

    s = (McfString)malloc(sizeof(_McfString));
    if (s == NULL) {
        return NULL;
    }

    len = src ? strlen(src) : 0u;
    MC_REF_INIT_DYNAMIC(s, &_MCFSTRING_REF_OPS);
    s->len = len;
    s->cap = 0u;
    s->data = (char *)(src ? src : "");
    s->slot_id = -1;
    s->flags = MCFSTRING_FLAG_BORROWED_DATA;
    if (src != NULL && _McfString_SyncSlotValueFromSource(s, src, len) != 0) {
        free(s);
        return NULL;
    }
    return s;
}

static inline const char *
McfString_CStr(McfString s)
{
    return s ? s->data : NULL;
}

static inline McfString
McfString_Retain(McfString s)
{
    if (s != NULL && !McRef_IsStatic(s)) {
        (void)McRef_Retain(s);
        (void)_McfString_SetSlotRefcnt(s);
    }
    return s;
}

static inline void
McfString_Release(McfString s)
{
    if (s == NULL || s->rc.refcnt < 0) {
        return;
    }

    if (s->rc.refcnt <= 0) {
        return;
    }

    if (s->rc.refcnt == 1) {
        s->rc.refcnt = 0;
        _McfString_Destroy(s);
        return;
    }

    s->rc.refcnt--;
    (void)_McfString_SetSlotRefcnt(s);
}

static void
_McfString_Destroy(void *obj)
{
    McfString s;
    int       slot_id;

    s = (McfString)obj;
    slot_id = s->slot_id;
    if (slot_id >= 0) {
        __asm volatile (
            "inline data modify storage std:vm s6 set value %{id: -1%}\n"
            "inline data modify storage std:vm s6.id set value %0\n"
            "inline function std:_internal/mcstr_free_slot with storage std:vm s6"
            :
            : "r"(slot_id)
        );
    }
    if ((s->flags & MCFSTRING_FLAG_BORROWED_DATA) == 0) {
        free(s->data);
    }
    free(s);
}

static inline int
McfString_Clear(McfString s)
{
    if (s == NULL) {
        return -1;
    }
    s->len = 0u;
    if (s->data != NULL) {
        s->data[0] = '\0';
    }
    return _McfString_SyncSlotValue(s);
}

static inline int
McfString_AssignCString(McfString s, const char *src)
{
    size_t len;

    if (s == NULL) {
        return -1;
    }

    len = src ? strlen(src) : 0u;
    if (_McfString_EnsureCapacity(s, len + 1u) != 0) {
        return -1;
    }

    if (len != 0u) {
        memcpy(s->data, src, len);
    }
    s->data[len] = '\0';
    s->len = len;
    return _McfString_SyncSlotValue(s);
}

static inline int
McfString_AppendCString(McfString s, const char *suffix)
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
    if (_McfString_EnsureCapacity(s, total_len + 1u) != 0) {
        return -1;
    }

    memcpy(s->data + s->len, suffix, suffix_len + 1u);
    s->len = total_len;
    return _McfString_SyncSlotValue(s);
}

static inline int
McfString_AppendLiteral(McfString s, const char *suffix)
{
    /* TODO: switch to compiler-backed literal pool when available. */
    return McfString_AppendCString(s, suffix);
}

static inline int
McfString_AppendInt(McfString s, int value)
{
    char buf[16];

    if (itoa(value, buf, 10) == NULL) {
        return -1;
    }
    return McfString_AppendCString(s, buf);
}

static inline int
McfString_AppendDouble(McfString s, double value)
{
    char buf[64];

    if (gcvt_fast(value, 17, buf) == NULL) {
        return -1;
    }
    return McfString_AppendCString(s, buf);
}

static inline int
McfString_AppendFloat(McfString s, float value)
{
    char buf[32];

    if (gcvt_fast((double)value, 9, buf) == NULL) {
        return -1;
    }
    return McfString_AppendCString(s, buf);
}

static inline McfString
McfString_FromInt(int value)
{
    McfString s;
    char buf[16];

    if (itoa(value, buf, 10) == NULL) {
        return NULL;
    }
    s = McfString_FromCString(buf);
    if (s == NULL) {
        return NULL;
    }
    if (_McfString_SyncSlotValueFromSource(s, buf, strlen(buf)) != 0) {
        McfString_Release(s);
        return NULL;
    }
    return s;
}

static inline McfString
McfString_FromDouble(double value)
{
    McfString s;
    char buf[64];

    if (gcvt_fast(value, 17, buf) == NULL) {
        return NULL;
    }
    s = McfString_FromCString(buf);
    if (s == NULL) {
        return NULL;
    }
    if (_McfString_SyncSlotValueFromSource(s, buf, strlen(buf)) != 0) {
        McfString_Release(s);
        return NULL;
    }
    return s;
}

static inline McfString
McfString_FromFloat(float value)
{
    McfString s;
    char buf[32];

    if (gcvt_fast((double)value, 9, buf) == NULL) {
        return NULL;
    }
    s = McfString_FromCString(buf);
    if (s == NULL) {
        return NULL;
    }
    if (_McfString_SyncSlotValueFromSource(s, buf, strlen(buf)) != 0) {
        McfString_Release(s);
        return NULL;
    }
    return s;
}

static inline int
McfString_CopyToStorage(McfString s, const char *slot_name)
{
    int slot_id;

    if (s == NULL || slot_name == NULL) {
        return -1;
    }
    if (_McfString_EnsureSlot(s) != 0) {
        return -1;
    }
    slot_id = s->slot_id;

    __asm volatile (
        "inline data modify storage std:vm s6 set value %{id: -1, slot_name: \"\", next: \"\"%}\n"
        "inline data modify storage std:vm s6.id set value %0"
        :
        : "r"(slot_id)
    );
    _McfString_LoadScratchSlotNameFromCString(slot_name);
    __asm volatile (
        "inline function std:_internal/mcstr_copy_to_storage with storage std:vm s6"
    );
    return 0;
}

static inline int
McfString_Exec(McfString s)
{
    int ret;
    int slot_id;

    if (s == NULL) {
        return -1;
    }
    if (_McfString_EnsureSlot(s) != 0) {
        return -1;
    }
    slot_id = s->slot_id;

    __asm volatile (
        "inline data modify storage std:vm s6 set value %{id: -1%}\n"
        "inline data modify storage std:vm s6.id set value %1\n"
        "inline function std:_internal/mcstr_exec with storage std:vm s6\n"
        "inline scoreboard players operation %0 vm_regs = rax vm_regs"
        : "=r"(ret)
        : "r"(slot_id)
    );
    return ret;
}
