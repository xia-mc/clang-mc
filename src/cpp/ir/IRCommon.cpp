//
// Created by xia__mc on 2025/2/17.
//

#include "IRCommon.h"
#include "ops/Mov.h"
#include "ir/ops/Label.h"
#include "ir/ops/Ret.h"
#include "ir/ops/Jmp.h"
#include "ir/ops/Call.h"
#include "ir/ops/Add.h"
#include "ir/ops/Sub.h"
#include "ir/ops/Mul.h"
#include "ir/ops/Inline.h"
#include "ir/ops/Push.h"
#include "ir/ops/Pop.h"
#include "ir/ops/Peek.h"
#include "ir/ops/Je.h"
#include "ir/ops/Jl.h"
#include "ir/ops/Jg.h"
#include "ir/ops/Jge.h"
#include "ir/ops/Nop.h"

template<typename T>
static OpPtr createWith1Arg(const i32 lineNumber, const std::string_view &args) {
    return std::make_unique<T>(lineNumber, std::string(args));
}

template<typename T>
static OpPtr createWith2Arg(const i32 lineNumber, const std::string_view &args) {
    auto parts = string::split(args, ',');
    if (UNLIKELY(parts.size() != 2)) {
        throw ParseException(i18nFormat("ir.invalid_op", args));
    }

    auto leftStr = std::string(string::trim(parts[0]));
    auto rightStr = std::string(string::trim(parts[1]));

    return std::make_unique<T>(lineNumber, createValue(leftStr), createValue(rightStr));
}

static __forceinline OpPtr createLabel(const i32 lineNumber, const std::string_view &string) {
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

template<typename T>
static OpPtr createConJmp(const i32 lineNumber, const std::string_view &args) {
    auto parts = string::split(args, ',');
    if (UNLIKELY(parts.size() != 3)) {
        throw ParseException(i18nFormat("ir.invalid_op", args));
    }

    auto leftStr = std::string(string::trim(parts[0]));
    auto rightStr = std::string(string::trim(parts[1]));
    auto label = std::string(string::trim(parts[2]));

    return std::make_unique<T>(lineNumber, createValue(leftStr), createValue(rightStr), label);
}

PURE OpPtr createOp(const i32 lineNumber, const std::string_view &string) {
    assert(!string.empty());
    if (UNLIKELY(string[string.length() - 1] == ':')) {
        return createLabel(lineNumber, string);
    }

    auto parts = string::split(string, ' ', 2);
    assert(!parts.empty());

    auto op = string::toLowerCase(parts[0]);
    auto args = parts.size() == 1 ? "" : parts[1];

    SWITCH_STR (op) {
        CASE_STR("mov"):
            return createWith2Arg<Mov>(lineNumber, args);
        CASE_STR("add"):
            return createWith2Arg<Add>(lineNumber, args);
        CASE_STR("sub"):
            return createWith2Arg<Sub>(lineNumber, args);
        CASE_STR("mul"):
            return createWith2Arg<Mul>(lineNumber, args);
        CASE_STR("ret"):
            return std::make_unique<Ret>(lineNumber);
        CASE_STR("jmp"):
            return createWith1Arg<Jmp>(lineNumber, args);
        CASE_STR("call"):
            return createWith1Arg<Call>(lineNumber, args);
        CASE_STR("je"):
            return createConJmp<Je>(lineNumber, args);
        CASE_STR("jl"):
            return createConJmp<Jl>(lineNumber, args);
        CASE_STR("jg"):
            return createConJmp<Jg>(lineNumber, args);
        CASE_STR("jge"):
            return createConJmp<Jge>(lineNumber, args);
        CASE_STR("inline"):
            return std::make_unique<Inline>(lineNumber, std::string(args));
        CASE_STR("push"):
            if (args.empty()) {
                return std::make_unique<Push>(lineNumber);
            }
            try {
                return std::make_unique<Push>(lineNumber, Registers::fromName(args).get());
            } catch (const ParseException &) {
            }
            return std::make_unique<Push>(lineNumber, parseToNumber(args));
        CASE_STR("pop"):
            if (args.empty()) {
                return std::make_unique<Pop>(lineNumber);
            }
            try {
                return std::make_unique<Pop>(lineNumber, Registers::fromName(args).get());
            } catch (const ParseException &) {
            }
            return std::make_unique<Pop>(lineNumber, parseToNumber(args));
        CASE_STR("peek"):
            return std::make_unique<Peek>(lineNumber, Registers::fromName(args).get());
        CASE_STR("nop"):
            return std::make_unique<Nop>(lineNumber);
        default: [[unlikely]]
            throw ParseException(i18nFormat("ir.unknown_op", op));
    }
}

PURE bool isTerminate(const OpPtr &op) {
    return INSTANCEOF(op, Ret) || INSTANCEOF(op, Jmp);
}