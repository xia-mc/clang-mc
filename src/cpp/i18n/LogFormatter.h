//
// Created by xia__mc on 2025/2/23.
//

#ifndef CLANG_MC_LOGFORMATTER_H
#define CLANG_MC_LOGFORMATTER_H

#include "spdlog/spdlog.h"

static inline bool isInClion() {
    static const bool result = std::getenv("CLION_IDE") != nullptr;
    return result;
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
                fmtColor.format(msg, dest);
            }
        }
    }

    [[nodiscard]] std::unique_ptr<formatter> clone() const override {
        return std::make_unique<LogFormatter>();
    }
};

#endif //CLANG_MC_LOGFORMATTER_H
