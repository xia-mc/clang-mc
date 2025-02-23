//
// Created by xia__mc on 2025/2/13.
//

#include "ArgParser.h"
#include "i18n/I18n.h"

ArgParser::ArgParser(Config &config) : config(config) {
    this->config.setInput(std::vector<Path>());
}

void ArgParser::setNameSpace(const std::string &arg) {
    switch (string::count(arg, ':')) {
        case 0:
            if (!string::isValidMCNamespace(arg)) {
                throw ParseException(i18n("cli.arg.invalid_namespace"));
            }
            config.setNameSpace(arg + ':');
            break;
        case 1:
            if (!string::isValidMCNamespace(string::removeFromFirst(arg, ":"))) {
                throw ParseException(i18n("cli.arg.invalid_namespace"));
            }
            assert(arg.length() > 1);
            if (arg[arg.length() - 1] == ':') {
                config.setNameSpace(arg);
            } else if (arg[arg.length() - 1] != '/') {
                config.setNameSpace(arg + '/');
            } else {
                config.setNameSpace(arg);
            }
            break;
        default:
            throw ParseException(i18n("cli.arg.invalid_namespace"));
    }
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
            case hash("--namespace"):
            case hash("-N"):
                // 设置编译非导出函数的命名空间路径
                setNameSpace(arg);
                break;
        }
        required = false;
        lastString = "";
        return;
    }

    const Hash argHash = hash(arg);
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
        case hash("-g"):
            // 额外的调试信息
            config.setDebugInfo(true);
            return;
        default:
            break;
    }

    // 认为是输入文件
    if (arg.empty()) {
        throw ParseException(i18n("cli.arg.empty_input_file"));
    }
    config.getInput().emplace_back(arg);
}

void ArgParser::end() {
    if (required) {
        throw ParseException(i18n("cli.arg.missing_arg") + lastString);
    }
    if (config.getNameSpace().empty()) {
        setNameSpace(config.getOutput().string());
    }
}
