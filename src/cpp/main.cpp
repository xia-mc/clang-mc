//
// Created by xia__mc on 2025/2/13.
//


#include <iostream>
#include "config/Config.h"
#include "config/ArgParser.h"
#include "ClangMc.h"

Config parseArgs(int argc, char *argv[]) {
    auto config = Config();
    if (argc <= 1) {
        return config;
    }

    auto parser = ArgParser(config);

    try {
        for (int i = 1; i < argc; ++i) {
            parser.next(argv[i]);
        }
        parser.end();
    } catch (const ParseException &e) {
        std::cout << e.what();
        exit(-1);
    }

    return config;
}

int main(int argc, char *argv[]) {
    auto config = parseArgs(argc, argv);

    auto instance = ClangMc(config);
    instance.start();
}
