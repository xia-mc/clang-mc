//
// Created by xia__mc on 2025/2/18.
//

#ifndef CLANG_MC_I18N_H
#define CLANG_MC_I18N_H

#include "utils/Common.h"

void initI18n();

std::string &i18n(const std::string_view &key, Hash keyHash);

FORCEINLINE constexpr std::string &i18n(const std::string_view &key) {
    return i18n(key, hash(key));
}

template<typename... T>
FORCEINLINE std::string i18nFormat(const std::string_view key, T &&... args) {
    return fmt::format(fmt::runtime(i18n(key)), std::forward<T>(args)...);
}

#endif //CLANG_MC_I18N_H
