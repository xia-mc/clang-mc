#pragma once

#include <assert.h>
#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

typedef struct _McfString _McfString;
typedef _McfString *McfString;

struct _McfString {
    size_t refcnt;
    size_t len;
    size_t cap;
    char  *data;
    int    slot_id;
    int    flags;
};

static inline int
_McfString_GetSlotId(McfString s)
{
    return s ? s->slot_id : -1;
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
_McfString_LoadScratchValueFromCString(const char *src)
{
    uintptr_t     ptr;
    unsigned char c;

    if (src == NULL || src[0] == '\0') {
        __asm volatile (
            "inline data modify storage std:vm s6.value set value \"\""
        );
        return;
    }

    ptr = ((uintptr_t)src) << 2;
    c = *(const unsigned char *)ptr;
    __asm volatile (
        "inline data modify storage std:vm s6.value set from storage std:vm char2str_map.\"%0\""
        :
        : "r"(c)
    );

    while ((c = *(const unsigned char *)++ptr) != 0) {
        __asm volatile (
            "inline data modify storage std:vm s6.next set from storage std:vm char2str_map.\"%0\"\n"
            "inline data modify storage std:vm s3 set value %{left: \"\", right: \"\"%}\n"
            "inline data modify storage std:vm s3.left set from storage std:vm s6.value\n"
            "inline data modify storage std:vm s3.right set from storage std:vm s6.next\n"
            "inline function std:_internal/merge_string2 with storage std:vm s3\n"
            "inline data modify storage std:vm s6.value set from storage std:vm s3.string"
            :
            : "r"(c)
        );
    }
}

static inline void
_McfString_LoadScratchSlotNameFromCString(const char *src)
{
    uintptr_t     ptr;
    unsigned char c;

    if (src == NULL || src[0] == '\0') {
        __asm volatile (
            "inline data modify storage std:vm s6.slot_name set value \"\""
        );
        return;
    }

    ptr = ((uintptr_t)src) << 2;
    c = *(const unsigned char *)ptr;
    __asm volatile (
        "inline data modify storage std:vm s6.slot_name set from storage std:vm char2str_map.\"%0\""
        :
        : "r"(c)
    );

    while ((c = *(const unsigned char *)++ptr) != 0) {
        __asm volatile (
            "inline data modify storage std:vm s6.next set from storage std:vm char2str_map.\"%0\"\n"
            "inline data modify storage std:vm s3 set value %{left: \"\", right: \"\"%}\n"
            "inline data modify storage std:vm s3.left set from storage std:vm s6.slot_name\n"
            "inline data modify storage std:vm s3.right set from storage std:vm s6.next\n"
            "inline function std:_internal/merge_string2 with storage std:vm s3\n"
            "inline data modify storage std:vm s6.slot_name set from storage std:vm s3.string"
            :
            : "r"(c)
        );
    }
}

static inline int
_McfString_SetSlotRefcnt(McfString s)
{
    if (s == NULL || s->slot_id < 0) {
        return 0;
    }

    __asm volatile (
        "inline data modify storage std:vm s6 set value %{id: -1, refcnt: -1%}\n"
        "inline execute store result storage std:vm s6.id int 1 run scoreboard players get %0 vm_regs\n"
        "inline execute store result storage std:vm s6.refcnt int 1 run scoreboard players get %1 vm_regs\n"
        "inline function std:_internal/mcstr_set_slot_refcnt with storage std:vm s6"
        :
        : "r"(s->slot_id), "r"((int)s->refcnt)
    );
    return 0;
}

static inline int
_McfString_SyncSlotValue(McfString s)
{
    if (s == NULL || s->slot_id < 0) {
        return 0;
    }

    __asm volatile (
        "inline data modify storage std:vm s6 set value %{id: -1, value: \"\", next: \"\"%}\n"
        "inline execute store result storage std:vm s6.id int 1 run scoreboard players get %0 vm_regs"
        :
        : "r"(s->slot_id)
    );
    _McfString_LoadScratchValueFromCString(s->data);
    __asm volatile (
        "inline function std:_internal/mcstr_set_slot_value with storage std:vm s6"
    );
    return _McfString_SetSlotRefcnt(s);
}

static inline int
_McfString_EnsureSlot(McfString s)
{
    int slot_id;

    if (s == NULL) {
        return -1;
    }
    if (s->slot_id >= 0) {
        return 0;
    }

    __asm volatile (
        "inline data modify storage std:vm s6 set value %{id: -1%}\n"
        "inline function std:_internal/mcstr_alloc with storage std:vm s6\n"
        "inline scoreboard players operation %0 vm_regs = rax vm_regs"
        : "=r"(slot_id)
    );
    s->slot_id = slot_id;
    return _McfString_SyncSlotValue(s);
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

    s->refcnt = 1u;
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
    /* TODO: switch to compiler-backed literal pool when available. */
    return McfString_FromCString(src);
}

static inline McfString
McfString_Retain(McfString s)
{
    if (s != NULL) {
        s->refcnt++;
        (void)_McfString_SetSlotRefcnt(s);
    }
    return s;
}

static inline void
McfString_Release(McfString s)
{
    if (s == NULL) {
        return;
    }

    assert(s->refcnt != 0u);
    s->refcnt--;
    if (s->refcnt == 0u) {
        if (s->slot_id >= 0) {
            __asm volatile (
                "inline data modify storage std:vm s6 set value %{id: -1%}\n"
                "inline execute store result storage std:vm s6.id int 1 run scoreboard players get %0 vm_regs\n"
                "inline function std:_internal/mcstr_free_slot with storage std:vm s6"
                :
                : "r"(s->slot_id)
            );
        }
        free(s->data);
        free(s);
        return;
    }

    (void)_McfString_SetSlotRefcnt(s);
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
McfString_CopyToStorage(McfString s, const char *slot_name)
{
    if (s == NULL || slot_name == NULL) {
        return -1;
    }
    if (_McfString_EnsureSlot(s) != 0) {
        return -1;
    }

    __asm volatile (
        "inline data modify storage std:vm s6 set value %{id: -1, slot_name: \"\", next: \"\"%}\n"
        "inline execute store result storage std:vm s6.id int 1 run scoreboard players get %0 vm_regs"
        :
        : "r"(s->slot_id)
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

    if (s == NULL) {
        return -1;
    }
    if (_McfString_EnsureSlot(s) != 0) {
        return -1;
    }

    __asm volatile (
        "inline data modify storage std:vm s6 set value %{id: -1%}\n"
        "inline execute store result storage std:vm s6.id int 1 run scoreboard players get %1 vm_regs\n"
        "inline function std:_internal/mcstr_exec with storage std:vm s6\n"
        "inline scoreboard players operation %0 vm_regs = rax vm_regs"
        : "=r"(ret)
        : "r"(s->slot_id)
    );
    return ret;
}
