# 测试获取翻译键

function std:string/alloc_str {string: "minecraft:diamond_sword", length: 23}

function std:stack/push_rax
scoreboard players operation r0 vm_regs = rax vm_regs
function std:get_item_translation_key
function std:stack/push_rax

scoreboard players operation r0 vm_regs = rax vm_regs
function std:string/print

# 清理资源
function std:stack/pop_r0
function std:string/free_str
function std:stack/pop_r0
function std:string/free_str
