//
// Created by xia__mc on 2025/5/24.
//

#ifndef CLANG_MC_FORMAT_H
#define CLANG_MC_FORMAT_H

#ifdef CMC_DEFINED___cpp_lib_is_constant_evaluated
#error "Name 'CMC_DEFINED___cpp_lib_is_constant_evaluated' shouldn't be defined."
#endif

// patch for fmt/base.h
#ifdef __cpp_lib_is_constant_evaluated // NOLINT(*-reserved-identifier)
#define CMC_DEFINED___cpp_lib_is_constant_evaluated __cpp_lib_is_constant_evaluated // NOLINT(*-reserved-identifier)
#undef __cpp_lib_is_constant_evaluated
#endif

#include "fmt/format.h"

// restore patch
#ifdef CMC_DEFINED___cpp_lib_is_constant_evaluated
#define __cpp_lib_is_constant_evaluated CMC_DEFINED___cpp_lib_is_constant_evaluated
#undef CMC_DEFINED___cpp_lib_is_constant_evaluated
#endif

#endif //CLANG_MC_FORMAT_H
