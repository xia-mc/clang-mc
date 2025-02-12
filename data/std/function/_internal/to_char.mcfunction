# 函数原型：void to_char()
# to_char的内部辅助实现
# 特别的，使用Minecraft数据包函数调用协议
# 在Minecraft函数的原型：int char_at(String string)
# 调用者需要确保字符串长度为1；函数本身不会检查这点
# 当无法解析时，Minecraft函数协议返回-1

data modify storage std:vm s3 set value {left: "", right: ""}
$data modify storage std:vm s3.left set from storage std:vm str_heap[$(string)]

# Python脚本生成的代码
data modify storage std:vm s3.right set value "\\t"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 9

data modify storage std:vm s3.right set value "\\n"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 10

data modify storage std:vm s3.right set value "\\x0b"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 11

data modify storage std:vm s3.right set value "\\x0c"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 12

data modify storage std:vm s3.right set value "\\r"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 13

data modify storage std:vm s3.right set value " "
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 32

data modify storage std:vm s3.right set value "!"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 33

data modify storage std:vm s3.right set value "\""
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 34

data modify storage std:vm s3.right set value "#"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 35

data modify storage std:vm s3.right set value "$"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 36

data modify storage std:vm s3.right set value "%"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 37

data modify storage std:vm s3.right set value "&"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 38

data modify storage std:vm s3.right set value "'"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 39

data modify storage std:vm s3.right set value "("
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 40

data modify storage std:vm s3.right set value ")"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 41

data modify storage std:vm s3.right set value "*"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 42

data modify storage std:vm s3.right set value "+"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 43

data modify storage std:vm s3.right set value ","
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 44

data modify storage std:vm s3.right set value "-"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 45

data modify storage std:vm s3.right set value "."
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 46

data modify storage std:vm s3.right set value "/"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 47

data modify storage std:vm s3.right set value "0"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 48

data modify storage std:vm s3.right set value "1"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 49

data modify storage std:vm s3.right set value "2"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 50

data modify storage std:vm s3.right set value "3"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 51

data modify storage std:vm s3.right set value "4"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 52

data modify storage std:vm s3.right set value "5"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 53

data modify storage std:vm s3.right set value "6"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 54

data modify storage std:vm s3.right set value "7"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 55

data modify storage std:vm s3.right set value "8"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 56

data modify storage std:vm s3.right set value "9"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 57

data modify storage std:vm s3.right set value ":"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 58

data modify storage std:vm s3.right set value ";"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 59

data modify storage std:vm s3.right set value "<"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 60

data modify storage std:vm s3.right set value "="
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 61

data modify storage std:vm s3.right set value ">"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 62

data modify storage std:vm s3.right set value "?"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 63

data modify storage std:vm s3.right set value "@"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 64

data modify storage std:vm s3.right set value "A"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 65

data modify storage std:vm s3.right set value "B"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 66

data modify storage std:vm s3.right set value "C"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 67

data modify storage std:vm s3.right set value "D"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 68

data modify storage std:vm s3.right set value "E"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 69

data modify storage std:vm s3.right set value "F"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 70

data modify storage std:vm s3.right set value "G"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 71

data modify storage std:vm s3.right set value "H"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 72

data modify storage std:vm s3.right set value "I"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 73

data modify storage std:vm s3.right set value "J"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 74

data modify storage std:vm s3.right set value "K"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 75

data modify storage std:vm s3.right set value "L"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 76

data modify storage std:vm s3.right set value "M"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 77

data modify storage std:vm s3.right set value "N"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 78

data modify storage std:vm s3.right set value "O"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 79

data modify storage std:vm s3.right set value "P"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 80

data modify storage std:vm s3.right set value "Q"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 81

data modify storage std:vm s3.right set value "R"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 82

data modify storage std:vm s3.right set value "S"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 83

data modify storage std:vm s3.right set value "T"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 84

data modify storage std:vm s3.right set value "U"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 85

data modify storage std:vm s3.right set value "V"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 86

data modify storage std:vm s3.right set value "W"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 87

data modify storage std:vm s3.right set value "X"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 88

data modify storage std:vm s3.right set value "Y"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 89

data modify storage std:vm s3.right set value "Z"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 90

data modify storage std:vm s3.right set value "["
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 91

data modify storage std:vm s3.right set value "\\"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 92

data modify storage std:vm s3.right set value "]"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 93

data modify storage std:vm s3.right set value "^"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 94

data modify storage std:vm s3.right set value "_"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 95

data modify storage std:vm s3.right set value "`"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 96

data modify storage std:vm s3.right set value "a"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 97

data modify storage std:vm s3.right set value "b"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 98

data modify storage std:vm s3.right set value "c"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 99

data modify storage std:vm s3.right set value "d"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 100

data modify storage std:vm s3.right set value "e"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 101

data modify storage std:vm s3.right set value "f"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 102

data modify storage std:vm s3.right set value "g"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 103

data modify storage std:vm s3.right set value "h"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 104

data modify storage std:vm s3.right set value "i"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 105

data modify storage std:vm s3.right set value "j"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 106

data modify storage std:vm s3.right set value "k"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 107

data modify storage std:vm s3.right set value "l"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 108

data modify storage std:vm s3.right set value "m"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 109

data modify storage std:vm s3.right set value "n"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 110

data modify storage std:vm s3.right set value "o"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 111

data modify storage std:vm s3.right set value "p"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 112

data modify storage std:vm s3.right set value "q"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 113

data modify storage std:vm s3.right set value "r"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 114

data modify storage std:vm s3.right set value "s"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 115

data modify storage std:vm s3.right set value "t"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 116

data modify storage std:vm s3.right set value "u"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 117

data modify storage std:vm s3.right set value "v"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 118

data modify storage std:vm s3.right set value "w"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 119

data modify storage std:vm s3.right set value "x"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 120

data modify storage std:vm s3.right set value "y"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 121

data modify storage std:vm s3.right set value "z"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 122

data modify storage std:vm s3.right set value "{"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 123

data modify storage std:vm s3.right set value "|"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 124

data modify storage std:vm s3.right set value "}"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 125

data modify storage std:vm s3.right set value "~"
function std:_internal/equals_const with storage std:vm s3
execute if score rax vm_regs matches 1 run return 126

return -1
