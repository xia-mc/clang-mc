//
// Created by xia__mc on 2025/2/16.
//

#ifndef CLANG_MC_VALUE_H
#define CLANG_MC_VALUE_H

#include "utils/Common.h"

class Value {
public:
    virtual ~Value() = default;

    /**
     * 生成值的字符串表示
     * 如"42", "rax"
     * @return 字符串表示
     */
    virtual std::string toString() = 0;
};

#endif //CLANG_MC_VALUE_H
