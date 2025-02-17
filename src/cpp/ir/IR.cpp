//
// Created by xia__mc on 2025/2/16.
//

#include "IR.h"
#include "utils/StringUtils.h"
#include "ops/Op.h"

void IR::parse(const std::string &code) {
    auto lines = string::split(code, '\n');

    size_t errors = 0;
    for (size_t i = 0; i < lines.size(); ++i) {
        const auto &line = string::trim(string::removeComment(lines[i]));
        if (UNLIKELY(line.empty())) {
            continue;
        }

        try {
            this->values.push_back(createOp(line));
        } catch (const ParseException &e) {
            const ui64 lineNumber = i + 1;  // ui64防止+1后溢出
            logger->error(fmt::format("{}:{}: {}\n    {} | {}",
                    file.string(), lineNumber, e.what(), lineNumber, line));
            errors++;
        }
    }

    if (UNLIKELY(errors != 0)) {
        throw ParseException(fmt::format("{}: {} errors generated.", file.string(), errors));
    }
}

std::unordered_map<Path, std::string> IR::compile() {
    NOT_IMPLEMENTED();
}
