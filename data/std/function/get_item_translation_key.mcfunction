# 函数原型：String get_item_translation_key(String itemName)
# 获取一个物品的翻译键。
# 函数默认参数是有效的字符串指针

# 查找冒号在itemName的下标
# 冒号的ascii为58
function std:stack/push_r0
scoreboard players set r1 vm_regs 58
function std:string/find

# 没找到就清理资源返回
# rax已经是-1，不用再设置
execute if score rax vm_regs matches -1 run function std:stack/pop_ignore
execute if score rax vm_regs matches -1 run return 0

# 获取itemName长度
function std:stack/peek_r0
function std:stack/push_rax
function std:string/get_length

# 分割物品名，如diamond
scoreboard players operation r2 vm_regs = rax vm_regs
function std:stack/pop_r1
scoreboard players add r1 vm_regs 1
function std:stack/pop_r0
function std:string/substring
function std:stack/push_rax

# 拼接字符串，alloc_str为特殊函数，不会影响rax以外的寄存器
scoreboard players operation r1 vm_regs = rax vm_regs
function std:string/alloc_str {string: "item.minecraft.", length: 14}
function std:stack/push_rax
scoreboard players operation r0 vm_regs = rax vm_regs
function std:string/merge_string

# 释放资源，free_str为特殊函数，不会影响寄存器
# 底下这两个注释掉的代码，取消注释哪一个都会莫名其妙爆炸
function std:stack/pop_r0
function std:string/free_str
function std:stack/pop_r0
function std:string/free_str

# 此时rax为merge_string的结果，直接返回
