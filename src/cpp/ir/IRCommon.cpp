//
// Created by xia__mc on 2025/2/17.
//

#include "IRCommon.h"

static OpPtr createMov(const std::string_view &string) {
    auto parts = string::split(string, ',');
    if (parts.size() != 2) {
        throw ParseException(fmt::format("Invalid arguments for mov: '{}'.", string));
    }

    auto leftStr = std::string(string::trim(parts[0]));
    auto rightStr = std::string(string::trim(parts[1]));

    return std::make_unique<Mov>(createValue(leftStr), createValue(rightStr));
}

OpPtr createOp(const std::string_view &string) {
    auto parts = string::split(string::trim(string), ' ', 2);
    assert(parts.size() == 2);

    auto op = parts[0];
    auto args = parts[1];

    switch (hash(op)) {
        case hash("mov"):
            return createMov(args);
        default:
            throw ParseException(fmt::format("Unknown op: '{}'.", op));
    }
}
