//
// Created by xia__mc on 2025/2/18.
//

#ifndef CLANG_MC_CLIUTILS_H
#define CLANG_MC_CLIUTILS_H

#include "utils/Common.h"
#include "ClangMc.h"

PURE static inline std::string getExecutableName(const std::string& argv0) {
    if (argv0.empty()) {  // 基本不可能发生，我想
#ifdef _WIN32
        return "clang-mc.exe";
#else
        return "clang-mc"
#endif
    }
    return std::filesystem::path(argv0).filename().string();
}

PURE static inline std::string getExecutableDir(const std::string& argv0) {
    if (argv0.empty()) {
#ifdef _WIN32
        return "Unknown";
#else
        return "/"
#endif
    }
    return std::filesystem::path(argv0).parent_path().string();
}

static constexpr auto HELP_MESSAGE_TEMPLATE = "USAGE: {} [options] file...\n"
                                              "\n"
                                              "OPTIONS:\n"
                                              "   --help                  \tShow this help message\n"
                                              "   --version               \tShow version information\n"
                                              "   --output (-o) <name>    \tSpecify output file name\n"
                                              "   --build-dir (-B) <name> \tSpecify build directory\n"
                                              "   --compile-only (-c)     \tCompile only, do not link as .zip\n"
                                              "   --log-file (-l)         \tWrite logs to file";

PURE static inline std::string getHelpMessage(const std::string& argv0) noexcept {
    return fmt::format(HELP_MESSAGE_TEMPLATE, getExecutableName(argv0));
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
    auto result = fmt::format("{} version {}\nTarget: {}\nCompiler: {}\nInstalledDir: {}",
                              ClangMc::NAME, ClangMc::VERSION,
                              getTargetMachine(), __VERSION__, getExecutableDir(argv0));
#ifndef NDEBUG
    result += "\nDEBUG MODE";
#endif
    return result;
}

#endif //CLANG_MC_CLIUTILS_H
