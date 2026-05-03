//
// Created by Codex on 2026/5/1.
//

#ifndef CLANG_MC_SPECIALFUNCTIONPASS_H
#define CLANG_MC_SPECIALFUNCTIONPASS_H

#include <string>

namespace postopt {

[[nodiscard]] bool replaceGeneratedSpecialFunction(std::string &code);

}  // namespace postopt

#endif //CLANG_MC_SPECIALFUNCTIONPASS_H
