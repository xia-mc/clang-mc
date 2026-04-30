execute store result score t0 vm_regs run data get storage std:vm mcstr.free_head
execute if score t0 vm_regs matches 0.. run data modify storage std:vm s6.id set from storage std:vm mcstr.free_head
execute if score t0 vm_regs matches 0.. run function std:_internal/mcstr_alloc_reuse with storage std:vm s6
execute if score t0 vm_regs matches ..-1 run function std:_internal/mcstr_alloc_new with storage std:vm s6
