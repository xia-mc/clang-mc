//
// Created by xia__mc on 2025/2/17.
//

#include "IRCommon.h"
#include "ops/Mov.h"
#include "ir/ops/Label.h"

static OpPtr createMov(const std::string_view &args) {
    auto parts = string::split(args, ',');
    if (UNLIKELY(parts.size() != 2)) {
        throw ParseException(fmt::format("Invalid arguments for mov: '{}'.", args));
    }

    auto leftStr = std::string(string::trim(parts[0]));
    auto rightStr = std::string(string::trim(parts[1]));

    return std::make_unique<Mov>(createValue(leftStr), createValue(rightStr));
}

static OpPtr createLabel(const std::string_view &string) {
    assert(!string.empty());
    assert(string[string.length() - 1] == ':');

    auto name = std::string(string.substr(0, string.length() - 1));
    return std::make_unique<Label>(name);
}

OpPtr createOp(const std::string_view &string) {
    assert(!string.empty());
    if (UNLIKELY(string[string.length() - 1] == ':')) {
        return createLabel(string);
    }

    auto parts = string::split(string, ' ', 2);
    assert(parts.size() == 2);

    auto op = parts[0];
    auto args = parts[1];

    switch (hash(op)) {
        case hash("mov"):
            return createMov(args);
        default: [[unlikely]]
            throw ParseException(fmt::format("Unknown op: '{}'.", op));
    }
}
