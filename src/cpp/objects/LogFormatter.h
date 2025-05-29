//
// Created by xia__mc on 2025/2/23.
//

#ifndef CLANG_MC_LOGFORMATTER_H
#define CLANG_MC_LOGFORMATTER_H

#include "spdlog/spdlog.h"
#include "utils/string/StringUtils.h"

static inline bool isInClion() {
    static const bool result = std::getenv("CLION_IDE") != nullptr;
    return result;
}

static inline const char *getLevelColor(spdlog::level::level_enum level) {
    switch (level) {
        case spdlog::level::critical:
        case spdlog::level::err:
            return "\033[1;31m"; // fatal/error: 粗体红
        case spdlog::level::warn:
            return "\033[1;33m"; // warning: 粗体黄
        case spdlog::level::info:
            return "\033[0;34m"; // note: 蓝色
        case spdlog::level::debug:
        case spdlog::level::trace:
            return "\033[0;90m"; // 灰色（暗）
        default:
            return "\033[0m";    // 重置
    }
}


static auto fmtColor = spdlog::pattern_formatter("%^%l:%$ %v");
static auto fmtNoteColor = spdlog::pattern_formatter("%^note:%$ %v");
static auto fmtNoColor = spdlog::pattern_formatter("%l: %v");
static auto fmtNoteNoColor = spdlog::pattern_formatter("note: %v");

class LogFormatter : public spdlog::formatter {
public:
    void format(const spdlog::details::log_msg &msg, spdlog::memory_buf_t &dest) override {
        if (isInClion()) { // Clion不知道为什么不能解析ANSI颜色代码
            if (msg.level == spdlog::level::info) {
                fmtNoteNoColor.format(msg, dest);
            } else {
                fmtNoColor.format(msg, dest);
            }
        } else {
            if (msg.level == spdlog::level::info) {
                fmtNoteColor.format(msg, dest);
            } else {
                if (!string::contains(msg.payload.data(), '\n')) {
                    auto string = fmt::format(
                            "{}{}: \033[97m{}\033[0m\n",
                            getLevelColor(msg.level),
                            spdlog::level::to_string_view(msg.level),
                            msg.payload
                    );
                    dest.append(string);
                } else {
                    auto splits = string::split(msg.payload.data(), '\n', 2);
                    assert(splits.size() == 2);
                    auto string = fmt::format(
                            "{}{}: \033[97m{}\033[0m\n{}\n",
                            getLevelColor(msg.level),
                            spdlog::level::to_string_view(msg.level),
                            splits[0],
                            splits[1]
                    );
                    dest.append(string);
                }
            }
        }
    }

    [[nodiscard]] std::unique_ptr<formatter> clone() const override {
        return std::make_unique<LogFormatter>();
    }
};

#endif //CLANG_MC_LOGFORMATTER_H
