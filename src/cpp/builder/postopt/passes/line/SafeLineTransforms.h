//
// Created by Codex on 2026/5/1.
//

#ifndef CLANG_MC_SAFELINETRANSFORMS_H
#define CLANG_MC_SAFELINETRANSFORMS_H

#include <string>

namespace postopt {

[[nodiscard]] std::string optimizeLine(std::string_view line);

[[nodiscard]] std::string optimizeLines(std::string_view code);

}  // namespace postopt

#endif //CLANG_MC_SAFELINETRANSFORMS_H
