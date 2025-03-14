//
// Created by xia__mc on 2025/2/27.
//

#ifndef CLANG_MC_CMPLIKE_H
#define CLANG_MC_CMPLIKE_H

#include <utility>

#include "Op.h"
#include "utils/string/StringUtils.h"
#include "OpCommon.h"

class CmpLike : public virtual Op {
protected:
    const ValuePtr left;
    const ValuePtr right;

    template<class Self, class T, class U>
    inline std::string cmp(const Self *self, const std::span<std::string_view> &cmds, T *leftVal, U *rightVal) const {
        static const auto fixCmd = [](const auto &cmd) -> std::string_view {
            // 指令选择优化
            constexpr std::string_view PREFIX = "return run ";
            if (cmd.starts_with(PREFIX)) {
                return {cmd.data() + PREFIX.length(), cmd.length() - PREFIX.length()};
            }
            return cmd;
        };

        auto result = StringBuilder(self->cmp(fixCmd(cmds[0]), leftVal, rightVal));
        for (size_t i = 1; i < cmds.size(); ++i) {
            result.append('\n');
            result.append(self->cmp(fixCmd(cmds[i]), leftVal, rightVal));
        }
        return result.toString();
    }
public:
    explicit CmpLike(ValuePtr &&left, ValuePtr &&right) noexcept: left(std::move(left)), right(std::move(right)) {
    }

    GETTER(Left, left);

    GETTER(Right, right);
};

#endif //CLANG_MC_CMPLIKE_H
