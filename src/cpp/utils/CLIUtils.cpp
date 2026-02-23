//
// Created by xia__mc on 2025/3/15.
//

#include "ClangMc.h"
#include "utils/CommonC.h"

int ARGC = 0;
const char **ARGV = nullptr;

#ifndef __VERSION__

#ifdef _MSC_FULL_VER
#define __VERSION__ "MSVC " STR(_MSC_FULL_VER)
#else
#define __VERSION__ "Unknown"
#endif

#endif

PURE std::string getVersionMessage(const std::string& argv0) noexcept {
    auto result = i18nFormat("cli.version_message_template",
                             ClangMc::NAME, ClangMc::VERSION,
                             getTargetMachine(), __VERSION__, getExecutableDir(argv0));
#ifndef NDEBUG
    result += i18n("cli.debug_mode");
#endif
    return result;
}

