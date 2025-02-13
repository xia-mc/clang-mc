//
// Created by xia__mc on 2025/2/13.
//

#ifndef CLANG_MC_CONFIG_H
#define CLANG_MC_CONFIG_H

#include <vector>
#include <string>
#include <utils/Helper.h>

class Config {
private:
    std::vector<Path> input;
    Path output;
public:
    explicit Config() = default;

    DATA(std::vector<Path>, Input, input);

    DATA(Path, Output, output);
};


#endif //CLANG_MC_CONFIG_H
