//
// Created by xia__mc on 2025/3/13.
//

#ifndef CLANG_MC_JMPTABLE_H
#define CLANG_MC_JMPTABLE_H

#include "ir/IRCommon.h"
#include "ir/ops/Label.h"

#define LABEL_RET "__internel_ret"

namespace {
    static inline std::string_view LABEL_RET_CMD = "function " LABEL_RET;
}

class JmpTable {
private:
    const std::vector<OpPtr> &values;
    const LabelMap &labelMap;
    JmpMap jmpMap = JmpMap();

    // 缓存data，以优化空间复杂度
    std::vector<std::string> data;
    std::string_view *dataView = nullptr;
public:
    explicit JmpTable(const std::vector<OpPtr> &values, const LabelMap &labelMap) noexcept:
            values(values), labelMap(labelMap) {
        jmpMap.emplace(hash(LABEL_RET), std::span<std::string_view>(&LABEL_RET_CMD, LABEL_RET_CMD.size()));
    }

    ~JmpTable() {
        free(dataView);
    }

    void make();

    GETTER(JmpMap, jmpMap);
};


#endif //CLANG_MC_JMPTABLE_H
