#include <minecraft.h>

int main(void) {
    McfString entity_type;
    McfString x;
    McfString y;
    McfString z;
    int entity_type_slot;
    int x_slot;
    int y_slot;
    int z_slot;
    int r;

    entity_type = McfString_FromLiteral("minecraft:armor_stand");
    entity_type_slot = _McfString_GetSlotId(entity_type);
    x = McfString_FromLiteral("2.5");
    x_slot = _McfString_GetSlotId(x);
    y = McfString_FromLiteral("82");
    y_slot = _McfString_GetSlotId(y);
    z = McfString_FromLiteral("2.5");
    z_slot = _McfString_GetSlotId(z);
    if (entity_type_slot < 0 || x_slot < 0 || y_slot < 0 || z_slot < 0)
        return 100;

    r = summon_unsafe(entity_type_slot, x_slot, y_slot, z_slot);
    return r == 1 ? 0 : 110 + r;
}
