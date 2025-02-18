//
// Created by xia__mc on 2025/2/13.
//

#include "Main.h"
#include <iostream>
#include <exception>
#include "config/Config.h"
#include "config/ArgParser.h"
#include "ClangMc.h"
#include "utils/OOMHandler.h"
#include "utils/CLIUtils.h"

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

extern "C" [[gnu::noinline]] int init(const int argc, const char *argv[]) {
    std::set_new_handler(onOOM);

    assert(argc >= 1);
    if (argc == 2) {
        switch (hash(argv[1])) {
            case hash("--help"):
                std::cout << getHelpMessage(argv[0]) << std::endl;
                return 0;
            case hash("--version"):
                std::cout << getVersionMessage(argv[0]) << std::endl;
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

    return 0;
}
