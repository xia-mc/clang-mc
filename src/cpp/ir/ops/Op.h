//
// Created by xia__mc on 2025/2/16.
//

#ifndef CLANG_MC_OP_H
#define CLANG_MC_OP_H

#include "OpCommon.h"

class Op {
private:
    const std::string name;
public:
    explicit Op(std::string name) : name(std::move(name)) {
    }

    virtual ~Op() = default;

    GETTER(Name, name);

    /**
     * 生成指令的字符串表示
     * 如"mov rax, r0"，toString()的返回值应为"rax, r0"，不包括指令本身
     * @return 字符串表示
     */
    virtual std::string toString() = 0;

    /**
     * 编译指令到McFunction
     * @return McFunction代码
     */
    virtual McFunction compile() = 0;
};


#endif //CLANG_MC_OP_H
