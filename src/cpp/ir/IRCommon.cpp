//
// Created by xia__mc on 2025/2/17.
//

#include "IRCommon.h"
#include "ops/Mov.h"
#include "ir/ops/Label.h"

static OpPtr createMov(const std::string_view &args) {
    auto parts = string::split(args, ',');
    if (UNLIKELY(parts.size() != 2)) {
        throw ParseException(i18nFormat("ir.invalid_mov", args));
    }

    auto leftStr = std::string(string::trim(parts[0]));
    auto rightStr = std::string(string::trim(parts[1]));

    return std::make_unique<Mov>(createValue(leftStr), createValue(rightStr));
}

static OpPtr createLabel(const std::string_view &string) {
    assert(!string.empty());
    assert(string[string.length() - 1] == ':');

    auto name = std::string(string.substr(0, string.length() - 1));
    auto parts = string::split(name, ' ', 2);

    if (UNLIKELY(parts.size() > 1)) {  // 带标签的label
        if (string::contains(parts[1], ' ')) {
            throw ParseException(i18n("ir.invalid_label"));
        }

        SWITCH_STR (parts[0]) {
            CASE_STR("export"):
                return std::make_unique<Label>(std::string(parts[1]), true, false);
            CASE_STR("extern"):
                return std::make_unique<Label>(std::string(parts[1]), false, true);
            default:
                throw ParseException(i18nFormat("ir.invalid_label_identifier",
                                                 parts[0]));
        }
    }

    return std::make_unique<Label>(name, false, false);
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

    SWITCH_STR (op) {
        CASE_STR("mov"):
            return createMov(args);
        default: [[unlikely]]
            throw ParseException(i18nFormat("ir.unknown_op", op));
    }
}
