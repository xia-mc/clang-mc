//
// Created by xia__mc on 2025/2/13.
//

#include "ArgParser.h"

ArgParser::ArgParser(const Config &config) {
    this->config = config;
    this->config.setInput(std::vector<Path>());
}

void ArgParser::next(const std::string &string) {
    if (required) {
        required = false;

        if (lastString == "-i") {
            for (const auto &item: split(string, ';')) {
                config.getInput().emplace_back(item);
            }
        } else if (lastString == "-o") {
            config.setOutput(Path(string));
        }
        return;
    }

    if (!(string == "-i" || string == "-o")) {
        throw ParseException("Unknown argument: " + string);
    }

    required = true;
    lastString = string;
}

void ArgParser::end() {
    if (required) {
        throw ParseException("Missing data for argument: " + lastString);
    }
}
