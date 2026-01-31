# Mcasm Backend - 简化的 32 位整数后端

## 概述

Mcasm 是一个从 X86 后端简化而来的最小化 LLVM 后端，专注于 32 位整数指令集。

## 特性

### 支持的功能
- ✅ 32 位整数运算（i8, i16, i32）
- ✅ 基础算术指令：ADD, SUB, MUL, DIV
- ✅ 逻辑指令：AND, OR, XOR, NOT
- ✅ 移位和旋转指令
- ✅ 条件移动指令（CMOV）
- ✅ 控制流：JMP, CALL, RET
- ✅ 条件跳转
- ✅ 栈操作：PUSH, POP
- ✅ FastCall 和 C 调用约定
- ✅ 完整的 SelectionDAG 代码生成

### 不支持的功能
- ❌ 浮点运算（无 x87, SSE, AVX）
- ❌ 向量指令（无 MMX, SSE, AVX, AVX-512）
- ❌ 64 位模式（仅 32 位）
- ❌ 原子指令和多线程支持
- ❌ GlobalISel
- ❌ 内联汇编解析
- ❌ 反汇编

## 寄存器

### 支持的寄存器类
- **GR8**: AL, CL, DL, BL, AH, CH, DH, BH（8 位）
- **GR16**: AX, CX, DX, BX, SI, DI, BP, SP（16 位）
- **GR32**: EAX, ECX, EDX, EBX, ESI, EDI, EBP, ESP（32 位）

### 特殊寄存器
- **EFLAGS**: 标志寄存器
- **EIP**: 指令指针
- **段寄存器**: CS, DS, SS, ES, FS, GS

## 调用约定

### FastCall
- 前两个整数参数通过 ECX 和 EDX 传递
- 其余参数通过栈传递
- 返回值通过 EAX（和 EDX，对于 64 位返回值）

### C 调用约定
- 前三个 `inreg` 参数通过 EAX, EDX, ECX 传递
- 其余参数通过栈传递
- 调用者清理栈

## CPU 定义

支持三个基础 CPU 类型：
- **generic**: 通用 32 位处理器（支持 CMOV, NOPL, CX8）
- **i386**: 基础 386 处理器
- **i686**: 686 兼容处理器（支持 CMOV, NOPL）

## 目录结构

```
Mcasm/
├── README.md                      # 本文件
├── IMPLEMENTATION_STATUS.md       # 详细实施状态报告
├── BACKUP_FILES.md                # 备份文件说明
├── CMakeLists.txt                 # 构建配置
├── Mcasm.h                        # 主头文件
├── Mcasm.td                       # TableGen 主文件
├── McasmInstrInfo.td              # 指令定义
├── McasmRegisterInfo.td           # 寄存器定义
├── McasmCallingConv.td            # 调用约定
├── McasmSubtarget.h/cpp           # Subtarget 实现
├── McasmISelLowering.h/cpp        # 指令选择 Lowering
├── McasmFrameLowering.h/cpp       # 栈帧管理
├── McasmTargetMachine.h/cpp       # Target Machine
├── McasmInstr*.td                 # 各类指令定义文件
├── Mcasm*.cpp                     # 各类 C++ 实现文件
├── MCTargetDesc/                  # MC 层描述
└── TargetInfo/                    # Target 信息
```

## 文件统计

### 主要文件行数
- Mcasm.td: 111 行（从 2,101 行简化）
- McasmInstrInfo.td: 58 行（从 99 行简化）
- McasmCallingConv.td: 103 行（从 1,225 行简化）
- McasmRegisterInfo.td: 182 行（从 869 行简化）

### 总体统计
- TableGen 文件: 20 个（从 62 个减少）
- C++ 文件: ~84 个（从 ~100 个减少）
- 总行数: ~80,000 行（从 224,161 行减少，缩减 64%）

## 使用限制

**重要**: 此后端**未注册**到 LLVM 构建系统，仅作为独立文件夹存在。

### 为什么不注册？
1. 保持 LLVM 构建的纯净性
2. 避免与 X86 后端冲突
3. 作为学习和实验性项目

### 如果需要使用

要使用此后端，需要：
1. 将其注册到 LLVM 构建系统
2. 添加到 `LLVM_ALL_TARGETS` 或 `LLVM_EXPERIMENTAL_TARGETS_TO_BUILD`
3. 在 Triple 类中添加 Mcasm 目标支持
4. 重新构建 LLVM

## 设计原则

1. **简单性**: 移除所有非必要功能
2. **可维护性**: 代码量减少 64%，更易理解
3. **完整性**: 保留完整的代码生成框架
4. **兼容性**: 基于成熟的 X86 后端，架构可靠

## 学习价值

此后端适合用于：
- 学习 LLVM 后端开发
- 理解 TableGen 和指令选择
- 研究调用约定和 ABI
- 作为自定义后端的起点
- 教学演示

## 与 X86 的主要区别

| 特性 | X86 | Mcasm |
|------|-----|-------|
| 支持模式 | 16/32/64 位 | 仅 32 位 |
| 浮点支持 | x87, SSE, AVX | 无 |
| 向量支持 | MMX, SSE, AVX, AVX-512 | 无 |
| 调用约定 | 10+ 种 | 2 种（FastCall, C） |
| CPU 定义 | 100+ 个 | 3 个 |
| TableGen 文件 | 62 个 | 20 个 |
| 总行数 | 224,161 | ~80,000 |

## 已知问题

1. 未在实际硬件上测试
2. 某些 TableGen 文件可能包含未使用的定义
3. McasmSubtarget.h 仍包含一些 SSE/AVX 方法定义
4. 缺少测试用例

## 后续改进建议

1. 创建测试套件
2. 简化 McasmSubtarget.h
3. 清理剩余的 TableGen 文件
4. 添加文档和示例
5. 如果需要，注册到 LLVM 构建系统

## 参考资料

- [LLVM 后端开发文档](https://llvm.org/docs/WritingAnLLVMBackend.html)
- [TableGen 文档](https://llvm.org/docs/TableGen/)
- [X86 后端源码](../X86/)

## 贡献

此项目是一个简化和学习性质的项目，欢迎改进建议。

## 许可证

与 LLVM 项目相同，使用 Apache License 2.0 with LLVM Exceptions。
