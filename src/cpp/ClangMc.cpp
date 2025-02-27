//
// Created by xia__mc on 2025/2/13.
//

#define _CRT_SECURE_NO_WARNINGS(any) any // NOLINT(*-reserved-identifier)

#include "ClangMc.h"
#include "utils/FileUtils.h"
#include "ir/verify/Verifier.h"
#include "i18n/LogFormatter.h"
#include <spdlog/sinks/ansicolor_sink.h>
#include <spdlog/sinks/basic_file_sink.h>
#include <execution>

ClangMc::ClangMc(const Config &config) : config(config) {
    auto consoleSink = std::make_shared<spdlog::sinks::ansicolor_stdout_sink_mt>();
    auto sinks = std::vector<spdlog::sink_ptr>{consoleSink};
    if (this->config.getLogFile()) {
        auto fileSink = std::make_shared<spdlog::sinks::basic_file_sink_mt>("latest.log", true);
        sinks.push_back(fileSink);
    }

    logger = std::make_shared<spdlog::logger>("multi_sink", sinks.begin(), sinks.end());
#ifndef NDEBUG
    for (const auto &sink: sinks) {
        sink->set_level(spdlog::level::debug);
    }
    logger->set_level(spdlog::level::debug);
#endif
    logger->set_formatter(std::make_unique<LogFormatter>());
}

ClangMc::~ClangMc() {
    spdlog::drop_all();
}

void ClangMc::start() {
    // initializing
    ensureValidConfig();
    ensureBuildDir();

    // compiling
    auto irs = loadIRCode();
    auto mcFunctions = std::vector<McFunctions>(irs.size());
    // TODO 加一个option允许开关并行编译
    std::transform(std::execution::par, irs.begin(), irs.end(), mcFunctions.begin(), compileIR);

    // building
    for (const auto &mcFunction: mcFunctions) {
        for (const auto &entry: mcFunction) {
            const auto &path = config.getBuildDir() / entry.first;
            const auto &data = entry.second;

            ensureParentDir(path);
            if (data.ends_with('\n')) {
                writeFile(path, data.substr(0, data.length() - 1));
            } else {
                writeFile(path, data);
            }
        }
    }

    // TODO linking
}

[[noreturn]] void ClangMc::exit() {
    spdlog::drop_all();
    std::exit(0);
    UNREACHABLE();
}

__forceinline void ClangMc::ensureValidConfig() {
    if (config.getInput().empty()) {
        logger->error(i18n("general.no_input_files"));
        exit();
    }
    if (std::any_of(config.getInput().begin(), config.getInput().end(), [&](const Path &item) {
        return !item.string().ends_with(".mcasm");
    })) {
        logger->error(i18n("general.invalid_input"));
        exit();
    }
}

__forceinline void ClangMc::ensureBuildDir() {
    const Path &dir = config.getBuildDir();
    try {
        if (exists(dir)) {
            remove_all(dir);
        }
        create_directory(dir);
    } catch (const std::filesystem::filesystem_error &e) {
        logger->error(i18n("general.failed_init_build"));
        logger->error(e.what());
    }
}

[[nodiscard]] std::vector<IR> ClangMc::loadIRCode() {
    auto irs = std::vector<IR>();
    try {
        for (const auto &path: config.getInput()) {
            irs.emplace_back(logger, config, path).parse(readFile(path));
        }

        Verifier(logger, config, irs).verify();
        if (!config.getDebugInfo()) {
            std::for_each(irs.begin(), irs.end(), FUNC_ARG0(freeSource));
        }

        return irs;
    } catch (const IOException &e) {
        logger->error(e.what());
    } catch (const ParseException &e) {
        logger->error(e.what());
    }

    logger->error(i18n("general.unable_to_build"));
    exit();
}
