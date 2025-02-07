# 函数原型：void find(String string, char target, int start, int stringLength)
# find的内部辅助实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：int find()
# 返回target的下标，未找到则返回-1

scoreboard players operation t1 vm_regs = r1 vm_regs
scoreboard players operation t2 vm_regs = r2 vm_regs

# 展开4次，尽量避免stack overflow
scoreboard players operation r1 vm_regs = t2 vm_regs
function std:string/char_at
execute if score rax vm_regs = t1 vm_regs run return run scoreboard players get t2 vm_regs

scoreboard players add t2 vm_regs 1
execute if score t2 vm_regs = r3 vm_regs run return -1
scoreboard players operation r1 vm_regs = t2 vm_regs
function std:string/char_at
execute if score rax vm_regs = t1 vm_regs run return run scoreboard players get t2 vm_regs

scoreboard players add t2 vm_regs 1
execute if score t2 vm_regs = r3 vm_regs run return -1
scoreboard players operation r1 vm_regs = t2 vm_regs
function std:string/char_at
execute if score rax vm_regs = t1 vm_regs run return run scoreboard players get t2 vm_regs

scoreboard players add t2 vm_regs 1
execute if score t2 vm_regs = r3 vm_regs run return -1
scoreboard players operation r1 vm_regs = t2 vm_regs
function std:string/char_at
execute if score rax vm_regs = t1 vm_regs run return run scoreboard players get t2 vm_regs

scoreboard players add t2 vm_regs 1
execute if score t2 vm_regs = r3 vm_regs run return -1
function std:_internal/find
