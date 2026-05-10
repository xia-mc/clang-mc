#include <minecraft.h>

int main(void) {
    Vec3i block_pos = {1, 2, 3};
    Vec3d entity_pos = {4.5, 5.5, 6.5};
    Vec2f rot = {90.0f, 0.0f};

    if (TARGET_PLAYERS == 0)
        return 101;
    if (block_pos.x != 1 || block_pos.y != 2 || block_pos.z != 3)
        return 102;
    if (!(entity_pos.x > 4.0 && entity_pos.y > 5.0 && entity_pos.z > 6.0))
        return 103;
    if (!(rot.x > 89.0f && rot.y < 1.0f))
        return 104;

    return 0;
}
