//
// Created by Codex on 2026/5/1.
//

#ifndef CLANG_MC_LINECLEANUPPASS_H
#define CLANG_MC_LINECLEANUPPASS_H

#include <string>

namespace postopt {

[[nodiscard]] std::string cleanupFunctionText(std::string_view code);

}  // namespace postopt

#endif //CLANG_MC_LINECLEANUPPASS_H
