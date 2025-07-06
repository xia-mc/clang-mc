//
// Created by xia__mc on 2025/2/24.
//

#include "OpCommon.h"
#include "i18n/I18n.h"
#include "ir/values/Symbol.h"
#include "ir/values/SymbolPtr.h"

PURE i32 parseToNumber(std::string_view string) {
    assert(!string.empty());
    string = string::trim(string);

    // 字符串（"AB"）或字符（'A'）
//    if (string.front() == '"' && string.back() == '"' && string.size() > 2) {
//        std::string_view content = string.substr(1, string.size() - 2); // 去掉引号
//        if (content.size() > 4) {
//            throw ParseException(i18n("ir.op.out_of_range"));
//        }
//        int32_t result = 0;
//        for (size_t i = 0; i < content.size(); ++i) {
//            result |= (static_cast<uint8_t>(content[i]) << (i * 8)); // 小端存储字面量
//        }
//        return result;
//    } else
    if (string.front() == '\'' && string.back() == '\'' && string.size() == 3) {
        return static_cast<int32_t>(string[1]); // 单字符
    }

    // 解析进制
    i32 base = 10;
    size_t offset = 0;
    bool isNegtive;
    if (string.front() == '-') {
        isNegtive = true;
        string = string::trim(string.substr(1));
    } else {
        isNegtive = false;
        if (string.front() == '+') {
            string = string::trim(string.substr(1));
        }
    }

    if (string.size() > 2) {
        if (string.substr(0, 2) == "0x" || string.substr(0, 2) == "0X") {
            base = 16;
            offset = 2;
        } else if (string.substr(0, 2) == "0b" || string.substr(0, 2) == "0B") {
            base = 2;
            offset = 2;
        } else if (string.substr(0, 2) == "0o" || string.substr(0, 2) == "0O") {
            base = 8;
            offset = 2;
        }
    }

    // 处理后缀（如"101b" "173o"）
    if (string.back() == 'b' && string.size() > 1) {
        base = 2;
        string = string.substr(0, string.size() - 1);
    } else if (string.back() == 'o' && string.size() > 1) {
        base = 8;
        string = string.substr(0, string.size() - 1);
    }

    // 解析数字
    i64 result;
    auto [ptr, ec] = std::from_chars(
            string.data() + offset, string.data() + string.size(), result, base);

    if (ec == std::errc::invalid_argument || ptr != string.data() + string.size()) {
        throw ParseException(i18n("ir.op.invalid_number_format"));
    }
    if (ec == std::errc::result_out_of_range) {
        throw ParseException(i18n("ir.op.out_of_range"));
    }

    if (isNegtive) {
        if (result > static_cast<i64>(INT_MAX) + 1) {
            throw ParseException(i18n("ir.op.out_of_range"));
        }
        result = -result;
    } else if (result > INT_MAX) {
        throw ParseException(i18n("ir.op.out_of_range"));
    }
    return static_cast<i32>(result);
}

struct PtrData {
    const Register *base;
    const Register *index;
    const i32 scale;
    const i32 displacement;
};

static __forceinline std::string fixStringForPtrData(const std::string_view &string) {
    auto splits = string::split(string, '-');
    if (splits.size() == 1) {
        return std::string(string);
    }

    std::transform(splits.begin(), splits.end(), splits.begin(), string::trim);
    return string::join(splits, "+-");
}

static PtrData parsePtrData(const std::string_view &string) {
    // base
    try {
        return PtrData(Registers::fromName(string).get(), nullptr, 1, 0);
    } catch (const ParseException &) {
    }

    // displacement
    try {
        return PtrData(nullptr, nullptr, 1, parseToNumber(string));
    } catch (const ParseException &) {
    }

    // index * scale
    auto splits = string::split(string, '*');
    std::transform(splits.begin(), splits.end(), splits.begin(), string::trim);
    if (splits.size() == 2) {
        try {
            auto scale = parseToNumber(splits[1]);
            if (scale < 0) {
                throw ParseException(i18n("ir.op.scale_out_of_range"));
            }

            return PtrData(nullptr, Registers::fromName(splits[0]).get(), scale, 0);
        } catch (const ParseException &) {
        }
    }

    auto fixed = fixStringForPtrData(string);
    splits = string::split(fixed, '+');
    std::transform(splits.begin(), splits.end(), splits.begin(), string::trim);
    if (splits.size() == 2) {
        // base + index
        try {
            return PtrData(Registers::fromName(splits[0]).get(),
                           Registers::fromName(splits[1]).get(), 1, 0);
        } catch (const ParseException &) {
        }

        // base + displacement
        try {
            return PtrData(Registers::fromName(splits[0]).get(), nullptr,
                           1, parseToNumber(splits[1]));
        } catch (const ParseException &) {
        }

        // base + index * scale
        auto splits2 = string::split(splits[1], '*');
        std::transform(splits2.begin(), splits2.end(), splits2.begin(), string::trim);
        if (splits2.size() == 2) {
            try {
                auto scale = parseToNumber(splits2[1]);
                if (scale < 0) {
                    throw ParseException(i18n("ir.op.scale_out_of_range"));
                }

                return PtrData(Registers::fromName(splits[0]).get(),
                               Registers::fromName(splits2[0]).get(), scale, 0);
            } catch (const ParseException &) {
            }
        }
    } else if (splits.size() == 3) {
        // base + index + displacement
        try {
            return PtrData(Registers::fromName(splits[0]).get(),
                           Registers::fromName(splits[1]).get(),
                           1, parseToNumber(splits[2]));
        } catch (const ParseException &) {
        }

        // base + index * scale + displacement
        auto splits2 = string::split(splits[1], '*');
        std::transform(splits2.begin(), splits2.end(), splits2.begin(), string::trim);
        if (splits2.size() == 2) {
            try {
                auto scale = parseToNumber(splits2[1]);
                if (scale < 0) {
                    throw ParseException(i18n("ir.op.scale_out_of_range"));
                }

                return PtrData(Registers::fromName(splits[0]).get(),
                               Registers::fromName(splits2[0]).get(),
                               scale, parseToNumber(splits[2]));
            } catch (const ParseException &) {
            }
        }
    }

    throw ParseException(i18n("ir.op.invalid_ptr"));
}


static __forceinline ValuePtr createImmediate(const std::string &string) {
    return std::make_shared<Immediate>(parseToNumber(string));
}

static __forceinline ValuePtr createPtr(const std::string_view &string) {
    const auto data = parsePtrData(string);
    return std::make_shared<Ptr>(data.base, data.index, data.scale, data.displacement);
}

PURE ValuePtr createValue(const std::string &string) {
    if (string.empty()) {
        throw ParseException(i18n("ir.op.empty_value"));
    }

    if (string.front() == '[' && string.back() == ']') {
        auto fixedStr = string.substr(1, string.length() - 2);
        try {
            return createPtr(fixedStr);
        } catch (const ParseException &e) {
            if (!string::contains(fixedStr, ' ')) {  // TODO 改为白名单isValidSymbol
                return std::make_shared<SymbolPtr>(fixedStr);
            }
            throw e;
        }

    }

    try {
        return Registers::fromName(string);
    } catch (const ParseException &e) {
    }
    try {
        return createImmediate(string);
    } catch (const ParseException &e) {
    }

    return std::make_shared<Symbol>(string);
}
