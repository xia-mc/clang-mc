# 初始化虚拟机资源

# 整数寄存器
scoreboard objectives add vm_regs dummy
# 函数返回值 caller-saved
scoreboard players set rax vm_regs 0
# 栈指针（未实现）
scoreboard players set rsp vm_regs 0
# 程序计数器（未实现）
scoreboard players set rip vm_regs 0
# 字符串常量池指针
scoreboard players set rpp vm_regs 0
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
# 专用临时寄存器 caller-saved
scoreboard players set t1 vm_regs 0
# 专用临时寄存器 caller-saved
scoreboard players set t2 vm_regs 0
# 专用临时寄存器 caller-saved
scoreboard players set t3 vm_regs 0

# 复杂存储
# list[int] 堆空间
data modify storage std:vm heap set value []
# 字符串常量池（用于优化字符串）
data modify storage std:vm str_pool set value []
# 字符串常量池中的大小（池中每个字符串的大小）
data modify storage std:vm str_size_pool set value []
# 复杂参数1或临时寄存器 caller-saved
data modify storage std:vm r4 set value {}
# 复杂参数2或临时寄存器 caller-saved
data modify storage std:vm r5 set value {}
# 专用临时寄存器 caller-saved
data modify storage std:vm t4 set value {}
# 专用临时寄存器 caller-saved
data modify storage std:vm t5 set value {}
