//
// Created by xia__mc on 2025/2/13.
//

#include "ClangMc.h"
#include "utils/FileUtils.h"
#include "ir/verify/Verifier.h"
#include "i18n/LogFormatter.h"
#include "builder/Builder.h"
#include "builder/PostOptimizer.h"
#include <spdlog/sinks/ansicolor_sink.h>
#include <spdlog/sinks/basic_file_sink.h>
#include <execution>
#include <llvm/TargetParser/Host.h>

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
    ensureEnvironment();
    ensureValidConfig();
    ensureBuildDir();

    // compiling
    auto irs = loadIRCode();
    auto mcFunctions = std::vector<McFunctions>(irs.size());
#pragma omp parallel for
    for (size_t i = 0; i < irs.size(); ++i) {
        mcFunctions[i] = irs[i].compile();
    }
    std::vector<IR>().swap(irs);  // 释放内存

    // post optimize
    if (!config.getDebugInfo()) {
        auto postOptimizer = PostOptimizer(mcFunctions);
        postOptimizer.optimize();
    }

    auto builder = Builder(config, std::move(mcFunctions));
    // building
    builder.build();

    // linking
    builder.link();
}

[[noreturn]] void ClangMc::exit() {
    spdlog::drop_all();
#ifndef NDEBUG
    fprintf(stderr, "Called ClangMc::exit.\n");
    onTerminate();
#else
    std::exit(0);
    UNREACHABLE();
#endif
}

void ClangMc::ensureEnvironment() const {
    bool correct = Builder::checkResources();
    if (!correct) {
        logger->error(i18n("general.environment_error"));
        exit();
    }
}

void ClangMc::ensureValidConfig() {
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

void ClangMc::ensureBuildDir() {
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

        Verifier(logger, irs).verify();
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
