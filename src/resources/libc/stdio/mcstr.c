#include <assert.h>
#include <stddef.h>

void
__mc_string_begin(const char *str)
{
    char c;

    assert(str != NULL);
    if (*str == '\0') {
        __asm volatile (
            "inline data modify storage std:vm s1 set value {str: \"\", next: \"\"}"
        );
        return;
    }

    __asm volatile (
        "inline data modify storage std:vm s1 set value {str: \"\", next: \"\"}\n"
        "inline data modify storage std:vm s1.str set from storage std:vm char2str_map.\"%0\""
        :
        : "r"(*str)
    );

    while ((c = *++str) != '\0') {
        __asm volatile (
            "inline data modify storage std:vm s1.next set from storage std:vm char2str_map.\"%0\"\n"
            "inline function std:_internal/merge_string with storage std:vm s1"
            :
            : "r"(c)
        );
    }
}

void
__mc_string_append(const char *str)
{
    char c;

    assert(str != NULL);
    if (*str == '\0') {
        return;
    }

    c = *str;
    __asm volatile (
        "inline data modify storage std:vm s1.next set from storage std:vm char2str_map.\"%0\"\n"
        "inline function std:_internal/merge_string with storage std:vm s1"
        :
        : "r"(c)
    );

    while ((c = *++str) != '\0') {
        __asm volatile (
            "inline data modify storage std:vm s1.next set from storage std:vm char2str_map.\"%0\"\n"
            "inline function std:_internal/merge_string with storage std:vm s1"
            :
            : "r"(c)
        );
    }
}
