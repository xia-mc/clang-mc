//===- McasmInstrCompiler.td - Compiler Pseudos and Patterns -*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file describes the various pseudo instructions used by the compiler,
// as well as Pat patterns used during instruction selection.
//
//===----------------------------------------------------------------------===//
//
// NOTE: Mcasm backend only supports 32-bit mode. Although this file contains
// 64-bit instruction definitions, they are NOT used during code generation.
// They are kept for framework compatibility only.

//===----------------------------------------------------------------------===//
// Pattern Matching Support

def GetLo32XForm : SDNodeXForm<imm, [{
  // Transformation function: get the low 32 bits.
  return getI32Imm((uint32_t)N->getZExtValue(), SDLoc(N));
}]>;


//===----------------------------------------------------------------------===//
// Random Pseudo Instructions.

// PIC base construction.  This expands to code that looks like this:
//     call  $next_inst
//     popl %destreg"
let hasSideEffects = 0, isNotDuplicable = 1, Uses = [rsp] in
  def MOVPC32r : Ii32<0xE8, Pseudo, (outs GR32:$reg), (ins i32imm:$label),
                      "", []>;

// ADJCALLSTACKDOWN/UP implicitly use/def rsp because they may be expanded into
// a stack adjustment and the codegen must know that they may modify the stack
// pointer before prolog-epilog rewriting occurs.
// Pessimistically assume ADJCALLSTACKDOWN / ADJCALLSTACKUP will become
// sub / add which can clobber EFLAGS.
let Defs = [rsp, EFLAGS], Uses = [rsp] in {
def ADJCALLSTACKDOWN32 : I<0, Pseudo, (outs),
                           (ins i32imm:$amt1, i32imm:$amt2, i32imm:$amt3),
                           "#ADJCALLSTACKDOWN", []>, Requires<[NotLP64]>;
def ADJCALLSTACKUP32   : I<0, Pseudo, (outs), (ins i32imm:$amt1, i32imm:$amt2),
                           "#ADJCALLSTACKUP",
                           [(Mcasmcallseq_end timm:$amt1, timm:$amt2)]>,
                           Requires<[NotLP64]>;
}
def : Pat<(Mcasmcallseq_start timm:$amt1, timm:$amt2),
       (ADJCALLSTACKDOWN32 i32imm:$amt1, i32imm:$amt2, 0)>, Requires<[NotLP64]>;


// MCASM NOTE: 64-bit not supported
// // ADJCALLSTACKDOWN/UP implicitly use/def RSP because they may be expanded into
// MCASM NOTE: 64-bit not supported
// // a stack adjustment and the codegen must know that they may modify the stack
// MCASM NOTE: 64-bit not supported
// // pointer before prolog-epilog rewriting occurs.
// MCASM NOTE: 64-bit not supported
// // Pessimistically assume ADJCALLSTACKDOWN / ADJCALLSTACKUP will become
// MCASM NOTE: 64-bit not supported
// // sub / add which can clobber EFLAGS.
// MCASM NOTE: 64-bit not supported
// let Defs = [RSP, EFLAGS, SSP], Uses = [RSP, SSP], SchedRW = [WriteALU] in {
// MCASM NOTE: 64-bit not supported
// def ADJCALLSTACKDOWN64 : I<0, Pseudo, (outs),
// MCASM NOTE: 64-bit not supported
//                            (ins i32imm:$amt1, i32imm:$amt2, i32imm:$amt3),
// MCASM NOTE: 64-bit not supported
//                            "#ADJCALLSTACKDOWN", []>, Requires<[IsLP64]>;
// MCASM NOTE: 64-bit not supported
// def ADJCALLSTACKUP64   : I<0, Pseudo, (outs), (ins i32imm:$amt1, i32imm:$amt2),
// MCASM NOTE: 64-bit not supported
//                            "#ADJCALLSTACKUP",
// MCASM NOTE: 64-bit not supported
//                            [(Mcasmcallseq_end timm:$amt1, timm:$amt2)]>,
// MCASM NOTE: 64-bit not supported
//                            Requires<[IsLP64]>;
// MCASM NOTE: 64-bit not supported
// }
// MCASM NOTE: 64-bit not supported
// def : Pat<(Mcasmcallseq_start timm:$amt1, timm:$amt2),
// MCASM NOTE: 64-bit not supported
//         (ADJCALLSTACKDOWN64 i32imm:$amt1, i32imm:$amt2, 0)>, Requires<[IsLP64]>;
// MCASM NOTE: 64-bit not supported
//
// MCASM_DISABLED: // SchedRW removed for mcasm (no scheduling model)
// MCASM_DISABLED: // let SchedRW = [WriteSystem] in {
// MCASM_DISABLED: 
// MCASM_DISABLED: // x86-64 va_start lowering magic.
// MCASM_DISABLED: let hasSideEffects = 1, mayStore = 1, Defs = [EFLAGS] in {
// MCASM_DISABLED: def VASTART_SAVE_XMM_REGS : I<0, Pseudo,
// MCASM_DISABLED:                               (outs),
// MCASM_DISABLED:                               (ins GR8:$al, i8mem:$regsavefi, variable_ops),
// MCASM_DISABLED:                               "#VASTART_SAVE_XMM_REGS $al, $regsavefi",
// MCASM_DISABLED:                               [(Mcasmvastart_save_xmm_regs GR8:$al, addr:$regsavefi)]>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: let usesCustomInserter = 1, Defs = [EFLAGS] in {
// MCASM_DISABLED: // The VAARG_64 and VAARG_X32 pseudo-instructions take the address of the
// MCASM_DISABLED: // va_list, and place the address of the next argument into a register.
// MCASM_DISABLED: let Defs = [EFLAGS] in {
// MCASM_DISABLED: def VAARG_64 : I<0, Pseudo,
// MCASM_DISABLED:                  (outs GR64:$dst),
// MCASM_DISABLED:                  (ins i8mem:$ap, i32imm:$size, i8imm:$mode, i32imm:$align),
// MCASM_DISABLED:                  "#VAARG_64 $dst, $ap, $size, $mode, $align",
// MCASM_DISABLED:                  [(set GR64:$dst,
// MCASM_DISABLED:                     (Mcasmvaarg64 addr:$ap, timm:$size, timm:$mode, timm:$align))]>,
// MCASM_DISABLED:                Requires<[In64BitMode, IsLP64]>;
// MCASM_DISABLED: def VAARG_X32 : I<0, Pseudo,
// MCASM_DISABLED:                  (outs GR32:$dst),
// MCASM_DISABLED:                  (ins i8mem:$ap, i32imm:$size, i8imm:$mode, i32imm:$align),
// MCASM_DISABLED:                  "#VAARG_X32 $dst, $ap, $size, $mode, $align",
// MCASM_DISABLED:                  [(set GR32:$dst,
// MCASM_DISABLED:                     (Mcasmvaargx32 addr:$ap, timm:$size, timm:$mode, timm:$align))]>,
// MCASM_DISABLED:                 Requires<[In64BitMode, NotLP64]>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: // When using segmented stacks these are lowered into instructions which first
// MCASM_DISABLED: // check if the current stacklet has enough free memory. If it does, memory is
// MCASM_DISABLED: // allocated by bumping the stack pointer. Otherwise memory is allocated from
// MCASM_DISABLED: // the heap.
// MCASM_DISABLED: 
// MCASM_DISABLED: let Defs = [EAX, ESP, EFLAGS], Uses = [ESP] in
// MCASM_DISABLED: def SEG_ALLOCA_32 : I<0, Pseudo, (outs GR32:$dst), (ins GR32:$size),
// MCASM_DISABLED:                       "# variable sized alloca for segmented stacks",
// MCASM_DISABLED:                       [(set GR32:$dst,
// MCASM_DISABLED:                          (McasmSegAlloca GR32:$size))]>,
// MCASM_DISABLED:                     Requires<[NotLP64]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: let Defs = [RAX, RSP, EFLAGS], Uses = [RSP] in
// MCASM_DISABLED: def SEG_ALLOCA_64 : I<0, Pseudo, (outs GR64:$dst), (ins GR64:$size),
// MCASM_DISABLED:                       "# variable sized alloca for segmented stacks",
// MCASM_DISABLED:                       [(set GR64:$dst,
// MCASM_DISABLED:                          (McasmSegAlloca GR64:$size))]>,
// MCASM_DISABLED:                     Requires<[In64BitMode]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // To protect against stack clash, dynamic allocation should perform a memory
// MCASM_DISABLED: // probe at each page.
// MCASM_DISABLED: 
// MCASM_DISABLED: let Defs = [EAX, ESP, EFLAGS], Uses = [ESP] in
// MCASM_DISABLED: def PROBED_ALLOCA_32 : I<0, Pseudo, (outs GR32:$dst), (ins GR32:$size),
// MCASM_DISABLED:                       "# variable sized alloca with probing",
// MCASM_DISABLED:                       [(set GR32:$dst,
// MCASM_DISABLED:                          (McasmProbedAlloca GR32:$size))]>,
// MCASM_DISABLED:                     Requires<[NotLP64]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: let Defs = [RAX, RSP, EFLAGS], Uses = [RSP] in
// MCASM_DISABLED: def PROBED_ALLOCA_64 : I<0, Pseudo, (outs GR64:$dst), (ins GR64:$size),
// MCASM_DISABLED:                       "# variable sized alloca with probing",
// MCASM_DISABLED:                       [(set GR64:$dst,
// MCASM_DISABLED:                          (McasmProbedAlloca GR64:$size))]>,
// MCASM_DISABLED:                     Requires<[In64BitMode]>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: let hasNoSchedulingInfo = 1 in
// MCASM_DISABLED: def STACKALLOC_W_PROBING : I<0, Pseudo, (outs), (ins i64imm:$stacksize),
// MCASM_DISABLED:                              "# fixed size alloca with probing",
// MCASM_DISABLED:                              []>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // Dynamic stack allocation yields a _chkstk or _alloca call for all Windows
// MCASM_DISABLED: // targets.  These calls are needed to probe the stack when allocating more than
// MCASM_DISABLED: // 4k bytes in one go. Touching the stack at 4K increments is necessary to
// MCASM_DISABLED: // ensure that the guard pages used by the OS virtual memory manager are
// MCASM_DISABLED: // allocated in correct sequence.
// MCASM_DISABLED: // The main point of having separate instruction are extra unmodelled effects
// MCASM_DISABLED: // (compared to ordinary calls) like stack pointer change.
// MCASM_DISABLED: 
// MCASM_DISABLED: let Defs = [EAX, ESP, EFLAGS], Uses = [ESP] in
// MCASM_DISABLED: def DYN_ALLOCA_32 : I<0, Pseudo, (outs), (ins GR32:$size),
// MCASM_DISABLED:                      "# dynamic stack allocation",
// MCASM_DISABLED:                      [(McasmDynAlloca GR32:$size)]>,
// MCASM_DISABLED:                      Requires<[NotLP64]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: let Defs = [RAX, RSP, EFLAGS], Uses = [RSP] in
// MCASM_DISABLED: def DYN_ALLOCA_64 : I<0, Pseudo, (outs), (ins GR64:$size),
// MCASM_DISABLED:                      "# dynamic stack allocation",
// MCASM_DISABLED:                      [(McasmDynAlloca GR64:$size)]>,
// MCASM_DISABLED:                      Requires<[In64BitMode]>;
// MCASM_DISABLED: } // SchedRW
// MCASM_DISABLED: 
// MCASM_DISABLED: // These instructions XOR the frame pointer into a GPR. They are used in some
// MCASM_DISABLED: // stack protection schemes. These are post-RA pseudos because we only know the
// MCASM_DISABLED: // frame register after register allocation.
// MCASM_DISABLED: let Constraints = "$src = $dst", isMoveImm = 1, isPseudo = 1, Defs = [EFLAGS] in {
// MCASM_DISABLED:   def XOR32_FP : I<0, Pseudo, (outs GR32:$dst), (ins GR32:$src),
// MCASM_DISABLED:                   "xorl\t$$FP, $src", []>,
// MCASM_DISABLED:                   Requires<[NotLP64]>, Sched<[WriteALU]>;
// MCASM_DISABLED:   def XOR64_FP : I<0, Pseudo, (outs GR64:$dst), (ins GR64:$src),
// MCASM_DISABLED:                   "xorq\t$$FP $src", []>,
// MCASM_DISABLED:                   Requires<[In64BitMode]>, Sched<[WriteALU]>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: //===----------------------------------------------------------------------===//
// MCASM_DISABLED: // EH Pseudo Instructions
// MCASM_DISABLED: //
// MCASM_DISABLED: let SchedRW = [WriteSystem] in {
// MCASM_DISABLED: let isTerminator = 1, isReturn = 1, isBarrier = 1,
// MCASM_DISABLED:     hasCtrlDep = 1, isCodeGenOnly = 1 in {
// MCASM_DISABLED: def EH_RETURN   : I<0xC3, RawFrm, (outs), (ins GR32:$addr),
// MCASM_DISABLED:                     "ret\t#eh_return, addr: $addr",
// MCASM_DISABLED:                     [(Mcasmehret GR32:$addr)]>, Sched<[WriteJumpLd]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: let isTerminator = 1, isReturn = 1, isBarrier = 1,
// MCASM_DISABLED:     hasCtrlDep = 1, isCodeGenOnly = 1 in {
// MCASM_DISABLED: def EH_RETURN64   : I<0xC3, RawFrm, (outs), (ins GR64:$addr),
// MCASM_DISABLED:                      "ret\t#eh_return, addr: $addr",
// MCASM_DISABLED:                      [(Mcasmehret GR64:$addr)]>, Sched<[WriteJumpLd]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: let isTerminator = 1, hasSideEffects = 1, isBarrier = 1, hasCtrlDep = 1,
// MCASM_DISABLED:     isCodeGenOnly = 1, isReturn = 1, isEHScopeReturn = 1 in {
// MCASM_DISABLED:   def CLEANUPRET : I<0, Pseudo, (outs), (ins), "# CLEANUPRET",
// MCASM_DISABLED:                      [(cleanupret bb)]>;
// MCASM_DISABLED: 
// MCASM_DISABLED:   // CATCHRET needs a custom inserter for SEH.
// MCASM_DISABLED:   let usesCustomInserter = 1 in
// MCASM_DISABLED:     def CATCHRET : I<0, Pseudo, (outs), (ins brtarget32:$dst, brtarget32:$from),
// MCASM_DISABLED:                      "# CATCHRET",
// MCASM_DISABLED:                      [(catchret bb:$dst, bb:$from)]>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: let hasSideEffects = 1, isBarrier = 1, isCodeGenOnly = 1,
// MCASM_DISABLED:     usesCustomInserter = 1 in {
// MCASM_DISABLED:   def EH_SjLj_SetJmp32  : I<0, Pseudo, (outs GR32:$dst), (ins i32mem:$buf),
// MCASM_DISABLED:                             "#EH_SJLJ_SETJMP32",
// MCASM_DISABLED:                             [(set GR32:$dst, (Mcasmeh_sjlj_setjmp addr:$buf))]>,
// MCASM_DISABLED:                           Requires<[Not64BitMode]>;
// MCASM_DISABLED:   def EH_SjLj_SetJmp64  : I<0, Pseudo, (outs GR32:$dst), (ins i64mem:$buf),
// MCASM_DISABLED:                             "#EH_SJLJ_SETJMP64",
// MCASM_DISABLED:                             [(set GR32:$dst, (Mcasmeh_sjlj_setjmp addr:$buf))]>,
// MCASM_DISABLED:                           Requires<[In64BitMode]>;
// MCASM_DISABLED:   let isTerminator = 1 in {
// MCASM_DISABLED:   def EH_SjLj_LongJmp32 : I<0, Pseudo, (outs), (ins i32mem:$buf),
// MCASM_DISABLED:                             "#EH_SJLJ_LONGJMP32",
// MCASM_DISABLED:                             [(Mcasmeh_sjlj_longjmp addr:$buf)]>,
// MCASM_DISABLED:                           Requires<[Not64BitMode]>;
// MCASM_DISABLED:   def EH_SjLj_LongJmp64 : I<0, Pseudo, (outs), (ins i64mem:$buf),
// MCASM_DISABLED:                             "#EH_SJLJ_LONGJMP64",
// MCASM_DISABLED:                             [(Mcasmeh_sjlj_longjmp addr:$buf)]>,
// MCASM_DISABLED:                           Requires<[In64BitMode]>;
// MCASM_DISABLED:   }
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: let isBranch = 1, isTerminator = 1, isCodeGenOnly = 1 in {
// MCASM_DISABLED:   def EH_SjLj_Setup : I<0, Pseudo, (outs), (ins brtarget:$dst),
// MCASM_DISABLED:                         "#EH_SjLj_Setup\t$dst", []>;
// MCASM_DISABLED: }
// MCASM_DISABLED: } // SchedRW
// MCASM_DISABLED: 
// MCASM_DISABLED: //===----------------------------------------------------------------------===//
// MCASM_DISABLED: // Pseudo instructions used by unwind info.
// MCASM_DISABLED: //
// MCASM_DISABLED: 
// MCASM_DISABLED: // Prolog instructions should not be duplicated, since this can cause issues
// MCASM_DISABLED: // because 1) if only some of the instructions are duplicated, then we will
// MCASM_DISABLED: // observe prolog instructions after the end-prolog instruction and 2) Windows
// MCASM_DISABLED: // expects there to only be a single prolog (e.g., when checking if unwinding
// MCASM_DISABLED: // is happening in the middle of a prolog).
// MCASM_DISABLED: let isPseudo = 1, isMeta = 1, isNotDuplicable = 1, SchedRW = [WriteSystem] in {
// MCASM_DISABLED:   def SEH_PushReg : I<0, Pseudo, (outs), (ins i32imm:$reg),
// MCASM_DISABLED:                             "#SEH_PushReg $reg", []>;
// MCASM_DISABLED:   def SEH_SaveReg : I<0, Pseudo, (outs), (ins i32imm:$reg, i32imm:$dst),
// MCASM_DISABLED:                             "#SEH_SaveReg $reg, $dst", []>;
// MCASM_DISABLED:   def SEH_SaveXMM : I<0, Pseudo, (outs), (ins i32imm:$reg, i32imm:$dst),
// MCASM_DISABLED:                             "#SEH_SaveXMM $reg, $dst", []>;
// MCASM_DISABLED:   def SEH_StackAlloc : I<0, Pseudo, (outs), (ins i32imm:$size),
// MCASM_DISABLED:                             "#SEH_StackAlloc $size", []>;
// MCASM_DISABLED:   def SEH_StackAlign : I<0, Pseudo, (outs), (ins i32imm:$align),
// MCASM_DISABLED:                             "#SEH_StackAlign $align", []>;
// MCASM_DISABLED:   def SEH_SetFrame : I<0, Pseudo, (outs), (ins i32imm:$reg, i32imm:$offset),
// MCASM_DISABLED:                             "#SEH_SetFrame $reg, $offset", []>;
// MCASM_DISABLED:   def SEH_PushFrame : I<0, Pseudo, (outs), (ins i1imm:$mode),
// MCASM_DISABLED:                             "#SEH_PushFrame $mode", []>;
// MCASM_DISABLED:   def SEH_EndPrologue : I<0, Pseudo, (outs), (ins),
// MCASM_DISABLED:                             "#SEH_EndPrologue", []>;
// MCASM_DISABLED:   def SEH_UnwindVersion : I<0, Pseudo, (outs), (ins i1imm:$version),
// MCASM_DISABLED:                             "#SEH_UnwindVersion $version", []>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: // Epilog instructions:
// MCASM_DISABLED: let isPseudo = 1, isMeta = 1, SchedRW = [WriteSystem] in {
// MCASM_DISABLED:   def SEH_BeginEpilogue : I<0, Pseudo, (outs), (ins),
// MCASM_DISABLED:                             "#SEH_BeginEpilogue", []>;
// MCASM_DISABLED:   def SEH_EndEpilogue : I<0, Pseudo, (outs), (ins),
// MCASM_DISABLED:                             "#SEH_EndEpilogue", []>;
// MCASM_DISABLED:   def SEH_UnwindV2Start : I<0, Pseudo, (outs), (ins),
// MCASM_DISABLED:                             "#SEH_UnwindV2Start", []>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: // Chain instructions:
// MCASM_DISABLED: let isPseudo = 1, isMeta = 1, SchedRW = [WriteSystem] in {
// MCASM_DISABLED:   def SEH_SplitChainedAtEndOfBlock : I<0, Pseudo, (outs), (ins),
// MCASM_DISABLED:                             "#SEH_SplitChainedAtEndOfBlock", []>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: //===----------------------------------------------------------------------===//
// MCASM_DISABLED: // Pseudo instructions used by KCFI.
// MCASM_DISABLED: //===----------------------------------------------------------------------===//
// MCASM_DISABLED: let
// MCASM_DISABLED:   Defs = [R10, R11, EFLAGS] in {
// MCASM_DISABLED: def KCFI_CHECK : PseudoI<
// MCASM_DISABLED:   (outs), (ins GR64:$ptr, i32imm:$type), []>, Sched<[]>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: //===----------------------------------------------------------------------===//
// MCASM_DISABLED: // Pseudo instructions used by address sanitizer.
// MCASM_DISABLED: //===----------------------------------------------------------------------===//
// MCASM_DISABLED: let
// MCASM_DISABLED:   Defs = [R10, R11, EFLAGS] in {
// MCASM_DISABLED: def ASAN_CHECK_MEMACCESS : PseudoI<
// MCASM_DISABLED:   (outs), (ins GR64PLTSafe:$addr, i32imm:$accessinfo),
// MCASM_DISABLED:   [(int_asan_check_memaccess GR64PLTSafe:$addr, (i32 timm:$accessinfo))]>,
// MCASM_DISABLED:   Sched<[]>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: //===----------------------------------------------------------------------===//
// MCASM_DISABLED: // Pseudo instructions used by segmented stacks.
// MCASM_DISABLED: //
// MCASM_DISABLED: 
// MCASM_DISABLED: // This is lowered into a RET instruction by MCInstLower.  We need
// MCASM_DISABLED: // this so that we don't have to have a MachineBasicBlock which ends
// MCASM_DISABLED: // with a RET and also has successors.
// MCASM_DISABLED: let isPseudo = 1, SchedRW = [WriteJumpLd] in {
// MCASM_DISABLED: def MORESTACK_RET: I<0, Pseudo, (outs), (ins), "", []>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // This instruction is lowered to a RET followed by a MOV.  The two
// MCASM_DISABLED: // instructions are not generated on a higher level since then the
// MCASM_DISABLED: // verifier sees a MachineBasicBlock ending with a non-terminator.
// MCASM_DISABLED: def MORESTACK_RET_RESTORE_R10 : I<0, Pseudo, (outs), (ins), "", []>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: //===----------------------------------------------------------------------===//
// MCASM_DISABLED: // Alias Instructions
// MCASM_DISABLED: //===----------------------------------------------------------------------===//
// MCASM_DISABLED: 
// MCASM_DISABLED: // Alias instruction mapping movr0 to xor.
// MCASM_DISABLED: // FIXME: remove when we can teach regalloc that xor reg, reg is ok.
// MCASM_DISABLED: let Defs = [EFLAGS], isReMaterializable = 1, isAsCheapAsAMove = 1,
// MCASM_DISABLED:     isPseudo = 1, isMoveImm = 1, AddedComplexity = 10 in
// MCASM_DISABLED: def MOV32r0  : I<0, Pseudo, (outs GR32:$dst), (ins), "",
// MCASM_DISABLED:                  [(set GR32:$dst, 0)]>, Sched<[WriteZero]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // Other widths can also make use of the 32-bit xor, which may have a smaller
// MCASM_DISABLED: // encoding and avoid partial register updates.
// MCASM_DISABLED: let AddedComplexity = 10 in {
// MCASM_DISABLED: def : Pat<(i8 0), (EXTRACT_SUBREG (MOV32r0), sub_8bit)>;
// MCASM_DISABLED: def : Pat<(i16 0), (EXTRACT_SUBREG (MOV32r0), sub_16bit)>;
// MCASM_DISABLED: def : Pat<(i64 0), (SUBREG_TO_REG (i64 0), (MOV32r0), sub_32bit)>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: let Predicates = [OptForSize, Not64BitMode],
// MCASM_DISABLED:     AddedComplexity = 10 in {
// MCASM_DISABLED:   let SchedRW = [WriteALU] in {
// MCASM_DISABLED:   // Pseudo instructions for materializing 1 and -1 using XOR+INC/DEC,
// MCASM_DISABLED:   // which only require 3 bytes compared to MOV32ri which requires 5.
// MCASM_DISABLED:   let Defs = [EFLAGS], isReMaterializable = 1, isPseudo = 1 in {
// MCASM_DISABLED:     def MOV32r1 : I<0, Pseudo, (outs GR32:$dst), (ins), "",
// MCASM_DISABLED:                         [(set GR32:$dst, 1)]>;
// MCASM_DISABLED:     def MOV32r_1 : I<0, Pseudo, (outs GR32:$dst), (ins), "",
// MCASM_DISABLED:                         [(set GR32:$dst, -1)]>;
// MCASM_DISABLED:   }
// MCASM_DISABLED:   } // SchedRW
// MCASM_DISABLED: 
// MCASM_DISABLED:   // MOV16ri is 4 bytes, so the instructions above are smaller.
// MCASM_DISABLED:   def : Pat<(i16 1), (EXTRACT_SUBREG (MOV32r1), sub_16bit)>;
// MCASM_DISABLED:   def : Pat<(i16 -1), (EXTRACT_SUBREG (MOV32r_1), sub_16bit)>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: let isReMaterializable = 1, isPseudo = 1, AddedComplexity = 5,
// MCASM_DISABLED:     SchedRW = [WriteALU] in {
// MCASM_DISABLED: // AddedComplexity higher than MOV64ri but lower than MOV32r0 and MOV32r1.
// MCASM_DISABLED: def MOV32ImmSExti8 : I<0, Pseudo, (outs GR32:$dst), (ins i32i8imm:$src), "",
// MCASM_DISABLED:                        [(set GR32:$dst, i32immSExt8:$src)]>,
// MCASM_DISABLED:                        Requires<[OptForMinSize, NotWin64WithoutFP]>;
// MCASM_DISABLED: def MOV64ImmSExti8 : I<0, Pseudo, (outs GR64:$dst), (ins i64i8imm:$src), "",
// MCASM_DISABLED:                        [(set GR64:$dst, i64immSExt8:$src)]>,
// MCASM_DISABLED:                        Requires<[OptForMinSize, NotWin64WithoutFP]>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: // Materialize i64 constant where top 32-bits are zero. This could theoretically
// MCASM_DISABLED: // use MOV32ri with a SUBREG_TO_REG to represent the zero-extension, however
// MCASM_DISABLED: // that would make it more difficult to rematerialize.
// MCASM_DISABLED: let AddedComplexity = 1, isReMaterializable = 1, isAsCheapAsAMove = 1,
// MCASM_DISABLED:     isPseudo = 1, SchedRW = [WriteMove] in
// MCASM_DISABLED: def MOV32ri64 : I<0, Pseudo, (outs GR64:$dst), (ins i64i32imm:$src), "",
// MCASM_DISABLED:                   [(set GR64:$dst, i64immZExt32:$src)]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // This 64-bit pseudo-move can also be used for labels in the x86-64 small code
// MCASM_DISABLED: // model.
// MCASM_DISABLED: def mov64imm32 : ComplexPattern<i64, 1, "selectMOV64Imm32", [McasmWrapper]>;
// MCASM_DISABLED: def : Pat<(i64 mov64imm32:$src), (MOV32ri64 mov64imm32:$src)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // Use sbb to materialize carry bit.
// MCASM_DISABLED: let Uses = [EFLAGS], Defs = [EFLAGS], isPseudo = 1, SchedRW = [WriteADC],
// MCASM_DISABLED:     hasSideEffects = 0 in {
// MCASM_DISABLED: // FIXME: These are pseudo ops that should be replaced with Pat<> patterns.
// MCASM_DISABLED: // However, Pat<> can't replicate the destination reg into the inputs of the
// MCASM_DISABLED: // result.
// MCASM_DISABLED: def SETB_C32r : I<0, Pseudo, (outs GR32:$dst), (ins), "", []>;
// MCASM_DISABLED: def SETB_C64r : I<0, Pseudo, (outs GR64:$dst), (ins), "", []>;
// MCASM_DISABLED: } // isCodeGenOnly
// MCASM_DISABLED: 
// MCASM_DISABLED: //===----------------------------------------------------------------------===//
// MCASM_DISABLED: // String Pseudo Instructions
// MCASM_DISABLED: //
// MCASM_DISABLED: let SchedRW = [WriteMicrocoded] in {
// MCASM_DISABLED: let Defs = [ECX,EDI,ESI], Uses = [ECX,EDI,ESI], isCodeGenOnly = 1 in {
// MCASM_DISABLED: def REP_MOVSB_32 : I<0xA4, RawFrm, (outs), (ins),
// MCASM_DISABLED:                     "{rep;movsb (%esi), %es:(%edi)|rep movsb es:[edi], [esi]}",
// MCASM_DISABLED:                     [(Mcasmrep_movs i8)]>, REP, AdSize32,
// MCASM_DISABLED:                    Requires<[NotLP64]>;
// MCASM_DISABLED: def REP_MOVSW_32 : I<0xA5, RawFrm, (outs), (ins),
// MCASM_DISABLED:                     "{rep;movsw (%esi), %es:(%edi)|rep movsw es:[edi], [esi]}",
// MCASM_DISABLED:                     [(Mcasmrep_movs i16)]>, REP, AdSize32, OpSize16,
// MCASM_DISABLED:                    Requires<[NotLP64]>;
// MCASM_DISABLED: def REP_MOVSD_32 : I<0xA5, RawFrm, (outs), (ins),
// MCASM_DISABLED:                     "{rep;movsl (%esi), %es:(%edi)|rep movsd es:[edi], [esi]}",
// MCASM_DISABLED:                     [(Mcasmrep_movs i32)]>, REP, AdSize32, OpSize32,
// MCASM_DISABLED:                    Requires<[NotLP64]>;
// MCASM_DISABLED: def REP_MOVSQ_32 : RI<0xA5, RawFrm, (outs), (ins),
// MCASM_DISABLED:                     "{rep;movsq (%esi), %es:(%edi)|rep movsq es:[edi], [esi]}",
// MCASM_DISABLED:                     [(Mcasmrep_movs i64)]>, REP, AdSize32,
// MCASM_DISABLED:                    Requires<[NotLP64, In64BitMode]>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: let Defs = [RCX,RDI,RSI], Uses = [RCX,RDI,RSI], isCodeGenOnly = 1 in {
// MCASM_DISABLED: def REP_MOVSB_64 : I<0xA4, RawFrm, (outs), (ins),
// MCASM_DISABLED:                     "{rep;movsb (%rsi), %es:(%rdi)|rep movsb es:[rdi], [rsi]}",
// MCASM_DISABLED:                     [(Mcasmrep_movs i8)]>, REP, AdSize64,
// MCASM_DISABLED:                    Requires<[IsLP64]>;
// MCASM_DISABLED: def REP_MOVSW_64 : I<0xA5, RawFrm, (outs), (ins),
// MCASM_DISABLED:                     "{rep;movsw (%rsi), %es:(%rdi)|rep movsw es:[rdi], [rsi]}",
// MCASM_DISABLED:                     [(Mcasmrep_movs i16)]>, REP, AdSize64, OpSize16,
// MCASM_DISABLED:                    Requires<[IsLP64]>;
// MCASM_DISABLED: def REP_MOVSD_64 : I<0xA5, RawFrm, (outs), (ins),
// MCASM_DISABLED:                     "{rep;movsl (%rsi), %es:(%rdi)|rep movsdi es:[rdi], [rsi]}",
// MCASM_DISABLED:                     [(Mcasmrep_movs i32)]>, REP, AdSize64, OpSize32,
// MCASM_DISABLED:                    Requires<[IsLP64]>;
// MCASM_DISABLED: def REP_MOVSQ_64 : RI<0xA5, RawFrm, (outs), (ins),
// MCASM_DISABLED:                     "{rep;movsq (%rsi), %es:(%rdi)|rep movsq es:[rdi], [rsi]}",
// MCASM_DISABLED:                     [(Mcasmrep_movs i64)]>, REP, AdSize64,
// MCASM_DISABLED:                    Requires<[IsLP64]>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: // FIXME: Should use "(Mcasmrep_stos AL)" as the pattern.
// MCASM_DISABLED: let Defs = [ECX,EDI], isCodeGenOnly = 1 in {
// MCASM_DISABLED:   let Uses = [AL,ECX,EDI] in
// MCASM_DISABLED:   def REP_STOSB_32 : I<0xAA, RawFrm, (outs), (ins),
// MCASM_DISABLED:                        "{rep;stosb %al, %es:(%edi)|rep stosb es:[edi], al}",
// MCASM_DISABLED:                       [(Mcasmrep_stos i8)]>, REP, AdSize32,
// MCASM_DISABLED:                      Requires<[NotLP64]>;
// MCASM_DISABLED:   let Uses = [AX,ECX,EDI] in
// MCASM_DISABLED:   def REP_STOSW_32 : I<0xAB, RawFrm, (outs), (ins),
// MCASM_DISABLED:                       "{rep;stosw %ax, %es:(%edi)|rep stosw es:[edi], ax}",
// MCASM_DISABLED:                       [(Mcasmrep_stos i16)]>, REP, AdSize32, OpSize16,
// MCASM_DISABLED:                      Requires<[NotLP64]>;
// MCASM_DISABLED:   let Uses = [EAX,ECX,EDI] in
// MCASM_DISABLED:   def REP_STOSD_32 : I<0xAB, RawFrm, (outs), (ins),
// MCASM_DISABLED:                       "{rep;stosl %eax, %es:(%edi)|rep stosd es:[edi], eax}",
// MCASM_DISABLED:                       [(Mcasmrep_stos i32)]>, REP, AdSize32, OpSize32,
// MCASM_DISABLED:                      Requires<[NotLP64]>;
// MCASM_DISABLED:   let Uses = [RAX,RCX,RDI] in
// MCASM_DISABLED:   def REP_STOSQ_32 : RI<0xAB, RawFrm, (outs), (ins),
// MCASM_DISABLED:                         "{rep;stosq %rax, %es:(%edi)|rep stosq es:[edi], rax}",
// MCASM_DISABLED:                         [(Mcasmrep_stos i64)]>, REP, AdSize32,
// MCASM_DISABLED:                         Requires<[NotLP64, In64BitMode]>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: let Defs = [RCX,RDI], isCodeGenOnly = 1 in {
// MCASM_DISABLED:   let Uses = [AL,RCX,RDI] in
// MCASM_DISABLED:   def REP_STOSB_64 : I<0xAA, RawFrm, (outs), (ins),
// MCASM_DISABLED:                        "{rep;stosb %al, %es:(%rdi)|rep stosb es:[rdi], al}",
// MCASM_DISABLED:                        [(Mcasmrep_stos i8)]>, REP, AdSize64,
// MCASM_DISABLED:                        Requires<[IsLP64]>;
// MCASM_DISABLED:   let Uses = [AX,RCX,RDI] in
// MCASM_DISABLED:   def REP_STOSW_64 : I<0xAB, RawFrm, (outs), (ins),
// MCASM_DISABLED:                        "{rep;stosw %ax, %es:(%rdi)|rep stosw es:[rdi], ax}",
// MCASM_DISABLED:                        [(Mcasmrep_stos i16)]>, REP, AdSize64, OpSize16,
// MCASM_DISABLED:                        Requires<[IsLP64]>;
// MCASM_DISABLED:   let Uses = [RAX,RCX,RDI] in
// MCASM_DISABLED:   def REP_STOSD_64 : I<0xAB, RawFrm, (outs), (ins),
// MCASM_DISABLED:                       "{rep;stosl %eax, %es:(%rdi)|rep stosd es:[rdi], eax}",
// MCASM_DISABLED:                        [(Mcasmrep_stos i32)]>, REP, AdSize64, OpSize32,
// MCASM_DISABLED:                        Requires<[IsLP64]>;
// MCASM_DISABLED: 
// MCASM_DISABLED:   let Uses = [RAX,RCX,RDI] in
// MCASM_DISABLED:   def REP_STOSQ_64 : RI<0xAB, RawFrm, (outs), (ins),
// MCASM_DISABLED:                         "{rep;stosq %rax, %es:(%rdi)|rep stosq es:[rdi], rax}",
// MCASM_DISABLED:                         [(Mcasmrep_stos i64)]>, REP, AdSize64,
// MCASM_DISABLED:                         Requires<[IsLP64]>;
// MCASM_DISABLED: }
// MCASM_DISABLED: } // SchedRW
// MCASM_DISABLED: 
// MCASM_DISABLED: //===----------------------------------------------------------------------===//
// MCASM_DISABLED: // Thread Local Storage Instructions
// MCASM_DISABLED: //
// MCASM_DISABLED: let SchedRW = [WriteSystem] in {
// MCASM_DISABLED: 
// MCASM_DISABLED: // ELF TLS Support
// MCASM_DISABLED: // All calls clobber the non-callee saved registers. ESP is marked as
// MCASM_DISABLED: // a use to prevent stack-pointer assignments that appear immediately
// MCASM_DISABLED: // before calls from potentially appearing dead.
// MCASM_DISABLED: let Defs = [EAX, ECX, EDX, FP0, FP1, FP2, FP3, FP4, FP5, FP6, FP7,
// MCASM_DISABLED:             ST0, ST1, ST2, ST3, ST4, ST5, ST6, ST7,
// MCASM_DISABLED:             MM0, MM1, MM2, MM3, MM4, MM5, MM6, MM7,
// MCASM_DISABLED:             XMM0, XMM1, XMM2, XMM3, XMM4, XMM5, XMM6, XMM7,
// MCASM_DISABLED:             XMM8, XMM9, XMM10, XMM11, XMM12, XMM13, XMM14, XMM15, EFLAGS, DF],
// MCASM_DISABLED:     Uses = [ESP, SSP] in {
// MCASM_DISABLED: def TLS_addr32 : I<0, Pseudo, (outs), (ins i32mem:$sym),
// MCASM_DISABLED:                   "# TLS_addr32",
// MCASM_DISABLED:                   [(Mcasmtlsaddr tls32addr:$sym)]>,
// MCASM_DISABLED:                   Requires<[Not64BitMode]>;
// MCASM_DISABLED: def TLS_base_addr32 : I<0, Pseudo, (outs), (ins i32mem:$sym),
// MCASM_DISABLED:                   "# TLS_base_addr32",
// MCASM_DISABLED:                   [(Mcasmtlsbaseaddr tls32baseaddr:$sym)]>,
// MCASM_DISABLED:                   Requires<[Not64BitMode]>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: // All calls clobber the non-callee saved registers. RSP is marked as
// MCASM_DISABLED: // a use to prevent stack-pointer assignments that appear immediately
// MCASM_DISABLED: // before calls from potentially appearing dead.
// MCASM_DISABLED: let Defs = [RAX, RCX, RDX, RSI, RDI, R8, R9, R10, R11,
// MCASM_DISABLED:             FP0, FP1, FP2, FP3, FP4, FP5, FP6, FP7,
// MCASM_DISABLED:             ST0, ST1, ST2, ST3, ST4, ST5, ST6, ST7,
// MCASM_DISABLED:             MM0, MM1, MM2, MM3, MM4, MM5, MM6, MM7,
// MCASM_DISABLED:             XMM0, XMM1, XMM2, XMM3, XMM4, XMM5, XMM6, XMM7,
// MCASM_DISABLED:             XMM8, XMM9, XMM10, XMM11, XMM12, XMM13, XMM14, XMM15, EFLAGS, DF],
// MCASM_DISABLED:     Uses = [RSP, SSP] in {
// MCASM_DISABLED: def TLS_addr64 : I<0, Pseudo, (outs), (ins i64mem:$sym),
// MCASM_DISABLED:                    "# TLS_addr64",
// MCASM_DISABLED:                   [(Mcasmtlsaddr tls64addr:$sym)]>,
// MCASM_DISABLED:                   Requires<[In64BitMode, IsLP64]>;
// MCASM_DISABLED: def TLS_base_addr64 : I<0, Pseudo, (outs), (ins i64mem:$sym),
// MCASM_DISABLED:                    "# TLS_base_addr64",
// MCASM_DISABLED:                   [(Mcasmtlsbaseaddr tls64baseaddr:$sym)]>,
// MCASM_DISABLED:                   Requires<[In64BitMode, IsLP64]>;
// MCASM_DISABLED: def TLS_addrX32 : I<0, Pseudo, (outs), (ins i32mem:$sym),
// MCASM_DISABLED:                    "# TLS_addrX32",
// MCASM_DISABLED:                   [(Mcasmtlsaddr tls32addr:$sym)]>,
// MCASM_DISABLED:                   Requires<[In64BitMode, NotLP64]>;
// MCASM_DISABLED: def TLS_base_addrX32 : I<0, Pseudo, (outs), (ins i32mem:$sym),
// MCASM_DISABLED:                    "# TLS_base_addrX32",
// MCASM_DISABLED:                   [(Mcasmtlsbaseaddr tls32baseaddr:$sym)]>,
// MCASM_DISABLED:                   Requires<[In64BitMode, NotLP64]>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: // TLSDESC only clobbers EAX and EFLAGS. ESP is marked as a use to prevent
// MCASM_DISABLED: // stack-pointer assignments that appear immediately before calls from
// MCASM_DISABLED: // potentially appearing dead.
// MCASM_DISABLED: let Defs = [EAX, EFLAGS], Uses = [RSP, SSP] in {
// MCASM_DISABLED:   def TLS_desc32 : I<0, Pseudo, (outs), (ins i32mem:$sym),
// MCASM_DISABLED:                      "# TLS_desc32", [(Mcasmtlsdesc tls32addr:$sym)]>;
// MCASM_DISABLED:   def TLS_desc64 : I<0, Pseudo, (outs), (ins i64mem:$sym),
// MCASM_DISABLED:                      "# TLS_desc64", [(Mcasmtlsdesc tls64addr:$sym)]>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: // Darwin TLS Support
// MCASM_DISABLED: // For i386, the address of the thunk is passed on the stack, on return the
// MCASM_DISABLED: // address of the variable is in %eax.  %ecx is trashed during the function
// MCASM_DISABLED: // call.  All other registers are preserved.
// MCASM_DISABLED: let Defs = [EAX, ECX, EFLAGS, DF],
// MCASM_DISABLED:     Uses = [ESP, SSP],
// MCASM_DISABLED:     usesCustomInserter = 1 in
// MCASM_DISABLED: def TLSCall_32 : I<0, Pseudo, (outs), (ins i32mem:$sym),
// MCASM_DISABLED:                 "# TLSCall_32",
// MCASM_DISABLED:                 [(McasmTLSCall addr:$sym)]>,
// MCASM_DISABLED:                 Requires<[Not64BitMode]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // For x86_64, the address of the thunk is passed in %rdi, but the
// MCASM_DISABLED: // pseudo directly use the symbol, so do not add an implicit use of
// MCASM_DISABLED: // %rdi. The lowering will do the right thing with RDI.
// MCASM_DISABLED: // On return the address of the variable is in %rax.  All other
// MCASM_DISABLED: // registers are preserved.
// MCASM_DISABLED: let Defs = [RAX, EFLAGS, DF],
// MCASM_DISABLED:     Uses = [RSP, SSP],
// MCASM_DISABLED:     usesCustomInserter = 1 in
// MCASM_DISABLED: def TLSCall_64 : I<0, Pseudo, (outs), (ins i64mem:$sym),
// MCASM_DISABLED:                   "# TLSCall_64",
// MCASM_DISABLED:                   [(McasmTLSCall addr:$sym)]>,
// MCASM_DISABLED:                   Requires<[In64BitMode]>;
// MCASM_DISABLED: } // SchedRW
// MCASM_DISABLED: 
// MCASM_DISABLED: //===----------------------------------------------------------------------===//
// MCASM_DISABLED: // Conditional Move Pseudo Instructions
// MCASM_DISABLED: 
// MCASM_DISABLED: // CMOV* - Used to implement the SELECT DAG operation.  Expanded after
// MCASM_DISABLED: // instruction selection into a branch sequence.
// MCASM_DISABLED: multiclass CMOVrr_PSEUDO<RegisterClass RC, ValueType VT> {
// MCASM_DISABLED:   def CMOV#NAME  : I<0, Pseudo,
// MCASM_DISABLED:                     (outs RC:$dst), (ins RC:$t, RC:$f, i8imm:$cond),
// MCASM_DISABLED:                     "#CMOV_"#NAME#" PSEUDO!",
// MCASM_DISABLED:                     [(set RC:$dst, (VT (Mcasmcmov RC:$t, RC:$f, timm:$cond,
// MCASM_DISABLED:                                                 EFLAGS)))]>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: let usesCustomInserter = 1, hasNoSchedulingInfo = 1, Uses = [EFLAGS] in {
// MCASM_DISABLED:   // Mcasm doesn't have 8-bit conditional moves. Use a customInserter to
// MCASM_DISABLED:   // emit control flow. An alternative to this is to mark i8 SELECT as Promote,
// MCASM_DISABLED:   // however that requires promoting the operands, and can induce additional
// MCASM_DISABLED:   // i8 register pressure.
// MCASM_DISABLED:   defm _GR8 : CMOVrr_PSEUDO<GR8, i8>;
// MCASM_DISABLED: 
// MCASM_DISABLED:   let Predicates = [NoCMOV] in {
// MCASM_DISABLED:     defm _GR32 : CMOVrr_PSEUDO<GR32, i32>;
// MCASM_DISABLED:     defm _GR16 : CMOVrr_PSEUDO<GR16, i16>;
// MCASM_DISABLED:   } // Predicates = [NoCMOV]
// MCASM_DISABLED: 
// MCASM_DISABLED:   // fcmov doesn't handle all possible EFLAGS, provide a fallback if there is no
// MCASM_DISABLED:   // SSE1/SSE2.
// MCASM_DISABLED:   let Predicates = [FPStackf32] in
// MCASM_DISABLED:     defm _RFP32 : CMOVrr_PSEUDO<RFP32, f32>;
// MCASM_DISABLED: 
// MCASM_DISABLED:   let Predicates = [FPStackf64] in
// MCASM_DISABLED:     defm _RFP64 : CMOVrr_PSEUDO<RFP64, f64>;
// MCASM_DISABLED: 
// MCASM_DISABLED:   defm _RFP80 : CMOVrr_PSEUDO<RFP80, f80>;
// MCASM_DISABLED: 
// MCASM_DISABLED:   let Predicates = [HasMMX] in
// MCASM_DISABLED:     defm _VR64   : CMOVrr_PSEUDO<VR64, x86mmx>;
// MCASM_DISABLED: 
// MCASM_DISABLED:   let Predicates = [HasSSE1,NoAVX512] in
// MCASM_DISABLED:     defm _FR32   : CMOVrr_PSEUDO<FR32, f32>;
// MCASM_DISABLED:   let Predicates = [HasSSE2,NoAVX512] in {
// MCASM_DISABLED:     defm _FR16   : CMOVrr_PSEUDO<FR16, f16>;
// MCASM_DISABLED:     defm _FR64   : CMOVrr_PSEUDO<FR64, f64>;
// MCASM_DISABLED:   }
// MCASM_DISABLED:   let Predicates = [HasAVX512] in {
// MCASM_DISABLED:     defm _FR16X  : CMOVrr_PSEUDO<FR16X, f16>;
// MCASM_DISABLED:     defm _FR32X  : CMOVrr_PSEUDO<FR32X, f32>;
// MCASM_DISABLED:     defm _FR64X  : CMOVrr_PSEUDO<FR64X, f64>;
// MCASM_DISABLED:   }
// MCASM_DISABLED:   let Predicates = [NoVLX] in {
// MCASM_DISABLED:     defm _VR128  : CMOVrr_PSEUDO<VR128, v2i64>;
// MCASM_DISABLED:     defm _VR256  : CMOVrr_PSEUDO<VR256, v4i64>;
// MCASM_DISABLED:   }
// MCASM_DISABLED:   let Predicates = [HasVLX] in {
// MCASM_DISABLED:     defm _VR128X : CMOVrr_PSEUDO<VR128X, v2i64>;
// MCASM_DISABLED:     defm _VR256X : CMOVrr_PSEUDO<VR256X, v4i64>;
// MCASM_DISABLED:   }
// MCASM_DISABLED:   defm _VR512  : CMOVrr_PSEUDO<VR512, v8i64>;
// MCASM_DISABLED:   defm _VK1    : CMOVrr_PSEUDO<VK1,  v1i1>;
// MCASM_DISABLED:   defm _VK2    : CMOVrr_PSEUDO<VK2,  v2i1>;
// MCASM_DISABLED:   defm _VK4    : CMOVrr_PSEUDO<VK4,  v4i1>;
// MCASM_DISABLED:   defm _VK8    : CMOVrr_PSEUDO<VK8,  v8i1>;
// MCASM_DISABLED:   defm _VK16   : CMOVrr_PSEUDO<VK16, v16i1>;
// MCASM_DISABLED:   defm _VK32   : CMOVrr_PSEUDO<VK32, v32i1>;
// MCASM_DISABLED:   defm _VK64   : CMOVrr_PSEUDO<VK64, v64i1>;
// MCASM_DISABLED: } // usesCustomInserter = 1, hasNoSchedulingInfo = 1, Uses = [EFLAGS]
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(f128 (Mcasmcmov VR128:$t, VR128:$f, timm:$cond, EFLAGS)),
// MCASM_DISABLED:           (CMOV_VR128 VR128:$t, VR128:$f, timm:$cond)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: let Predicates = [NoVLX] in {
// MCASM_DISABLED:   def : Pat<(v16i8 (Mcasmcmov VR128:$t, VR128:$f, timm:$cond, EFLAGS)),
// MCASM_DISABLED:             (CMOV_VR128 VR128:$t, VR128:$f, timm:$cond)>;
// MCASM_DISABLED:   def : Pat<(v8i16 (Mcasmcmov VR128:$t, VR128:$f, timm:$cond, EFLAGS)),
// MCASM_DISABLED:             (CMOV_VR128 VR128:$t, VR128:$f, timm:$cond)>;
// MCASM_DISABLED:   def : Pat<(v4i32 (Mcasmcmov VR128:$t, VR128:$f, timm:$cond, EFLAGS)),
// MCASM_DISABLED:             (CMOV_VR128 VR128:$t, VR128:$f, timm:$cond)>;
// MCASM_DISABLED:   def : Pat<(v4f32 (Mcasmcmov VR128:$t, VR128:$f, timm:$cond, EFLAGS)),
// MCASM_DISABLED:             (CMOV_VR128 VR128:$t, VR128:$f, timm:$cond)>;
// MCASM_DISABLED:   def : Pat<(v2f64 (Mcasmcmov VR128:$t, VR128:$f, timm:$cond, EFLAGS)),
// MCASM_DISABLED:             (CMOV_VR128 VR128:$t, VR128:$f, timm:$cond)>;
// MCASM_DISABLED: 
// MCASM_DISABLED:   def : Pat<(v32i8 (Mcasmcmov VR256:$t, VR256:$f, timm:$cond, EFLAGS)),
// MCASM_DISABLED:             (CMOV_VR256 VR256:$t, VR256:$f, timm:$cond)>;
// MCASM_DISABLED:   def : Pat<(v16i16 (Mcasmcmov VR256:$t, VR256:$f, timm:$cond, EFLAGS)),
// MCASM_DISABLED:             (CMOV_VR256 VR256:$t, VR256:$f, timm:$cond)>;
// MCASM_DISABLED:   def : Pat<(v8i32 (Mcasmcmov VR256:$t, VR256:$f, timm:$cond, EFLAGS)),
// MCASM_DISABLED:             (CMOV_VR256 VR256:$t, VR256:$f, timm:$cond)>;
// MCASM_DISABLED:   def : Pat<(v8f32 (Mcasmcmov VR256:$t, VR256:$f, timm:$cond, EFLAGS)),
// MCASM_DISABLED:             (CMOV_VR256 VR256:$t, VR256:$f, timm:$cond)>;
// MCASM_DISABLED:   def : Pat<(v4f64 (Mcasmcmov VR256:$t, VR256:$f, timm:$cond, EFLAGS)),
// MCASM_DISABLED:             (CMOV_VR256 VR256:$t, VR256:$f, timm:$cond)>;
// MCASM_DISABLED: }
// MCASM_DISABLED: let Predicates = [HasVLX] in {
// MCASM_DISABLED:   def : Pat<(v16i8 (Mcasmcmov VR128X:$t, VR128X:$f, timm:$cond, EFLAGS)),
// MCASM_DISABLED:             (CMOV_VR128X VR128X:$t, VR128X:$f, timm:$cond)>;
// MCASM_DISABLED:   def : Pat<(v8i16 (Mcasmcmov VR128X:$t, VR128X:$f, timm:$cond, EFLAGS)),
// MCASM_DISABLED:             (CMOV_VR128X VR128X:$t, VR128X:$f, timm:$cond)>;
// MCASM_DISABLED:   def : Pat<(v8f16 (Mcasmcmov VR128X:$t, VR128X:$f, timm:$cond, EFLAGS)),
// MCASM_DISABLED:             (CMOV_VR128X VR128X:$t, VR128X:$f, timm:$cond)>;
// MCASM_DISABLED:   def : Pat<(v4i32 (Mcasmcmov VR128X:$t, VR128X:$f, timm:$cond, EFLAGS)),
// MCASM_DISABLED:             (CMOV_VR128X VR128X:$t, VR128X:$f, timm:$cond)>;
// MCASM_DISABLED:   def : Pat<(v4f32 (Mcasmcmov VR128X:$t, VR128X:$f, timm:$cond, EFLAGS)),
// MCASM_DISABLED:             (CMOV_VR128X VR128X:$t, VR128X:$f, timm:$cond)>;
// MCASM_DISABLED:   def : Pat<(v2f64 (Mcasmcmov VR128X:$t, VR128X:$f, timm:$cond, EFLAGS)),
// MCASM_DISABLED:             (CMOV_VR128X VR128X:$t, VR128X:$f, timm:$cond)>;
// MCASM_DISABLED: 
// MCASM_DISABLED:   def : Pat<(v32i8 (Mcasmcmov VR256X:$t, VR256X:$f, timm:$cond, EFLAGS)),
// MCASM_DISABLED:             (CMOV_VR256X VR256X:$t, VR256X:$f, timm:$cond)>;
// MCASM_DISABLED:   def : Pat<(v16i16 (Mcasmcmov VR256X:$t, VR256X:$f, timm:$cond, EFLAGS)),
// MCASM_DISABLED:             (CMOV_VR256X VR256X:$t, VR256X:$f, timm:$cond)>;
// MCASM_DISABLED:   def : Pat<(v16f16 (Mcasmcmov VR256X:$t, VR256X:$f, timm:$cond, EFLAGS)),
// MCASM_DISABLED:             (CMOV_VR256X VR256X:$t, VR256X:$f, timm:$cond)>;
// MCASM_DISABLED:   def : Pat<(v8i32 (Mcasmcmov VR256X:$t, VR256X:$f, timm:$cond, EFLAGS)),
// MCASM_DISABLED:             (CMOV_VR256X VR256X:$t, VR256X:$f, timm:$cond)>;
// MCASM_DISABLED:   def : Pat<(v8f32 (Mcasmcmov VR256X:$t, VR256X:$f, timm:$cond, EFLAGS)),
// MCASM_DISABLED:             (CMOV_VR256X VR256X:$t, VR256X:$f, timm:$cond)>;
// MCASM_DISABLED:   def : Pat<(v4f64 (Mcasmcmov VR256X:$t, VR256X:$f, timm:$cond, EFLAGS)),
// MCASM_DISABLED:             (CMOV_VR256X VR256X:$t, VR256X:$f, timm:$cond)>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(v64i8 (Mcasmcmov VR512:$t, VR512:$f, timm:$cond, EFLAGS)),
// MCASM_DISABLED:           (CMOV_VR512 VR512:$t, VR512:$f, timm:$cond)>;
// MCASM_DISABLED: def : Pat<(v32i16 (Mcasmcmov VR512:$t, VR512:$f, timm:$cond, EFLAGS)),
// MCASM_DISABLED:           (CMOV_VR512 VR512:$t, VR512:$f, timm:$cond)>;
// MCASM_DISABLED: def : Pat<(v32f16 (Mcasmcmov VR512:$t, VR512:$f, timm:$cond, EFLAGS)),
// MCASM_DISABLED:           (CMOV_VR512 VR512:$t, VR512:$f, timm:$cond)>;
// MCASM_DISABLED: def : Pat<(v16i32 (Mcasmcmov VR512:$t, VR512:$f, timm:$cond, EFLAGS)),
// MCASM_DISABLED:           (CMOV_VR512 VR512:$t, VR512:$f, timm:$cond)>;
// MCASM_DISABLED: def : Pat<(v16f32 (Mcasmcmov VR512:$t, VR512:$f, timm:$cond, EFLAGS)),
// MCASM_DISABLED:           (CMOV_VR512 VR512:$t, VR512:$f, timm:$cond)>;
// MCASM_DISABLED: def : Pat<(v8f64 (Mcasmcmov VR512:$t, VR512:$f, timm:$cond, EFLAGS)),
// MCASM_DISABLED:           (CMOV_VR512 VR512:$t, VR512:$f, timm:$cond)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: //===----------------------------------------------------------------------===//
// MCASM_DISABLED: // Normal-Instructions-With-Lock-Prefix Pseudo Instructions
// MCASM_DISABLED: //===----------------------------------------------------------------------===//
// MCASM_DISABLED: 
// MCASM_DISABLED: // FIXME: Use normal instructions and add lock prefix dynamically.
// MCASM_DISABLED: 
// MCASM_DISABLED: // Memory barriers
// MCASM_DISABLED: 
// MCASM_DISABLED: let isCodeGenOnly = 1, Defs = [EFLAGS] in
// MCASM_DISABLED: def OR32mi8Locked  : Ii8<0x83, MRM1m, (outs), (ins i32mem:$dst, i32i8imm:$zero),
// MCASM_DISABLED:                          "or{l}\t{$zero, $dst|$dst, $zero}", []>,
// MCASM_DISABLED:                          Requires<[Not64BitMode]>, OpSize32, LOCK,
// MCASM_DISABLED:                          Sched<[WriteALURMW]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // RegOpc corresponds to the mr version of the instruction
// MCASM_DISABLED: // ImmOpc corresponds to the mi version of the instruction
// MCASM_DISABLED: // ImmOpc8 corresponds to the mi8 version of the instruction
// MCASM_DISABLED: // ImmMod corresponds to the instruction format of the mi and mi8 versions
// MCASM_DISABLED: multiclass LOCK_ArithBinOp<bits<8> RegOpc, bits<8> ImmOpc, bits<8> ImmOpc8,
// MCASM_DISABLED:                            Format ImmMod, SDNode Op, string mnemonic> {
// MCASM_DISABLED: let Defs = [EFLAGS], mayLoad = 1, mayStore = 1, isCodeGenOnly = 1,
// MCASM_DISABLED:     SchedRW = [WriteALURMW] in {
// MCASM_DISABLED: 
// MCASM_DISABLED: def NAME#8mr : I<{RegOpc{7}, RegOpc{6}, RegOpc{5}, RegOpc{4},
// MCASM_DISABLED:                   RegOpc{3}, RegOpc{2}, RegOpc{1}, 0 },
// MCASM_DISABLED:                   MRMDestMem, (outs), (ins i8mem:$dst, GR8:$src2),
// MCASM_DISABLED:                   !strconcat(mnemonic, "{b}\t",
// MCASM_DISABLED:                              "{$src2, $dst|$dst, $src2}"),
// MCASM_DISABLED:                   [(set EFLAGS, (Op addr:$dst, GR8:$src2))]>, LOCK;
// MCASM_DISABLED: 
// MCASM_DISABLED: def NAME#16mr : I<{RegOpc{7}, RegOpc{6}, RegOpc{5}, RegOpc{4},
// MCASM_DISABLED:                    RegOpc{3}, RegOpc{2}, RegOpc{1}, 1 },
// MCASM_DISABLED:                    MRMDestMem, (outs), (ins i16mem:$dst, GR16:$src2),
// MCASM_DISABLED:                    !strconcat(mnemonic, "{w}\t",
// MCASM_DISABLED:                               "{$src2, $dst|$dst, $src2}"),
// MCASM_DISABLED:                    [(set EFLAGS, (Op addr:$dst, GR16:$src2))]>,
// MCASM_DISABLED:                    OpSize16, LOCK;
// MCASM_DISABLED: 
// MCASM_DISABLED: def NAME#32mr : I<{RegOpc{7}, RegOpc{6}, RegOpc{5}, RegOpc{4},
// MCASM_DISABLED:                    RegOpc{3}, RegOpc{2}, RegOpc{1}, 1 },
// MCASM_DISABLED:                    MRMDestMem, (outs), (ins i32mem:$dst, GR32:$src2),
// MCASM_DISABLED:                    !strconcat(mnemonic, "{l}\t",
// MCASM_DISABLED:                               "{$src2, $dst|$dst, $src2}"),
// MCASM_DISABLED:                    [(set EFLAGS, (Op addr:$dst, GR32:$src2))]>,
// MCASM_DISABLED:                    OpSize32, LOCK;
// MCASM_DISABLED: 
// MCASM_DISABLED: def NAME#64mr : RI<{RegOpc{7}, RegOpc{6}, RegOpc{5}, RegOpc{4},
// MCASM_DISABLED:                     RegOpc{3}, RegOpc{2}, RegOpc{1}, 1 },
// MCASM_DISABLED:                     MRMDestMem, (outs), (ins i64mem:$dst, GR64:$src2),
// MCASM_DISABLED:                     !strconcat(mnemonic, "{q}\t",
// MCASM_DISABLED:                                "{$src2, $dst|$dst, $src2}"),
// MCASM_DISABLED:                     [(set EFLAGS, (Op addr:$dst, GR64:$src2))]>, LOCK;
// MCASM_DISABLED: 
// MCASM_DISABLED: // NOTE: These are order specific, we want the mi8 forms to be listed
// MCASM_DISABLED: // first so that they are slightly preferred to the mi forms.
// MCASM_DISABLED: def NAME#16mi8 : Ii8<{ImmOpc8{7}, ImmOpc8{6}, ImmOpc8{5}, ImmOpc8{4},
// MCASM_DISABLED:                       ImmOpc8{3}, ImmOpc8{2}, ImmOpc8{1}, 1 },
// MCASM_DISABLED:                       ImmMod, (outs), (ins i16mem :$dst, i16i8imm :$src2),
// MCASM_DISABLED:                       !strconcat(mnemonic, "{w}\t",
// MCASM_DISABLED:                                  "{$src2, $dst|$dst, $src2}"),
// MCASM_DISABLED:                       [(set EFLAGS, (Op addr:$dst, i16immSExt8:$src2))]>,
// MCASM_DISABLED:                       OpSize16, LOCK;
// MCASM_DISABLED: 
// MCASM_DISABLED: def NAME#32mi8 : Ii8<{ImmOpc8{7}, ImmOpc8{6}, ImmOpc8{5}, ImmOpc8{4},
// MCASM_DISABLED:                       ImmOpc8{3}, ImmOpc8{2}, ImmOpc8{1}, 1 },
// MCASM_DISABLED:                       ImmMod, (outs), (ins i32mem :$dst, i32i8imm :$src2),
// MCASM_DISABLED:                       !strconcat(mnemonic, "{l}\t",
// MCASM_DISABLED:                                  "{$src2, $dst|$dst, $src2}"),
// MCASM_DISABLED:                       [(set EFLAGS, (Op addr:$dst, i32immSExt8:$src2))]>,
// MCASM_DISABLED:                       OpSize32, LOCK;
// MCASM_DISABLED: 
// MCASM_DISABLED: def NAME#64mi8 : RIi8<{ImmOpc8{7}, ImmOpc8{6}, ImmOpc8{5}, ImmOpc8{4},
// MCASM_DISABLED:                        ImmOpc8{3}, ImmOpc8{2}, ImmOpc8{1}, 1 },
// MCASM_DISABLED:                        ImmMod, (outs), (ins i64mem :$dst, i64i8imm :$src2),
// MCASM_DISABLED:                        !strconcat(mnemonic, "{q}\t",
// MCASM_DISABLED:                                   "{$src2, $dst|$dst, $src2}"),
// MCASM_DISABLED:                        [(set EFLAGS, (Op addr:$dst, i64immSExt8:$src2))]>,
// MCASM_DISABLED:                        LOCK;
// MCASM_DISABLED: 
// MCASM_DISABLED: def NAME#8mi : Ii8<{ImmOpc{7}, ImmOpc{6}, ImmOpc{5}, ImmOpc{4},
// MCASM_DISABLED:                     ImmOpc{3}, ImmOpc{2}, ImmOpc{1}, 0 },
// MCASM_DISABLED:                     ImmMod, (outs), (ins i8mem :$dst, i8imm :$src2),
// MCASM_DISABLED:                     !strconcat(mnemonic, "{b}\t",
// MCASM_DISABLED:                                "{$src2, $dst|$dst, $src2}"),
// MCASM_DISABLED:                     [(set EFLAGS, (Op addr:$dst, (i8 imm:$src2)))]>, LOCK;
// MCASM_DISABLED: 
// MCASM_DISABLED: def NAME#16mi : Ii16<{ImmOpc{7}, ImmOpc{6}, ImmOpc{5}, ImmOpc{4},
// MCASM_DISABLED:                       ImmOpc{3}, ImmOpc{2}, ImmOpc{1}, 1 },
// MCASM_DISABLED:                       ImmMod, (outs), (ins i16mem :$dst, i16imm :$src2),
// MCASM_DISABLED:                       !strconcat(mnemonic, "{w}\t",
// MCASM_DISABLED:                                  "{$src2, $dst|$dst, $src2}"),
// MCASM_DISABLED:                       [(set EFLAGS, (Op addr:$dst, (i16 imm:$src2)))]>,
// MCASM_DISABLED:                       OpSize16, LOCK;
// MCASM_DISABLED: 
// MCASM_DISABLED: def NAME#32mi : Ii32<{ImmOpc{7}, ImmOpc{6}, ImmOpc{5}, ImmOpc{4},
// MCASM_DISABLED:                       ImmOpc{3}, ImmOpc{2}, ImmOpc{1}, 1 },
// MCASM_DISABLED:                       ImmMod, (outs), (ins i32mem :$dst, i32imm :$src2),
// MCASM_DISABLED:                       !strconcat(mnemonic, "{l}\t",
// MCASM_DISABLED:                                  "{$src2, $dst|$dst, $src2}"),
// MCASM_DISABLED:                       [(set EFLAGS, (Op addr:$dst, (i32 imm:$src2)))]>,
// MCASM_DISABLED:                       OpSize32, LOCK;
// MCASM_DISABLED: 
// MCASM_DISABLED: def NAME#64mi32 : RIi32S<{ImmOpc{7}, ImmOpc{6}, ImmOpc{5}, ImmOpc{4},
// MCASM_DISABLED:                           ImmOpc{3}, ImmOpc{2}, ImmOpc{1}, 1 },
// MCASM_DISABLED:                           ImmMod, (outs), (ins i64mem :$dst, i64i32imm :$src2),
// MCASM_DISABLED:                           !strconcat(mnemonic, "{q}\t",
// MCASM_DISABLED:                                      "{$src2, $dst|$dst, $src2}"),
// MCASM_DISABLED:                           [(set EFLAGS, (Op addr:$dst, i64immSExt32:$src2))]>,
// MCASM_DISABLED:                           LOCK;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: defm LOCK_ADD : LOCK_ArithBinOp<0x00, 0x80, 0x83, MRM0m, Mcasmlock_add, "add">;
// MCASM_DISABLED: defm LOCK_SUB : LOCK_ArithBinOp<0x28, 0x80, 0x83, MRM5m, Mcasmlock_sub, "sub">;
// MCASM_DISABLED: defm LOCK_OR  : LOCK_ArithBinOp<0x08, 0x80, 0x83, MRM1m, Mcasmlock_or , "or">;
// MCASM_DISABLED: defm LOCK_AND : LOCK_ArithBinOp<0x20, 0x80, 0x83, MRM4m, Mcasmlock_and, "and">;
// MCASM_DISABLED: defm LOCK_XOR : LOCK_ArithBinOp<0x30, 0x80, 0x83, MRM6m, Mcasmlock_xor, "xor">;
// MCASM_DISABLED: 
// MCASM_DISABLED: let Defs = [EFLAGS], mayLoad = 1, mayStore = 1, isCodeGenOnly = 1,
// MCASM_DISABLED:     SchedRW = [WriteALURMW]  in {
// MCASM_DISABLED:   let Predicates = [UseIncDec] in {
// MCASM_DISABLED:     def LOCK_INC8m  : I<0xFE, MRM0m, (outs), (ins i8mem :$dst),
// MCASM_DISABLED:                         "inc{b}\t$dst",
// MCASM_DISABLED:                         [(set EFLAGS, (Mcasmlock_add_nocf addr:$dst, (i8 1)))]>,
// MCASM_DISABLED:                         LOCK;
// MCASM_DISABLED:     def LOCK_INC16m : I<0xFF, MRM0m, (outs), (ins i16mem:$dst),
// MCASM_DISABLED:                         "inc{w}\t$dst",
// MCASM_DISABLED:                         [(set EFLAGS, (Mcasmlock_add_nocf addr:$dst, (i16 1)))]>,
// MCASM_DISABLED:                         OpSize16, LOCK;
// MCASM_DISABLED:     def LOCK_INC32m : I<0xFF, MRM0m, (outs), (ins i32mem:$dst),
// MCASM_DISABLED:                         "inc{l}\t$dst",
// MCASM_DISABLED:                         [(set EFLAGS, (Mcasmlock_add_nocf addr:$dst, (i32 1)))]>,
// MCASM_DISABLED:                         OpSize32, LOCK;
// MCASM_DISABLED: 
// MCASM_DISABLED:     def LOCK_DEC8m  : I<0xFE, MRM1m, (outs), (ins i8mem :$dst),
// MCASM_DISABLED:                         "dec{b}\t$dst",
// MCASM_DISABLED:                         [(set EFLAGS, (Mcasmlock_sub_nocf addr:$dst, (i8 1)))]>,
// MCASM_DISABLED:                         LOCK;
// MCASM_DISABLED:     def LOCK_DEC16m : I<0xFF, MRM1m, (outs), (ins i16mem:$dst),
// MCASM_DISABLED:                         "dec{w}\t$dst",
// MCASM_DISABLED:                         [(set EFLAGS, (Mcasmlock_sub_nocf addr:$dst, (i16 1)))]>,
// MCASM_DISABLED:                         OpSize16, LOCK;
// MCASM_DISABLED:     def LOCK_DEC32m : I<0xFF, MRM1m, (outs), (ins i32mem:$dst),
// MCASM_DISABLED:                         "dec{l}\t$dst",
// MCASM_DISABLED:                         [(set EFLAGS, (Mcasmlock_sub_nocf addr:$dst, (i32 1)))]>,
// MCASM_DISABLED:                         OpSize32, LOCK;
// MCASM_DISABLED:   }
// MCASM_DISABLED: 
// MCASM_DISABLED:   let Predicates = [UseIncDec, In64BitMode] in {
// MCASM_DISABLED:     def LOCK_INC64m : RI<0xFF, MRM0m, (outs), (ins i64mem:$dst),
// MCASM_DISABLED:                          "inc{q}\t$dst",
// MCASM_DISABLED:                          [(set EFLAGS, (Mcasmlock_add_nocf addr:$dst, (i64 1)))]>,
// MCASM_DISABLED:                          LOCK;
// MCASM_DISABLED:     def LOCK_DEC64m : RI<0xFF, MRM1m, (outs), (ins i64mem:$dst),
// MCASM_DISABLED:                          "dec{q}\t$dst",
// MCASM_DISABLED:                          [(set EFLAGS, (Mcasmlock_sub_nocf addr:$dst, (i64 1)))]>,
// MCASM_DISABLED:                          LOCK;
// MCASM_DISABLED:   }
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: let Predicates = [UseIncDec] in {
// MCASM_DISABLED:   // Additional patterns for -1 constant.
// MCASM_DISABLED:   def : Pat<(Mcasmlock_add addr:$dst, (i8  -1)), (LOCK_DEC8m  addr:$dst)>;
// MCASM_DISABLED:   def : Pat<(Mcasmlock_add addr:$dst, (i16 -1)), (LOCK_DEC16m addr:$dst)>;
// MCASM_DISABLED:   def : Pat<(Mcasmlock_add addr:$dst, (i32 -1)), (LOCK_DEC32m addr:$dst)>;
// MCASM_DISABLED:   def : Pat<(Mcasmlock_sub addr:$dst, (i8  -1)), (LOCK_INC8m  addr:$dst)>;
// MCASM_DISABLED:   def : Pat<(Mcasmlock_sub addr:$dst, (i16 -1)), (LOCK_INC16m addr:$dst)>;
// MCASM_DISABLED:   def : Pat<(Mcasmlock_sub addr:$dst, (i32 -1)), (LOCK_INC32m addr:$dst)>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: let Predicates = [UseIncDec, In64BitMode] in {
// MCASM_DISABLED:   // Additional patterns for -1 constant.
// MCASM_DISABLED:   def : Pat<(Mcasmlock_add addr:$dst, (i64 -1)), (LOCK_DEC64m addr:$dst)>;
// MCASM_DISABLED:   def : Pat<(Mcasmlock_sub addr:$dst, (i64 -1)), (LOCK_INC64m addr:$dst)>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: // Atomic bit test.
// MCASM_DISABLED: def McasmLBTest : SDTypeProfile<1, 3, [SDTCisVT<0, i32>, SDTCisPtrTy<1>,
// MCASM_DISABLED:                                      SDTCisVT<2, i8>, SDTCisVT<3, i32>]>;
// MCASM_DISABLED: def x86bts : SDNode<"McasmISD::LBTS", McasmLBTest,
// MCASM_DISABLED:                     [SDNPHasChain, SDNPMayLoad, SDNPMayStore, SDNPMemOperand]>;
// MCASM_DISABLED: def x86btc : SDNode<"McasmISD::LBTC", McasmLBTest,
// MCASM_DISABLED:                     [SDNPHasChain, SDNPMayLoad, SDNPMayStore, SDNPMemOperand]>;
// MCASM_DISABLED: def x86btr : SDNode<"McasmISD::LBTR", McasmLBTest,
// MCASM_DISABLED:                     [SDNPHasChain, SDNPMayLoad, SDNPMayStore, SDNPMemOperand]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def McasmLBTestRM : SDTypeProfile<1, 2, [SDTCisVT<0, i32>, SDTCisPtrTy<1>,
// MCASM_DISABLED:                                        SDTCisInt<2>]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def x86_rm_bts : SDNode<"McasmISD::LBTS_RM", McasmLBTestRM,
// MCASM_DISABLED:                         [SDNPHasChain, SDNPMayLoad, SDNPMayStore, SDNPMemOperand]>;
// MCASM_DISABLED: def x86_rm_btc : SDNode<"McasmISD::LBTC_RM", McasmLBTestRM,
// MCASM_DISABLED:                         [SDNPHasChain, SDNPMayLoad, SDNPMayStore, SDNPMemOperand]>;
// MCASM_DISABLED: def x86_rm_btr : SDNode<"McasmISD::LBTR_RM", McasmLBTestRM,
// MCASM_DISABLED:                         [SDNPHasChain, SDNPMayLoad, SDNPMayStore, SDNPMemOperand]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: 
// MCASM_DISABLED: multiclass ATOMIC_LOGIC_OP<Format Form, string s> {
// MCASM_DISABLED:   let Defs = [EFLAGS], mayLoad = 1, mayStore = 1, isCodeGenOnly = 1,
// MCASM_DISABLED:       SchedRW = [WriteBitTestSetRegRMW]  in {
// MCASM_DISABLED:     def 16m : Ii8<0xBA, Form, (outs), (ins i16mem:$src1, i8imm:$src2),
// MCASM_DISABLED:                   !strconcat(s, "{w}\t{$src2, $src1|$src1, $src2}"),
// MCASM_DISABLED:                   [(set EFLAGS, (!cast<SDNode>("x86" # s) addr:$src1, timm:$src2, (i32 16)))]>,
// MCASM_DISABLED:               OpSize16, TB, LOCK;
// MCASM_DISABLED:     def 32m : Ii8<0xBA, Form, (outs), (ins i32mem:$src1, i8imm:$src2),
// MCASM_DISABLED:                   !strconcat(s, "{l}\t{$src2, $src1|$src1, $src2}"),
// MCASM_DISABLED:                   [(set EFLAGS, (!cast<SDNode>("x86" # s) addr:$src1, timm:$src2, (i32 32)))]>,
// MCASM_DISABLED:               OpSize32, TB, LOCK;
// MCASM_DISABLED:     def 64m : RIi8<0xBA, Form, (outs), (ins i64mem:$src1, i8imm:$src2),
// MCASM_DISABLED:                    !strconcat(s, "{q}\t{$src2, $src1|$src1, $src2}"),
// MCASM_DISABLED:                    [(set EFLAGS, (!cast<SDNode>("x86" # s) addr:$src1, timm:$src2, (i32 64)))]>,
// MCASM_DISABLED:               TB, LOCK;
// MCASM_DISABLED:   }
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: multiclass ATOMIC_LOGIC_OP_RM<bits<8> Opc8, string s> {
// MCASM_DISABLED:   let Defs = [EFLAGS], mayLoad = 1, mayStore = 1, isCodeGenOnly = 1,
// MCASM_DISABLED:       SchedRW = [WriteBitTestSetRegRMW]  in {
// MCASM_DISABLED:     def 16rm : I<Opc8, MRMDestMem, (outs), (ins i16mem:$src1, GR16:$src2),
// MCASM_DISABLED:                   !strconcat(s, "{w}\t{$src2, $src1|$src1, $src2}"),
// MCASM_DISABLED:                   [(set EFLAGS, (!cast<SDNode>("x86_rm_" # s) addr:$src1, GR16:$src2))]>,
// MCASM_DISABLED:                OpSize16, TB, LOCK;
// MCASM_DISABLED:     def 32rm : I<Opc8, MRMDestMem, (outs), (ins i32mem:$src1, GR32:$src2),
// MCASM_DISABLED:                   !strconcat(s, "{l}\t{$src2, $src1|$src1, $src2}"),
// MCASM_DISABLED:                   [(set EFLAGS, (!cast<SDNode>("x86_rm_" # s) addr:$src1, GR32:$src2))]>,
// MCASM_DISABLED:                OpSize32, TB, LOCK;
// MCASM_DISABLED:     def 64rm : RI<Opc8, MRMDestMem, (outs), (ins i64mem:$src1, GR64:$src2),
// MCASM_DISABLED:                    !strconcat(s, "{q}\t{$src2, $src1|$src1, $src2}"),
// MCASM_DISABLED:                    [(set EFLAGS, (!cast<SDNode>("x86_rm_" # s) addr:$src1, GR64:$src2))]>,
// MCASM_DISABLED:                TB, LOCK;
// MCASM_DISABLED:   }
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: 
// MCASM_DISABLED: defm LOCK_BTS : ATOMIC_LOGIC_OP<MRM5m, "bts">;
// MCASM_DISABLED: defm LOCK_BTC : ATOMIC_LOGIC_OP<MRM7m, "btc">;
// MCASM_DISABLED: defm LOCK_BTR : ATOMIC_LOGIC_OP<MRM6m, "btr">;
// MCASM_DISABLED: 
// MCASM_DISABLED: defm LOCK_BTS_RM : ATOMIC_LOGIC_OP_RM<0xAB, "bts">;
// MCASM_DISABLED: defm LOCK_BTC_RM : ATOMIC_LOGIC_OP_RM<0xBB, "btc">;
// MCASM_DISABLED: defm LOCK_BTR_RM : ATOMIC_LOGIC_OP_RM<0xB3, "btr">;
// MCASM_DISABLED: 
// MCASM_DISABLED: // Atomic compare and swap.
// MCASM_DISABLED: multiclass LCMPXCHG_BinOp<bits<8> Opc8, bits<8> Opc, Format Form,
// MCASM_DISABLED:                           string mnemonic, SDPatternOperator frag> {
// MCASM_DISABLED: let isCodeGenOnly = 1, SchedRW = [WriteCMPXCHGRMW] in {
// MCASM_DISABLED:   let Defs = [AL, EFLAGS], Uses = [AL] in
// MCASM_DISABLED:   def NAME#8  : I<Opc8, Form, (outs), (ins i8mem:$ptr, GR8:$swap),
// MCASM_DISABLED:                   !strconcat(mnemonic, "{b}\t{$swap, $ptr|$ptr, $swap}"),
// MCASM_DISABLED:                   [(frag addr:$ptr, GR8:$swap, 1)]>, TB, LOCK;
// MCASM_DISABLED:   let Defs = [AX, EFLAGS], Uses = [AX] in
// MCASM_DISABLED:   def NAME#16 : I<Opc, Form, (outs), (ins i16mem:$ptr, GR16:$swap),
// MCASM_DISABLED:                   !strconcat(mnemonic, "{w}\t{$swap, $ptr|$ptr, $swap}"),
// MCASM_DISABLED:                   [(frag addr:$ptr, GR16:$swap, 2)]>, TB, OpSize16, LOCK;
// MCASM_DISABLED:   let Defs = [EAX, EFLAGS], Uses = [EAX] in
// MCASM_DISABLED:   def NAME#32 : I<Opc, Form, (outs), (ins i32mem:$ptr, GR32:$swap),
// MCASM_DISABLED:                   !strconcat(mnemonic, "{l}\t{$swap, $ptr|$ptr, $swap}"),
// MCASM_DISABLED:                   [(frag addr:$ptr, GR32:$swap, 4)]>, TB, OpSize32, LOCK;
// MCASM_DISABLED:   let Defs = [RAX, EFLAGS], Uses = [RAX] in
// MCASM_DISABLED:   def NAME#64 : RI<Opc, Form, (outs), (ins i64mem:$ptr, GR64:$swap),
// MCASM_DISABLED:                    !strconcat(mnemonic, "{q}\t{$swap, $ptr|$ptr, $swap}"),
// MCASM_DISABLED:                    [(frag addr:$ptr, GR64:$swap, 8)]>, TB, LOCK;
// MCASM_DISABLED: }
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: let Defs = [EAX, EDX, EFLAGS], Uses = [EAX, EBX, ECX, EDX],
// MCASM_DISABLED:     Predicates = [HasCX8], SchedRW = [WriteCMPXCHGRMW],
// MCASM_DISABLED:     isCodeGenOnly = 1, usesCustomInserter = 1 in {
// MCASM_DISABLED: def LCMPXCHG8B : I<0xC7, MRM1m, (outs), (ins i64mem:$ptr),
// MCASM_DISABLED:                    "cmpxchg8b\t$ptr",
// MCASM_DISABLED:                    [(Mcasmcas8 addr:$ptr)]>, TB, LOCK;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: let Defs = [RAX, RDX, EFLAGS], Uses = [RAX, RBX, RCX, RDX],
// MCASM_DISABLED:     Predicates = [HasCX16,In64BitMode], SchedRW = [WriteCMPXCHGRMW],
// MCASM_DISABLED:     isCodeGenOnly = 1, mayLoad = 1, mayStore = 1, hasSideEffects = 0 in {
// MCASM_DISABLED: def LCMPXCHG16B : RI<0xC7, MRM1m, (outs), (ins i128mem:$ptr),
// MCASM_DISABLED:                      "cmpxchg16b\t$ptr",
// MCASM_DISABLED:                      []>, TB, LOCK;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: // This pseudo must be used when the frame uses RBX as
// MCASM_DISABLED: // the base pointer. Indeed, in such situation RBX is a reserved
// MCASM_DISABLED: // register and the register allocator will ignore any use/def of
// MCASM_DISABLED: // it. In other words, the register will not fix the clobbering of
// MCASM_DISABLED: // RBX that will happen when setting the arguments for the instrucion.
// MCASM_DISABLED: //
// MCASM_DISABLED: // Unlike the actual related instruction, we mark that this one
// MCASM_DISABLED: // defines RBX (instead of using RBX).
// MCASM_DISABLED: // The rationale is that we will define RBX during the expansion of
// MCASM_DISABLED: // the pseudo. The argument feeding RBX is rbx_input.
// MCASM_DISABLED: //
// MCASM_DISABLED: // The additional argument, $rbx_save, is a temporary register used to
// MCASM_DISABLED: // save the value of RBX across the actual instruction.
// MCASM_DISABLED: //
// MCASM_DISABLED: // To make sure the register assigned to $rbx_save does not interfere with
// MCASM_DISABLED: // the definition of the actual instruction, we use a definition $dst which
// MCASM_DISABLED: // is tied to $rbx_save. That way, the live-range of $rbx_save spans across
// MCASM_DISABLED: // the instruction and we are sure we will have a valid register to restore
// MCASM_DISABLED: // the value of RBX.
// MCASM_DISABLED: let Defs = [RAX, RDX, RBX, EFLAGS], Uses = [RAX, RCX, RDX],
// MCASM_DISABLED:     Predicates = [HasCX16,In64BitMode], SchedRW = [WriteCMPXCHGRMW],
// MCASM_DISABLED:     isCodeGenOnly = 1, isPseudo = 1,
// MCASM_DISABLED:     mayLoad = 1, mayStore = 1, hasSideEffects = 0,
// MCASM_DISABLED:     Constraints = "$rbx_save = $dst" in {
// MCASM_DISABLED: def LCMPXCHG16B_SAVE_RBX :
// MCASM_DISABLED:     I<0, Pseudo, (outs GR64:$dst),
// MCASM_DISABLED:       (ins i128mem:$ptr, GR64:$rbx_input, GR64:$rbx_save), "", []>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: // Pseudo instruction that doesn't read/write RBX. Will be turned into either
// MCASM_DISABLED: // LCMPXCHG16B_SAVE_RBX or LCMPXCHG16B via a custom inserter.
// MCASM_DISABLED: let Defs = [RAX, RDX, EFLAGS], Uses = [RAX, RCX, RDX],
// MCASM_DISABLED:     Predicates = [HasCX16,In64BitMode], SchedRW = [WriteCMPXCHGRMW],
// MCASM_DISABLED:     isCodeGenOnly = 1, isPseudo = 1,
// MCASM_DISABLED:     mayLoad = 1, mayStore = 1, hasSideEffects = 0,
// MCASM_DISABLED:     usesCustomInserter = 1 in {
// MCASM_DISABLED: def LCMPXCHG16B_NO_RBX :
// MCASM_DISABLED:     I<0, Pseudo, (outs), (ins i128mem:$ptr, GR64:$rbx_input), "",
// MCASM_DISABLED:       [(Mcasmcas16 addr:$ptr, GR64:$rbx_input)]>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: // This pseudo must be used when the frame uses RBX/EBX as
// MCASM_DISABLED: // the base pointer.
// MCASM_DISABLED: // cf comment for LCMPXCHG16B_SAVE_RBX.
// MCASM_DISABLED: let Defs = [EBX], Uses = [ECX, EAX],
// MCASM_DISABLED:     Predicates = [HasMWAITX], SchedRW = [WriteSystem],
// MCASM_DISABLED:     isCodeGenOnly = 1, isPseudo = 1, Constraints = "$rbx_save = $dst" in {
// MCASM_DISABLED: def MWAITX_SAVE_RBX :
// MCASM_DISABLED:     I<0, Pseudo, (outs GR64:$dst),
// MCASM_DISABLED:       (ins GR32:$ebx_input, GR64:$rbx_save),
// MCASM_DISABLED:       "mwaitx",
// MCASM_DISABLED:       []>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: // Pseudo mwaitx instruction to use for custom insertion.
// MCASM_DISABLED: let Predicates = [HasMWAITX], SchedRW = [WriteSystem],
// MCASM_DISABLED:     isCodeGenOnly = 1, isPseudo = 1,
// MCASM_DISABLED:     usesCustomInserter = 1 in {
// MCASM_DISABLED: def MWAITX :
// MCASM_DISABLED:     I<0, Pseudo, (outs), (ins GR32:$ecx, GR32:$eax, GR32:$ebx),
// MCASM_DISABLED:       "mwaitx",
// MCASM_DISABLED:       [(int_x86_mwaitx GR32:$ecx, GR32:$eax, GR32:$ebx)]>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: 
// MCASM_DISABLED: defm LCMPXCHG : LCMPXCHG_BinOp<0xB0, 0xB1, MRMDestMem, "cmpxchg", Mcasmcas>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // Atomic exchange and add
// MCASM_DISABLED: multiclass ATOMIC_RMW_BINOP<bits<8> opc8, bits<8> opc, string mnemonic,
// MCASM_DISABLED:                             string frag> {
// MCASM_DISABLED:   let Constraints = "$val = $dst", Defs = [EFLAGS], mayLoad = 1, mayStore = 1,
// MCASM_DISABLED:       isCodeGenOnly = 1, SchedRW = [WriteALURMW] in {
// MCASM_DISABLED:     def NAME#8  : I<opc8, MRMSrcMem, (outs GR8:$dst),
// MCASM_DISABLED:                     (ins GR8:$val, i8mem:$ptr),
// MCASM_DISABLED:                     !strconcat(mnemonic, "{b}\t{$val, $ptr|$ptr, $val}"),
// MCASM_DISABLED:                     [(set GR8:$dst,
// MCASM_DISABLED:                           (!cast<PatFrag>(frag # "_i8") addr:$ptr, GR8:$val))]>;
// MCASM_DISABLED:     def NAME#16 : I<opc, MRMSrcMem, (outs GR16:$dst),
// MCASM_DISABLED:                     (ins GR16:$val, i16mem:$ptr),
// MCASM_DISABLED:                     !strconcat(mnemonic, "{w}\t{$val, $ptr|$ptr, $val}"),
// MCASM_DISABLED:                     [(set
// MCASM_DISABLED:                        GR16:$dst,
// MCASM_DISABLED:                        (!cast<PatFrag>(frag # "_i16") addr:$ptr, GR16:$val))]>,
// MCASM_DISABLED:                     OpSize16;
// MCASM_DISABLED:     def NAME#32 : I<opc, MRMSrcMem, (outs GR32:$dst),
// MCASM_DISABLED:                     (ins GR32:$val, i32mem:$ptr),
// MCASM_DISABLED:                     !strconcat(mnemonic, "{l}\t{$val, $ptr|$ptr, $val}"),
// MCASM_DISABLED:                     [(set
// MCASM_DISABLED:                        GR32:$dst,
// MCASM_DISABLED:                        (!cast<PatFrag>(frag # "_i32") addr:$ptr, GR32:$val))]>,
// MCASM_DISABLED:                     OpSize32;
// MCASM_DISABLED:     def NAME#64 : RI<opc, MRMSrcMem, (outs GR64:$dst),
// MCASM_DISABLED:                      (ins GR64:$val, i64mem:$ptr),
// MCASM_DISABLED:                      !strconcat(mnemonic, "{q}\t{$val, $ptr|$ptr, $val}"),
// MCASM_DISABLED:                      [(set
// MCASM_DISABLED:                         GR64:$dst,
// MCASM_DISABLED:                         (!cast<PatFrag>(frag # "_i64") addr:$ptr, GR64:$val))]>;
// MCASM_DISABLED:   }
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: defm LXADD : ATOMIC_RMW_BINOP<0xc0, 0xc1, "xadd", "atomic_load_add">, TB, LOCK;
// MCASM_DISABLED: 
// MCASM_DISABLED: /* The following multiclass tries to make sure that in code like
// MCASM_DISABLED:  *    x.store (immediate op x.load(acquire), release)
// MCASM_DISABLED:  * and
// MCASM_DISABLED:  *    x.store (register op x.load(acquire), release)
// MCASM_DISABLED:  * an operation directly on memory is generated instead of wasting a register.
// MCASM_DISABLED:  * It is not automatic as atomic_store/load are only lowered to MOV instructions
// MCASM_DISABLED:  * extremely late to prevent them from being accidentally reordered in the backend
// MCASM_DISABLED:  * (see below the RELEASE_MOV* / ACQUIRE_MOV* pseudo-instructions)
// MCASM_DISABLED:  */
// MCASM_DISABLED: multiclass RELEASE_BINOP_MI<string Name, SDNode op> {
// MCASM_DISABLED:   def : Pat<(atomic_store_8 (op (atomic_load_nonext_8 addr:$dst), (i8 imm:$src)),
// MCASM_DISABLED:                             addr:$dst),
// MCASM_DISABLED:             (!cast<Instruction>(Name#"8mi") addr:$dst, imm:$src)>;
// MCASM_DISABLED:   def : Pat<(atomic_store_16 (op (atomic_load_nonext_16 addr:$dst), (i16 imm:$src)),
// MCASM_DISABLED:                              addr:$dst),
// MCASM_DISABLED:             (!cast<Instruction>(Name#"16mi") addr:$dst, imm:$src)>;
// MCASM_DISABLED:   def : Pat<(atomic_store_32 (op (atomic_load_nonext_32 addr:$dst), (i32 imm:$src)),
// MCASM_DISABLED:                              addr:$dst),
// MCASM_DISABLED:             (!cast<Instruction>(Name#"32mi") addr:$dst, imm:$src)>;
// MCASM_DISABLED:   def : Pat<(atomic_store_64 (op (atomic_load_nonext_64 addr:$dst), (i64immSExt32:$src)),
// MCASM_DISABLED:                              addr:$dst),
// MCASM_DISABLED:             (!cast<Instruction>(Name#"64mi32") addr:$dst, (i64immSExt32:$src))>;
// MCASM_DISABLED:   def : Pat<(atomic_store_8 (op (atomic_load_nonext_8 addr:$dst), (i8 GR8:$src)), addr:$dst),
// MCASM_DISABLED:             (!cast<Instruction>(Name#"8mr") addr:$dst, GR8:$src)>;
// MCASM_DISABLED:   def : Pat<(atomic_store_16 (op (atomic_load_nonext_16 addr:$dst), (i16 GR16:$src)),
// MCASM_DISABLED:                              addr:$dst),
// MCASM_DISABLED:             (!cast<Instruction>(Name#"16mr") addr:$dst, GR16:$src)>;
// MCASM_DISABLED:   def : Pat<(atomic_store_32 (op (atomic_load_nonext_32 addr:$dst), (i32 GR32:$src)),
// MCASM_DISABLED:                              addr:$dst),
// MCASM_DISABLED:             (!cast<Instruction>(Name#"32mr") addr:$dst, GR32:$src)>;
// MCASM_DISABLED:   def : Pat<(atomic_store_64 (op (atomic_load_nonext_64 addr:$dst), (i64 GR64:$src)),
// MCASM_DISABLED:                              addr:$dst),
// MCASM_DISABLED:             (!cast<Instruction>(Name#"64mr") addr:$dst, GR64:$src)>;
// MCASM_DISABLED: }
// MCASM_DISABLED: defm : RELEASE_BINOP_MI<"ADD", add>;
// MCASM_DISABLED: defm : RELEASE_BINOP_MI<"AND", and>;
// MCASM_DISABLED: defm : RELEASE_BINOP_MI<"OR",  or>;
// MCASM_DISABLED: defm : RELEASE_BINOP_MI<"XOR", xor>;
// MCASM_DISABLED: defm : RELEASE_BINOP_MI<"SUB", sub>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // Atomic load + floating point patterns.
// MCASM_DISABLED: // FIXME: This could also handle SIMD operations with *ps and *pd instructions.
// MCASM_DISABLED: multiclass ATOMIC_LOAD_FP_BINOP_MI<string Name, SDNode op> {
// MCASM_DISABLED:   def : Pat<(op FR32:$src1, (bitconvert (i32 (atomic_load_nonext_32 addr:$src2)))),
// MCASM_DISABLED:             (!cast<Instruction>(Name#"SSrm") FR32:$src1, addr:$src2)>,
// MCASM_DISABLED:             Requires<[UseSSE1]>;
// MCASM_DISABLED:   def : Pat<(op FR32:$src1, (bitconvert (i32 (atomic_load_nonext_32 addr:$src2)))),
// MCASM_DISABLED:             (!cast<Instruction>("V"#Name#"SSrm") FR32:$src1, addr:$src2)>,
// MCASM_DISABLED:             Requires<[UseAVX]>;
// MCASM_DISABLED:   def : Pat<(op FR32X:$src1, (bitconvert (i32 (atomic_load_nonext_32 addr:$src2)))),
// MCASM_DISABLED:             (!cast<Instruction>("V"#Name#"SSZrm") FR32X:$src1, addr:$src2)>,
// MCASM_DISABLED:             Requires<[HasAVX512]>;
// MCASM_DISABLED: 
// MCASM_DISABLED:   def : Pat<(op FR64:$src1, (bitconvert (i64 (atomic_load_nonext_64 addr:$src2)))),
// MCASM_DISABLED:             (!cast<Instruction>(Name#"SDrm") FR64:$src1, addr:$src2)>,
// MCASM_DISABLED:             Requires<[UseSSE1]>;
// MCASM_DISABLED:   def : Pat<(op FR64:$src1, (bitconvert (i64 (atomic_load_nonext_64 addr:$src2)))),
// MCASM_DISABLED:             (!cast<Instruction>("V"#Name#"SDrm") FR64:$src1, addr:$src2)>,
// MCASM_DISABLED:             Requires<[UseAVX]>;
// MCASM_DISABLED:   def : Pat<(op FR64X:$src1, (bitconvert (i64 (atomic_load_nonext_64 addr:$src2)))),
// MCASM_DISABLED:             (!cast<Instruction>("V"#Name#"SDZrm") FR64X:$src1, addr:$src2)>,
// MCASM_DISABLED:             Requires<[HasAVX512]>;
// MCASM_DISABLED: }
// MCASM_DISABLED: defm : ATOMIC_LOAD_FP_BINOP_MI<"ADD", fadd>;
// MCASM_DISABLED: defm : ATOMIC_LOAD_FP_BINOP_MI<"SUB", fsub>;
// MCASM_DISABLED: defm : ATOMIC_LOAD_FP_BINOP_MI<"MUL", fmul>;
// MCASM_DISABLED: defm : ATOMIC_LOAD_FP_BINOP_MI<"DIV", fdiv>;
// MCASM_DISABLED: 
// MCASM_DISABLED: multiclass RELEASE_UNOP<string Name, dag dag8, dag dag16, dag dag32,
// MCASM_DISABLED:                         dag dag64> {
// MCASM_DISABLED:   def : Pat<(atomic_store_8 dag8, addr:$dst),
// MCASM_DISABLED:             (!cast<Instruction>(Name#8m) addr:$dst)>;
// MCASM_DISABLED:   def : Pat<(atomic_store_16 dag16, addr:$dst),
// MCASM_DISABLED:             (!cast<Instruction>(Name#16m) addr:$dst)>;
// MCASM_DISABLED:   def : Pat<(atomic_store_32 dag32, addr:$dst),
// MCASM_DISABLED:             (!cast<Instruction>(Name#32m) addr:$dst)>;
// MCASM_DISABLED:   def : Pat<(atomic_store_64 dag64, addr:$dst),
// MCASM_DISABLED:             (!cast<Instruction>(Name#64m) addr:$dst)>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: let Predicates = [UseIncDec] in {
// MCASM_DISABLED:   defm : RELEASE_UNOP<"INC",
// MCASM_DISABLED:       (add (atomic_load_nonext_8  addr:$dst), (i8 1)),
// MCASM_DISABLED:       (add (atomic_load_nonext_16 addr:$dst), (i16 1)),
// MCASM_DISABLED:       (add (atomic_load_nonext_32 addr:$dst), (i32 1)),
// MCASM_DISABLED:       (add (atomic_load_nonext_64 addr:$dst), (i64 1))>;
// MCASM_DISABLED:   defm : RELEASE_UNOP<"DEC",
// MCASM_DISABLED:       (add (atomic_load_nonext_8  addr:$dst), (i8 -1)),
// MCASM_DISABLED:       (add (atomic_load_nonext_16 addr:$dst), (i16 -1)),
// MCASM_DISABLED:       (add (atomic_load_nonext_32 addr:$dst), (i32 -1)),
// MCASM_DISABLED:       (add (atomic_load_nonext_64 addr:$dst), (i64 -1))>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: defm : RELEASE_UNOP<"NEG",
// MCASM_DISABLED:     (ineg (i8 (atomic_load_nonext_8  addr:$dst))),
// MCASM_DISABLED:     (ineg (i16 (atomic_load_nonext_16 addr:$dst))),
// MCASM_DISABLED:     (ineg (i32 (atomic_load_nonext_32 addr:$dst))),
// MCASM_DISABLED:     (ineg (i64 (atomic_load_nonext_64 addr:$dst)))>;
// MCASM_DISABLED: defm : RELEASE_UNOP<"NOT",
// MCASM_DISABLED:     (not (i8 (atomic_load_nonext_8  addr:$dst))),
// MCASM_DISABLED:     (not (i16 (atomic_load_nonext_16 addr:$dst))),
// MCASM_DISABLED:     (not (i32 (atomic_load_nonext_32 addr:$dst))),
// MCASM_DISABLED:     (not (i64 (atomic_load_nonext_64 addr:$dst)))>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(atomic_store_8 (i8 imm:$src), addr:$dst),
// MCASM_DISABLED:           (MOV8mi addr:$dst, imm:$src)>;
// MCASM_DISABLED: def : Pat<(atomic_store_16 (i16 imm:$src), addr:$dst),
// MCASM_DISABLED:           (MOV16mi addr:$dst, imm:$src)>;
// MCASM_DISABLED: def : Pat<(atomic_store_32 (i32 imm:$src), addr:$dst),
// MCASM_DISABLED:           (MOV32mi addr:$dst, imm:$src)>;
// MCASM_DISABLED: def : Pat<(atomic_store_64 (i64immSExt32:$src), addr:$dst),
// MCASM_DISABLED:           (MOV64mi32 addr:$dst, i64immSExt32:$src)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(atomic_store_8 GR8:$src, addr:$dst),
// MCASM_DISABLED:           (MOV8mr addr:$dst, GR8:$src)>;
// MCASM_DISABLED: def : Pat<(atomic_store_16 GR16:$src, addr:$dst),
// MCASM_DISABLED:           (MOV16mr addr:$dst, GR16:$src)>;
// MCASM_DISABLED: def : Pat<(atomic_store_32 GR32:$src, addr:$dst),
// MCASM_DISABLED:           (MOV32mr addr:$dst, GR32:$src)>;
// MCASM_DISABLED: def : Pat<(atomic_store_64 GR64:$src, addr:$dst),
// MCASM_DISABLED:           (MOV64mr addr:$dst, GR64:$src)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(i8  (atomic_load_nonext_8 addr:$src)),  (MOV8rm addr:$src)>;
// MCASM_DISABLED: def : Pat<(i16 (atomic_load_nonext_16 addr:$src)), (MOV16rm addr:$src)>;
// MCASM_DISABLED: def : Pat<(i32 (atomic_load_nonext_32 addr:$src)), (MOV32rm addr:$src)>;
// MCASM_DISABLED: def : Pat<(i64 (atomic_load_nonext_64 addr:$src)), (MOV64rm addr:$src)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // load atomic <2 x i16>
// MCASM_DISABLED: def : Pat<(v4i32 (scalar_to_vector (i32 (atomic_load_32 addr:$src)))),
// MCASM_DISABLED:   (MOVDI2PDIrm addr:$src)>, Requires<[UseSSE2]>;
// MCASM_DISABLED: def : Pat<(v4i32 (scalar_to_vector (i32 (atomic_load_32 addr:$src)))),
// MCASM_DISABLED:   (VMOVSSrm addr:$src)>, Requires<[UseAVX]>;
// MCASM_DISABLED: def : Pat<(v4i32 (scalar_to_vector (i32 (atomic_load_32 addr:$src)))),
// MCASM_DISABLED:   (VMOVSSZrm addr:$src)>, Requires<[HasAVX512]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // load atomic <2 x i32,float>
// MCASM_DISABLED: def : Pat<(v2i64 (scalar_to_vector (i64 (atomic_load_64 addr:$src)))),
// MCASM_DISABLED:   (MOV64toPQIrm addr:$src)>, Requires<[UseSSE2]>;
// MCASM_DISABLED: def : Pat<(v2i64 (scalar_to_vector (i64 (atomic_load_64 addr:$src)))),
// MCASM_DISABLED:   (VMOV64toPQIrm addr:$src)>, Requires<[UseAVX]>;
// MCASM_DISABLED: def : Pat<(v2i64 (scalar_to_vector (i64 (atomic_load_64 addr:$src)))),
// MCASM_DISABLED:   (VMOV64toPQIZrm addr:$src)>, Requires<[HasAVX512]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // Floating point loads/stores.
// MCASM_DISABLED: def : Pat<(atomic_store_32 (i32 (bitconvert (f32 FR32:$src))), addr:$dst),
// MCASM_DISABLED:           (MOVSSmr addr:$dst, FR32:$src)>, Requires<[UseSSE1]>;
// MCASM_DISABLED: def : Pat<(atomic_store_32 (i32 (bitconvert (f32 FR32:$src))), addr:$dst),
// MCASM_DISABLED:           (VMOVSSmr addr:$dst, FR32:$src)>, Requires<[UseAVX]>;
// MCASM_DISABLED: def : Pat<(atomic_store_32 (i32 (bitconvert (f32 FR32:$src))), addr:$dst),
// MCASM_DISABLED:           (VMOVSSZmr addr:$dst, FR32:$src)>, Requires<[HasAVX512]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(atomic_store_64 (i64 (bitconvert (f64 FR64:$src))), addr:$dst),
// MCASM_DISABLED:           (MOVSDmr addr:$dst, FR64:$src)>, Requires<[UseSSE2]>;
// MCASM_DISABLED: def : Pat<(atomic_store_64 (i64 (bitconvert (f64 FR64:$src))), addr:$dst),
// MCASM_DISABLED:           (VMOVSDmr addr:$dst, FR64:$src)>, Requires<[UseAVX]>;
// MCASM_DISABLED: def : Pat<(atomic_store_64 (i64 (bitconvert (f64 FR64:$src))), addr:$dst),
// MCASM_DISABLED:           (VMOVSDmr addr:$dst, FR64:$src)>, Requires<[HasAVX512]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(f32 (bitconvert (i32 (atomic_load_nonext_32 addr:$src)))),
// MCASM_DISABLED:           (MOVSSrm_alt addr:$src)>, Requires<[UseSSE1]>;
// MCASM_DISABLED: def : Pat<(f32 (bitconvert (i32 (atomic_load_nonext_32 addr:$src)))),
// MCASM_DISABLED:           (VMOVSSrm_alt addr:$src)>, Requires<[UseAVX]>;
// MCASM_DISABLED: def : Pat<(f32 (bitconvert (i32 (atomic_load_nonext_32 addr:$src)))),
// MCASM_DISABLED:           (VMOVSSZrm_alt addr:$src)>, Requires<[HasAVX512]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(f64 (bitconvert (i64 (atomic_load_nonext_64 addr:$src)))),
// MCASM_DISABLED:           (MOVSDrm_alt addr:$src)>, Requires<[UseSSE2]>;
// MCASM_DISABLED: def : Pat<(f64 (bitconvert (i64 (atomic_load_nonext_64 addr:$src)))),
// MCASM_DISABLED:           (VMOVSDrm_alt addr:$src)>, Requires<[UseAVX]>;
// MCASM_DISABLED: def : Pat<(f64 (bitconvert (i64 (atomic_load_nonext_64 addr:$src)))),
// MCASM_DISABLED:           (VMOVSDZrm_alt addr:$src)>, Requires<[HasAVX512]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: //===----------------------------------------------------------------------===//
// MCASM_DISABLED: // DAG Pattern Matching Rules
// MCASM_DISABLED: //===----------------------------------------------------------------------===//
// MCASM_DISABLED: 
// MCASM_DISABLED: // Use AND/OR to store 0/-1 in memory when optimizing for minsize. This saves
// MCASM_DISABLED: // binary size compared to a regular MOV, but it introduces an unnecessary
// MCASM_DISABLED: // load, so is not suitable for regular or optsize functions.
// MCASM_DISABLED: let Predicates = [OptForMinSize] in {
// MCASM_DISABLED: def : Pat<(simple_store (i16 0), addr:$dst), (AND16mi addr:$dst, 0)>;
// MCASM_DISABLED: def : Pat<(simple_store (i32 0), addr:$dst), (AND32mi addr:$dst, 0)>;
// MCASM_DISABLED: def : Pat<(simple_store (i64 0), addr:$dst), (AND64mi32 addr:$dst, 0)>;
// MCASM_DISABLED: def : Pat<(simple_store (i16 -1), addr:$dst), (OR16mi addr:$dst, -1)>;
// MCASM_DISABLED: def : Pat<(simple_store (i32 -1), addr:$dst), (OR32mi addr:$dst, -1)>;
// MCASM_DISABLED: def : Pat<(simple_store (i64 -1), addr:$dst), (OR64mi32 addr:$dst, -1)>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: // In kernel code model, we can get the address of a label
// MCASM_DISABLED: // into a register with 'movq'.  FIXME: This is a hack, the 'imm' predicate of
// MCASM_DISABLED: // the MOV64ri32 should accept these.
// MCASM_DISABLED: def : Pat<(i64 (McasmWrapper tconstpool  :$dst)),
// MCASM_DISABLED:           (MOV64ri32 tconstpool  :$dst)>, Requires<[KernelCode]>;
// MCASM_DISABLED: def : Pat<(i64 (McasmWrapper tjumptable  :$dst)),
// MCASM_DISABLED:           (MOV64ri32 tjumptable  :$dst)>, Requires<[KernelCode]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // If the globaladdr is an absolute_symbol, don't bother using the sign extending
// MCASM_DISABLED: // instruction since there's no benefit to using it with absolute symbols.
// MCASM_DISABLED: def globalAddrNoAbsSym : PatLeaf<(tglobaladdr:$dst), [{
// MCASM_DISABLED:   auto *GA = cast<GlobalAddressSDNode>(N);
// MCASM_DISABLED:   return !GA->getGlobal()->getAbsoluteSymbolRange();
// MCASM_DISABLED: }]>;
// MCASM_DISABLED: def : Pat<(i64 (McasmWrapper globalAddrNoAbsSym:$dst)),
// MCASM_DISABLED:           (MOV64ri32 tglobaladdr:$dst)>,
// MCASM_DISABLED:       Requires<[KernelCode]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(i64 (McasmWrapper texternalsym:$dst)),
// MCASM_DISABLED:           (MOV64ri32 texternalsym:$dst)>, Requires<[KernelCode]>;
// MCASM_DISABLED: def : Pat<(i64 (McasmWrapper mcsym:$dst)),
// MCASM_DISABLED:           (MOV64ri32 mcsym:$dst)>, Requires<[KernelCode]>;
// MCASM_DISABLED: def : Pat<(i64 (McasmWrapper tblockaddress:$dst)),
// MCASM_DISABLED:           (MOV64ri32 tblockaddress:$dst)>, Requires<[KernelCode]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // If we have small model and -static mode, it is safe to store global addresses
// MCASM_DISABLED: // directly as immediates.  FIXME: This is really a hack, the 'imm' predicate
// MCASM_DISABLED: // for MOV64mi32 should handle this sort of thing.
// MCASM_DISABLED: def : Pat<(store (i64 (McasmWrapper tconstpool:$src)), addr:$dst),
// MCASM_DISABLED:           (MOV64mi32 addr:$dst, tconstpool:$src)>,
// MCASM_DISABLED:           Requires<[NearData, IsNotPIC]>;
// MCASM_DISABLED: def : Pat<(store (i64 (McasmWrapper tjumptable:$src)), addr:$dst),
// MCASM_DISABLED:           (MOV64mi32 addr:$dst, tjumptable:$src)>,
// MCASM_DISABLED:           Requires<[NearData, IsNotPIC]>;
// MCASM_DISABLED: def : Pat<(store (i64 (McasmWrapper tglobaladdr:$src)), addr:$dst),
// MCASM_DISABLED:           (MOV64mi32 addr:$dst, tglobaladdr:$src)>,
// MCASM_DISABLED:           Requires<[NearData, IsNotPIC]>;
// MCASM_DISABLED: def : Pat<(store (i64 (McasmWrapper texternalsym:$src)), addr:$dst),
// MCASM_DISABLED:           (MOV64mi32 addr:$dst, texternalsym:$src)>,
// MCASM_DISABLED:           Requires<[NearData, IsNotPIC]>;
// MCASM_DISABLED: def : Pat<(store (i64 (McasmWrapper mcsym:$src)), addr:$dst),
// MCASM_DISABLED:           (MOV64mi32 addr:$dst, mcsym:$src)>,
// MCASM_DISABLED:           Requires<[NearData, IsNotPIC]>;
// MCASM_DISABLED: def : Pat<(store (i64 (McasmWrapper tblockaddress:$src)), addr:$dst),
// MCASM_DISABLED:           (MOV64mi32 addr:$dst, tblockaddress:$src)>,
// MCASM_DISABLED:           Requires<[NearData, IsNotPIC]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(i32 (McasmRecoverFrameAlloc mcsym:$dst)), (MOV32ri mcsym:$dst)>;
// MCASM_DISABLED: def : Pat<(i64 (McasmRecoverFrameAlloc mcsym:$dst)), (MOV64ri mcsym:$dst)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // Calls
// MCASM_DISABLED: 
// MCASM_DISABLED: // tls has some funny stuff here...
// MCASM_DISABLED: // This corresponds to movabs $foo@tpoff, %rax
// MCASM_DISABLED: def : Pat<(i64 (McasmWrapper tglobaltlsaddr :$dst)),
// MCASM_DISABLED:           (MOV64ri32 tglobaltlsaddr :$dst)>;
// MCASM_DISABLED: // This corresponds to add $foo@tpoff, %rax
// MCASM_DISABLED: def : Pat<(add GR64:$src1, (McasmWrapper tglobaltlsaddr :$dst)),
// MCASM_DISABLED:           (ADD64ri32 GR64:$src1, tglobaltlsaddr :$dst)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: 
// MCASM_DISABLED: // Direct PC relative function call for small code model. 32-bit displacement
// MCASM_DISABLED: // sign extended to 64-bit.
// MCASM_DISABLED: def : Pat<(Mcasmcall (i64 tglobaladdr:$dst)),
// MCASM_DISABLED:           (CALL64pcrel32 tglobaladdr:$dst)>;
// MCASM_DISABLED: def : Pat<(Mcasmcall (i64 texternalsym:$dst)),
// MCASM_DISABLED:           (CALL64pcrel32 texternalsym:$dst)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(Mcasmcall_rvmarker (i64 tglobaladdr:$rvfunc), (i64 texternalsym:$dst)),
// MCASM_DISABLED:           (CALL64pcrel32_RVMARKER tglobaladdr:$rvfunc, texternalsym:$dst)>;
// MCASM_DISABLED: def : Pat<(Mcasmcall_rvmarker (i64 tglobaladdr:$rvfunc), (i64 tglobaladdr:$dst)),
// MCASM_DISABLED:           (CALL64pcrel32_RVMARKER tglobaladdr:$rvfunc, tglobaladdr:$dst)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(Mcasmimp_call (i64 tglobaladdr:$dst)),
// MCASM_DISABLED:           (CALL64pcrel32 tglobaladdr:$dst)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // Tailcall stuff. The TCRETURN instructions execute after the epilog, so they
// MCASM_DISABLED: // can never use callee-saved registers. That is the purpose of the GR64_TC
// MCASM_DISABLED: // register classes.
// MCASM_DISABLED: //
// MCASM_DISABLED: // The only volatile register that is never used by the calling convention is
// MCASM_DISABLED: // %r11. This happens when calling a vararg function with 6 arguments.
// MCASM_DISABLED: //
// MCASM_DISABLED: // Match an Mcasmtcret that uses less than 7 volatile registers.
// MCASM_DISABLED: def : Pat<(Mcasmtcret GR32_TC:$dst, timm:$off),
// MCASM_DISABLED:           (TCRETURNri GR32_TC:$dst, timm:$off)>,
// MCASM_DISABLED:           Requires<[Not64BitMode, IsNotHiPECCFunc, NotUseIndirectThunkCalls]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(Mcasmtcret GR32:$dst, timm:$off),
// MCASM_DISABLED:           (TCRETURN_HIPE32ri GR32:$dst, timm:$off)>,
// MCASM_DISABLED:           Requires<[Not64BitMode, IsHiPECCFunc, NotUseIndirectThunkCalls]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // FIXME: This is disabled for 32-bit PIC mode because the global base
// MCASM_DISABLED: // register which is part of the address mode may be assigned a
// MCASM_DISABLED: // callee-saved register.
// MCASM_DISABLED: // Similar to Mcasmtcret_6regs, here we only have 1 register left
// MCASM_DISABLED: def : Pat<(Mcasmtcret_1reg (load addr:$dst), timm:$off),
// MCASM_DISABLED:           (TCRETURNmi addr:$dst, timm:$off)>,
// MCASM_DISABLED:           Requires<[Not64BitMode, IsNotPIC, NotUseIndirectThunkCalls]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(Mcasmtcret (i32 tglobaladdr:$dst), timm:$off),
// MCASM_DISABLED:           (TCRETURNdi tglobaladdr:$dst, timm:$off)>,
// MCASM_DISABLED:           Requires<[NotLP64]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(Mcasmtcret (i32 texternalsym:$dst), timm:$off),
// MCASM_DISABLED:           (TCRETURNdi texternalsym:$dst, timm:$off)>,
// MCASM_DISABLED:           Requires<[NotLP64]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(Mcasmtcret ptr_rc_tailcall:$dst, timm:$off),
// MCASM_DISABLED:           (TCRETURNri64 ptr_rc_tailcall:$dst, timm:$off)>,
// MCASM_DISABLED:           Requires<[In64BitMode, IsNotWin64CCFunc, NotUseIndirectThunkCalls, ImportCallOptimizationDisabled]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(Mcasmtcret GR64_TCW64:$dst, timm:$off),
// MCASM_DISABLED:           (TCRETURN_WIN64ri GR64_TCW64:$dst, timm:$off)>,
// MCASM_DISABLED:           Requires<[IsWin64CCFunc, NotUseIndirectThunkCalls, ImportCallOptimizationDisabled]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(Mcasmtcret ptr_rc_tailcall:$dst, timm:$off),
// MCASM_DISABLED:           (TCRETURNri64_ImpCall ptr_rc_tailcall:$dst, timm:$off)>,
// MCASM_DISABLED:           Requires<[In64BitMode, NotUseIndirectThunkCalls, ImportCallOptimizationEnabled]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // Don't fold loads into Mcasmtcret requiring more than 6 regs.
// MCASM_DISABLED: // There wouldn't be enough scratch registers for base+index.
// MCASM_DISABLED: def : Pat<(Mcasmtcret_6regs (load addr:$dst), timm:$off),
// MCASM_DISABLED:           (TCRETURNmi64 addr:$dst, timm:$off)>,
// MCASM_DISABLED:           Requires<[In64BitMode, IsNotWin64CCFunc, NotUseIndirectThunkCalls]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(Mcasmtcret_6regs (load addr:$dst), timm:$off),
// MCASM_DISABLED:           (TCRETURN_WINmi64 addr:$dst, timm:$off)>,
// MCASM_DISABLED:           Requires<[IsWin64CCFunc, NotUseIndirectThunkCalls]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(Mcasmtcret_globaladdr tglobaladdr:$dst, timm:$off),
// MCASM_DISABLED:           (TCRETURNmi64 RIP, 1, zero_reg, tglobaladdr:$dst, zero_reg, timm:$off)>,
// MCASM_DISABLED:           Requires<[In64BitMode, IsNotWin64CCFunc]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(Mcasmtcret_globaladdr tglobaladdr:$dst, timm:$off),
// MCASM_DISABLED:           (TCRETURN_WINmi64 RIP, 1, zero_reg, tglobaladdr:$dst, zero_reg, timm:$off)>,
// MCASM_DISABLED:           Requires<[IsWin64CCFunc]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(Mcasmtcret ptr_rc_tailcall:$dst, timm:$off),
// MCASM_DISABLED:           (INDIRECT_THUNK_TCRETURN64 ptr_rc_tailcall:$dst, timm:$off)>,
// MCASM_DISABLED:           Requires<[In64BitMode, UseIndirectThunkCalls]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(Mcasmtcret ptr_rc_tailcall:$dst, timm:$off),
// MCASM_DISABLED:           (INDIRECT_THUNK_TCRETURN32 ptr_rc_tailcall:$dst, timm:$off)>,
// MCASM_DISABLED:           Requires<[Not64BitMode, UseIndirectThunkCalls]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(Mcasmtcret (i64 tglobaladdr:$dst), timm:$off),
// MCASM_DISABLED:           (TCRETURNdi64 tglobaladdr:$dst, timm:$off)>,
// MCASM_DISABLED:           Requires<[IsLP64]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(Mcasmtcret (i64 texternalsym:$dst), timm:$off),
// MCASM_DISABLED:           (TCRETURNdi64 texternalsym:$dst, timm:$off)>,
// MCASM_DISABLED:           Requires<[IsLP64]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // Normal calls, with various flavors of addresses.
// MCASM_DISABLED: def : Pat<(Mcasmcall (i32 tglobaladdr:$dst)),
// MCASM_DISABLED:           (CALLpcrel32 tglobaladdr:$dst)>;
// MCASM_DISABLED: def : Pat<(Mcasmcall (i32 texternalsym:$dst)),
// MCASM_DISABLED:           (CALLpcrel32 texternalsym:$dst)>;
// MCASM_DISABLED: def : Pat<(Mcasmcall (i32 imm:$dst)),
// MCASM_DISABLED:           (CALLpcrel32 imm:$dst)>, Requires<[CallImmAddr]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(Mcasmcall_globaladdr tglobaladdr:$dst),
// MCASM_DISABLED:           (CALL64m RIP, 1, zero_reg, tglobaladdr:$dst, zero_reg)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // Comparisons.
// MCASM_DISABLED: 
// MCASM_DISABLED: // TEST R,R is smaller than CMP R,0
// MCASM_DISABLED: def : Pat<(Mcasmcmp GR8:$src1, 0),
// MCASM_DISABLED:           (TEST8rr GR8:$src1, GR8:$src1)>;
// MCASM_DISABLED: def : Pat<(Mcasmcmp GR16:$src1, 0),
// MCASM_DISABLED:           (TEST16rr GR16:$src1, GR16:$src1)>;
// MCASM_DISABLED: def : Pat<(Mcasmcmp GR32:$src1, 0),
// MCASM_DISABLED:           (TEST32rr GR32:$src1, GR32:$src1)>;
// MCASM_DISABLED: def : Pat<(Mcasmcmp GR64:$src1, 0),
// MCASM_DISABLED:           (TEST64rr GR64:$src1, GR64:$src1)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // zextload bool -> zextload byte
// MCASM_DISABLED: // i1 stored in one byte in zero-extended form.
// MCASM_DISABLED: // Upper bits cleanup should be executed before Store.
// MCASM_DISABLED: def : Pat<(zextloadi8i1  addr:$src), (MOV8rm addr:$src)>;
// MCASM_DISABLED: def : Pat<(zextloadi16i1 addr:$src),
// MCASM_DISABLED:           (EXTRACT_SUBREG (MOVZX32rm8 addr:$src), sub_16bit)>;
// MCASM_DISABLED: def : Pat<(zextloadi32i1 addr:$src), (MOVZX32rm8 addr:$src)>;
// MCASM_DISABLED: def : Pat<(zextloadi64i1 addr:$src),
// MCASM_DISABLED:           (SUBREG_TO_REG (i64 0), (MOVZX32rm8 addr:$src), sub_32bit)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // extload bool -> extload byte
// MCASM_DISABLED: // When extloading from 16-bit and smaller memory locations into 64-bit
// MCASM_DISABLED: // registers, use zero-extending loads so that the entire 64-bit register is
// MCASM_DISABLED: // defined, avoiding partial-register updates.
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(extloadi8i1 addr:$src),   (MOV8rm      addr:$src)>;
// MCASM_DISABLED: def : Pat<(extloadi16i1 addr:$src),
// MCASM_DISABLED:           (EXTRACT_SUBREG (MOVZX32rm8 addr:$src), sub_16bit)>;
// MCASM_DISABLED: def : Pat<(extloadi32i1 addr:$src),  (MOVZX32rm8  addr:$src)>;
// MCASM_DISABLED: def : Pat<(extloadi16i8 addr:$src),
// MCASM_DISABLED:           (EXTRACT_SUBREG (MOVZX32rm8 addr:$src), sub_16bit)>;
// MCASM_DISABLED: def : Pat<(extloadi32i8 addr:$src),  (MOVZX32rm8  addr:$src)>;
// MCASM_DISABLED: def : Pat<(extloadi32i16 addr:$src), (MOVZX32rm16 addr:$src)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // For other extloads, use subregs, since the high contents of the register are
// MCASM_DISABLED: // defined after an extload.
// MCASM_DISABLED: // NOTE: The extloadi64i32 pattern needs to be first as it will try to form
// MCASM_DISABLED: // 32-bit loads for 4 byte aligned i8/i16 loads.
// MCASM_DISABLED: def : Pat<(extloadi64i32 addr:$src),
// MCASM_DISABLED:           (SUBREG_TO_REG (i64 0), (MOV32rm addr:$src), sub_32bit)>;
// MCASM_DISABLED: def : Pat<(extloadi64i1 addr:$src),
// MCASM_DISABLED:           (SUBREG_TO_REG (i64 0), (MOVZX32rm8 addr:$src), sub_32bit)>;
// MCASM_DISABLED: def : Pat<(extloadi64i8 addr:$src),
// MCASM_DISABLED:           (SUBREG_TO_REG (i64 0), (MOVZX32rm8 addr:$src), sub_32bit)>;
// MCASM_DISABLED: def : Pat<(extloadi64i16 addr:$src),
// MCASM_DISABLED:           (SUBREG_TO_REG (i64 0), (MOVZX32rm16 addr:$src), sub_32bit)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // anyext. Define these to do an explicit zero-extend to
// MCASM_DISABLED: // avoid partial-register updates.
// MCASM_DISABLED: def : Pat<(i16 (anyext GR8 :$src)), (EXTRACT_SUBREG
// MCASM_DISABLED:                                      (MOVZX32rr8 GR8 :$src), sub_16bit)>;
// MCASM_DISABLED: def : Pat<(i32 (anyext GR8 :$src)), (MOVZX32rr8  GR8 :$src)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // Except for i16 -> i32 since isel expect i16 ops to be promoted to i32.
// MCASM_DISABLED: def : Pat<(i32 (anyext GR16:$src)),
// MCASM_DISABLED:           (INSERT_SUBREG (i32 (IMPLICIT_DEF)), GR16:$src, sub_16bit)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(i64 (anyext GR8 :$src)),
// MCASM_DISABLED:           (SUBREG_TO_REG (i64 0), (MOVZX32rr8  GR8  :$src), sub_32bit)>;
// MCASM_DISABLED: def : Pat<(i64 (anyext GR16:$src)),
// MCASM_DISABLED:           (SUBREG_TO_REG (i64 0), (MOVZX32rr16 GR16 :$src), sub_32bit)>;
// MCASM_DISABLED: def : Pat<(i64 (anyext GR32:$src)),
// MCASM_DISABLED:           (INSERT_SUBREG (i64 (IMPLICIT_DEF)), GR32:$src, sub_32bit)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(i32 (anyext_sdiv GR8:$src)), (MOVSX32rr8 GR8:$src)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // In the case of a 32-bit def that is known to implicitly zero-extend,
// MCASM_DISABLED: // we can use a SUBREG_TO_REG.
// MCASM_DISABLED: def : Pat<(i64 (zext def32:$src)),
// MCASM_DISABLED:           (SUBREG_TO_REG (i64 0), GR32:$src, sub_32bit)>;
// MCASM_DISABLED: def : Pat<(i64 (and (anyext def32:$src), 0x00000000FFFFFFFF)),
// MCASM_DISABLED:           (SUBREG_TO_REG (i64 0), GR32:$src, sub_32bit)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: //===----------------------------------------------------------------------===//
// MCASM_DISABLED: // Pattern match OR as ADD
// MCASM_DISABLED: //===----------------------------------------------------------------------===//
// MCASM_DISABLED: 
// MCASM_DISABLED: // If safe, we prefer to pattern match OR as ADD at isel time. ADD can be
// MCASM_DISABLED: // 3-addressified into an LEA instruction to avoid copies.  However, we also
// MCASM_DISABLED: // want to finally emit these instructions as an or at the end of the code
// MCASM_DISABLED: // generator to make the generated code easier to read.  To do this, we select
// MCASM_DISABLED: // into "disjoint bits" pseudo ops.
// MCASM_DISABLED: 
// MCASM_DISABLED: // (or x1, x2) -> (add x1, x2) if two operands are known not to share bits.
// MCASM_DISABLED: // Try this before the selecting to OR.
// MCASM_DISABLED: let SchedRW = [WriteALU] in {
// MCASM_DISABLED: 
// MCASM_DISABLED: let isConvertibleToThreeAddress = 1, isPseudo = 1,
// MCASM_DISABLED:     Constraints = "$src1 = $dst", Defs = [EFLAGS] in {
// MCASM_DISABLED: let isCommutable = 1 in {
// MCASM_DISABLED: def ADD8rr_DB   : I<0, Pseudo, (outs GR8:$dst), (ins GR8:$src1, GR8:$src2),
// MCASM_DISABLED:                     "", // orb/addb REG, REG
// MCASM_DISABLED:                     [(set GR8:$dst, (or_is_add GR8:$src1, GR8:$src2))]>;
// MCASM_DISABLED: def ADD16rr_DB  : I<0, Pseudo, (outs GR16:$dst), (ins GR16:$src1, GR16:$src2),
// MCASM_DISABLED:                     "", // orw/addw REG, REG
// MCASM_DISABLED:                     [(set GR16:$dst, (or_is_add GR16:$src1, GR16:$src2))]>;
// MCASM_DISABLED: def ADD32rr_DB  : I<0, Pseudo, (outs GR32:$dst), (ins GR32:$src1, GR32:$src2),
// MCASM_DISABLED:                     "", // orl/addl REG, REG
// MCASM_DISABLED:                     [(set GR32:$dst, (or_is_add GR32:$src1, GR32:$src2))]>;
// MCASM_DISABLED: def ADD64rr_DB  : I<0, Pseudo, (outs GR64:$dst), (ins GR64:$src1, GR64:$src2),
// MCASM_DISABLED:                     "", // orq/addq REG, REG
// MCASM_DISABLED:                     [(set GR64:$dst, (or_is_add GR64:$src1, GR64:$src2))]>;
// MCASM_DISABLED: } // isCommutable
// MCASM_DISABLED: 
// MCASM_DISABLED: def ADD8ri_DB :   I<0, Pseudo,
// MCASM_DISABLED:                     (outs GR8:$dst), (ins GR8:$src1, i8imm:$src2),
// MCASM_DISABLED:                     "", // orb/addb REG, imm8
// MCASM_DISABLED:                     [(set GR8:$dst, (or_is_add GR8:$src1, imm:$src2))]>;
// MCASM_DISABLED: def ADD16ri_DB  : I<0, Pseudo, (outs GR16:$dst), (ins GR16:$src1, i16imm:$src2),
// MCASM_DISABLED:                     "", // orw/addw REG, imm
// MCASM_DISABLED:                     [(set GR16:$dst, (or_is_add GR16:$src1, imm:$src2))]>;
// MCASM_DISABLED: def ADD32ri_DB  : I<0, Pseudo, (outs GR32:$dst), (ins GR32:$src1, i32imm:$src2),
// MCASM_DISABLED:                     "", // orl/addl REG, imm
// MCASM_DISABLED:                     [(set GR32:$dst, (or_is_add GR32:$src1, imm:$src2))]>;
// MCASM_DISABLED: def ADD64ri32_DB : I<0, Pseudo,
// MCASM_DISABLED:                      (outs GR64:$dst), (ins GR64:$src1, i64i32imm:$src2),
// MCASM_DISABLED:                      "", // orq/addq REG, imm
// MCASM_DISABLED:                      [(set GR64:$dst, (or_is_add GR64:$src1,
// MCASM_DISABLED:                                                  i64immSExt32:$src2))]>;
// MCASM_DISABLED: }
// MCASM_DISABLED: } // AddedComplexity, SchedRW
// MCASM_DISABLED: 
// MCASM_DISABLED: //===----------------------------------------------------------------------===//
// MCASM_DISABLED: // Pattern match XOR as ADD
// MCASM_DISABLED: //===----------------------------------------------------------------------===//
// MCASM_DISABLED: 
// MCASM_DISABLED: // Prefer to pattern match XOR with min_signed_value as ADD at isel time.
// MCASM_DISABLED: // ADD can be 3-addressified into an LEA instruction to avoid copies.
// MCASM_DISABLED: let AddedComplexity = 5 in {
// MCASM_DISABLED: def : Pat<(xor GR8:$src1, -128),
// MCASM_DISABLED:           (ADD8ri GR8:$src1, -128)>;
// MCASM_DISABLED: def : Pat<(xor GR16:$src1, -32768),
// MCASM_DISABLED:           (ADD16ri GR16:$src1, -32768)>;
// MCASM_DISABLED: def : Pat<(xor GR32:$src1, -2147483648),
// MCASM_DISABLED:           (ADD32ri GR32:$src1, -2147483648)>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: //===----------------------------------------------------------------------===//
// MCASM_DISABLED: // Some peepholes
// MCASM_DISABLED: //===----------------------------------------------------------------------===//
// MCASM_DISABLED: 
// MCASM_DISABLED: // Odd encoding trick: -128 fits into an 8-bit immediate field while
// MCASM_DISABLED: // +128 doesn't, so in this special case use a sub instead of an add.
// MCASM_DISABLED: let Predicates = [NoNDD] in {
// MCASM_DISABLED:   def : Pat<(add GR16:$src1, 128),
// MCASM_DISABLED:             (SUB16ri GR16:$src1, -128)>;
// MCASM_DISABLED:   def : Pat<(add GR32:$src1, 128),
// MCASM_DISABLED:             (SUB32ri GR32:$src1, -128)>;
// MCASM_DISABLED:   def : Pat<(add GR64:$src1, 128),
// MCASM_DISABLED:             (SUB64ri32 GR64:$src1, -128)>;
// MCASM_DISABLED: 
// MCASM_DISABLED:   def : Pat<(Mcasmadd_flag_nocf GR16:$src1, 128),
// MCASM_DISABLED:             (SUB16ri GR16:$src1, -128)>;
// MCASM_DISABLED:   def : Pat<(Mcasmadd_flag_nocf GR32:$src1, 128),
// MCASM_DISABLED:             (SUB32ri GR32:$src1, -128)>;
// MCASM_DISABLED:   def : Pat<(Mcasmadd_flag_nocf GR64:$src1, 128),
// MCASM_DISABLED:             (SUB64ri32 GR64:$src1, -128)>;
// MCASM_DISABLED: }
// MCASM_DISABLED: let Predicates = [HasNDD] in {
// MCASM_DISABLED:   def : Pat<(add GR16:$src1, 128),
// MCASM_DISABLED:             (SUB16ri_ND GR16:$src1, -128)>;
// MCASM_DISABLED:   def : Pat<(add GR32:$src1, 128),
// MCASM_DISABLED:             (SUB32ri_ND GR32:$src1, -128)>;
// MCASM_DISABLED:   def : Pat<(add GR64:$src1, 128),
// MCASM_DISABLED:             (SUB64ri32_ND GR64:$src1, -128)>;
// MCASM_DISABLED: 
// MCASM_DISABLED:   def : Pat<(Mcasmadd_flag_nocf GR16:$src1, 128),
// MCASM_DISABLED:             (SUB16ri_ND GR16:$src1, -128)>;
// MCASM_DISABLED:   def : Pat<(Mcasmadd_flag_nocf GR32:$src1, 128),
// MCASM_DISABLED:             (SUB32ri_ND GR32:$src1, -128)>;
// MCASM_DISABLED:   def : Pat<(Mcasmadd_flag_nocf GR64:$src1, 128),
// MCASM_DISABLED:             (SUB64ri32_ND GR64:$src1, -128)>;
// MCASM_DISABLED: }
// MCASM_DISABLED: def : Pat<(store (add (loadi16 addr:$dst), 128), addr:$dst),
// MCASM_DISABLED:           (SUB16mi addr:$dst, -128)>;
// MCASM_DISABLED: def : Pat<(store (add (loadi32 addr:$dst), 128), addr:$dst),
// MCASM_DISABLED:           (SUB32mi addr:$dst, -128)>;
// MCASM_DISABLED: def : Pat<(store (add (loadi64 addr:$dst), 128), addr:$dst),
// MCASM_DISABLED:           (SUB64mi32 addr:$dst, -128)>;
// MCASM_DISABLED: let Predicates = [HasNDD] in {
// MCASM_DISABLED:   def : Pat<(add (loadi16 addr:$src), 128),
// MCASM_DISABLED:             (SUB16mi_ND addr:$src, -128)>;
// MCASM_DISABLED:   def : Pat<(add (loadi32 addr:$src), 128),
// MCASM_DISABLED:             (SUB32mi_ND addr:$src, -128)>;
// MCASM_DISABLED:   def : Pat<(add (loadi64 addr:$src), 128),
// MCASM_DISABLED:             (SUB64mi32_ND addr:$src, -128)>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: // The same trick applies for 32-bit immediate fields in 64-bit
// MCASM_DISABLED: // instructions.
// MCASM_DISABLED: let Predicates = [NoNDD] in {
// MCASM_DISABLED:   def : Pat<(add GR64:$src1, 0x0000000080000000),
// MCASM_DISABLED:             (SUB64ri32 GR64:$src1, 0xffffffff80000000)>;
// MCASM_DISABLED:   def : Pat<(Mcasmadd_flag_nocf GR64:$src1, 0x0000000080000000),
// MCASM_DISABLED:             (SUB64ri32 GR64:$src1, 0xffffffff80000000)>;
// MCASM_DISABLED: }
// MCASM_DISABLED: let Predicates = [HasNDD] in {
// MCASM_DISABLED:   def : Pat<(add GR64:$src1, 0x0000000080000000),
// MCASM_DISABLED:             (SUB64ri32_ND GR64:$src1, 0xffffffff80000000)>;
// MCASM_DISABLED:   def : Pat<(Mcasmadd_flag_nocf GR64:$src1, 0x0000000080000000),
// MCASM_DISABLED:             (SUB64ri32_ND GR64:$src1, 0xffffffff80000000)>;
// MCASM_DISABLED: }
// MCASM_DISABLED: def : Pat<(store (add (loadi64 addr:$dst), 0x0000000080000000), addr:$dst),
// MCASM_DISABLED:           (SUB64mi32 addr:$dst, 0xffffffff80000000)>;
// MCASM_DISABLED: let Predicates = [HasNDD] in {
// MCASM_DISABLED:   def : Pat<(add(loadi64 addr:$src), 0x0000000080000000),
// MCASM_DISABLED:             (SUB64mi32_ND addr:$src, 0xffffffff80000000)>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: // Depositing value to 8/16 bit subreg:
// MCASM_DISABLED: def : Pat<(or (and GR64:$dst, -256),
// MCASM_DISABLED:               (i64 (zextloadi8 addr:$src))),
// MCASM_DISABLED:           (INSERT_SUBREG (i64 (COPY $dst)), (MOV8rm  i8mem:$src), sub_8bit)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(or (and GR32:$dst, -256),
// MCASM_DISABLED:               (i32 (zextloadi8 addr:$src))),
// MCASM_DISABLED:           (INSERT_SUBREG (i32 (COPY $dst)), (MOV8rm  i8mem:$src), sub_8bit)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(or (and GR64:$dst, -65536),
// MCASM_DISABLED:               (i64 (zextloadi16 addr:$src))),
// MCASM_DISABLED:           (INSERT_SUBREG (i64 (COPY $dst)), (MOV16rm  i16mem:$src), sub_16bit)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(or (and GR32:$dst, -65536),
// MCASM_DISABLED:               (i32 (zextloadi16 addr:$src))),
// MCASM_DISABLED:           (INSERT_SUBREG (i32 (COPY $dst)), (MOV16rm  i16mem:$src), sub_16bit)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // To avoid needing to materialize an immediate in a register, use a 32-bit and
// MCASM_DISABLED: // with implicit zero-extension instead of a 64-bit and if the immediate has at
// MCASM_DISABLED: // least 32 bits of leading zeros. If in addition the last 32 bits can be
// MCASM_DISABLED: // represented with a sign extension of a 8 bit constant, use that.
// MCASM_DISABLED: // This can also reduce instruction size by eliminating the need for the REX
// MCASM_DISABLED: // prefix.
// MCASM_DISABLED: 
// MCASM_DISABLED: // AddedComplexity is needed to give priority over i64immSExt8 and i64immSExt32.
// MCASM_DISABLED: let AddedComplexity = 1 in {
// MCASM_DISABLED:   let Predicates = [NoNDD] in {
// MCASM_DISABLED:     def : Pat<(and GR64:$src, i64immZExt32:$imm),
// MCASM_DISABLED:               (SUBREG_TO_REG
// MCASM_DISABLED:                 (i64 0),
// MCASM_DISABLED:                 (AND32ri
// MCASM_DISABLED:                   (EXTRACT_SUBREG GR64:$src, sub_32bit),
// MCASM_DISABLED:                   (i32 (GetLo32XForm imm:$imm))),
// MCASM_DISABLED:                 sub_32bit)>;
// MCASM_DISABLED:   }
// MCASM_DISABLED:   let Predicates = [HasNDD] in {
// MCASM_DISABLED:     def : Pat<(and GR64:$src, i64immZExt32:$imm),
// MCASM_DISABLED:               (SUBREG_TO_REG
// MCASM_DISABLED:                 (i64 0),
// MCASM_DISABLED:                 (AND32ri_ND
// MCASM_DISABLED:                   (EXTRACT_SUBREG GR64:$src, sub_32bit),
// MCASM_DISABLED:                   (i32 (GetLo32XForm imm:$imm))),
// MCASM_DISABLED:                 sub_32bit)>;
// MCASM_DISABLED:   }
// MCASM_DISABLED: } // AddedComplexity = 1
// MCASM_DISABLED: 
// MCASM_DISABLED: 
// MCASM_DISABLED: // AddedComplexity is needed due to the increased complexity on the
// MCASM_DISABLED: // i64immZExt32SExt8 and i64immZExt32 patterns above. Applying this to all
// MCASM_DISABLED: // the MOVZX patterns keeps thems together in DAGIsel tables.
// MCASM_DISABLED: let AddedComplexity = 1 in {
// MCASM_DISABLED: // r & (2^16-1) ==> movz
// MCASM_DISABLED: def : Pat<(and GR32:$src1, 0xffff),
// MCASM_DISABLED:           (MOVZX32rr16 (EXTRACT_SUBREG GR32:$src1, sub_16bit))>;
// MCASM_DISABLED: // r & (2^8-1) ==> movz
// MCASM_DISABLED: def : Pat<(and GR32:$src1, 0xff),
// MCASM_DISABLED:           (MOVZX32rr8 (EXTRACT_SUBREG GR32:$src1, sub_8bit))>;
// MCASM_DISABLED: // r & (2^8-1) ==> movz
// MCASM_DISABLED: def : Pat<(and GR16:$src1, 0xff),
// MCASM_DISABLED:            (EXTRACT_SUBREG (MOVZX32rr8 (EXTRACT_SUBREG GR16:$src1, sub_8bit)),
// MCASM_DISABLED:              sub_16bit)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // r & (2^32-1) ==> movz
// MCASM_DISABLED: def : Pat<(and GR64:$src, 0x00000000FFFFFFFF),
// MCASM_DISABLED:           (SUBREG_TO_REG (i64 0),
// MCASM_DISABLED:                          (MOV32rr (EXTRACT_SUBREG GR64:$src, sub_32bit)),
// MCASM_DISABLED:                          sub_32bit)>;
// MCASM_DISABLED: // r & (2^16-1) ==> movz
// MCASM_DISABLED: def : Pat<(and GR64:$src, 0xffff),
// MCASM_DISABLED:           (SUBREG_TO_REG (i64 0),
// MCASM_DISABLED:                       (MOVZX32rr16 (i16 (EXTRACT_SUBREG GR64:$src, sub_16bit))),
// MCASM_DISABLED:                       sub_32bit)>;
// MCASM_DISABLED: // r & (2^8-1) ==> movz
// MCASM_DISABLED: def : Pat<(and GR64:$src, 0xff),
// MCASM_DISABLED:           (SUBREG_TO_REG (i64 0),
// MCASM_DISABLED:                          (MOVZX32rr8 (i8 (EXTRACT_SUBREG GR64:$src, sub_8bit))),
// MCASM_DISABLED:                          sub_32bit)>;
// MCASM_DISABLED: } // AddedComplexity = 1
// MCASM_DISABLED: 
// MCASM_DISABLED: 
// MCASM_DISABLED: // Try to use BTS/BTR/BTC for single bit operations on the upper 32-bits.
// MCASM_DISABLED: 
// MCASM_DISABLED: def BTRXForm : SDNodeXForm<imm, [{
// MCASM_DISABLED:   // Transformation function: Find the lowest 0.
// MCASM_DISABLED:   return getI64Imm((uint8_t)N->getAPIntValue().countr_one(), SDLoc(N));
// MCASM_DISABLED: }]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def BTCBTSXForm : SDNodeXForm<imm, [{
// MCASM_DISABLED:   // Transformation function: Find the lowest 1.
// MCASM_DISABLED:   return getI64Imm((uint8_t)N->getAPIntValue().countr_zero(), SDLoc(N));
// MCASM_DISABLED: }]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def BTRMask64 : ImmLeaf<i64, [{
// MCASM_DISABLED:   return !isUInt<32>(Imm) && !isInt<32>(Imm) && isPowerOf2_64(~Imm);
// MCASM_DISABLED: }]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def BTCBTSMask64 : ImmLeaf<i64, [{
// MCASM_DISABLED:   return !isInt<32>(Imm) && isPowerOf2_64(Imm);
// MCASM_DISABLED: }]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // For now only do this for optsize.
// MCASM_DISABLED: let AddedComplexity = 1, Predicates=[OptForSize] in {
// MCASM_DISABLED:   def : Pat<(and GR64:$src1, BTRMask64:$mask),
// MCASM_DISABLED:             (BTR64ri8 GR64:$src1, (BTRXForm imm:$mask))>;
// MCASM_DISABLED:   def : Pat<(or GR64:$src1, BTCBTSMask64:$mask),
// MCASM_DISABLED:             (BTS64ri8 GR64:$src1, (BTCBTSXForm imm:$mask))>;
// MCASM_DISABLED:   def : Pat<(xor GR64:$src1, BTCBTSMask64:$mask),
// MCASM_DISABLED:             (BTC64ri8 GR64:$src1, (BTCBTSXForm imm:$mask))>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: 
// MCASM_DISABLED: // sext_inreg patterns
// MCASM_DISABLED: def : Pat<(sext_inreg GR32:$src, i16),
// MCASM_DISABLED:           (MOVSX32rr16 (EXTRACT_SUBREG GR32:$src, sub_16bit))>;
// MCASM_DISABLED: def : Pat<(sext_inreg GR32:$src, i8),
// MCASM_DISABLED:           (MOVSX32rr8 (EXTRACT_SUBREG GR32:$src, sub_8bit))>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(sext_inreg GR16:$src, i8),
// MCASM_DISABLED:            (EXTRACT_SUBREG (MOVSX32rr8 (EXTRACT_SUBREG GR16:$src, sub_8bit)),
// MCASM_DISABLED:              sub_16bit)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def : Pat<(sext_inreg GR64:$src, i32),
// MCASM_DISABLED:           (MOVSX64rr32 (EXTRACT_SUBREG GR64:$src, sub_32bit))>;
// MCASM_DISABLED: def : Pat<(sext_inreg GR64:$src, i16),
// MCASM_DISABLED:           (MOVSX64rr16 (EXTRACT_SUBREG GR64:$src, sub_16bit))>;
// MCASM_DISABLED: def : Pat<(sext_inreg GR64:$src, i8),
// MCASM_DISABLED:           (MOVSX64rr8 (EXTRACT_SUBREG GR64:$src, sub_8bit))>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // sext, sext_load, zext, zext_load
// MCASM_DISABLED: def: Pat<(i16 (sext GR8:$src)),
// MCASM_DISABLED:           (EXTRACT_SUBREG (MOVSX32rr8 GR8:$src), sub_16bit)>;
// MCASM_DISABLED: def: Pat<(sextloadi16i8 addr:$src),
// MCASM_DISABLED:           (EXTRACT_SUBREG (MOVSX32rm8 addr:$src), sub_16bit)>;
// MCASM_DISABLED: def: Pat<(i16 (zext GR8:$src)),
// MCASM_DISABLED:           (EXTRACT_SUBREG (MOVZX32rr8 GR8:$src), sub_16bit)>;
// MCASM_DISABLED: def: Pat<(zextloadi16i8 addr:$src),
// MCASM_DISABLED:           (EXTRACT_SUBREG (MOVZX32rm8 addr:$src), sub_16bit)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // trunc patterns
// MCASM_DISABLED: def : Pat<(i16 (trunc GR32:$src)),
// MCASM_DISABLED:           (EXTRACT_SUBREG GR32:$src, sub_16bit)>;
// MCASM_DISABLED: def : Pat<(i8 (trunc GR32:$src)),
// MCASM_DISABLED:           (EXTRACT_SUBREG (i32 (COPY_TO_REGCLASS GR32:$src, GR32_ABCD)),
// MCASM_DISABLED:                           sub_8bit)>,
// MCASM_DISABLED:       Requires<[Not64BitMode]>;
// MCASM_DISABLED: def : Pat<(i8 (trunc GR16:$src)),
// MCASM_DISABLED:           (EXTRACT_SUBREG (i16 (COPY_TO_REGCLASS GR16:$src, GR16_ABCD)),
// MCASM_DISABLED:                           sub_8bit)>,
// MCASM_DISABLED:       Requires<[Not64BitMode]>;
// MCASM_DISABLED: def : Pat<(i32 (trunc GR64:$src)),
// MCASM_DISABLED:           (EXTRACT_SUBREG GR64:$src, sub_32bit)>;
// MCASM_DISABLED: def : Pat<(i16 (trunc GR64:$src)),
// MCASM_DISABLED:           (EXTRACT_SUBREG GR64:$src, sub_16bit)>;
// MCASM_DISABLED: def : Pat<(i8 (trunc GR64:$src)),
// MCASM_DISABLED:           (EXTRACT_SUBREG GR64:$src, sub_8bit)>;
// MCASM_DISABLED: def : Pat<(i8 (trunc GR32:$src)),
// MCASM_DISABLED:           (EXTRACT_SUBREG GR32:$src, sub_8bit)>,
// MCASM_DISABLED:       Requires<[In64BitMode]>;
// MCASM_DISABLED: def : Pat<(i8 (trunc GR16:$src)),
// MCASM_DISABLED:           (EXTRACT_SUBREG GR16:$src, sub_8bit)>,
// MCASM_DISABLED:       Requires<[In64BitMode]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: def immff00_ffff  : ImmLeaf<i32, [{
// MCASM_DISABLED:   return Imm >= 0xff00 && Imm <= 0xffff;
// MCASM_DISABLED: }]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // h-register tricks
// MCASM_DISABLED: def : Pat<(i8 (trunc (srl_su GR16:$src, (i8 8)))),
// MCASM_DISABLED:           (EXTRACT_SUBREG GR16:$src, sub_8bit_hi)>,
// MCASM_DISABLED:       Requires<[Not64BitMode]>;
// MCASM_DISABLED: def : Pat<(i8 (trunc (srl_su (i32 (anyext GR16:$src)), (i8 8)))),
// MCASM_DISABLED:           (EXTRACT_SUBREG GR16:$src, sub_8bit_hi)>,
// MCASM_DISABLED:       Requires<[Not64BitMode]>;
// MCASM_DISABLED: def : Pat<(i8 (trunc (srl_su GR32:$src, (i8 8)))),
// MCASM_DISABLED:           (EXTRACT_SUBREG GR32:$src, sub_8bit_hi)>,
// MCASM_DISABLED:       Requires<[Not64BitMode]>;
// MCASM_DISABLED: def : Pat<(srl GR16:$src, (i8 8)),
// MCASM_DISABLED:           (EXTRACT_SUBREG
// MCASM_DISABLED:             (MOVZX32rr8_NOREX (EXTRACT_SUBREG GR16:$src, sub_8bit_hi)),
// MCASM_DISABLED:             sub_16bit)>;
// MCASM_DISABLED: def : Pat<(i32 (zext (srl_su GR16:$src, (i8 8)))),
// MCASM_DISABLED:           (MOVZX32rr8_NOREX (EXTRACT_SUBREG GR16:$src, sub_8bit_hi))>;
// MCASM_DISABLED: def : Pat<(i32 (anyext (srl_su GR16:$src, (i8 8)))),
// MCASM_DISABLED:           (MOVZX32rr8_NOREX (EXTRACT_SUBREG GR16:$src, sub_8bit_hi))>;
// MCASM_DISABLED: def : Pat<(and (srl_su GR32:$src, (i8 8)), (i32 255)),
// MCASM_DISABLED:           (MOVZX32rr8_NOREX (EXTRACT_SUBREG GR32:$src, sub_8bit_hi))>;
// MCASM_DISABLED: def : Pat<(srl (and_su GR32:$src, immff00_ffff), (i8 8)),
// MCASM_DISABLED:           (MOVZX32rr8_NOREX (EXTRACT_SUBREG GR32:$src, sub_8bit_hi))>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // h-register tricks.
// MCASM_DISABLED: // For now, be conservative on x86-64 and use an h-register extract only if the
// MCASM_DISABLED: // value is immediately zero-extended or stored, which are somewhat common
// MCASM_DISABLED: // cases. This uses a bunch of code to prevent a register requiring a REX prefix
// MCASM_DISABLED: // from being allocated in the same instruction as the h register, as there's
// MCASM_DISABLED: // currently no way to describe this requirement to the register allocator.
// MCASM_DISABLED: 
// MCASM_DISABLED: // h-register extract and zero-extend.
// MCASM_DISABLED: def : Pat<(and (srl_su GR64:$src, (i8 8)), (i64 255)),
// MCASM_DISABLED:           (SUBREG_TO_REG
// MCASM_DISABLED:             (i64 0),
// MCASM_DISABLED:             (MOVZX32rr8_NOREX
// MCASM_DISABLED:               (EXTRACT_SUBREG GR64:$src, sub_8bit_hi)),
// MCASM_DISABLED:             sub_32bit)>;
// MCASM_DISABLED: def : Pat<(i64 (zext (srl_su GR16:$src, (i8 8)))),
// MCASM_DISABLED:           (SUBREG_TO_REG
// MCASM_DISABLED:             (i64 0),
// MCASM_DISABLED:             (MOVZX32rr8_NOREX
// MCASM_DISABLED:               (EXTRACT_SUBREG GR16:$src, sub_8bit_hi)),
// MCASM_DISABLED:             sub_32bit)>;
// MCASM_DISABLED: def : Pat<(i64 (anyext (srl_su GR16:$src, (i8 8)))),
// MCASM_DISABLED:           (SUBREG_TO_REG
// MCASM_DISABLED:             (i64 0),
// MCASM_DISABLED:             (MOVZX32rr8_NOREX
// MCASM_DISABLED:               (EXTRACT_SUBREG GR16:$src, sub_8bit_hi)),
// MCASM_DISABLED:             sub_32bit)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // h-register extract and store.
// MCASM_DISABLED: def : Pat<(store (i8 (trunc_su (srl_su GR64:$src, (i8 8)))), addr:$dst),
// MCASM_DISABLED:           (MOV8mr_NOREX
// MCASM_DISABLED:             addr:$dst,
// MCASM_DISABLED:             (EXTRACT_SUBREG GR64:$src, sub_8bit_hi))>;
// MCASM_DISABLED: def : Pat<(store (i8 (trunc_su (srl_su GR32:$src, (i8 8)))), addr:$dst),
// MCASM_DISABLED:           (MOV8mr_NOREX
// MCASM_DISABLED:             addr:$dst,
// MCASM_DISABLED:             (EXTRACT_SUBREG GR32:$src, sub_8bit_hi))>,
// MCASM_DISABLED:       Requires<[In64BitMode]>;
// MCASM_DISABLED: def : Pat<(store (i8 (trunc_su (srl_su GR16:$src, (i8 8)))), addr:$dst),
// MCASM_DISABLED:           (MOV8mr_NOREX
// MCASM_DISABLED:             addr:$dst,
// MCASM_DISABLED:             (EXTRACT_SUBREG GR16:$src, sub_8bit_hi))>,
// MCASM_DISABLED:       Requires<[In64BitMode]>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // Special pattern to catch the last step of __builtin_parity handling. Our
// MCASM_DISABLED: // goal is to use an xor of an h-register with the corresponding l-register.
// MCASM_DISABLED: // The above patterns would handle this on non 64-bit targets, but for 64-bit
// MCASM_DISABLED: // we need to be more careful. We're using a NOREX instruction here in case
// MCASM_DISABLED: // register allocation fails to keep the two registers together. So we need to
// MCASM_DISABLED: // make sure we can't accidentally mix R8-R15 with an h-register.
// MCASM_DISABLED: def : Pat<(Mcasmxor_flag (i8 (trunc GR32:$src)),
// MCASM_DISABLED:                        (i8 (trunc (srl_su GR32:$src, (i8 8))))),
// MCASM_DISABLED:           (XOR8rr_NOREX (EXTRACT_SUBREG GR32:$src, sub_8bit),
// MCASM_DISABLED:                         (EXTRACT_SUBREG GR32:$src, sub_8bit_hi))>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // (shl x, 1) ==> (add x, x)
// MCASM_DISABLED: // Note that if x is undef (immediate or otherwise), we could theoretically
// MCASM_DISABLED: // end up with the two uses of x getting different values, producing a result
// MCASM_DISABLED: // where the least significant bit is not 0. However, the probability of this
// MCASM_DISABLED: // happening is considered low enough that this is officially not a
// MCASM_DISABLED: // "real problem".
// MCASM_DISABLED: let Predicates = [NoNDD] in {
// MCASM_DISABLED:   def : Pat<(shl GR8 :$src1, (i8 1)), (ADD8rr  GR8 :$src1, GR8 :$src1)>;
// MCASM_DISABLED:   def : Pat<(shl GR16:$src1, (i8 1)), (ADD16rr GR16:$src1, GR16:$src1)>;
// MCASM_DISABLED:   def : Pat<(shl GR32:$src1, (i8 1)), (ADD32rr GR32:$src1, GR32:$src1)>;
// MCASM_DISABLED:   def : Pat<(shl GR64:$src1, (i8 1)), (ADD64rr GR64:$src1, GR64:$src1)>;
// MCASM_DISABLED: }
// MCASM_DISABLED: let Predicates = [HasNDD] in {
// MCASM_DISABLED:   def : Pat<(shl GR8 :$src1, (i8 1)), (ADD8rr_ND  GR8 :$src1, GR8 :$src1)>;
// MCASM_DISABLED:   def : Pat<(shl GR16:$src1, (i8 1)), (ADD16rr_ND GR16:$src1, GR16:$src1)>;
// MCASM_DISABLED:   def : Pat<(shl GR32:$src1, (i8 1)), (ADD32rr_ND GR32:$src1, GR32:$src1)>;
// MCASM_DISABLED:   def : Pat<(shl GR64:$src1, (i8 1)), (ADD64rr_ND GR64:$src1, GR64:$src1)>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: // Shift amount is implicitly masked.
// MCASM_DISABLED: multiclass MaskedShiftAmountPats<SDNode frag> {
// MCASM_DISABLED:   // (shift x (and y, 31)) ==> (shift x, y)
// MCASM_DISABLED:   // (shift x (and y, 63)) ==> (shift x, y)
// MCASM_DISABLED:   let Predicates = [NoNDD] in {
// MCASM_DISABLED:     def : Pat<(frag GR8:$src1, (shiftMask32 CL)),
// MCASM_DISABLED:               (!cast<Instruction>(NAME # "8rCL") GR8:$src1)>;
// MCASM_DISABLED:     def : Pat<(frag GR16:$src1, (shiftMask32 CL)),
// MCASM_DISABLED:               (!cast<Instruction>(NAME # "16rCL") GR16:$src1)>;
// MCASM_DISABLED:     def : Pat<(frag GR32:$src1, (shiftMask32 CL)),
// MCASM_DISABLED:               (!cast<Instruction>(NAME # "32rCL") GR32:$src1)>;
// MCASM_DISABLED:     def : Pat<(frag GR64:$src1, (shiftMask64 CL)),
// MCASM_DISABLED:               (!cast<Instruction>(NAME # "64rCL") GR64:$src1)>;
// MCASM_DISABLED:   }
// MCASM_DISABLED:   let Predicates = [HasNDD] in {
// MCASM_DISABLED:     def : Pat<(frag GR8:$src1, (shiftMask32 CL)),
// MCASM_DISABLED:               (!cast<Instruction>(NAME # "8rCL_ND") GR8:$src1)>;
// MCASM_DISABLED:     def : Pat<(frag GR16:$src1, (shiftMask32 CL)),
// MCASM_DISABLED:               (!cast<Instruction>(NAME # "16rCL_ND") GR16:$src1)>;
// MCASM_DISABLED:     def : Pat<(frag GR32:$src1, (shiftMask32 CL)),
// MCASM_DISABLED:               (!cast<Instruction>(NAME # "32rCL_ND") GR32:$src1)>;
// MCASM_DISABLED:     def : Pat<(frag GR64:$src1, (shiftMask64 CL)),
// MCASM_DISABLED:               (!cast<Instruction>(NAME # "64rCL_ND") GR64:$src1)>;
// MCASM_DISABLED:   }
// MCASM_DISABLED: 
// MCASM_DISABLED:   def : Pat<(store (frag (loadi8 addr:$dst), (shiftMask32 CL)), addr:$dst),
// MCASM_DISABLED:             (!cast<Instruction>(NAME # "8mCL") addr:$dst)>;
// MCASM_DISABLED:   def : Pat<(store (frag (loadi16 addr:$dst), (shiftMask32 CL)), addr:$dst),
// MCASM_DISABLED:             (!cast<Instruction>(NAME # "16mCL") addr:$dst)>;
// MCASM_DISABLED:   def : Pat<(store (frag (loadi32 addr:$dst), (shiftMask32 CL)), addr:$dst),
// MCASM_DISABLED:             (!cast<Instruction>(NAME # "32mCL") addr:$dst)>;
// MCASM_DISABLED:   def : Pat<(store (frag (loadi64 addr:$dst), (shiftMask64 CL)), addr:$dst),
// MCASM_DISABLED:             (!cast<Instruction>(NAME # "64mCL") addr:$dst)>;
// MCASM_DISABLED: 
// MCASM_DISABLED:   let Predicates = [HasNDD] in {
// MCASM_DISABLED:     def : Pat<(frag (loadi8 addr:$src), (shiftMask32 CL)),
// MCASM_DISABLED:               (!cast<Instruction>(NAME # "8mCL_ND") addr:$src)>;
// MCASM_DISABLED:     def : Pat<(frag (loadi16 addr:$src), (shiftMask32 CL)),
// MCASM_DISABLED:               (!cast<Instruction>(NAME # "16mCL_ND") addr:$src)>;
// MCASM_DISABLED:     def : Pat<(frag (loadi32 addr:$src), (shiftMask32 CL)),
// MCASM_DISABLED:               (!cast<Instruction>(NAME # "32mCL_ND") addr:$src)>;
// MCASM_DISABLED:     def : Pat<(frag (loadi64 addr:$src), (shiftMask64 CL)),
// MCASM_DISABLED:               (!cast<Instruction>(NAME # "64mCL_ND") addr:$src)>;
// MCASM_DISABLED:   }
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: defm SHL : MaskedShiftAmountPats<shl>;
// MCASM_DISABLED: defm SHR : MaskedShiftAmountPats<srl>;
// MCASM_DISABLED: defm SAR : MaskedShiftAmountPats<sra>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // ROL/ROR instructions allow a stronger mask optimization than shift for 8- and
// MCASM_DISABLED: // 16-bit. We can remove a mask of any (bitwidth - 1) on the rotation amount
// MCASM_DISABLED: // because over-rotating produces the same result. This is noted in the Intel
// MCASM_DISABLED: // docs with: "tempCOUNT <- (COUNT & COUNTMASK) MOD SIZE". Masking the rotation
// MCASM_DISABLED: // amount could affect EFLAGS results, but that does not matter because we are
// MCASM_DISABLED: // not tracking flags for these nodes.
// MCASM_DISABLED: multiclass MaskedRotateAmountPats<SDNode frag> {
// MCASM_DISABLED:   // (rot x (and y, BitWidth - 1)) ==> (rot x, y)
// MCASM_DISABLED:   let Predicates = [NoNDD] in {
// MCASM_DISABLED:     def : Pat<(frag GR8:$src1, (shiftMask8 CL)),
// MCASM_DISABLED:               (!cast<Instruction>(NAME # "8rCL") GR8:$src1)>;
// MCASM_DISABLED:     def : Pat<(frag GR16:$src1, (shiftMask16 CL)),
// MCASM_DISABLED:               (!cast<Instruction>(NAME # "16rCL") GR16:$src1)>;
// MCASM_DISABLED:     def : Pat<(frag GR32:$src1, (shiftMask32 CL)),
// MCASM_DISABLED:               (!cast<Instruction>(NAME # "32rCL") GR32:$src1)>;
// MCASM_DISABLED:     def : Pat<(frag GR64:$src1, (shiftMask64 CL)),
// MCASM_DISABLED:               (!cast<Instruction>(NAME # "64rCL") GR64:$src1)>;
// MCASM_DISABLED:   }
// MCASM_DISABLED:   let Predicates = [HasNDD] in {
// MCASM_DISABLED:     def : Pat<(frag GR8:$src1, (shiftMask8 CL)),
// MCASM_DISABLED:               (!cast<Instruction>(NAME # "8rCL_ND") GR8:$src1)>;
// MCASM_DISABLED:     def : Pat<(frag GR16:$src1, (shiftMask16 CL)),
// MCASM_DISABLED:               (!cast<Instruction>(NAME # "16rCL_ND") GR16:$src1)>;
// MCASM_DISABLED:     def : Pat<(frag GR32:$src1, (shiftMask32 CL)),
// MCASM_DISABLED:               (!cast<Instruction>(NAME # "32rCL_ND") GR32:$src1)>;
// MCASM_DISABLED:     def : Pat<(frag GR64:$src1, (shiftMask64 CL)),
// MCASM_DISABLED:               (!cast<Instruction>(NAME # "64rCL_ND") GR64:$src1)>;
// MCASM_DISABLED:   }
// MCASM_DISABLED: 
// MCASM_DISABLED:   def : Pat<(store (frag (loadi8 addr:$dst), (shiftMask8 CL)), addr:$dst),
// MCASM_DISABLED:             (!cast<Instruction>(NAME # "8mCL") addr:$dst)>;
// MCASM_DISABLED:   def : Pat<(store (frag (loadi16 addr:$dst), (shiftMask16 CL)), addr:$dst),
// MCASM_DISABLED:             (!cast<Instruction>(NAME # "16mCL") addr:$dst)>;
// MCASM_DISABLED:   def : Pat<(store (frag (loadi32 addr:$dst), (shiftMask32 CL)), addr:$dst),
// MCASM_DISABLED:             (!cast<Instruction>(NAME # "32mCL") addr:$dst)>;
// MCASM_DISABLED:   def : Pat<(store (frag (loadi64 addr:$dst), (shiftMask64 CL)), addr:$dst),
// MCASM_DISABLED:             (!cast<Instruction>(NAME # "64mCL") addr:$dst)>;
// MCASM_DISABLED: 
// MCASM_DISABLED:   let Predicates = [HasNDD] in {
// MCASM_DISABLED:     def : Pat<(frag (loadi8 addr:$src), (shiftMask8 CL)),
// MCASM_DISABLED:               (!cast<Instruction>(NAME # "8mCL_ND") addr:$src)>;
// MCASM_DISABLED:     def : Pat<(frag (loadi16 addr:$src), (shiftMask16 CL)),
// MCASM_DISABLED:               (!cast<Instruction>(NAME # "16mCL_ND") addr:$src)>;
// MCASM_DISABLED:     def : Pat<(frag (loadi32 addr:$src), (shiftMask32 CL)),
// MCASM_DISABLED:               (!cast<Instruction>(NAME # "32mCL_ND") addr:$src)>;
// MCASM_DISABLED:     def : Pat<(frag (loadi64 addr:$src), (shiftMask64 CL)),
// MCASM_DISABLED:               (!cast<Instruction>(NAME # "64mCL_ND") addr:$src)>;
// MCASM_DISABLED:   }
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: defm ROL : MaskedRotateAmountPats<rotl>;
// MCASM_DISABLED: defm ROR : MaskedRotateAmountPats<rotr>;
// MCASM_DISABLED: 
// MCASM_DISABLED: multiclass MaskedShlrdAmountPats<string suffix, Predicate p> {
// MCASM_DISABLED:   let Predicates = [p] in {
// MCASM_DISABLED:     // Double "funnel" shift amount is implicitly masked.
// MCASM_DISABLED:     // (fshl/fshr x (and y, 31)) ==> (fshl/fshr x, y) (NOTE: modulo32)
// MCASM_DISABLED:     def : Pat<(Mcasmfshl GR16:$src1, GR16:$src2, (shiftMask32 CL)),
// MCASM_DISABLED:               (!cast<Instruction>(SHLD16rrCL#suffix) GR16:$src1, GR16:$src2)>;
// MCASM_DISABLED:     def : Pat<(Mcasmfshr GR16:$src2, GR16:$src1, (shiftMask32 CL)),
// MCASM_DISABLED:               (!cast<Instruction>(SHRD16rrCL#suffix) GR16:$src1, GR16:$src2)>;
// MCASM_DISABLED: 
// MCASM_DISABLED:     // (fshl/fshr x (and y, 31)) ==> (fshl/fshr x, y)
// MCASM_DISABLED:     def : Pat<(fshl GR32:$src1, GR32:$src2, (shiftMask32 CL)),
// MCASM_DISABLED:               (!cast<Instruction>(SHLD32rrCL#suffix) GR32:$src1, GR32:$src2)>;
// MCASM_DISABLED:     def : Pat<(fshr GR32:$src2, GR32:$src1, (shiftMask32 CL)),
// MCASM_DISABLED:               (!cast<Instruction>(SHRD32rrCL#suffix) GR32:$src1, GR32:$src2)>;
// MCASM_DISABLED: 
// MCASM_DISABLED:     // (fshl/fshr x (and y, 63)) ==> (fshl/fshr x, y)
// MCASM_DISABLED:     def : Pat<(fshl GR64:$src1, GR64:$src2, (shiftMask64 CL)),
// MCASM_DISABLED:               (!cast<Instruction>(SHLD64rrCL#suffix) GR64:$src1, GR64:$src2)>;
// MCASM_DISABLED:     def : Pat<(fshr GR64:$src2, GR64:$src1, (shiftMask64 CL)),
// MCASM_DISABLED:               (!cast<Instruction>(SHRD64rrCL#suffix) GR64:$src1, GR64:$src2)>;
// MCASM_DISABLED:   }
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: defm : MaskedShlrdAmountPats<"", NoNDD>;
// MCASM_DISABLED: defm : MaskedShlrdAmountPats<"_ND", HasNDD>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // Use BTR/BTS/BTC for clearing/setting/toggling a bit in a variable location.
// MCASM_DISABLED: multiclass OneBitPats<RegisterClass rc, ValueType vt, Instruction btr,
// MCASM_DISABLED:                       Instruction bts, Instruction btc, PatFrag mask> {
// MCASM_DISABLED:   def : Pat<(and rc:$src1, (rotl -2, GR8:$src2)),
// MCASM_DISABLED:             (btr rc:$src1,
// MCASM_DISABLED:                  (INSERT_SUBREG (vt (IMPLICIT_DEF)), GR8:$src2, sub_8bit))>;
// MCASM_DISABLED:   def : Pat<(or rc:$src1, (shl 1, GR8:$src2)),
// MCASM_DISABLED:             (bts rc:$src1,
// MCASM_DISABLED:                  (INSERT_SUBREG (vt (IMPLICIT_DEF)), GR8:$src2, sub_8bit))>;
// MCASM_DISABLED:   def : Pat<(xor rc:$src1, (shl 1, GR8:$src2)),
// MCASM_DISABLED:             (btc rc:$src1,
// MCASM_DISABLED:                  (INSERT_SUBREG (vt (IMPLICIT_DEF)), GR8:$src2, sub_8bit))>;
// MCASM_DISABLED: 
// MCASM_DISABLED:   // Similar to above, but removing unneeded masking of the shift amount.
// MCASM_DISABLED:   def : Pat<(and rc:$src1, (rotl -2, (mask GR8:$src2))),
// MCASM_DISABLED:             (btr rc:$src1,
// MCASM_DISABLED:                  (INSERT_SUBREG (vt (IMPLICIT_DEF)), GR8:$src2, sub_8bit))>;
// MCASM_DISABLED:   def : Pat<(or rc:$src1, (shl 1, (mask GR8:$src2))),
// MCASM_DISABLED:             (bts rc:$src1,
// MCASM_DISABLED:                 (INSERT_SUBREG (vt (IMPLICIT_DEF)), GR8:$src2, sub_8bit))>;
// MCASM_DISABLED:   def : Pat<(xor rc:$src1, (shl 1, (mask GR8:$src2))),
// MCASM_DISABLED:             (btc rc:$src1,
// MCASM_DISABLED:                 (INSERT_SUBREG (vt (IMPLICIT_DEF)), GR8:$src2, sub_8bit))>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: defm : OneBitPats<GR16, i16, BTR16rr, BTS16rr, BTC16rr, shiftMask16>;
// MCASM_DISABLED: defm : OneBitPats<GR32, i32, BTR32rr, BTS32rr, BTC32rr, shiftMask32>;
// MCASM_DISABLED: defm : OneBitPats<GR64, i64, BTR64rr, BTS64rr, BTC64rr, shiftMask64>;
// MCASM_DISABLED: 
// MCASM_DISABLED: //===----------------------------------------------------------------------===//
// MCASM_DISABLED: // EFLAGS-defining Patterns
// MCASM_DISABLED: //===----------------------------------------------------------------------===//
// MCASM_DISABLED: 
// MCASM_DISABLED: multiclass EFLAGSDefiningPats<string suffix, Predicate p> {
// MCASM_DISABLED:   let Predicates = [p] in {
// MCASM_DISABLED:     // add reg, reg
// MCASM_DISABLED:     def : Pat<(add GR8 :$src1, GR8 :$src2), (!cast<Instruction>(ADD8rr#suffix) GR8 :$src1, GR8 :$src2)>;
// MCASM_DISABLED:     def : Pat<(add GR16:$src1, GR16:$src2), (!cast<Instruction>(ADD16rr#suffix) GR16:$src1, GR16:$src2)>;
// MCASM_DISABLED:     def : Pat<(add GR32:$src1, GR32:$src2), (!cast<Instruction>(ADD32rr#suffix) GR32:$src1, GR32:$src2)>;
// MCASM_DISABLED:     def : Pat<(add GR64:$src1, GR64:$src2), (!cast<Instruction>(ADD64rr#suffix) GR64:$src1, GR64:$src2)>;
// MCASM_DISABLED: 
// MCASM_DISABLED:     // add reg, mem
// MCASM_DISABLED:     def : Pat<(add GR8:$src1, (loadi8 addr:$src2)),
// MCASM_DISABLED:               (!cast<Instruction>(ADD8rm#suffix) GR8:$src1, addr:$src2)>;
// MCASM_DISABLED:     def : Pat<(add GR16:$src1, (loadi16 addr:$src2)),
// MCASM_DISABLED:               (!cast<Instruction>(ADD16rm#suffix) GR16:$src1, addr:$src2)>;
// MCASM_DISABLED:     def : Pat<(add GR32:$src1, (loadi32 addr:$src2)),
// MCASM_DISABLED:               (!cast<Instruction>(ADD32rm#suffix) GR32:$src1, addr:$src2)>;
// MCASM_DISABLED:     def : Pat<(add GR64:$src1, (loadi64 addr:$src2)),
// MCASM_DISABLED:               (!cast<Instruction>(ADD64rm#suffix) GR64:$src1, addr:$src2)>;
// MCASM_DISABLED: 
// MCASM_DISABLED:     // add reg, imm
// MCASM_DISABLED:     def : Pat<(add GR8 :$src1, imm:$src2), (!cast<Instruction>(ADD8ri#suffix) GR8:$src1 , imm:$src2)>;
// MCASM_DISABLED:     def : Pat<(add GR16:$src1, imm:$src2), (!cast<Instruction>(ADD16ri#suffix) GR16:$src1, imm:$src2)>;
// MCASM_DISABLED:     def : Pat<(add GR32:$src1, imm:$src2), (!cast<Instruction>(ADD32ri#suffix) GR32:$src1, imm:$src2)>;
// MCASM_DISABLED:     def : Pat<(add GR64:$src1, i64immSExt32:$src2), (!cast<Instruction>(ADD64ri32#suffix) GR64:$src1, i64immSExt32:$src2)>;
// MCASM_DISABLED: 
// MCASM_DISABLED:     // sub reg, reg
// MCASM_DISABLED:     def : Pat<(sub GR8 :$src1, GR8 :$src2), (!cast<Instruction>(SUB8rr#suffix)  GR8 :$src1, GR8 :$src2)>;
// MCASM_DISABLED:     def : Pat<(sub GR16:$src1, GR16:$src2), (!cast<Instruction>(SUB16rr#suffix) GR16:$src1, GR16:$src2)>;
// MCASM_DISABLED:     def : Pat<(sub GR32:$src1, GR32:$src2), (!cast<Instruction>(SUB32rr#suffix) GR32:$src1, GR32:$src2)>;
// MCASM_DISABLED:     def : Pat<(sub GR64:$src1, GR64:$src2), (!cast<Instruction>(SUB64rr#suffix) GR64:$src1, GR64:$src2)>;
// MCASM_DISABLED: 
// MCASM_DISABLED:     // sub reg, mem
// MCASM_DISABLED:     def : Pat<(sub GR8:$src1, (loadi8 addr:$src2)),
// MCASM_DISABLED:               (!cast<Instruction>(SUB8rm#suffix) GR8:$src1, addr:$src2)>;
// MCASM_DISABLED:     def : Pat<(sub GR16:$src1, (loadi16 addr:$src2)),
// MCASM_DISABLED:               (!cast<Instruction>(SUB16rm#suffix) GR16:$src1, addr:$src2)>;
// MCASM_DISABLED:     def : Pat<(sub GR32:$src1, (loadi32 addr:$src2)),
// MCASM_DISABLED:               (!cast<Instruction>(SUB32rm#suffix) GR32:$src1, addr:$src2)>;
// MCASM_DISABLED:     def : Pat<(sub GR64:$src1, (loadi64 addr:$src2)),
// MCASM_DISABLED:               (!cast<Instruction>(SUB64rm#suffix) GR64:$src1, addr:$src2)>;
// MCASM_DISABLED: 
// MCASM_DISABLED:     // sub reg, imm
// MCASM_DISABLED:     def : Pat<(sub GR8:$src1, imm:$src2),
// MCASM_DISABLED:               (!cast<Instruction>(SUB8ri#suffix) GR8:$src1, imm:$src2)>;
// MCASM_DISABLED:     def : Pat<(sub GR16:$src1, imm:$src2),
// MCASM_DISABLED:               (!cast<Instruction>(SUB16ri#suffix) GR16:$src1, imm:$src2)>;
// MCASM_DISABLED:     def : Pat<(sub GR32:$src1, imm:$src2),
// MCASM_DISABLED:               (!cast<Instruction>(SUB32ri#suffix) GR32:$src1, imm:$src2)>;
// MCASM_DISABLED:     def : Pat<(sub GR64:$src1, i64immSExt32:$src2),
// MCASM_DISABLED:               (!cast<Instruction>(SUB64ri32#suffix) GR64:$src1, i64immSExt32:$src2)>;
// MCASM_DISABLED: 
// MCASM_DISABLED:     // sub 0, reg
// MCASM_DISABLED:     def : Pat<(Mcasmsub_flag 0, GR8 :$src), (!cast<Instruction>(NEG8r#suffix)  GR8 :$src)>;
// MCASM_DISABLED:     def : Pat<(Mcasmsub_flag 0, GR16:$src), (!cast<Instruction>(NEG16r#suffix) GR16:$src)>;
// MCASM_DISABLED:     def : Pat<(Mcasmsub_flag 0, GR32:$src), (!cast<Instruction>(NEG32r#suffix) GR32:$src)>;
// MCASM_DISABLED:     def : Pat<(Mcasmsub_flag 0, GR64:$src), (!cast<Instruction>(NEG64r#suffix) GR64:$src)>;
// MCASM_DISABLED: 
// MCASM_DISABLED:     // mul reg, reg
// MCASM_DISABLED:     def : Pat<(mul GR16:$src1, GR16:$src2),
// MCASM_DISABLED:               (!cast<Instruction>(IMUL16rr#suffix) GR16:$src1, GR16:$src2)>;
// MCASM_DISABLED:     def : Pat<(mul GR32:$src1, GR32:$src2),
// MCASM_DISABLED:               (!cast<Instruction>(IMUL32rr#suffix) GR32:$src1, GR32:$src2)>;
// MCASM_DISABLED:     def : Pat<(mul GR64:$src1, GR64:$src2),
// MCASM_DISABLED:               (!cast<Instruction>(IMUL64rr#suffix) GR64:$src1, GR64:$src2)>;
// MCASM_DISABLED: 
// MCASM_DISABLED:     // mul reg, mem
// MCASM_DISABLED:     def : Pat<(mul GR16:$src1, (loadi16 addr:$src2)),
// MCASM_DISABLED:               (!cast<Instruction>(IMUL16rm#suffix) GR16:$src1, addr:$src2)>;
// MCASM_DISABLED:     def : Pat<(mul GR32:$src1, (loadi32 addr:$src2)),
// MCASM_DISABLED:               (!cast<Instruction>(IMUL32rm#suffix) GR32:$src1, addr:$src2)>;
// MCASM_DISABLED:     def : Pat<(mul GR64:$src1, (loadi64 addr:$src2)),
// MCASM_DISABLED:               (!cast<Instruction>(IMUL64rm#suffix) GR64:$src1, addr:$src2)>;
// MCASM_DISABLED: 
// MCASM_DISABLED:     // or reg/reg.
// MCASM_DISABLED:     def : Pat<(or GR8 :$src1, GR8 :$src2), (!cast<Instruction>(OR8rr#suffix)  GR8 :$src1, GR8 :$src2)>;
// MCASM_DISABLED:     def : Pat<(or GR16:$src1, GR16:$src2), (!cast<Instruction>(OR16rr#suffix) GR16:$src1, GR16:$src2)>;
// MCASM_DISABLED:     def : Pat<(or GR32:$src1, GR32:$src2), (!cast<Instruction>(OR32rr#suffix) GR32:$src1, GR32:$src2)>;
// MCASM_DISABLED:     def : Pat<(or GR64:$src1, GR64:$src2), (!cast<Instruction>(OR64rr#suffix) GR64:$src1, GR64:$src2)>;
// MCASM_DISABLED: 
// MCASM_DISABLED:     // or reg/mem
// MCASM_DISABLED:     def : Pat<(or GR8:$src1, (loadi8 addr:$src2)),
// MCASM_DISABLED:               (!cast<Instruction>(OR8rm#suffix) GR8:$src1, addr:$src2)>;
// MCASM_DISABLED:     def : Pat<(or GR16:$src1, (loadi16 addr:$src2)),
// MCASM_DISABLED:               (!cast<Instruction>(OR16rm#suffix) GR16:$src1, addr:$src2)>;
// MCASM_DISABLED:     def : Pat<(or GR32:$src1, (loadi32 addr:$src2)),
// MCASM_DISABLED:               (!cast<Instruction>(OR32rm#suffix) GR32:$src1, addr:$src2)>;
// MCASM_DISABLED:     def : Pat<(or GR64:$src1, (loadi64 addr:$src2)),
// MCASM_DISABLED:               (!cast<Instruction>(OR64rm#suffix) GR64:$src1, addr:$src2)>;
// MCASM_DISABLED: 
// MCASM_DISABLED:     // or reg/imm
// MCASM_DISABLED:     def : Pat<(or GR8:$src1 , imm:$src2), (!cast<Instruction>(OR8ri#suffix)  GR8 :$src1, imm:$src2)>;
// MCASM_DISABLED:     def : Pat<(or GR16:$src1, imm:$src2), (!cast<Instruction>(OR16ri#suffix) GR16:$src1, imm:$src2)>;
// MCASM_DISABLED:     def : Pat<(or GR32:$src1, imm:$src2), (!cast<Instruction>(OR32ri#suffix) GR32:$src1, imm:$src2)>;
// MCASM_DISABLED:     def : Pat<(or GR64:$src1, i64immSExt32:$src2),
// MCASM_DISABLED:               (!cast<Instruction>(OR64ri32#suffix) GR64:$src1, i64immSExt32:$src2)>;
// MCASM_DISABLED: 
// MCASM_DISABLED:     // xor reg/reg
// MCASM_DISABLED:     def : Pat<(xor GR8 :$src1, GR8 :$src2), (!cast<Instruction>(XOR8rr#suffix)  GR8 :$src1, GR8 :$src2)>;
// MCASM_DISABLED:     def : Pat<(xor GR16:$src1, GR16:$src2), (!cast<Instruction>(XOR16rr#suffix) GR16:$src1, GR16:$src2)>;
// MCASM_DISABLED:     def : Pat<(xor GR32:$src1, GR32:$src2), (!cast<Instruction>(XOR32rr#suffix) GR32:$src1, GR32:$src2)>;
// MCASM_DISABLED:     def : Pat<(xor GR64:$src1, GR64:$src2), (!cast<Instruction>(XOR64rr#suffix) GR64:$src1, GR64:$src2)>;
// MCASM_DISABLED: 
// MCASM_DISABLED:     // xor reg/mem
// MCASM_DISABLED:     def : Pat<(xor GR8:$src1, (loadi8 addr:$src2)),
// MCASM_DISABLED:               (!cast<Instruction>(XOR8rm#suffix) GR8:$src1, addr:$src2)>;
// MCASM_DISABLED:     def : Pat<(xor GR16:$src1, (loadi16 addr:$src2)),
// MCASM_DISABLED:               (!cast<Instruction>(XOR16rm#suffix) GR16:$src1, addr:$src2)>;
// MCASM_DISABLED:     def : Pat<(xor GR32:$src1, (loadi32 addr:$src2)),
// MCASM_DISABLED:               (!cast<Instruction>(XOR32rm#suffix) GR32:$src1, addr:$src2)>;
// MCASM_DISABLED:     def : Pat<(xor GR64:$src1, (loadi64 addr:$src2)),
// MCASM_DISABLED:               (!cast<Instruction>(XOR64rm#suffix) GR64:$src1, addr:$src2)>;
// MCASM_DISABLED: 
// MCASM_DISABLED:     // xor reg/imm
// MCASM_DISABLED:     def : Pat<(xor GR8:$src1, imm:$src2),
// MCASM_DISABLED:               (!cast<Instruction>(XOR8ri#suffix) GR8:$src1, imm:$src2)>;
// MCASM_DISABLED:     def : Pat<(xor GR16:$src1, imm:$src2),
// MCASM_DISABLED:               (!cast<Instruction>(XOR16ri#suffix) GR16:$src1, imm:$src2)>;
// MCASM_DISABLED:     def : Pat<(xor GR32:$src1, imm:$src2),
// MCASM_DISABLED:               (!cast<Instruction>(XOR32ri#suffix) GR32:$src1, imm:$src2)>;
// MCASM_DISABLED:     def : Pat<(xor GR64:$src1, i64immSExt32:$src2),
// MCASM_DISABLED:               (!cast<Instruction>(XOR64ri32#suffix) GR64:$src1, i64immSExt32:$src2)>;
// MCASM_DISABLED: 
// MCASM_DISABLED:     // and reg/reg
// MCASM_DISABLED:     def : Pat<(and GR8 :$src1, GR8 :$src2), (!cast<Instruction>(AND8rr#suffix)  GR8 :$src1, GR8 :$src2)>;
// MCASM_DISABLED:     def : Pat<(and GR16:$src1, GR16:$src2), (!cast<Instruction>(AND16rr#suffix) GR16:$src1, GR16:$src2)>;
// MCASM_DISABLED:     def : Pat<(and GR32:$src1, GR32:$src2), (!cast<Instruction>(AND32rr#suffix) GR32:$src1, GR32:$src2)>;
// MCASM_DISABLED:     def : Pat<(and GR64:$src1, GR64:$src2), (!cast<Instruction>(AND64rr#suffix) GR64:$src1, GR64:$src2)>;
// MCASM_DISABLED: 
// MCASM_DISABLED:     // and reg/mem
// MCASM_DISABLED:     def : Pat<(and GR8:$src1, (loadi8 addr:$src2)),
// MCASM_DISABLED:               (!cast<Instruction>(AND8rm#suffix) GR8:$src1, addr:$src2)>;
// MCASM_DISABLED:     def : Pat<(and GR16:$src1, (loadi16 addr:$src2)),
// MCASM_DISABLED:               (!cast<Instruction>(AND16rm#suffix) GR16:$src1, addr:$src2)>;
// MCASM_DISABLED:     def : Pat<(and GR32:$src1, (loadi32 addr:$src2)),
// MCASM_DISABLED:               (!cast<Instruction>(AND32rm#suffix) GR32:$src1, addr:$src2)>;
// MCASM_DISABLED:     def : Pat<(and GR64:$src1, (loadi64 addr:$src2)),
// MCASM_DISABLED:               (!cast<Instruction>(AND64rm#suffix) GR64:$src1, addr:$src2)>;
// MCASM_DISABLED: 
// MCASM_DISABLED:     // and reg/imm
// MCASM_DISABLED:     def : Pat<(and GR8:$src1, imm:$src2),
// MCASM_DISABLED:               (!cast<Instruction>(AND8ri#suffix) GR8:$src1, imm:$src2)>;
// MCASM_DISABLED:     def : Pat<(and GR16:$src1, imm:$src2),
// MCASM_DISABLED:               (!cast<Instruction>(AND16ri#suffix) GR16:$src1, imm:$src2)>;
// MCASM_DISABLED:     def : Pat<(and GR32:$src1, imm:$src2),
// MCASM_DISABLED:               (!cast<Instruction>(AND32ri#suffix) GR32:$src1, imm:$src2)>;
// MCASM_DISABLED:     def : Pat<(and GR64:$src1, i64immSExt32:$src2),
// MCASM_DISABLED:               (!cast<Instruction>(AND64ri32#suffix) GR64:$src1, i64immSExt32:$src2)>;
// MCASM_DISABLED:   }
// MCASM_DISABLED: 
// MCASM_DISABLED:   // Increment/Decrement reg.
// MCASM_DISABLED:   // Do not make INC/DEC if it is slow
// MCASM_DISABLED:   let Predicates = [UseIncDec, p] in {
// MCASM_DISABLED:     def : Pat<(add GR8:$src, 1),   (!cast<Instruction>(INC8r#suffix) GR8:$src)>;
// MCASM_DISABLED:     def : Pat<(add GR16:$src, 1),  (!cast<Instruction>(INC16r#suffix) GR16:$src)>;
// MCASM_DISABLED:     def : Pat<(add GR32:$src, 1),  (!cast<Instruction>(INC32r#suffix) GR32:$src)>;
// MCASM_DISABLED:     def : Pat<(add GR64:$src, 1),  (!cast<Instruction>(INC64r#suffix) GR64:$src)>;
// MCASM_DISABLED:     def : Pat<(add GR8:$src, -1),  (!cast<Instruction>(DEC8r#suffix) GR8:$src)>;
// MCASM_DISABLED:     def : Pat<(add GR16:$src, -1), (!cast<Instruction>(DEC16r#suffix) GR16:$src)>;
// MCASM_DISABLED:     def : Pat<(add GR32:$src, -1), (!cast<Instruction>(DEC32r#suffix) GR32:$src)>;
// MCASM_DISABLED:     def : Pat<(add GR64:$src, -1), (!cast<Instruction>(DEC64r#suffix) GR64:$src)>;
// MCASM_DISABLED: 
// MCASM_DISABLED:     def : Pat<(Mcasmadd_flag_nocf GR8:$src, -1),  (!cast<Instruction>(DEC8r#suffix) GR8:$src)>;
// MCASM_DISABLED:     def : Pat<(Mcasmadd_flag_nocf GR16:$src, -1), (!cast<Instruction>(DEC16r#suffix) GR16:$src)>;
// MCASM_DISABLED:     def : Pat<(Mcasmadd_flag_nocf GR32:$src, -1), (!cast<Instruction>(DEC32r#suffix) GR32:$src)>;
// MCASM_DISABLED:     def : Pat<(Mcasmadd_flag_nocf GR64:$src, -1), (!cast<Instruction>(DEC64r#suffix) GR64:$src)>;
// MCASM_DISABLED:     def : Pat<(Mcasmsub_flag_nocf GR8:$src, -1),  (!cast<Instruction>(INC8r#suffix) GR8:$src)>;
// MCASM_DISABLED:     def : Pat<(Mcasmsub_flag_nocf GR16:$src, -1), (!cast<Instruction>(INC16r#suffix) GR16:$src)>;
// MCASM_DISABLED:     def : Pat<(Mcasmsub_flag_nocf GR32:$src, -1), (!cast<Instruction>(INC32r#suffix) GR32:$src)>;
// MCASM_DISABLED:     def : Pat<(Mcasmsub_flag_nocf GR64:$src, -1), (!cast<Instruction>(INC64r#suffix) GR64:$src)>;
// MCASM_DISABLED: 
// MCASM_DISABLED:     def : Pat<(or_is_add GR8:$src, 1),   (!cast<Instruction>(INC8r#suffix) GR8:$src)>;
// MCASM_DISABLED:     def : Pat<(or_is_add GR16:$src, 1),  (!cast<Instruction>(INC16r#suffix) GR16:$src)>;
// MCASM_DISABLED:     def : Pat<(or_is_add GR32:$src, 1),  (!cast<Instruction>(INC32r#suffix) GR32:$src)>;
// MCASM_DISABLED:     def : Pat<(or_is_add GR64:$src, 1),  (!cast<Instruction>(INC64r#suffix) GR64:$src)>;
// MCASM_DISABLED:   }
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: defm : EFLAGSDefiningPats<"", NoNDD>;
// MCASM_DISABLED: defm : EFLAGSDefiningPats<"_ND", HasNDD>;
// MCASM_DISABLED: 
// MCASM_DISABLED: let Predicates = [HasZU] in {
// MCASM_DISABLED:   // zext (mul reg/mem, imm) -> imulzu
// MCASM_DISABLED:   def : Pat<(i32 (zext (i16 (mul GR16:$src1, imm:$src2)))),
// MCASM_DISABLED:             (SUBREG_TO_REG (i32 0), (IMULZU16rri GR16:$src1, imm:$src2), sub_16bit)>;
// MCASM_DISABLED:   def : Pat<(i32 (zext (i16 (mul (loadi16 addr:$src1), imm:$src2)))),
// MCASM_DISABLED:             (SUBREG_TO_REG (i32 0), (IMULZU16rmi addr:$src1, imm:$src2), sub_16bit)>;
// MCASM_DISABLED:   def : Pat<(i64 (zext (i16 (mul GR16:$src1, imm:$src2)))),
// MCASM_DISABLED:             (SUBREG_TO_REG (i64 0), (IMULZU16rri GR16:$src1, imm:$src2), sub_16bit)>;
// MCASM_DISABLED:   def : Pat<(i64 (zext (i16 (mul (loadi16 addr:$src1), imm:$src2)))),
// MCASM_DISABLED:             (SUBREG_TO_REG (i64 0), (IMULZU16rmi addr:$src1, imm:$src2), sub_16bit)>;
// MCASM_DISABLED: }
// MCASM_DISABLED: 
// MCASM_DISABLED: // mul reg, imm
// MCASM_DISABLED: def : Pat<(mul GR16:$src1, imm:$src2),
// MCASM_DISABLED:           (IMUL16rri GR16:$src1, imm:$src2)>;
// MCASM_DISABLED: def : Pat<(mul GR32:$src1, imm:$src2),
// MCASM_DISABLED:           (IMUL32rri GR32:$src1, imm:$src2)>;
// MCASM_DISABLED: def : Pat<(mul GR64:$src1, i64immSExt32:$src2),
// MCASM_DISABLED:           (IMUL64rri32 GR64:$src1, i64immSExt32:$src2)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // reg = mul mem, imm
// MCASM_DISABLED: def : Pat<(mul (loadi16 addr:$src1), imm:$src2),
// MCASM_DISABLED:           (IMUL16rmi addr:$src1, imm:$src2)>;
// MCASM_DISABLED: def : Pat<(mul (loadi32 addr:$src1), imm:$src2),
// MCASM_DISABLED:           (IMUL32rmi addr:$src1, imm:$src2)>;
// MCASM_DISABLED: def : Pat<(mul (loadi64 addr:$src1), i64immSExt32:$src2),
// MCASM_DISABLED:           (IMUL64rmi32 addr:$src1, i64immSExt32:$src2)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // Bit scan instruction patterns to match explicit zero-undef behavior.
// MCASM_DISABLED: def : Pat<(cttz_zero_undef GR16:$src), (BSF16rr (i16 (IMPLICIT_DEF)), GR16:$src)>;
// MCASM_DISABLED: def : Pat<(cttz_zero_undef GR32:$src), (BSF32rr (i32 (IMPLICIT_DEF)), GR32:$src)>;
// MCASM_DISABLED: def : Pat<(cttz_zero_undef GR64:$src), (BSF64rr (i64 (IMPLICIT_DEF)), GR64:$src)>;
// MCASM_DISABLED: def : Pat<(cttz_zero_undef (loadi16 addr:$src)), (BSF16rm (i16 (IMPLICIT_DEF)), addr:$src)>;
// MCASM_DISABLED: def : Pat<(cttz_zero_undef (loadi32 addr:$src)), (BSF32rm (i32 (IMPLICIT_DEF)), addr:$src)>;
// MCASM_DISABLED: def : Pat<(cttz_zero_undef (loadi64 addr:$src)), (BSF64rm (i64 (IMPLICIT_DEF)), addr:$src)>;
// MCASM_DISABLED: 
// MCASM_DISABLED: // When HasMOVBE is enabled it is possible to get a non-legalized
// MCASM_DISABLED: // register-register 16 bit bswap. This maps it to a ROL instruction.
// MCASM_DISABLED: let Predicates = [HasMOVBE] in {
// MCASM_DISABLED:  def : Pat<(bswap GR16:$src), (ROL16ri GR16:$src, (i8 8))>;
// MCASM_DISABLED: }
