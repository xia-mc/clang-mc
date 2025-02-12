import string

TEMPLATE = """
data modify storage vm:vm r4.right set value "%CHAR%"
function std:_internal/equals_const with storage vm:vm r4
execute if score rax vm_regs matches 1 run return %NUMBER%"""

for char in sorted(string.printable, key=ord):
    escaped_char = repr(char)[1:-1]  # 去掉 repr() 生成的引号
    if escaped_char[0] == "\\":  # mcfunction语法转义
        escaped_char = "\\" + escaped_char
    print(TEMPLATE.replace("%CHAR%", escaped_char).replace("%NUMBER%", str(ord(char))))
