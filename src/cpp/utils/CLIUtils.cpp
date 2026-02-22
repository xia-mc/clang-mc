//
// Created by xia__mc on 2025/3/15.
//

#include "ClangMc.h"

int ARGC = 0;
const char **ARGV = nullptr;

PURE std::string getVersionMessage(const std::string& argv0) noexcept {
    auto result = i18nFormat("cli.version_message_template",
                             ClangMc::NAME, ClangMc::VERSION,
                             getTargetMachine(), __VERSION__, getExecutableDir(argv0));
#ifndef NDEBUG
    result += i18n("cli.debug_mode");
#endif
    return result;
}

