//
// Created by xia__mc on 2025/2/19.
//

#include <execution>
#include "Verifier.h"
#include "ir/ops/CallLike.h"
#include "ir/ops/Nop.h"
#include "ir/ops/CmpLike.h"

void Verifier::verify() {
    for (auto& ir : irs) {
        [[maybe_unused]] auto _ = handleSingle(ir);  // 如果是C风格include，就不需要考虑这个
    }

    if (errors != 0) {
        throw ParseException(i18nFormat("ir.errors_generated", errors));
    }
}

/**
 * 从start开始找下一个label，没找到返回ops.size()
 */
__forceinline size_t findNextLabel(const std::vector<OpPtr> &ops, size_t start) {
    size_t i = start;
    for (; i < ops.size(); ++i) {
        if (INSTANCEOF(ops[i], Label)) {
            break;
        }
    }
    return i;
}

VerifyResult Verifier::handleSingle(IR &ir) {
    auto &ops = ir.getValues();

    auto definedLabels = HashMap<Hash, Label *>();
    auto undefinedLabels = HashMap<Hash, std::vector<CallLike *>>();  // label hash, 使用label的地方
    auto unusedLabels = HashSet<Hash>();

    if (ops.empty()) {
        return VerifyResult(std::move(definedLabels), std::move(undefinedLabels), std::move(unusedLabels));
    }

    static const auto reportUnreachable = [&](const int start) {
        const auto firstLabel = findNextLabel(ops, start);

        warn(i18n("ir.verify.unreachable"));
        note(i18n("ir.verify.unreachable_before"), &ir, ops[firstLabel - 1].get());

        // 避免后续编译时预期的代码流非法
        for (size_t i = 0; i < firstLabel; ++i) {
            ops[i] = std::make_unique<Nop>(0);
        }
    };

    currentIR = &ir;
    if (const auto &op = ops[0]) {
        currentOp = op.get();
        if (!INSTANCEOF(op, Label)) {
            reportUnreachable(1);
        }
    }

    bool unreachable = false;
    for (size_t i = 0; i < ops.size(); ++i) {
        const auto &op = ops[i];
        currentOp = op.get();

        if (const auto labelOp = INSTANCEOF(op, Label)) {
            unreachable = false;
            const auto label = labelOp->getLabelHash();

            if (definedLabels.contains(label)) {
                error(i18nFormat("ir.verify.label_redefinition", labelOp->getLabel()));
                note(i18n("ir.verify.previous_definition"), &ir, definedLabels[label]);
            } else {
                // 防止后续报错更加混乱
                definedLabels.emplace(label, labelOp);
            }

            if (!undefinedLabels.erase(label) && !labelOp->getExport()) {
                unusedLabels.emplace(label);
            }

            if (labelOp->getExtern()) {
                unreachable = true;
            }
            continue;
        }

        if (unreachable) {
            warn(i18n("ir.verify.unreachable"));
            const auto nextLabel = findNextLabel(ops, i + 1);
            note(i18n("ir.verify.unreachable_before"), &ir, ops[nextLabel - 1].get());
            unreachable = false;  // 防止报一连串的unreachable
        }

        if (const auto callLike = INSTANCEOF(op, CallLike)) {
            const auto label = callLike->getLabelHash();

            if (definedLabels.contains(label)) {
                unusedLabels.erase(label);
                if (INSTANCEOF(op, Jmp) && definedLabels[label]->getExtern()) {
                    warn(i18n("ir.verify.jmp_to_extern"));
                    note(i18n("ir.verify.previous_definition"), &ir, definedLabels[label]);
                }
            } else {
                undefinedLabels[label].push_back(callLike);
            }
        }

        if (isTerminate(op)) {
            unreachable = true;
        }
    }

    for (const auto &data: undefinedLabels.values()) {
        for (const auto op: data.second) {
            error(i18nFormat("ir.verify.undeclared_label", op->getLabel()), &ir, op);
        }
    }

    for (const auto &label: unusedLabels) {
        const auto labelOp = definedLabels[label];
        warn(i18nFormat("ir.verify.unused_label", labelOp->getLabel()), &ir, labelOp);
    }

    return VerifyResult(std::move(definedLabels), std::move(undefinedLabels), std::move(unusedLabels));
}

void Verifier::error(const std::string &message, const IR *ir, const Op *op) {
    logger->error(createIRMessage(ir->getFileDisplay(), op->getLineNumber(),
                                  ir->getSource(op), message));
    errors++;
}

void Verifier::warn(const std::string &message, const IR *ir, const Op *op) {
    // TODO Werror
    const auto lineNumber = op->getLineNumber();
    if (lineNumber > 0) {
        logger->warn(createIRMessage(ir->getFileDisplay(), lineNumber,
                                     ir->getSource(op), message));
    }
}

void Verifier::note(const std::string &message, const IR *ir, const Op *op) {
    const auto lineNumber = op->getLineNumber();
    if (lineNumber > 0) {
        logger->info(createIRMessage(ir->getFileDisplay(), lineNumber,
                                     ir->getSource(op), message));
    }
}
