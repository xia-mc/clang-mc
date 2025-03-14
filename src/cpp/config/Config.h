//
// Created by xia__mc on 2025/2/13.
//

#ifndef CLANG_MC_CONFIG_H
#define CLANG_MC_CONFIG_H

#include <vector>
#include <string>
#include <utils/Common.h>

class Config {
private:
    std::vector<Path> input = std::vector<Path>();
    Path output = Path("output");
    Path buildDir = Path("build");
    bool compileOnly = false;
    bool logFile = false;
    std::string nameSpace;
    bool debugInfo = false;
public:
    explicit Config() = default;

    DATA(Input, input);

    DATA(Output, output);

    DATA(BuildDir, buildDir);

    DATA_POD(CompileOnly, compileOnly);

    DATA_POD(LogFile, logFile);

    DATA(NameSpace, nameSpace);

    DATA_POD(DebugInfo, debugInfo);
};


#endif //CLANG_MC_CONFIG_H
