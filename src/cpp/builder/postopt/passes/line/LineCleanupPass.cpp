//
// Created by Codex on 2026/5/1.
//

#include "LineCleanupPass.h"
#include "utils/string/StringUtils.h"

namespace postopt {

std::string cleanupFunctionText(std::string_view code) {
    if (code.empty()) {
        return {};
    }

    const auto lines = string::split(code, '\n');
    auto builder = StringBuilder();
    bool first = true;
    for (const auto &line: lines) {
        if (line.empty() || line.front() == '#') {
            continue;
        }
        auto fixedLine = string::trim(line);
        if (fixedLine.empty() || fixedLine.front() == '#') {
            continue;
        }
        if (fixedLine.front() == '$' && !string::contains(fixedLine, "$(")) {
            fixedLine.remove_prefix(1);
        }

        if (!first) {
            builder.append('\n');
        }
        builder.append(fixedLine);
        first = false;
    }
    return builder.toString();
}

}  // namespace postopt
