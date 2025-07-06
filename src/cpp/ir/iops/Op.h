//
// Created by xia__mc on 2025/2/16.
//

#ifndef CLANG_MC_OP_H
#define CLANG_MC_OP_H


class IR;

class Op {
private:
    const std::string_view name;  // constexpr

protected:
    IR *ir;

public:
    explicit Op(std::string_view &&name, [[maybe_unused]] i32 lineNumber) noexcept : name(name), ir(nullptr) {
    }

    virtual ~Op() = default;

    virtual auto withIR(IR *context) noexcept -> decltype(this) {
        this->ir = context;
        return this;
    };

    /**
     * 生成指令的字符串表示
     * @return 字符串表示
     */
    [[nodiscard]] virtual std::string toString() const = 0;

    /**
     * 编译prefix指令到McFunction，通常由基类执行
     * @return McFunction代码
     */
    [[nodiscard]] virtual std::string compilePrefix() const {
        return "";
    }

    /**
     * 编译指令到McFunction
     * @return McFunction代码
     */
    [[nodiscard]] virtual std::string compile() const = 0;
};


#endif //CLANG_MC_OP_H
