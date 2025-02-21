//
// Created by xia__mc on 2025/2/16.
//

#ifndef CLANG_MC_OP_H
#define CLANG_MC_OP_H

class Op {
private:
    const std::string name;
public:
    explicit Op(std::string name) noexcept : name(std::move(name)) {
    }

    virtual ~Op() = default;

    GETTER(Name, name);

    /**
     * 生成指令的字符串表示
     * @return 字符串表示
     */
    virtual std::string toString() const noexcept = 0;

    /**
     * 编译指令到McFunction
     * @return McFunction代码
     */
    [[nodiscard]] virtual std::string compile() const = 0;
};


#endif //CLANG_MC_OP_H
