//
// Created by xia__mc on 2025/2/19.
//

#ifndef CLANG_MC_JMP_H
#define CLANG_MC_JMP_H

#include "Op.h"
#include "JmpLike.h"
#include "utils/string/StringUtils.h"
#include "OpCommon.h"
#include "utils/string/StringBuilder.h"

class Jmp : public JmpLike {
public:
    explicit Jmp(const ui32 lineNumber, std::string label) noexcept:
            Op("jmp", lineNumber), JmpLike(std::move(label)) {
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
