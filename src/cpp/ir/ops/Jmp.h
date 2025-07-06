//
// Created by xia__mc on 2025/2/19.
//

#ifndef CLANG_MC_JMP_H
#define CLANG_MC_JMP_H

#include "ir/iops/Op.h"
#include "ir/iops/JmpLike.h"
#include "utils/string/StringUtils.h"
#include "ir/OpCommon.h"
#include "utils/string/StringBuilder.h"

class Jmp : public JmpLike {
public:
    explicit Jmp(const i32 lineNumber, std::string label) noexcept:
            Op("jmp", lineNumber), CallLike(std::move(label)) {
    }

    [[nodiscard]] std::string toString() const noexcept override {
        return fmt::format("jmp {}", label);
    }

    [[nodiscard]] std::string compile(const JmpMap &jmpMap) const override {
        assert(jmpMap.contains(labelHash));
        return string::join(jmpMap.at(labelHash), '\n');
    }
};

#endif //CLANG_MC_JMP_H
