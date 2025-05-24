//
// Created by xia__mc on 2025/2/19.
//

#ifndef CLANG_MC_VERIFIER_H
#define CLANG_MC_VERIFIER_H

#include "ir/IRCommon.h"
#include "ir/IR.h"
#include "VerifyResult.h"
#include "ir/ops/Ret.h"
#include "ir/ops/Jmp.h"


class Verifier {
private:
    const Logger &logger;
    std::vector<IR> &irs;

    const IR *currentIR = nullptr;
    const Op *currentOp = nullptr;
    u32 errors = 0;

    VerifyResult handleSingle(IR &ir);

    void error(const std::string &message, const IR *ir, const Op *op);

    __forceinline void error(const std::string &message) {
        return error(message, currentIR, currentOp);
    }

    void warn(const std::string &message, const IR *ir, const Op *op);

    __forceinline void warn(const std::string &message) {
        return warn(message, currentIR, currentOp);
    }

    void note(const std::string &message, const IR *ir, const Op *op);

public:
    explicit Verifier(const Logger &logger, std::vector<IR> &irs) :
            logger(logger), irs(irs) {
    }

    void verify();
};


#endif //CLANG_MC_VERIFIER_H
