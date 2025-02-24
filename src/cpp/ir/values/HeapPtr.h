//
// Created by xia__mc on 2025/2/24.
//

#ifndef CLANG_MC_HEAPPTR_H
#define CLANG_MC_HEAPPTR_H

#include "Ptr.h"

class HeapPtr : public Ptr {
public:
    explicit HeapPtr(const Register *base, const Register *index, const i32 scale, const i32 displacement) noexcept:
            Ptr(base, index, scale, displacement) {
    }

    [[nodiscard]] std::string toString() const noexcept override {
        return fmt::format("[{}]", formatAddress());
    }

    [[nodiscard]] std::string load(const Register &reg) const override {
        if (base == nullptr && index == nullptr) {
            assert(scale == 1);
            // 内联以改善性能
            return fmt::format("execute store result score {} vm_regs run data get storage std:vm heap[{}]",
                               reg.getName(), displacement);
        }

        auto result = std::ostringstream();

        result << fmt::format("data modify storage std:vm s2 set value {{result: \"{}\", ptr: -1}}\n",
                              reg.getName());
        setPtr(result, "ptr");
        result << "function std:_internal/load_heap_custom with storage std:vm s2";
        return result.str();
    }

    [[nodiscard]] std::string store(const Register &reg) const override {
        if (base == nullptr && index == nullptr) {
            assert(scale == 1);
            // 内联以改善性能
            return fmt::format("execute store result storage std:vm heap[{}] int 1 run scoreboard players get {} vm_regs",
                               displacement, reg.getName());
        }

        auto result = std::ostringstream();

        result << fmt::format("data modify storage std:vm s2 set value {{ptr: -1, value: \"{}\"}}\n",
                              reg.getName());
        setPtr(result, "ptr");
        result << "function std:_internal/store_heap_custom with storage std:vm s2";
        return result.str();
    }

    [[nodiscard]] std::string store(const Immediate &immediate) const override {
        if (base == nullptr && index == nullptr) {
            assert(scale == 1);
            // 内联以改善性能
            return fmt::format("data modify storage std:vm heap[{}] set value {}",
                               displacement, immediate.getValue());
        }

        auto result = std::ostringstream();

        result << fmt::format("data modify storage std:vm s2 set value {{ptr: -1, value: {}}}\n",
                              immediate.getValue());
        setPtr(result, "ptr");
        result << "function std:_internal/store_heap_custom2 with storage std:vm s2";
        return result.str();
    }

    [[nodiscard]] std::string store(const Ptr &ptr) const override {
        if (base == nullptr && index == nullptr && ptr.base == nullptr && ptr.index == nullptr) {
            assert(scale == 1);
            // 内联以改善性能
            return fmt::format("data modify storage std:vm heap[{}] set from storage std:vm heap[{}]",
                               displacement, ptr.displacement);
        }

        auto result = std::ostringstream();

        result << "data modify storage std:vm s2 set value {{to: -1, from: -1}}\n";
        setPtr(result, "to");
        ptr.setPtr(result, "from");
        result << "function std:_internal/store_heap_custom3 with storage std:vm s2";
        return result.str();
    }
};

#endif //CLANG_MC_HEAPPTR_H
