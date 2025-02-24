//
// Created by xia__mc on 2025/2/18.
//

#ifndef CLANG_MC_I18N_H
#define CLANG_MC_I18N_H

#include "utils/Common.h"

void initI18n();

std::string &i18n(Hash keyHash);

__forceinline std::string &i18n(const std::string_view &key) {
    return i18n(hash(key));
}

template<typename... T>
__forceinline std::string i18nFormat(const std::string_view key, T &&... args) {
    return fmt::format(fmt::runtime(i18n(key)), std::forward<T>(args)...);
}

#endif //CLANG_MC_I18N_H
