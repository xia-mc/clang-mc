# 初始化虚拟机资源
scoreboard objectives add vm_regs dummy
scoreboard objectives remove vm_regs
scoreboard objectives add vm_regs dummy

# 寄存器
# 函数返回值 caller-saved
scoreboard players set rax vm_regs 0
# 栈指针
scoreboard players set rsp vm_regs 0
# 参数1或临时寄存器 caller-saved
scoreboard players set r0 vm_regs 0
# 参数2或临时寄存器 caller-saved
scoreboard players set r1 vm_regs 0
# 参数3或临时寄存器 caller-saved
scoreboard players set r2 vm_regs 0
# 参数4或临时寄存器 caller-saved
scoreboard players set r3 vm_regs 0
# 专用临时寄存器 caller-saved
scoreboard players set t0 vm_regs 0
scoreboard players set t1 vm_regs 0
scoreboard players set t2 vm_regs 0
scoreboard players set t3 vm_regs 0
# VM内部保留寄存器
# 程序计数器（未实现）
scoreboard players set rip vm_regs 0
# 堆大小
scoreboard players set shp vm_regs 0
# 字符串堆大小
scoreboard players set spp vm_regs 0
# 字符串堆空闲空间指针
scoreboard players set sap vm_regs 0
scoreboard players set s0 vm_regs 0
scoreboard players set s1 vm_regs 0

# 复杂存储
# list[int] 栈空间
data modify storage std:vm stack set value []
# list[int] 堆空间
data modify storage std:vm heap set value []
# 字符串堆（用于优化字符串）
data modify storage std:vm str_heap set value []
# 字符串堆中的空闲空间（用于优化字符串）
data modify storage std:vm str_available_space set value []
# 字符串堆中的大小（池中每个字符串的大小）
data modify storage std:vm str_size_heap set value []
# VM内部保留
data modify storage std:vm s2 set value {}
data modify storage std:vm s3 set value {}
data modify storage std:vm s4 set value {}
data modify storage std:vm s5 set value {}
data modify storage std:vm s6 set value {}


# 初始化堆
scoreboard players set r0 vm_regs 64
function std:heap/expand
scoreboard players set r0 vm_regs 0
