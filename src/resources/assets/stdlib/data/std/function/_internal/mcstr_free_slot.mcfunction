$data modify storage std:vm mcstr.slots[$(id)].value set value ""
$data modify storage std:vm mcstr.slots[$(id)].refcnt set value 0
$data modify storage std:vm mcstr.slots[$(id)].flags set value 0
$data modify storage std:vm mcstr.slots[$(id)].next set from storage std:vm mcstr.free_head
$data modify storage std:vm mcstr.free_head set value $(id)
