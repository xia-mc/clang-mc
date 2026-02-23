//
// Created by xia__mc on 2025/2/23.
//

#ifndef CLANG_MC_LOGFORMATTER_H
#define CLANG_MC_LOGFORMATTER_H

#include "spdlog/spdlog.h"
#include "utils/string/StringUtils.h"

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
        case spdlog::level::off:
            FMT_FALLTHROUGH;
        case spdlog::level::n_levels:
            FMT_FALLTHROUGH;
        default:
            return "";
    }
}


static inline const char *getLevelName(spdlog::level::level_enum level) {
    switch (level) {
        case spdlog::level::critical:
            return "fatal error";
        case spdlog::level::err:
            return "error";
        case spdlog::level::warn:
            return "warn";
        case spdlog::level::info:
            return "note";
        case spdlog::level::debug:
            return "debug";
        case spdlog::level::trace:
            return "trace";
        case spdlog::level::off:
            FMT_FALLTHROUGH;
        case spdlog::level::n_levels:
            FMT_FALLTHROUGH;
        default:
            return "?";
    }
}

class LogFormatter : public spdlog::formatter {
public:
    void format(const spdlog::details::log_msg &msg, spdlog::memory_buf_t &dest) override {
        if (!string::contains(msg.payload.data(), '\n')) {
            auto string = fmt::format(
                    "{}{}: \033[97m{}\033[0m\n",
                    getLevelColor(msg.level),
                    getLevelName(msg.level),
                    msg.payload
            );
            dest.append(string);
        } else {
            auto splits = string::split(msg.payload.data(), '\n', 2);
            assert(splits.size() == 2);
            auto string = fmt::format(
                    "{}{}: \033[97m{}\033[0m\n{}\n",
                    getLevelColor(msg.level),
                    getLevelName(msg.level),
                    splits[0],
                    splits[1]
            );
            dest.append(string);
        }
    }

    [[nodiscard]] std::unique_ptr<formatter> clone() const override {
        return std::make_unique<LogFormatter>();
    }
};

#endif //CLANG_MC_LOGFORMATTER_H
