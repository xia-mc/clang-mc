//
// Created by xia__mc on 2025/2/24.
//

#include "OpCommon.h"
#include "ir/values/HeapPtr.h"
#include "i18n/I18n.h"

static i32 parseToNumber(const std::string_view &string) {
    assert(!string.empty());

    // 字符串（"AB"）或字符（'A'）
    if (string.front() == '"' && string.back() == '"' && string.size() > 2) {
        std::string_view content = string.substr(1, string.size() - 2); // 去掉引号
        if (content.size() > 4) {
            throw ParseException(i18n("ir.op.out_of_range"));
        }
        int32_t result = 0;
        for (size_t i = 0; i < content.size(); ++i) {
            result |= (static_cast<uint8_t>(content[i]) << (i * 8)); // 小端存储字面量
        }
        return result;
    } else if (string.front() == '\'' && string.back() == '\'' && string.size() == 3) {
        return static_cast<int32_t>(string[1]); // 单字符
    }

    // 解析进制
    int base = 10;
    size_t offset = 0;

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
    std::string_view numStr = string;
    if (string.back() == 'b' && string.size() > 1) {
        base = 2;
        numStr = numStr.substr(0, numStr.size() - 1);
    } else if (string.back() == 'o' && string.size() > 1) {
        base = 8;
        numStr = numStr.substr(0, numStr.size() - 1);
    }

    // 解析数字
    i32 result;
    auto [ptr, ec] = std::from_chars(
            numStr.data() + offset, numStr.data() + numStr.size(), result, base);

    if (ec == std::errc::invalid_argument || ptr != numStr.data() + numStr.size()) {
        throw std::invalid_argument("Invalid number format");
    }
    if (ec == std::errc::result_out_of_range) {
        throw ParseException(i18n("ir.op.out_of_range"));
    }
    return result;
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
    } catch (const std::invalid_argument &) {
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
        } catch (const std::invalid_argument &) {
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
        } catch (const std::invalid_argument &) {
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
            } catch (const std::invalid_argument &) {
            } catch (const ParseException &) {
            }
        }
    } else if (splits.size() == 3) {
        // base + index + displacement
        try {
            return PtrData(Registers::fromName(splits[0]).get(),
                           Registers::fromName(splits[1]).get(),
                           1, parseToNumber(splits[2]));
        } catch (const std::invalid_argument &) {
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
            } catch (const std::invalid_argument &) {
            } catch (const ParseException &) {
            }
        }
    }

    throw ParseException(i18n("ir.op.invalid_ptr"));
}


static __forceinline ValuePtr createImmediate(const std::string &string) {
    return std::make_shared<Immediate>(parseToNumber(string));
}

static __forceinline ValuePtr createHeapPtr(const std::string_view &string) {
    const auto data = parsePtrData(string);
    return std::make_shared<HeapPtr>(data.base, data.index, data.scale, data.displacement);
}

PURE ValuePtr createValue(const std::string &string) {
    if (string.empty()) {
        throw ParseException(i18n("ir.op.empty_value"));
    }

    if (string.front() == '[' && string.back() == ']') {
        return createHeapPtr(string.substr(1, string.size() - 2));
    }

    try {
        return Registers::fromName(string);
    } catch (const ParseException &e) {
        try {
            return createImmediate(string);
        } catch (const std::invalid_argument &) {
            throw e;
        }
    }
}
