#include <minecraft.h>
#include <stdio.h>

int main(void) {
    Target player;
    McfString name;
    char buf[64];
    int before;
    int after;

    player = Target_FromLiteral("CodexBot");
    if (player == 0)
        return 100;
    name = Target_GetMcf(player);
    before = _McfString_GetSlotId(name);

    snprintf(buf, sizeof(buf), "%.17g", 2.5);
    snprintf(buf, sizeof(buf), "%.17g", 82.0);
    snprintf(buf, sizeof(buf), "%.17g", 2.5);

    name = Target_GetMcf(player);
    after = _McfString_GetSlotId(name);
    Target_Release(player);

    if (before != 0)
        return 110 + before;
    if (after != 0)
        return 120 + after;
    return 0;
}
