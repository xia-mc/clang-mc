# 函数原型：int find(String string, char target)
# 返回target的下标，未找到则返回-1

scoreboard players set r2 vm_regs 0
function std:string/get_length
scoreboard players operation r3 vm_regs = rax vm_regs

execute store result score rax vm_regs run function std:_internal/find
