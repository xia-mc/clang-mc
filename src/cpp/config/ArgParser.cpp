//
// Created by xia__mc on 2025/2/13.
//

#include "ArgParser.h"

ArgParser::ArgParser(Config &config) : config(config) {
    this->config.setInput(std::vector<Path>());
}

void ArgParser::next(const std::string &arg) {
    if (required) {
        switch (hash(lastString)) {
            case hash("--output"):
            case hash("-o"):
                // 设置输出数据包zip的文件名
                config.setOutput(Path(arg));
                break;
            case hash("--build-dir"):
            case hash("-B"):
                // 设置构建文件夹
                config.setBuildDir(Path(arg));
                break;
        }
        required = false;
        lastString = "";
        return;
    }

    const ui64 argHash = hash(arg);
    if (DATA_ARGS.contains(argHash)) {
        required = true;
        lastString = arg;
        return;
    }
    
    switch (argHash) {
        case hash("--compile-only"):
        case hash("-c"):
            // 只编译，不链接
            config.setCompileOnly(true);
            return;
        case hash("--log-file"):
        case hash("-l"):
            // 输出日志到文件
            config.setLogFile(true);
            return;
    }

    // 认为是输入文件
    if (arg.empty()) {
        throw ParseException("Input file path can't be empty.");
    }
    config.getInput().emplace_back(arg);
}

void ArgParser::end() {
    if (required) {
        throw ParseException("Missing argument for: " + lastString);
    }
}
