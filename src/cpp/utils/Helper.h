//
// Created by xia__mc on 2025/2/13.
//

#ifndef CLANG_MC_HELPER_H
#define CLANG_MC_HELPER_H

#include <filesystem>

typedef std::filesystem::path Path;

#define GETTER(type, name, field) __forceinline type get##name() { return field; }
#define SETTER(type, name, field) __forceinline void set##name(const type &value) { field = value; }
#define DATA(type, name, field) GETTER(type, name, field) SETTER(type, name, field)

#endif //CLANG_MC_HELPER_H
