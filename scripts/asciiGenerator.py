import string

TEMPLATE = """
# 字符串常量映射 不要修改此映射，该映射由脚本生成
data modify storage std:vm str2char_map set value %S2C_MAP%
data modify storage std:vm char2str_map set value %C2S_MAP%"""

s2cMap = {}
c2sMap = {}
for char in sorted(string.printable, key=ord):
    escaped_char = repr(char)[1:-1]  # 去掉 repr() 生成的引号
    # if escaped_char[0] == "\\":  # mcfunction语法转义
    #     escaped_char = "\\" + escaped_char
    s2cMap[escaped_char] = ord(char)
    c2sMap[str(ord(char))] = escaped_char
print(TEMPLATE
      .replace("%S2C_MAP%", repr(s2cMap))
      .replace("%C2S_MAP%", repr(c2sMap))
      .replace("'\"'", '"\\""')
      .replace(", '", ', "')
      .replace("': ", '": ')
      .replace("', ", '", ')
      .replace(": '", ': "')
      .replace("'}", '"}')
      .replace("{'", '{"')
)
