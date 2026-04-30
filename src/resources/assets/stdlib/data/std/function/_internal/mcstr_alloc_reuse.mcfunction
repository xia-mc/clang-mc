$execute store result score rax vm_regs run data get storage std:vm s6.id
$data modify storage std:vm mcstr.free_head set from storage std:vm mcstr.slots[$(id)].next
$data modify storage std:vm mcstr.slots[$(id)] set value {value: "", refcnt: 0, next: -1, flags: 0}
