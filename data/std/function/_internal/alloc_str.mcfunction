# 函数原型：String alloc_str()
# alloc_str的内部辅助实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：int alloc_str(NBTString string, int length)
# 从缓存的字符串堆可用空间里取一个
# s2寄存器有Minecarft函数入参

scoreboard players remove sap vm_regs 1

$data modify storage std:vm s2 set value {string: "$(string)", length: $(length), sap: -1, result: -1}
execute store result storage std:vm s2.sap int 1 run scoreboard players get sap vm_regs

function std:_internal/alloc_str2 with storage std:vm s2

return 0
