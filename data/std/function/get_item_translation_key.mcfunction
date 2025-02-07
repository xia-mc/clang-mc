# 函数原型：String get_item_translation_key(String itemName)
# 获取一个物品的翻译键。
# 函数默认参数是有效的物品命名空间名称

function std:alloc_str {string: ":", length: 1}

# 找到冒号
scoreboard players operation r1 vm_regs = rax vm_regs
function std:string/find
# 此时rax为冒号的下标

# 释放资源
scoreboard players operation t0 vm_regs = r0 vm_regs
scoreboard players operation r0 vm_regs = r1 vm_regs
function std:free_str
scoreboard players operation r0 vm_regs = t0 vm_regs

# 获取字符串长度
function std:string/get_length
scoreboard players operation t0 vm_regs = rax vm_regs

# 获取物品名的后半段
# 此时rax为冒号的下标，t0为字符串长度
scoreboard players operation r1 vm_regs = rax vm_regs
scoreboard players operation r2 vm_regs = t0 vm_regs
function std:string/substring
# 此时rax为物品名的后半段（如diamond_sword）

# 拼接字符串
scoreboard players operation r1 vm_regs = rax vm_regs
# 创建前缀
function std:alloc_str {string: "item.minecraft", length: 14}
scoreboard players operation r0 vm_regs = rax vm_regs
scoreboard players operation t1 vm_regs = rax vm_regs
function std:string/merge_string
# 此时rax为结果

# 释放资源
scoreboard players operation r0 vm_regs = t1 vm_regs
function std:free_str
