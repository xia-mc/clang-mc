//
// Created by xia__mc on 2025/2/17.
//

#include "IRCommon.h"
#include "ops/Mov.h"
#include "ir/ops/Label.h"
#include "ir/ops/Ret.h"
#include "ir/ops/Jmp.h"
#include "ir/ops/Call.h"

static OpPtr createMov(const ui64 lineNumber, const std::string_view &args) {
    auto parts = string::split(args, ',');
    if (UNLIKELY(parts.size() != 2)) {
        throw ParseException(i18nFormat("ir.invalid_mov", args));
    }

    auto leftStr = std::string(string::trim(parts[0]));
    auto rightStr = std::string(string::trim(parts[1]));

    return std::make_unique<Mov>(lineNumber, createValue(leftStr), createValue(rightStr));
}

static OpPtr createLabel(const ui64 lineNumber, const std::string_view &string) {
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
                return std::make_unique<Label>(lineNumber, std::string(parts[1]), true, false);
            CASE_STR("extern"):
                return std::make_unique<Label>(lineNumber, std::string(parts[1]), false, true);
            default:
                throw ParseException(i18nFormat("ir.invalid_label_identifier",
                                                 parts[0]));
        }
    }

    return std::make_unique<Label>(lineNumber, name, false, false);
}

PURE OpPtr createOp(const ui64 lineNumber, const std::string_view &string) {
    assert(!string.empty());
    if (UNLIKELY(string[string.length() - 1] == ':')) {
        return createLabel(lineNumber, string);
    }

    auto parts = string::split(string, ' ', 2);
    assert(!parts.empty());

    auto op = parts[0];
    auto args = parts.size() == 1 ? "" : parts[1];

    SWITCH_STR (op) {
        CASE_STR("mov"):
            return createMov(lineNumber, args);
        CASE_STR("ret"):
            return std::make_unique<Ret>(lineNumber);
        CASE_STR("jmp"):
            return std::make_unique<Jmp>(lineNumber, std::string(args));
        CASE_STR("call"):
            return std::make_unique<Call>(lineNumber, std::string(args));
        default: [[unlikely]]
            throw ParseException(i18nFormat("ir.unknown_op", op));
    }
}

PURE bool isTerminate(const OpPtr &op) {
    return INSTANCEOF(op, Ret) || INSTANCEOF(op, Jmp);
}