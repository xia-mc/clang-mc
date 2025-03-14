//
// Created by xia__mc on 2025/2/23.
//

#ifndef CLANG_MC_VERIFYRESULT_H
#define CLANG_MC_VERIFYRESULT_H

#include "utils/Common.h"
#include "ir/ops/JmpLike.h"

class VerifyResult {
private:
    const HashMap<Hash, Label *> definedLabels;
    const HashMap<Hash, std::vector<JmpLike *>> undefinedLabels;
    const HashSet<Hash> unusedLabels;
public:
    explicit VerifyResult(HashMap<Hash, Label *> &&definedLabels, HashMap<Hash, std::vector<JmpLike *>> &&undefinedLabels,
                          HashSet<Hash> &&unusedLabels) noexcept
            : definedLabels(std::move(definedLabels)), undefinedLabels(std::move(undefinedLabels)),
              unusedLabels(std::move(unusedLabels)) {
    }

    GETTER(DefinedLabels, definedLabels);

    GETTER(UndefinedLabels, undefinedLabels);

    GETTER(UnusedLabels, unusedLabels);
};

#endif //CLANG_MC_VERIFYRESULT_H
