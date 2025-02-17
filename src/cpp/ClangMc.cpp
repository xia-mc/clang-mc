//
// Created by xia__mc on 2025/2/13.
//

#include "ClangMc.h"
#include "ir/IR.h"
#include <spdlog/sinks/ansicolor_sink.h>
#include <spdlog/sinks/basic_file_sink.h>

static inline bool isInClion() {
    static bool result = std::getenv("CLION_IDE") != nullptr;
    return result;
}

[[maybe_unused]] ClangMc *ClangMc::INSTANCE;

ClangMc::ClangMc(const Config &config) : config(config) {
    INSTANCE = this;

    auto consoleSink = std::make_shared<spdlog::sinks::ansicolor_stdout_sink_mt>();
    auto sinks = std::vector<spdlog::sink_ptr>{consoleSink};
    if (this->config.getLogFile()) {
        auto fileSink = std::make_shared<spdlog::sinks::basic_file_sink_mt>("latest.log", true);
        sinks.push_back(fileSink);
    }

    logger = std::make_shared<spdlog::logger>("multi_sink", sinks.begin(), sinks.end());
#ifndef NDEBUG
    console_sink->set_level(spdlog::level::debug);
    file_sink->set_level(spdlog::level::debug);
    logger->set_level(spdlog::level::debug);
#endif
    if (isInClion()) { // Clion不知道为什么不能解析ANSI颜色代码
        logger->set_pattern("%l: %v");
    } else {
        logger->set_pattern("%^%l:%$ %v");
    }
}

void ClangMc::start() {
    ensureValidConfig();
}

void ClangMc::ensureValidConfig() {
    if (config.getInput().empty()) {
        logger->error("no input files.");
        exit();
    }
    for (const auto &item: config.getInput()) {
        logger->debug(item.string());
    }
    if (std::any_of(config.getInput().begin(), config.getInput().end(), [&](const Path &item) {
        return !item.string().ends_with(".mcasm");
    })) {
        logger->error("invalid input file, expected '.mcasm' files.");
        exit();
    }
}

ClangMc::~ClangMc() {
    spdlog::drop_all();
}

void ClangMc::exit() {
    spdlog::drop_all();
    ::exit(0);
}
