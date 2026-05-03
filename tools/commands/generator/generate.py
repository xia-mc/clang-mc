from __future__ import annotations

import json
import re
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
SCHEMA_PATH = ROOT / "tools" / "commands" / "schema" / "stage1_commands.json"
ENTITY_LIST_PATH = ROOT / "src" / "resources" / "libmc" / "entity" / "Entities.h"
BINDINGS_DIR = ROOT / "src" / "resources" / "libmc" / "bindings"
ENTITY_TYPES_PATH = ROOT / "src" / "resources" / "libmc" / "entity" / "EntityTypes.h"


def load_schema() -> dict:
    return json.loads(SCHEMA_PATH.read_text(encoding="utf-8"))


def parse_entity_ids() -> list[str]:
    entity_ids: list[str] = []
    pattern = re.compile(r'^\s*X\((ENTITY_[A-Z0-9_]+),\s*"')
    for line in ENTITY_LIST_PATH.read_text(encoding="utf-8").splitlines():
        match = pattern.match(line)
        if match:
            entity_ids.append(match.group(1))
    return entity_ids


def write_if_changed(path: Path, content: str) -> None:
    if path.exists() and path.read_text(encoding="utf-8") == content:
        return
    path.write_text(content, encoding="utf-8", newline="\n")


def entity_type_alias_name(entity_id: str) -> str:
    return entity_id.replace("ENTITY_", "ENTITY_TYPE_", 1)


def render_entity_types(entity_ids: list[str]) -> str:
    aliases = "\n".join(
        f"static const EntityType {entity_type_alias_name(entity_id)} = {entity_id};"
        for entity_id in entity_ids
    )
    return f"""#pragma once

#include "Entities.h"

#ifdef __cplusplus
extern "C" {{
#endif

{aliases}

#ifdef __cplusplus
}}
#endif
"""


def render_enum(enum_spec: dict) -> str:
    values = ",\n    ".join(enum_spec["values"])
    return f"""typedef enum {{
    {values}
}} {enum_spec["name"]};
"""


def render_setblock() -> str:
    return """static inline int
setblock_unsafe(int x, int y, int z, McfString block_name, SetBlockMode mode)
{
    int ret;
    int slot_id;

    slot_id = _McfString_GetSlotId(block_name);
    if (slot_id < 0) {
        return -1;
    }

    switch (mode) {
        case DESTROY:
            __asm volatile (
                "inline data modify storage std:vm s0.block set from storage std:vm mcstr.slots[%4].value\\n"
                "inline execute store result score %0 vm_regs run setblock %1 %2 %3 $(block) destroy"
                : "=r"(ret)
                : "r"(x), "r"(y), "r"(z), "r"(slot_id)
            );
            return ret;
        case KEEP:
            __asm volatile (
                "inline data modify storage std:vm s0.block set from storage std:vm mcstr.slots[%4].value\\n"
                "inline execute store result score %0 vm_regs run setblock %1 %2 %3 $(block) keep"
                : "=r"(ret)
                : "r"(x), "r"(y), "r"(z), "r"(slot_id)
            );
            return ret;
        case REPLACE:
            __asm volatile (
                "inline data modify storage std:vm s0.block set from storage std:vm mcstr.slots[%4].value\\n"
                "inline execute store result score %0 vm_regs run setblock %1 %2 %3 $(block)"
                : "=r"(ret)
                : "r"(x), "r"(y), "r"(z), "r"(slot_id)
            );
            return ret;
        default:
            return -1;
    }
}

static inline int
setblock(Vec3i pos, Block block, SetBlockMode mode)
{
    McfString block_name;

    block_name = Block_EnsureMcfName(block);
    if (block_name == NULL) {
        return -1;
    }
    return setblock_unsafe(pos.x, pos.y, pos.z, block_name, mode);
}
"""


def render_fill() -> str:
    return """static inline int
fill_unsafe(int from_x, int from_y, int from_z,
            int to_x, int to_y, int to_z,
            McfString block_name, FillMode mode)
{
    int ret;
    int slot_id;

    slot_id = _McfString_GetSlotId(block_name);
    if (slot_id < 0) {
        return -1;
    }

    switch (mode) {
        case FILL_DESTROY:
            __asm volatile (
                "inline data modify storage std:vm s0.block set from storage std:vm mcstr.slots[%7].value\\n"
                "inline execute store result score %0 vm_regs run fill %1 %2 %3 %4 %5 %6 $(block) destroy"
                : "=r"(ret)
                : "r"(from_x), "r"(from_y), "r"(from_z),
                  "r"(to_x), "r"(to_y), "r"(to_z), "r"(slot_id)
            );
            return ret;
        case FILL_HOLLOW:
            __asm volatile (
                "inline data modify storage std:vm s0.block set from storage std:vm mcstr.slots[%7].value\\n"
                "inline execute store result score %0 vm_regs run fill %1 %2 %3 %4 %5 %6 $(block) hollow"
                : "=r"(ret)
                : "r"(from_x), "r"(from_y), "r"(from_z),
                  "r"(to_x), "r"(to_y), "r"(to_z), "r"(slot_id)
            );
            return ret;
        case FILL_KEEP:
            __asm volatile (
                "inline data modify storage std:vm s0.block set from storage std:vm mcstr.slots[%7].value\\n"
                "inline execute store result score %0 vm_regs run fill %1 %2 %3 %4 %5 %6 $(block) keep"
                : "=r"(ret)
                : "r"(from_x), "r"(from_y), "r"(from_z),
                  "r"(to_x), "r"(to_y), "r"(to_z), "r"(slot_id)
            );
            return ret;
        case FILL_OUTLINE:
            __asm volatile (
                "inline data modify storage std:vm s0.block set from storage std:vm mcstr.slots[%7].value\\n"
                "inline execute store result score %0 vm_regs run fill %1 %2 %3 %4 %5 %6 $(block) outline"
                : "=r"(ret)
                : "r"(from_x), "r"(from_y), "r"(from_z),
                  "r"(to_x), "r"(to_y), "r"(to_z), "r"(slot_id)
            );
            return ret;
        case FILL_REPLACE:
            __asm volatile (
                "inline data modify storage std:vm s0.block set from storage std:vm mcstr.slots[%7].value\\n"
                "inline execute store result score %0 vm_regs run fill %1 %2 %3 %4 %5 %6 $(block)"
                : "=r"(ret)
                : "r"(from_x), "r"(from_y), "r"(from_z),
                  "r"(to_x), "r"(to_y), "r"(to_z), "r"(slot_id)
            );
            return ret;
        default:
            return -1;
    }
}

static inline int
fill(Vec3i from, Vec3i to, Block block, FillMode mode)
{
    McfString block_name;

    block_name = Block_EnsureMcfName(block);
    if (block_name == NULL) {
        return -1;
    }
    return fill_unsafe(from.x, from.y, from.z, to.x, to.y, to.z, block_name, mode);
}
"""


def render_summon() -> str:
    return """static inline int
summon_unsafe(McfString entity_type_name, McfString x, McfString y, McfString z)
{
    int ret;
    int entity_type_slot;
    int x_slot;
    int y_slot;
    int z_slot;

    entity_type_slot = _McfString_GetSlotId(entity_type_name);
    x_slot = _McfString_GetSlotId(x);
    y_slot = _McfString_GetSlotId(y);
    z_slot = _McfString_GetSlotId(z);
    if (entity_type_slot < 0 || x_slot < 0 || y_slot < 0 || z_slot < 0) {
        return -1;
    }

    __asm volatile (
        "inline data modify storage std:vm s0.entity_type set from storage std:vm mcstr.slots[%1].value\\n"
        "inline data modify storage std:vm s0.x set from storage std:vm mcstr.slots[%2].value\\n"
        "inline data modify storage std:vm s0.y set from storage std:vm mcstr.slots[%3].value\\n"
        "inline data modify storage std:vm s0.z set from storage std:vm mcstr.slots[%4].value\\n"
        "inline execute store result score %0 vm_regs run summon $(entity_type) $(x) $(y) $(z)"
        : "=r"(ret)
        : "r"(entity_type_slot), "r"(x_slot), "r"(y_slot), "r"(z_slot)
    );
    return ret;
}

static inline int
summon(EntityType type, Vec3d pos)
{
    int ret;
    McfString entity_type_name;
    McfString x;
    McfString y;
    McfString z;

    entity_type_name = EntityType_EnsureMcfName(type);
    if (entity_type_name == NULL) {
        return -1;
    }

    x = _Command_FormatDouble(pos.x);
    y = _Command_FormatDouble(pos.y);
    z = _Command_FormatDouble(pos.z);
    if (x == NULL || y == NULL || z == NULL) {
        McfString_Release(x);
        McfString_Release(y);
        McfString_Release(z);
        return -1;
    }

    ret = summon_unsafe(entity_type_name, x, y, z);
    McfString_Release(x);
    McfString_Release(y);
    McfString_Release(z);
    return ret;
}
"""


def render_kill() -> str:
    return """static inline int
kill_unsafe(McfString target_name)
{
    int ret;
    int slot_id;

    slot_id = _McfString_GetSlotId(target_name);
    if (slot_id < 0) {
        return -1;
    }

    __asm volatile (
        "inline data modify storage std:vm s0.target set from storage std:vm mcstr.slots[%1].value\\n"
        "inline execute store result score %0 vm_regs run kill $(target)"
        : "=r"(ret)
        : "r"(slot_id)
    );
    return ret;
}

static inline int
kill(Target target)
{
    McfString target_name;

    target_name = _Command_RequireTargetMcf(target);
    if (target_name == NULL) {
        return -1;
    }
    return kill_unsafe(target_name);
}
"""


def render_tp() -> str:
    return """static inline int
tp_unsafe(McfString target_name, McfString x, McfString y, McfString z)
{
    int ret;
    int target_slot;
    int x_slot;
    int y_slot;
    int z_slot;

    target_slot = _McfString_GetSlotId(target_name);
    x_slot = _McfString_GetSlotId(x);
    y_slot = _McfString_GetSlotId(y);
    z_slot = _McfString_GetSlotId(z);
    if (target_slot < 0 || x_slot < 0 || y_slot < 0 || z_slot < 0) {
        return -1;
    }

    __asm volatile (
        "inline data modify storage std:vm s0.target set from storage std:vm mcstr.slots[%1].value\\n"
        "inline data modify storage std:vm s0.x set from storage std:vm mcstr.slots[%2].value\\n"
        "inline data modify storage std:vm s0.y set from storage std:vm mcstr.slots[%3].value\\n"
        "inline data modify storage std:vm s0.z set from storage std:vm mcstr.slots[%4].value\\n"
        "inline execute store result score %0 vm_regs run tp $(target) $(x) $(y) $(z)"
        : "=r"(ret)
        : "r"(target_slot), "r"(x_slot), "r"(y_slot), "r"(z_slot)
    );
    return ret;
}

static inline int
tp_rot_unsafe(McfString target_name, McfString x, McfString y, McfString z,
              McfString yaw, McfString pitch)
{
    int ret;
    int target_slot;
    int x_slot;
    int y_slot;
    int z_slot;
    int yaw_slot;
    int pitch_slot;

    target_slot = _McfString_GetSlotId(target_name);
    x_slot = _McfString_GetSlotId(x);
    y_slot = _McfString_GetSlotId(y);
    z_slot = _McfString_GetSlotId(z);
    yaw_slot = _McfString_GetSlotId(yaw);
    pitch_slot = _McfString_GetSlotId(pitch);
    if (target_slot < 0 || x_slot < 0 || y_slot < 0 ||
        z_slot < 0 || yaw_slot < 0 || pitch_slot < 0) {
        return -1;
    }

    __asm volatile (
        "inline data modify storage std:vm s0.target set from storage std:vm mcstr.slots[%1].value\\n"
        "inline data modify storage std:vm s0.x set from storage std:vm mcstr.slots[%2].value\\n"
        "inline data modify storage std:vm s0.y set from storage std:vm mcstr.slots[%3].value\\n"
        "inline data modify storage std:vm s0.z set from storage std:vm mcstr.slots[%4].value\\n"
        "inline data modify storage std:vm s0.yaw set from storage std:vm mcstr.slots[%5].value\\n"
        "inline data modify storage std:vm s0.pitch set from storage std:vm mcstr.slots[%6].value\\n"
        "inline execute store result score %0 vm_regs run tp $(target) $(x) $(y) $(z) $(yaw) $(pitch)"
        : "=r"(ret)
        : "r"(target_slot), "r"(x_slot), "r"(y_slot), "r"(z_slot), "r"(yaw_slot), "r"(pitch_slot)
    );
    return ret;
}

static inline int
tp_entity_unsafe(McfString target_name, McfString destination_name)
{
    int ret;
    int target_slot;
    int destination_slot;

    target_slot = _McfString_GetSlotId(target_name);
    destination_slot = _McfString_GetSlotId(destination_name);
    if (target_slot < 0 || destination_slot < 0) {
        return -1;
    }

    __asm volatile (
        "inline data modify storage std:vm s0.target set from storage std:vm mcstr.slots[%1].value\\n"
        "inline data modify storage std:vm s0.destination set from storage std:vm mcstr.slots[%2].value\\n"
        "inline execute store result score %0 vm_regs run tp $(target) $(destination)"
        : "=r"(ret)
        : "r"(target_slot), "r"(destination_slot)
    );
    return ret;
}

static inline int
tp(Target target, Vec3d pos)
{
    int ret;
    McfString target_name;
    McfString x;
    McfString y;
    McfString z;

    target_name = _Command_RequireTargetMcf(target);
    if (target_name == NULL) {
        return -1;
    }

    x = _Command_FormatDouble(pos.x);
    y = _Command_FormatDouble(pos.y);
    z = _Command_FormatDouble(pos.z);
    if (x == NULL || y == NULL || z == NULL) {
        McfString_Release(x);
        McfString_Release(y);
        McfString_Release(z);
        return -1;
    }

    ret = tp_unsafe(target_name, x, y, z);
    McfString_Release(x);
    McfString_Release(y);
    McfString_Release(z);
    return ret;
}

static inline int
tp_rot(Target target, Vec3d pos, Vec2f rot)
{
    int ret;
    McfString target_name;
    McfString x;
    McfString y;
    McfString z;
    McfString yaw;
    McfString pitch;

    target_name = _Command_RequireTargetMcf(target);
    if (target_name == NULL) {
        return -1;
    }

    x = _Command_FormatDouble(pos.x);
    y = _Command_FormatDouble(pos.y);
    z = _Command_FormatDouble(pos.z);
    yaw = _Command_FormatFloat(rot.x);
    pitch = _Command_FormatFloat(rot.y);
    if (x == NULL || y == NULL || z == NULL || yaw == NULL || pitch == NULL) {
        McfString_Release(x);
        McfString_Release(y);
        McfString_Release(z);
        McfString_Release(yaw);
        McfString_Release(pitch);
        return -1;
    }

    ret = tp_rot_unsafe(target_name, x, y, z, yaw, pitch);
    McfString_Release(x);
    McfString_Release(y);
    McfString_Release(z);
    McfString_Release(yaw);
    McfString_Release(pitch);
    return ret;
}

static inline int
tp_entity(Target target, Target destination)
{
    McfString target_name;
    McfString destination_name;

    target_name = _Command_RequireTargetMcf(target);
    destination_name = _Command_RequireTargetMcf(destination);
    if (target_name == NULL || destination_name == NULL) {
        return -1;
    }
    return tp_entity_unsafe(target_name, destination_name);
}
"""


def render_say() -> str:
    return """static inline int
say_unsafe(McfString text)
{
    int ret;
    int slot_id;

    slot_id = _McfString_GetSlotId(text);
    if (slot_id < 0) {
        return -1;
    }

    __asm volatile (
        "inline data modify storage std:vm s0.text set from storage std:vm mcstr.slots[%1].value\\n"
        "inline execute store result score %0 vm_regs run say $(text)"
        : "=r"(ret)
        : "r"(slot_id)
    );
    return ret;
}

static inline int
say(String text)
{
    McfString text_mcf;

    text_mcf = _Command_RequireStringMcf(text);
    if (text_mcf == NULL) {
        return -1;
    }
    return say_unsafe(text_mcf);
}
"""


def render_tellraw() -> str:
    return """static inline int
tellraw_unsafe(McfString target_name, McfString json_text)
{
    int ret;
    int target_slot;
    int json_slot;

    target_slot = _McfString_GetSlotId(target_name);
    json_slot = _McfString_GetSlotId(json_text);
    if (target_slot < 0 || json_slot < 0) {
        return -1;
    }

    __asm volatile (
        "inline data modify storage std:vm s0.target set from storage std:vm mcstr.slots[%1].value\\n"
        "inline data modify storage std:vm s0.json set from storage std:vm mcstr.slots[%2].value\\n"
        "inline execute store result score %0 vm_regs run tellraw $(target) $(json)"
        : "=r"(ret)
        : "r"(target_slot), "r"(json_slot)
    );
    return ret;
}

static inline int
tellraw(Target target, String json)
{
    McfString target_name;
    McfString json_text;

    target_name = _Command_RequireTargetMcf(target);
    json_text = _Command_RequireStringMcf(json);
    if (target_name == NULL || json_text == NULL) {
        return -1;
    }
    return tellraw_unsafe(target_name, json_text);
}
"""


RENDERERS = {
    "setblock": render_setblock,
    "fill": render_fill,
    "summon": render_summon,
    "kill": render_kill,
    "tp": render_tp,
    "say": render_say,
    "tellraw": render_tellraw,
}


def render_header(command: dict) -> str:
    enums = "\n".join(render_enum(enum_spec) for enum_spec in command.get("enums", []))
    body = RENDERERS[command["kind"]]()
    return f"""#pragma once

/* Generated by tools/commands/generator/generate.py. */

#include "bindings/CommandSupport.h"

{enums}
#ifdef __cplusplus
extern "C" {{
#endif

{body}
#ifdef __cplusplus
}}
#endif
"""


def main() -> None:
    schema = load_schema()
    entity_ids = parse_entity_ids()
    write_if_changed(ENTITY_TYPES_PATH, render_entity_types(entity_ids))
    for command in schema["commands"]:
        write_if_changed(BINDINGS_DIR / command["header"], render_header(command))


if __name__ == "__main__":
    main()
