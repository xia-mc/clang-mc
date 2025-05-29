//
// Created by xia__mc on 2025/5/26.
//

#ifndef CLANG_MC_MATRIXSTACK_H
#define CLANG_MC_MATRIXSTACK_H


#include <stack>

template<class T>
class MatrixStack {
private:
    std::stack<T> stack = std::stack<T>();
public:
    explicit MatrixStack() = default;

    __forceinline void pushMatrix(T &&object) {
        stack.push(std::move(object));
    }

    __forceinline void pushMatrix(const T object) {
        stack.push(std::move(object));
    }

    __forceinline T popMatrix() {
        auto result = std::move(stack.top());
        stack.pop();
        return result;
    }

    __forceinline bool isEmpty() {
        return stack.empty();
    }

    __forceinline u32 size() {
        return stack.size();
    }
};


#endif //CLANG_MC_MATRIXSTACK_H
