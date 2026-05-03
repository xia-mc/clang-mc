#pragma once

#include "block/Block.h"
#include "entity/EntityTypes.h"
#include "util/Target.h"
#include "util/math/vec.h"

static inline McfString
_Command_NewLiteral(const char *literal)
{
    return McfString_FromLiteral(literal);
}

static inline McfString
_Command_RequireStringMcf(String src)
{
    if (String_EnsureMcf(src) != 0) {
        return NULL;
    }
    return _String_GetMcf(src);
}

static inline McfString
_Command_RequireTargetMcf(Target target)
{
    return Target_GetMcf(target);
}

static inline McfString
_Command_FormatDouble(double value)
{
    return McfString_FromDouble(value);
}

static inline McfString
_Command_FormatFloat(float value)
{
    return McfString_FromFloat(value);
}

static inline int
_Command_AppendStringLiteral(McfString dst, const char *literal)
{
    return McfString_AppendLiteral(dst, literal);
}

static inline int
_Command_AppendStringObject(McfString dst, String src)
{
    const char *text;

    if (dst == NULL || src == NULL) {
        return -1;
    }
    text = String_CStr(src);
    if (text == NULL) {
        return -1;
    }
    return McfString_AppendCString(dst, text);
}

static inline int
_Command_AppendTarget(McfString dst, Target target)
{
    const char *text;

    if (dst == NULL || target == NULL) {
        return -1;
    }
    text = Target_CStr(target);
    if (text == NULL) {
        return -1;
    }
    return McfString_AppendCString(dst, text);
}

static inline int
_Command_AppendBlock(McfString dst, Block block)
{
    McfString block_name;

    if (dst == NULL) {
        return -1;
    }
    block_name = Block_EnsureMcfName(block);
    if (block_name == NULL) {
        return -1;
    }
    return McfString_AppendCString(dst, McfString_CStr(block_name));
}

static inline int
_Command_AppendEntityType(McfString dst, EntityType type)
{
    McfString type_name;

    if (dst == NULL) {
        return -1;
    }
    type_name = EntityType_EnsureMcfName(type);
    if (type_name == NULL) {
        return -1;
    }
    return McfString_AppendCString(dst, McfString_CStr(type_name));
}

static inline int
_Command_AppendVec3i(McfString dst, Vec3i value)
{
    if (dst == NULL) {
        return -1;
    }
    if (McfString_AppendInt(dst, value.x) != 0) {
        return -1;
    }
    if (McfString_AppendLiteral(dst, " ") != 0) {
        return -1;
    }
    if (McfString_AppendInt(dst, value.y) != 0) {
        return -1;
    }
    if (McfString_AppendLiteral(dst, " ") != 0) {
        return -1;
    }
    return McfString_AppendInt(dst, value.z);
}

static inline int
_Command_AppendVec3d(McfString dst, Vec3d value)
{
    if (dst == NULL) {
        return -1;
    }
    if (McfString_AppendDouble(dst, value.x) != 0) {
        return -1;
    }
    if (McfString_AppendLiteral(dst, " ") != 0) {
        return -1;
    }
    if (McfString_AppendDouble(dst, value.y) != 0) {
        return -1;
    }
    if (McfString_AppendLiteral(dst, " ") != 0) {
        return -1;
    }
    return McfString_AppendDouble(dst, value.z);
}

static inline int
_Command_AppendVec2f(McfString dst, Vec2f value)
{
    if (dst == NULL) {
        return -1;
    }
    if (McfString_AppendFloat(dst, value.x) != 0) {
        return -1;
    }
    if (McfString_AppendLiteral(dst, " ") != 0) {
        return -1;
    }
    return McfString_AppendFloat(dst, value.y);
}

static inline int
_Command_ExecAndRelease(McfString cmd)
{
    int ret;

    if (cmd == NULL) {
        return -1;
    }
    ret = McfString_Exec(cmd);
    McfString_Release(cmd);
    return ret;
}
