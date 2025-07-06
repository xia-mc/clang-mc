//
// Created by xia__mc on 2025/2/23.
//

#ifndef CLANG_MC_VERIFYRESULT_H
#define CLANG_MC_VERIFYRESULT_H

#include "utils/Common.h"
#include "ir/iops/CallLike.h"

struct SymbolOp {
    std::string_view name;
    Op *op;
};

class VerifyResult {
private:
    const HashMap<Hash, SymbolOp> definedSymbols;
    const HashSet<Hash> unusedSymbols;
    const HashMap<Hash, Label *> definedLabels;
    const HashMap<Hash, std::vector<CallLike *>> undefinedLabels;
    const HashSet<Hash> unusedLabels;
public:
    explicit VerifyResult(HashMap<Hash, SymbolOp> &&definedSymbols,
                          HashSet<Hash> &&unusedSymbols,
                          HashMap<Hash, Label *> &&definedLabels,
                          HashMap<Hash, std::vector<CallLike *>> &&undefinedLabels,
                          HashSet<Hash> &&unusedLabels) noexcept
            : definedSymbols(std::move(definedSymbols)),
            unusedSymbols(std::move(unusedSymbols)),
            definedLabels(std::move(definedLabels)),
            undefinedLabels(std::move(undefinedLabels)),
            unusedLabels(std::move(unusedLabels)) {
    }

    GETTER(DefinedSymbols, definedSymbols);

    GETTER(UnusedSymbols, unusedSymbols);

    GETTER(DefinedLabels, definedLabels);

    GETTER(UndefinedLabels, undefinedLabels);

    GETTER(UnusedLabels, unusedLabels);
};

#endif //CLANG_MC_VERIFYRESULT_H
