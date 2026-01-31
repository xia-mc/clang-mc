# Mcasm 后端 - 备份文件说明

## 备份文件列表

在简化过程中，对以下关键文件创建了备份：

1. **Mcasm.td.bak**
   - 原始行数：2,101 行
   - 简化后：111 行
   - 说明：完全重写了主 TableGen 文件，移除了所有 SSE/AVX 特性和 100+ 个 CPU 定义

2. **McasmCallingConv.td.bak**
   - 原始行数：1,225 行
   - 简化后：103 行
   - 说明：仅保留了 FastCall 和 C 调用约定，移除了所有浮点和 64 位调用约定

3. **McasmRegisterInfo.td.bak**
   - 原始行数：869 行
   - 简化后：182 行
   - 说明：仅保留 32 位整数寄存器，移除了 XMM/YMM/ZMM 和 64 位寄存器

4. **McasmSubtarget.h.bak**
   - 原始行数：435 行
   - 当前状态：未简化
   - 说明：仅做了备份，未进行简化（与自动生成的代码耦合）

## 如何恢复备份

如果需要恢复任何原始文件：

```bash
cd llvm/lib/Target/Mcasm

# 恢复 Mcasm.td
cp Mcasm.td.bak Mcasm.td

# 恢复 McasmCallingConv.td
cp McasmCallingConv.td.bak McasmCallingConv.td

# 恢复 McasmRegisterInfo.td
cp McasmRegisterInfo.td.bak McasmRegisterInfo.td

# 恢复 McasmSubtarget.h
cp McasmSubtarget.h.bak McasmSubtarget.h
```

## 删除的文件（无备份）

以下文件已被永久删除，没有创建备份：

### 子目录（完全删除）
- `AsmParser/` - 包含约 3 个文件
- `Disassembler/` - 包含约 2 个文件
- `MCA/` - 包含约 14 个文件
- `GISel/` - 包含约 5 个文件

### C++ 文件（16 个）
- McasmFloatingPoint.cpp
- McasmLowerAMXType.cpp
- McasmLowerAMXIntrinsics.cpp
- McasmTileConfig.cpp
- McasmFastTileConfig.cpp
- McasmFastPreTileConfig.cpp
- McasmPreTileConfig.cpp
- McasmLowerTileCopy.cpp
- McasmVZeroUpper.cpp
- McasmCompressEVEX.cpp
- McasmDomainReassignment.cpp
- McasmInstrFMA3Info.cpp
- McasmInterleavedAccess.cpp
- McasmPartialReduction.cpp
- McasmShuffleDecodeConstantPool.cpp
- McasmInstCombineIntrinsic.cpp

### TableGen 文件（42 个）
- McasmInstrFPStack.td
- McasmInstrSSE.td
- McasmInstrAVX512.td
- McasmInstrAVX10.td
- McasmInstrMMX.td
- McasmInstr3DNow.td
- McasmInstrFMA.td
- McasmInstrFragmentsSIMD.td
- McasmInstrVecCompiler.td
- McasmInstrXOP.td
- McasmInstrTBM.td
- McasmInstrAMX.td
- McasmInstrKL.td
- McasmInstrRAOINT.td
- McasmInstrVMX.td
- McasmInstrSVM.td
- McasmInstrSNP.td
- McasmInstrTSX.td
- McasmInstrSGX.td
- McasmInstrTDX.td
- McasmInstrGISel.td
- McasmCombine.td
- McasmRegisterBanks.td
- McasmSched*.td (15 个调度模型文件)
- McasmSchedule*.td

## 如何完全恢复

如果需要完全恢复到原始 X86 后端：

```bash
cd llvm/lib/Target

# 1. 删除 Mcasm 目录
rm -rf Mcasm

# 2. 重新从 X86 复制
cp -r X86 Mcasm

# 注意：这会丢失所有 Mcasm 的修改
```

## 保留原始 X86 后端

原始的 X86 后端仍然完整保留在 `llvm/lib/Target/X86/` 目录中，未受任何影响。
