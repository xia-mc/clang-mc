//
// Created by xia__mc on 2025/2/16.
//

#ifndef CLANG_MC_IR_H
#define CLANG_MC_IR_H

#include "vector"
#include "IRCommon.h"


class IR {
private:
    const std::vector<OpPtr> values = std::vector<OpPtr>();
public:
    explicit IR() = default;

public:

};


#endif //CLANG_MC_IR_H
