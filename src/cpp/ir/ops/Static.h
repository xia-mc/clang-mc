//
// Created by xia__mc on 2025/7/4.
//

#ifndef CLANG_MC_STATIC_H
#define CLANG_MC_STATIC_H

#include "ir/iops/Op.h"
#include "ir/iops/Special.h"
#include "utils/string/StringUtils.h"
#include "ir/OpCommon.h"
#include "objects/Int.h"
#include "utils/Stream.h"


class Static : public Special {
private:
    std::string name;
    Hash nameHash;
    std::vector<i32> data;
public:
    explicit Static(const i32 lineNumber, std::string name, std::vector<i32> &&data) noexcept:
            Op("static", lineNumber), name(std::move(name)), nameHash(hash(this->name)), data(std::move(data)) {
    }

    [[nodiscard]] std::string toString() const noexcept override {
        return fmt::format(
                "static {} [{}]",
                name, string::join(stream::map(data, FUNC_WITH(std::to_string)), ", "));
    }

    GETTER(Name, name)

    GETTER_POD(NameHash, nameHash);

    GETTER(Data, data);
};

#endif //CLANG_MC_STATIC_H
