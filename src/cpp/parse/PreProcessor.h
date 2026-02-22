//
// Created by xia__mc on 2025/2/13.
//

#ifndef CLANG_MC_PREPROCESSOR_H
#define CLANG_MC_PREPROCESSOR_H

#include "utils/Common.h"
#include <optional>
#include <vector>

class PreProcessor {
public:
    struct Target {
        Path path;
        std::string code;
    };

    void addIncludeDir(Path path);
    void addTarget(Path path);
    void addTargetString(std::string code);
    void load();    // throws IOException
    void process(); // throws ParseException, IOException

    [[nodiscard]] const std::vector<Target> &getTargets() const noexcept;
    [[nodiscard]] const HashMap<Path, HashMap<std::string, std::string>> &getDefines() const noexcept;

private:
    using FuncMacroEntry = std::pair<std::vector<std::string>, std::string>;

    std::vector<Path> includeDirs;
    std::vector<Target> targets;
    HashSet<Path> processing;
    HashMap<Path, HashMap<std::string, std::string>> defines;
    HashMap<Path, HashMap<std::string, FuncMacroEntry>> funcMacros;
    HashSet<Path> includeOnce;
    HashMap<Path, HashSet<Path>> bypassInclude;

    [[nodiscard]] std::vector<std::string> logicalLines(const std::string &code) const;
    [[nodiscard]] std::pair<std::string, std::string> splitDefine(const std::string &s) const;
    [[nodiscard]] std::optional<std::string> tryExpandFuncMacro(const Path &tgt, const std::string &line) const;
    [[nodiscard]] std::string tryExpandObjMacros(const Path &tgt, const std::string &line) const;
    [[nodiscard]] std::optional<std::pair<Path, std::string>> getInclude(
        const Path &tgt, const Path &curFile, const std::string &fileStr);
    [[nodiscard]] std::string handleTarget(const Path &tgt, const Path &cur, const std::string &code);
};

#endif //CLANG_MC_PREPROCESSOR_H
