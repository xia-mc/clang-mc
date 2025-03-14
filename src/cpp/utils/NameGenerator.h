//
// Created by xia__mc on 2025/2/19.
//

#ifndef CLANG_MC_NAMEGENERATOR_H
#define CLANG_MC_NAMEGENERATOR_H

#include <cstdlib>
#include "Native.h"

class NameGenerator {
private:
    static inline constexpr char DICTIONARY[] = "abcdefghijklmnopqrstuvwxyz";
    static inline constexpr size_t DICT_SIZE = sizeof(DICTIONARY) - 1;
    static inline constexpr size_t START_LENGTH = 1;

    size_t *counters = nullptr;
    size_t length = START_LENGTH;

public:
    explicit NameGenerator() noexcept {
        counters = static_cast<size_t *>(calloc(START_LENGTH, sizeof(size_t)));
        if (counters == nullptr) {
            onOOM();
        }
    }

    ~NameGenerator() {
        free(counters);
    }

    static __forceinline NameGenerator &getInstance() noexcept {
        static auto generator = NameGenerator();
        return generator;
    }

    __forceinline std::string generate() {
        auto result = std::string(length, '\0');
        for (size_t i = 0; i < length; i++) {
            result[i] = DICTIONARY[counters[i]];
        }
        incrementCounters();
        return result;
    }

private:
    __forceinline void incrementCounters() noexcept {
        size_t i = length - 1;
        do {
            counters[i]++;
            if (LIKELY(counters[i] < DICT_SIZE)) {
                return;
            }
            counters[i] = 0;
        } while (i-- > 0);

        length++;

        // 更新counters
        free(counters);
        counters = static_cast<size_t *>(calloc(length, sizeof(size_t)));
        if (counters == nullptr) {
            // 不需要显式析构
            onOOM();
        }
    }
};

#endif //CLANG_MC_NAMEGENERATOR_H
