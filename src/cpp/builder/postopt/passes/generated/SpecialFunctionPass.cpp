//
// Created by Codex on 2026/5/1.
//

#include "SpecialFunctionPass.h"
#include <string_view>

namespace postopt {

static inline constexpr std::string_view LABEL_BIT_SHR = "# label: \"__bit_shr\"";
static inline constexpr std::string_view LABEL_BIT_SHR_B31 = "# label: \"__bit_shr.isB31\"";

static inline constexpr std::string_view FIXED_BIT_SHR = R"(execute if score r1 vm_regs matches 0 run return run function a:o
execute if score r1 vm_regs matches 31 run return run function a:p
scoreboard players operation t0 vm_regs = r0 vm_regs
scoreboard players operation r0 vm_regs = r1 vm_regs
function a:a
scoreboard players operation t1 vm_regs = rax vm_regs
return run function a:n)";

static inline constexpr std::string_view FIXED_BIT_SHR_B31 = R"(execute if score r0 vm_regs matches 0..2147483647 run return 0
scoreboard players set rax vm_regs 1
return 1)";

bool replaceGeneratedSpecialFunction(std::string &code) {
    if (code.find(LABEL_BIT_SHR) != std::string::npos) {
        code = FIXED_BIT_SHR;
        return true;
    }
    if (code.find(LABEL_BIT_SHR_B31) != std::string::npos) {
        code = FIXED_BIT_SHR_B31;
        return true;
    }
    return false;
}

}  // namespace postopt
