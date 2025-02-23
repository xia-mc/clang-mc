//
// Created by xia__mc on 2025/2/18.
//

#include "I18n.h"
#include <unordered_map>
#include <yaml-cpp/yaml.h>
#include "utils/StringUtils.h"

#ifdef GENERATED_SETUP
#include "GeneratedI18n.h"
#else
#include "I18nTemplate.h"
#endif

inline auto TRANSLATIONS = HashMap<Hash, std::string>();

void loadLanguage(const char *const data) {
    YAML::Node config = YAML::Load(data);
    for (const auto &it: config) {
        TRANSLATIONS[hash(it.first.as<std::string>())] = it.second.as<std::string>();
    }
}

#if defined(_WIN32)
#include <windows.h>
#elif defined(__APPLE__) || defined(__linux__)
#include <locale.h>
#include <langinfo.h>
#endif

std::string getSystemLanguage() {
    std::string lang = "en-US";

#if defined(_WIN32) || defined(_WIN64)
    wchar_t localeName[LOCALE_NAME_MAX_LENGTH] = {0};
    if (GetUserDefaultLocaleName(localeName, LOCALE_NAME_MAX_LENGTH)) {
        std::wstring wstr(localeName);
        lang = std::string(wstr.begin(), wstr.end());
    }
#elif defined(__APPLE__) || defined(__linux__)
    const char* locale = setlocale(LC_ALL, "");
    if (locale) {
        lang = std::string(locale);
    }
#endif

    return string::replaceFast(lang, '_', '-');
}

void initI18n() {
    std::setlocale(LC_ALL, ".UTF-8");
    if (getSystemLanguage() == "zh-CN") {
        loadLanguage(ZH_CN);
    } else {
        loadLanguage(EN_US);
    }
}

std::string &i18n(const Hash keyHash) {
    assert(TRANSLATIONS.contains(keyHash));
    return TRANSLATIONS[keyHash];
}
