import string

TEMPLATE_S2C = """
# 字符串常量映射 不要修改此映射，该映射由脚本生成
data modify storage std:vm str2char_map set value %S2C_MAP%"""

TEMPLATE_C2S = f"""
%IF%
jmp .c_{ord('?')}
%VAL%"""

TEMPLATE_C2S_IF = f"""je r1, %ORD%, .c_%ORD%"""
TEMPLATE_C2S_VAL = f""".c_%ORD%:
inline data modify storage std:vm s3.next set value "%CHAR%"
ret"""

s2cMap = {}
c2sMap = {}
for char in sorted(string.printable, key=ord):
    escaped_char = repr(char)[1:-1]  # 去掉 repr() 生成的引号
    # if escaped_char[0] == "\\":  # mcfunction语法转义
    #     escaped_char = "\\" + escaped_char
    s2cMap[escaped_char] = ord(char)
    c2sMap[str(ord(char))] = escaped_char
print(TEMPLATE_S2C
      .replace("%S2C_MAP%", repr(s2cMap))
      .replace("'\"'", '"\\""')
      .replace(", '", ', "')
      .replace("': ", '": ')
      .replace("', ", '", ')
      .replace(": '", ': "')
      .replace("'}", '"}')
      .replace("{'", '{"')
)
print(TEMPLATE_C2S
      .replace("%IF%", "\n".join(map(lambda c: TEMPLATE_C2S_IF
                                     .replace("%ORD%", c)
                                     , c2sMap.keys())))
      .replace("%VAL%", "\n".join(map(lambda data: TEMPLATE_C2S_VAL
                                      .replace("%ORD%", data[0])
                                      .replace("%CHAR%", data[1].replace("\"", '\\"'))
                                      , c2sMap.items())))
)
