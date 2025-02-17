//
// Created by xia__mc on 2025/2/13.
//


#include <iostream>
#include <exception>
#include "config/Config.h"
#include "config/ArgParser.h"
#include "ClangMc.h"

static inline Config parseArgs(const int argc, const char *argv[]) {
    auto config = Config();
    if (argc <= 1) {
        return config;
    }

    auto parser = ArgParser(config);

    for (int i = 1; i < argc; ++i) {
        parser.next(argv[i]);
    }
    parser.end();

    return config;
}

static inline std::string getExecutableName(const std::string& argv0) {
    if (argv0.empty()) {  // 基本不可能发生，我想
#ifdef _WIN32
        return "clang-mc.exe";
#else
        return "clang-mc"
#endif
    }
    return std::filesystem::path(argv0).filename().string();
}

int main(const int argc, const char *argv[]) {
    assert(argc >= 1);
    if (argc == 2) {
        switch (hash(argv[1])) {
            case hash("--help"):
                std::cout << getHelpMessage(getExecutableName(argv[0])) << '\n';
                return 0;
            case hash("--version"):
                std::cout << fmt::format("{} version {}\n", ClangMc::NAME, ClangMc::VERSION);
#ifndef NDEBUG
                std::cout << "Debug Mode\n";
#endif
                return 0;
        }
    }

    Config config;
    try {
        config = parseArgs(argc, argv);
    } catch (const ParseException &e) {
        std::cerr << "error: " << e.what() << std::endl;
        return 1;
    }

    try {
        auto instance = ClangMc(config);
        instance.start();
    } catch (const std::exception& e) {
        printStacktrace(e);
    } catch (...) {
        printStacktrace();
    }
}
