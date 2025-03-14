//
// Created by xia__mc on 2025/2/18.
//

#ifndef CLANG_MC_CLIUTILS_H
#define CLANG_MC_CLIUTILS_H

#include "utils/Common.h"
#include "ClangMc.h"
#include "i18n/I18n.h"

extern int ARGC;
extern const char **ARGV;

static inline const char *getArgv0() {
    if (ARGC == 0) return "";
    return *ARGV;
}

PURE static inline std::string getExecutableName(const std::string_view& argv0) {
    if (argv0.empty()) {  // 基本不可能发生，我想
#ifdef _WIN32
        return "clang-mc.exe";
#else
        return "clang-mc"
#endif
    }
    return std::filesystem::path(argv0).filename().string();
}

PURE static inline std::string getExecutableDir(const std::string_view& argv0) {
    if (argv0.empty()) {
#ifdef _WIN32
        return "Unknown";
#else
        return "/"
#endif
    }
    return std::filesystem::path(argv0).parent_path().string();
}

PURE static inline std::string getHelpMessage(const std::string& argv0) noexcept {
    return i18nFormat("cli.help_message_template", getExecutableName(argv0));
}

PURE static inline std::string getTargetMachine() noexcept {
    std::string result;

#if defined(__x86_64__) || defined(_M_X64)
    result += "x86_64";
#elif defined(__i386__) || defined(_M_IX86)
    result += "i386";
#elif defined(__aarch64__) || defined(_M_ARM64)
    result += "aarch64";
#elif defined(__arm__) || defined(_M_ARM)
    result += "arm";
#elif defined(__riscv) && (__riscv_xlen == 64)
    result += "riscv64";
#elif defined(__riscv) && (__riscv_xlen == 32)
    result += "riscv32";
#else
    result += "unknown";
#endif

    result += "-";

#if defined(__APPLE__)
    result += "apple";
#elif defined(_WIN32)
    result += "pc";
#else
    result += "unknown";
#endif

    result += "-";

#if defined(__linux__)
    result += "linux";
#elif defined(__APPLE__)
    result += "darwin";
#elif defined(_WIN32)
    result += "windows";
#elif defined(__FreeBSD__)
    result += "freebsd";
#elif defined(__NetBSD__)
    result += "netbsd";
#elif defined(__OpenBSD__)
    result += "openbsd";
#else
    result += "unknown";
#endif

#if defined(__GNUC__)
    result += "-gnu";
#elif defined(_MSC_VER)
    result += "-msvc";
#elif defined(__ANDROID__)
    result += "-androideabi";
#elif defined(__MUSL__)
    result += "-musl";
#endif

    return result;
}

PURE static inline std::string getVersionMessage(const std::string& argv0) noexcept {
    auto result = i18nFormat("cli.version_message_template",
                              ClangMc::NAME, ClangMc::VERSION,
                              getTargetMachine(), __VERSION__, getExecutableDir(argv0));
#ifndef NDEBUG
    result += i18n("cli.debug_mode");
#endif
    return result;
}

#endif //CLANG_MC_CLIUTILS_H
