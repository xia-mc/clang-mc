//===----------McasmInstrFragments - Mcasm Pattern fragments. --*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

// Mcasm-specific DAG node.
def SDTMcasmCmpTest : SDTypeProfile<1, 2, [SDTCisVT<0, i32>, SDTCisInt<1>,
                                         SDTCisSameAs<1, 2>]>;
def SDTMcasmFCmp    : SDTypeProfile<1, 2, [SDTCisVT<0, i32>, SDTCisFP<1>,
                                         SDTCisSameAs<1, 2>]>;

def SDTMcasmCcmp    : SDTypeProfile<1, 5,
                                  [SDTCisVT<3, i8>, SDTCisVT<4, i8>, SDTCisVT<5, i32>]>;

// RES = op PTR, PASSTHRU, COND, EFLAGS
def SDTMcasmCload    : SDTypeProfile<1, 4,
                                  [SDTCisInt<0>, SDTCisPtrTy<1>, SDTCisSameAs<0, 2>,
                                   SDTCisVT<3, i8>, SDTCisVT<4, i32>]>;
// op VAL, PTR, COND, EFLAGS
def SDTMcasmCstore    : SDTypeProfile<0, 4,
                                  [SDTCisInt<0>, SDTCisPtrTy<1>,
                                   SDTCisVT<2, i8>, SDTCisVT<3, i32>]>;

def SDTMcasmCmov    : SDTypeProfile<1, 4,
                                  [SDTCisSameAs<0, 1>, SDTCisSameAs<1, 2>,
                                   SDTCisVT<3, i8>, SDTCisVT<4, i32>]>;

// Unary and binary operator instructions that set EFLAGS as a side-effect.
def SDTUnaryArithWithFlags : SDTypeProfile<2, 1,
                                           [SDTCisSameAs<0, 2>,
                                            SDTCisInt<0>, SDTCisVT<1, i32>]>;

def SDTBinaryArithWithFlags : SDTypeProfile<2, 2,
                                            [SDTCisSameAs<0, 2>,
                                             SDTCisSameAs<0, 3>,
                                             SDTCisInt<0>, SDTCisVT<1, i32>]>;

// SDTBinaryArithWithFlagsInOut - RES1, EFLAGS = op LHS, RHS, EFLAGS
def SDTBinaryArithWithFlagsInOut : SDTypeProfile<2, 3,
                                            [SDTCisSameAs<0, 2>,
                                             SDTCisSameAs<0, 3>,
                                             SDTCisInt<0>,
                                             SDTCisVT<1, i32>,
                                             SDTCisVT<4, i32>]>;

def SDTMcasmBrCond  : SDTypeProfile<0, 3,
                                  [SDTCisVT<0, OtherVT>,
                                   SDTCisVT<1, i8>, SDTCisVT<2, i32>]>;

def SDTMcasmSetCC   : SDTypeProfile<1, 2,
                                  [SDTCisVT<0, i8>,
                                   SDTCisVT<1, i8>, SDTCisVT<2, i32>]>;
def SDTMcasmSetCC_C : SDTypeProfile<1, 2,
                                  [SDTCisInt<0>,
                                   SDTCisVT<1, i8>, SDTCisVT<2, i32>]>;

def SDTMcasmsahf : SDTypeProfile<1, 1, [SDTCisVT<0, i32>, SDTCisVT<1, i8>]>;

def SDTMcasmrdrand : SDTypeProfile<2, 0, [SDTCisInt<0>, SDTCisVT<1, i32>]>;

def SDTMcasmrdpkru : SDTypeProfile<1, 1, [SDTCisVT<0, i32>, SDTCisVT<1, i32>]>;
def SDTMcasmwrpkru : SDTypeProfile<0, 3, [SDTCisVT<0, i32>, SDTCisVT<1, i32>,
                                        SDTCisVT<2, i32>]>;

def SDTMcasmcas : SDTypeProfile<0, 3, [SDTCisPtrTy<0>, SDTCisInt<1>,
                                     SDTCisVT<2, i8>]>;
def SDTMcasmcas8pair : SDTypeProfile<0, 1, [SDTCisPtrTy<0>]>;
def SDTMcasmcas16pair : SDTypeProfile<0, 2, [SDTCisPtrTy<0>, SDTCisVT<1, i64>]>;

def SDTLockBinaryArithWithFlags : SDTypeProfile<1, 2, [SDTCisVT<0, i32>,
                                                       SDTCisPtrTy<1>,
                                                       SDTCisInt<2>]>;

def SDTLockUnaryArithWithFlags : SDTypeProfile<1, 1, [SDTCisVT<0, i32>,
                                                      SDTCisPtrTy<1>]>;

// mcasm RET has no parameters (caller cleanup done by caller with ADD/POP)
// Allow variadic operands for return value registers in glue chain
def SDTMcasmRet     : SDTypeProfile<0, -1, []>;

def SDT_McasmCallSeqStart : SDCallSeqStart<[SDTCisVT<0, i32>,
                                          SDTCisVT<1, i32>]>;
def SDT_McasmCallSeqEnd   : SDCallSeqEnd<[SDTCisVT<0, i32>,
                                        SDTCisVT<1, i32>]>;

def SDT_McasmCall   : SDTypeProfile<0, -1, [SDTCisVT<0, iPTR>]>;

def SDT_McasmNtBrind : SDTypeProfile<0, -1, [SDTCisVT<0, iPTR>]>;

// XMM varargs not supported in Mcasm (no SSE/AVX)
// def SDT_McasmVASTART_SAVE_XMM_REGS : SDTypeProfile<0, -1, [SDTCisVT<0, i8>,
//                                                          SDTCisPtrTy<1>]>;

def SDT_McasmVAARG : SDTypeProfile<1, -1, [SDTCisPtrTy<0>,
                                         SDTCisPtrTy<1>,
                                         SDTCisVT<2, i32>,
                                         SDTCisVT<3, i8>,
                                         SDTCisVT<4, i32>]>;

def SDTMcasmRepStr  : SDTypeProfile<0, 1, [SDTCisVT<0, OtherVT>]>;

def SDTMcasmVoid    : SDTypeProfile<0, 0, []>;

def SDTMcasmWrapper : SDTypeProfile<1, 1, [SDTCisSameAs<0, 1>, SDTCisPtrTy<0>]>;

def SDT_McasmTLSADDR : SDTypeProfile<0, 1, [SDTCisInt<0>]>;

def SDT_McasmTLSBASEADDR : SDTypeProfile<0, 1, [SDTCisInt<0>]>;

def SDT_McasmTLSCALL : SDTypeProfile<0, 1, [SDTCisInt<0>]>;

def SDT_McasmDYN_ALLOCA : SDTypeProfile<0, 1, [SDTCisVT<0, iPTR>]>;

def SDT_McasmSEG_ALLOCA : SDTypeProfile<1, 1, [SDTCisVT<0, iPTR>, SDTCisVT<1, iPTR>]>;

def SDT_McasmPROBED_ALLOCA : SDTypeProfile<1, 1, [SDTCisVT<0, iPTR>, SDTCisVT<1, iPTR>]>;

def SDT_McasmEHRET : SDTypeProfile<0, 1, [SDTCisInt<0>]>;

def SDT_McasmTCRET : SDTypeProfile<0, 2, [SDTCisPtrTy<0>, SDTCisVT<1, i32>]>;

def SDT_McasmENQCMD : SDTypeProfile<1, 2, [SDTCisVT<0, i32>,
                                         SDTCisPtrTy<1>, SDTCisSameAs<1, 2>]>;

def SDT_McasmAESENCDECKL : SDTypeProfile<2, 2, [SDTCisVT<0, v2i64>,
                                              SDTCisVT<1, i32>,
                                              SDTCisVT<2, v2i64>,
                                              SDTCisPtrTy<3>]>;

def SDTMcasmCmpccxadd : SDTypeProfile<1, 4, [SDTCisSameAs<0, 2>,
                                           SDTCisPtrTy<1>, SDTCisSameAs<2, 3>,
                                           SDTCisVT<4, i8>]>;

def McasmMFence : SDNode<"McasmISD::MFENCE", SDTNone, [SDNPHasChain]>;


def Mcasmbsf     : SDNode<"McasmISD::BSF",      SDTBinaryArithWithFlags>;
def Mcasmbsr     : SDNode<"McasmISD::BSR",      SDTBinaryArithWithFlags>;
def Mcasmfshl    : SDNode<"McasmISD::FSHL",     SDTIntShiftDOp>;
def Mcasmfshr    : SDNode<"McasmISD::FSHR",     SDTIntShiftDOp>;

def Mcasmcmp     : SDNode<"McasmISD::CMP" ,     SDTMcasmCmpTest>;
def Mcasmfcmp    : SDNode<"McasmISD::FCMP",     SDTMcasmFCmp>;
def Mcasmstrict_fcmp : SDNode<"McasmISD::STRICT_FCMP", SDTMcasmFCmp, [SDNPHasChain]>;
def Mcasmstrict_fcmps : SDNode<"McasmISD::STRICT_FCMPS", SDTMcasmFCmp, [SDNPHasChain]>;
def Mcasmbt      : SDNode<"McasmISD::BT",       SDTMcasmCmpTest>;

def Mcasmccmp    : SDNode<"McasmISD::CCMP",     SDTMcasmCcmp>;
def Mcasmctest   : SDNode<"McasmISD::CTEST",    SDTMcasmCcmp>;

def Mcasmcload    : SDNode<"McasmISD::CLOAD",   SDTMcasmCload, [SDNPHasChain, SDNPMayLoad, SDNPMemOperand]>;
def Mcasmcstore   : SDNode<"McasmISD::CSTORE",  SDTMcasmCstore, [SDNPHasChain, SDNPMayStore, SDNPMemOperand]>;

def Mcasmcmov    : SDNode<"McasmISD::CMOV",     SDTMcasmCmov>;
def Mcasmbrcond  : SDNode<"McasmISD::BRCOND",   SDTMcasmBrCond,
                        [SDNPHasChain]>;
def Mcasmsetcc   : SDNode<"McasmISD::SETCC",    SDTMcasmSetCC>;
def Mcasmsetcc_c : SDNode<"McasmISD::SETCC_CARRY", SDTMcasmSetCC_C>;

def Mcasmrdrand  : SDNode<"McasmISD::RDRAND",   SDTMcasmrdrand,
                        [SDNPHasChain, SDNPSideEffect]>;

def Mcasmrdseed  : SDNode<"McasmISD::RDSEED",   SDTMcasmrdrand,
                        [SDNPHasChain, SDNPSideEffect]>;

def Mcasmrdpkru : SDNode<"McasmISD::RDPKRU",    SDTMcasmrdpkru,
                       [SDNPHasChain, SDNPSideEffect]>;
def Mcasmwrpkru : SDNode<"McasmISD::WRPKRU",    SDTMcasmwrpkru,
                       [SDNPHasChain, SDNPSideEffect]>;

def Mcasmcas : SDNode<"McasmISD::LCMPXCHG_DAG", SDTMcasmcas,
                        [SDNPHasChain, SDNPInGlue, SDNPOutGlue, SDNPMayStore,
                         SDNPMayLoad, SDNPMemOperand]>;
def Mcasmcas8 : SDNode<"McasmISD::LCMPXCHG8_DAG", SDTMcasmcas8pair,
                        [SDNPHasChain, SDNPInGlue, SDNPOutGlue, SDNPMayStore,
                         SDNPMayLoad, SDNPMemOperand]>;
def Mcasmcas16 : SDNode<"McasmISD::LCMPXCHG16_DAG", SDTMcasmcas16pair,
                        [SDNPHasChain, SDNPInGlue, SDNPOutGlue, SDNPMayStore,
                         SDNPMayLoad, SDNPMemOperand]>;

def Mcasmretglue : SDNode<"McasmISD::RET_GLUE", SDTMcasmRet,
                        [SDNPHasChain, SDNPOptInGlue, SDNPVariadic]>;
def Mcasmiret : SDNode<"McasmISD::IRET", SDTMcasmRet,
                        [SDNPHasChain, SDNPOptInGlue]>;

// XMM varargs not supported in Mcasm
// def Mcasmvastart_save_xmm_regs :
//                  SDNode<"McasmISD::VASTART_SAVE_XMM_REGS",
//                         SDT_McasmVASTART_SAVE_XMM_REGS,
//                         [SDNPHasChain, SDNPMayStore, SDNPMemOperand, SDNPVariadic]>;
def Mcasmvaarg64 :
                 SDNode<"McasmISD::VAARG_64", SDT_McasmVAARG,
                        [SDNPHasChain, SDNPMayLoad, SDNPMayStore,
                         SDNPMemOperand]>;
def Mcasmvaargx32 :
                 SDNode<"McasmISD::VAARG_X32", SDT_McasmVAARG,
                        [SDNPHasChain, SDNPMayLoad, SDNPMayStore,
                         SDNPMemOperand]>;
def Mcasmcallseq_start :
                 SDNode<"ISD::CALLSEQ_START", SDT_McasmCallSeqStart,
                        [SDNPHasChain, SDNPOutGlue]>;
def Mcasmcallseq_end :
                 SDNode<"ISD::CALLSEQ_END",   SDT_McasmCallSeqEnd,
                        [SDNPHasChain, SDNPOptInGlue, SDNPOutGlue]>;

def Mcasmcall    : SDNode<"McasmISD::CALL",     SDT_McasmCall,
                        [SDNPHasChain, SDNPOutGlue, SDNPOptInGlue,
                         SDNPVariadic]>;

def Mcasmcall_rvmarker  : SDNode<"McasmISD::CALL_RVMARKER",     SDT_McasmCall,
                        [SDNPHasChain, SDNPOutGlue, SDNPOptInGlue,
                         SDNPVariadic]>;

def Mcasmcall_globaladdr  : SDNode<"McasmISD::CALL_GLOBALADDR",     SDT_McasmCall,
                        [SDNPHasChain, SDNPOutGlue, SDNPOptInGlue,
                         SDNPVariadic]>;

def Mcasmimp_call  : SDNode<"McasmISD::IMP_CALL",     SDT_McasmCall,
                        [SDNPHasChain, SDNPOutGlue, SDNPOptInGlue,
                         SDNPVariadic]>;

def McasmNoTrackCall : SDNode<"McasmISD::NT_CALL", SDT_McasmCall,
                            [SDNPHasChain, SDNPOutGlue, SDNPOptInGlue,
                             SDNPVariadic]>;
def McasmNoTrackBrind : SDNode<"McasmISD::NT_BRIND", SDT_McasmNtBrind,
                             [SDNPHasChain]>;

def Mcasmrep_stos: SDNode<"McasmISD::REP_STOS", SDTMcasmRepStr,
                        [SDNPHasChain, SDNPInGlue, SDNPOutGlue, SDNPMayStore]>;
def Mcasmrep_movs: SDNode<"McasmISD::REP_MOVS", SDTMcasmRepStr,
                        [SDNPHasChain, SDNPInGlue, SDNPOutGlue, SDNPMayStore,
                         SDNPMayLoad]>;

def McasmWrapper    : SDNode<"McasmISD::Wrapper",     SDTMcasmWrapper>;
def McasmWrapperRIP : SDNode<"McasmISD::WrapperRIP",  SDTMcasmWrapper>;

def McasmRecoverFrameAlloc : SDNode<"ISD::LOCAL_RECOVER",
                                  SDTypeProfile<1, 1, [SDTCisSameAs<0, 1>,
                                                       SDTCisInt<1>]>>;

def Mcasmtlsaddr : SDNode<"McasmISD::TLSADDR", SDT_McasmTLSADDR,
                        [SDNPHasChain, SDNPOptInGlue, SDNPOutGlue]>;

def Mcasmtlsbaseaddr : SDNode<"McasmISD::TLSBASEADDR", SDT_McasmTLSBASEADDR,
                        [SDNPHasChain, SDNPOptInGlue, SDNPOutGlue]>;

def Mcasmtlsdesc : SDNode<"McasmISD::TLSDESC", SDT_McasmTLSADDR,
                        [SDNPHasChain, SDNPOptInGlue, SDNPOutGlue]>;

def Mcasmehret : SDNode<"McasmISD::EH_RETURN", SDT_McasmEHRET,
                        [SDNPHasChain]>;

def Mcasmeh_sjlj_setjmp  : SDNode<"McasmISD::EH_SJLJ_SETJMP",
                                SDTypeProfile<1, 1, [SDTCisInt<0>,
                                                     SDTCisPtrTy<1>]>,
                                [SDNPHasChain, SDNPSideEffect]>;
def Mcasmeh_sjlj_longjmp : SDNode<"McasmISD::EH_SJLJ_LONGJMP",
                                SDTypeProfile<0, 1, [SDTCisPtrTy<0>]>,
                                [SDNPHasChain, SDNPSideEffect]>;
def Mcasmeh_sjlj_setup_dispatch : SDNode<"McasmISD::EH_SJLJ_SETUP_DISPATCH",
                                       SDTypeProfile<0, 0, []>,
                                       [SDNPHasChain, SDNPSideEffect]>;

def Mcasmtcret : SDNode<"McasmISD::TC_RETURN", SDT_McasmTCRET,
                        [SDNPHasChain,  SDNPOptInGlue, SDNPVariadic]>;

def Mcasmtcret_globaladdr : SDNode<"McasmISD::TC_RETURN_GLOBALADDR", SDT_McasmTCRET,
                        [SDNPHasChain,  SDNPOptInGlue, SDNPVariadic]>;

def Mcasmadd_flag  : SDNode<"McasmISD::ADD",  SDTBinaryArithWithFlags,
                          [SDNPCommutative]>;
def Mcasmsub_flag  : SDNode<"McasmISD::SUB",  SDTBinaryArithWithFlags>;
def Mcasmsmul_flag : SDNode<"McasmISD::SMUL", SDTBinaryArithWithFlags,
                          [SDNPCommutative]>;
def Mcasmumul_flag : SDNode<"McasmISD::UMUL", SDTBinaryArithWithFlags,
                          [SDNPCommutative]>;
def Mcasmadc_flag  : SDNode<"McasmISD::ADC",  SDTBinaryArithWithFlagsInOut>;
def Mcasmsbb_flag  : SDNode<"McasmISD::SBB",  SDTBinaryArithWithFlagsInOut>;

def Mcasmor_flag   : SDNode<"McasmISD::OR",   SDTBinaryArithWithFlags,
                          [SDNPCommutative]>;
def Mcasmxor_flag  : SDNode<"McasmISD::XOR",  SDTBinaryArithWithFlags,
                          [SDNPCommutative]>;
def Mcasmand_flag  : SDNode<"McasmISD::AND",  SDTBinaryArithWithFlags,
                          [SDNPCommutative]>;

def Mcasmlock_add  : SDNode<"McasmISD::LADD",  SDTLockBinaryArithWithFlags,
                          [SDNPHasChain, SDNPMayStore, SDNPMayLoad,
                           SDNPMemOperand]>;
def Mcasmlock_sub  : SDNode<"McasmISD::LSUB",  SDTLockBinaryArithWithFlags,
                          [SDNPHasChain, SDNPMayStore, SDNPMayLoad,
                           SDNPMemOperand]>;
def Mcasmlock_or  : SDNode<"McasmISD::LOR",  SDTLockBinaryArithWithFlags,
                         [SDNPHasChain, SDNPMayStore, SDNPMayLoad,
                          SDNPMemOperand]>;
def Mcasmlock_xor  : SDNode<"McasmISD::LXOR",  SDTLockBinaryArithWithFlags,
                          [SDNPHasChain, SDNPMayStore, SDNPMayLoad,
                           SDNPMemOperand]>;
def Mcasmlock_and  : SDNode<"McasmISD::LAND",  SDTLockBinaryArithWithFlags,
                          [SDNPHasChain, SDNPMayStore, SDNPMayLoad,
                           SDNPMemOperand]>;

def Mcasmbextr  : SDNode<"McasmISD::BEXTR",  SDTIntBinOp>;
def Mcasmbextri : SDNode<"McasmISD::BEXTRI", SDTIntBinOp>;

def Mcasmbzhi   : SDNode<"McasmISD::BZHI",   SDTIntBinOp>;

def Mcasmpdep   : SDNode<"McasmISD::PDEP",   SDTIntBinOp>;
def Mcasmpext   : SDNode<"McasmISD::PEXT",   SDTIntBinOp>;

def Mcasmmul_imm : SDNode<"McasmISD::MUL_IMM", SDTIntBinOp>;

def McasmDynAlloca : SDNode<"McasmISD::DYN_ALLOCA", SDT_McasmDYN_ALLOCA,
                          [SDNPHasChain, SDNPOutGlue]>;

def McasmSegAlloca : SDNode<"McasmISD::SEG_ALLOCA", SDT_McasmSEG_ALLOCA,
                          [SDNPHasChain]>;

def McasmProbedAlloca : SDNode<"McasmISD::PROBED_ALLOCA", SDT_McasmPROBED_ALLOCA,
                          [SDNPHasChain]>;

def McasmTLSCall : SDNode<"McasmISD::TLSCALL", SDT_McasmTLSCALL,
                        [SDNPHasChain, SDNPOptInGlue, SDNPOutGlue]>;

def Mcasmlwpins : SDNode<"McasmISD::LWPINS",
                       SDTypeProfile<1, 3, [SDTCisVT<0, i32>, SDTCisInt<1>,
                                            SDTCisVT<2, i32>, SDTCisVT<3, i32>]>,
                       [SDNPHasChain, SDNPMayStore, SDNPMayLoad, SDNPSideEffect]>;

def Mcasmumwait : SDNode<"McasmISD::UMWAIT",
                       SDTypeProfile<1, 3, [SDTCisVT<0, i32>, SDTCisInt<1>,
                                            SDTCisVT<2, i32>, SDTCisVT<3, i32>]>,
                       [SDNPHasChain, SDNPSideEffect]>;

def Mcasmtpause : SDNode<"McasmISD::TPAUSE",
                       SDTypeProfile<1, 3, [SDTCisVT<0, i32>, SDTCisInt<1>,
                                            SDTCisVT<2, i32>, SDTCisVT<3, i32>]>,
                       [SDNPHasChain, SDNPSideEffect]>;

def Mcasmenqcmd : SDNode<"McasmISD::ENQCMD", SDT_McasmENQCMD,
                       [SDNPHasChain, SDNPSideEffect]>;
def Mcasmenqcmds : SDNode<"McasmISD::ENQCMDS", SDT_McasmENQCMD,
                       [SDNPHasChain, SDNPSideEffect]>;
def Mcasmtestui : SDNode<"McasmISD::TESTUI",
                       SDTypeProfile<1, 0, [SDTCisVT<0, i32>]>,
                       [SDNPHasChain, SDNPSideEffect]>;

def Mcasmaesenc128kl : SDNode<"McasmISD::AESENC128KL", SDT_McasmAESENCDECKL,
                            [SDNPHasChain, SDNPMayLoad, SDNPSideEffect,
                             SDNPMemOperand]>;
def Mcasmaesdec128kl : SDNode<"McasmISD::AESDEC128KL", SDT_McasmAESENCDECKL,
                            [SDNPHasChain, SDNPMayLoad, SDNPSideEffect,
                             SDNPMemOperand]>;
def Mcasmaesenc256kl : SDNode<"McasmISD::AESENC256KL", SDT_McasmAESENCDECKL,
                            [SDNPHasChain, SDNPMayLoad, SDNPSideEffect,
                             SDNPMemOperand]>;
def Mcasmaesdec256kl : SDNode<"McasmISD::AESDEC256KL", SDT_McasmAESENCDECKL,
                            [SDNPHasChain, SDNPMayLoad, SDNPSideEffect,
                             SDNPMemOperand]>;

def Mcasmcmpccxadd : SDNode<"McasmISD::CMPCCXADD", SDTMcasmCmpccxadd,
                          [SDNPHasChain, SDNPMayLoad, SDNPMayStore,
                           SDNPMemOperand]>;

// Define Mcasm-specific addressing mode.
let WantsParent = true in
def addr      : ComplexPattern<iPTR, 5, "selectAddr">;
def gi_addr   : GIComplexOperandMatcher<s32, "selectAddr">,
                GIComplexPatternEquiv<addr>;
def lea32addr : ComplexPattern<i32, 5, "selectLEAAddr",
                               [add, sub, mul, Mcasmmul_imm, shl, or, xor, frameindex],
                               []>;
// In 64-bit mode 8/16/32-bit LEAs can use RIP-relative addressing.
def lea64_iaddr : ComplexPattern<iAny, 5, "selectLEA64_Addr",
                                 [add, sub, mul, Mcasmmul_imm, shl, or, xor,
                                  frameindex, McasmWrapperRIP],
                                 []>;

def tls32addr : ComplexPattern<i32, 5, "selectTLSADDRAddr",
                               [tglobaltlsaddr], []>;

def tls32baseaddr : ComplexPattern<i32, 5, "selectTLSADDRAddr",
                               [tglobaltlsaddr], []>;

def lea64addr : ComplexPattern<i64, 5, "selectLEAAddr",
                        [add, sub, mul, Mcasmmul_imm, shl, or, xor, frameindex,
                         McasmWrapperRIP], []>;

def tls64addr : ComplexPattern<i64, 5, "selectTLSADDRAddr",
                               [tglobaltlsaddr], []>;

def tls64baseaddr : ComplexPattern<i64, 5, "selectTLSADDRAddr",
                               [tglobaltlsaddr], []>;

let WantsParent = true in
def vectoraddr : ComplexPattern<iPTR, 5, "selectVectorAddr">;

// A relocatable immediate is an operand that can be relocated by the linker to
// an immediate, such as a regular symbol in non-PIC code.
def relocImm : ComplexPattern<iAny, 1, "selectRelocImm",
                              [McasmWrapper], [], 0>;

// Mcasm specific condition code. These correspond to CondCode in
// McasmInstrInfo.h. They must be kept in synch.
def Mcasm_COND_O   : PatLeaf<(i8 0)>;
def Mcasm_COND_NO  : PatLeaf<(i8 1)>;
def Mcasm_COND_B   : PatLeaf<(i8 2)>;  // alt. COND_C
def Mcasm_COND_AE  : PatLeaf<(i8 3)>;  // alt. COND_NC
def Mcasm_COND_E   : PatLeaf<(i8 4)>;  // alt. COND_Z
def Mcasm_COND_NE  : PatLeaf<(i8 5)>;  // alt. COND_NZ
def Mcasm_COND_BE  : PatLeaf<(i8 6)>;  // alt. COND_NA
def Mcasm_COND_A   : PatLeaf<(i8 7)>;  // alt. COND_NBE
def Mcasm_COND_S   : PatLeaf<(i8 8)>;
def Mcasm_COND_NS  : PatLeaf<(i8 9)>;
def Mcasm_COND_P   : PatLeaf<(i8 10)>; // alt. COND_PE
def Mcasm_COND_NP  : PatLeaf<(i8 11)>; // alt. COND_PO
def Mcasm_COND_L   : PatLeaf<(i8 12)>; // alt. COND_NGE
def Mcasm_COND_GE  : PatLeaf<(i8 13)>; // alt. COND_NL
def Mcasm_COND_LE  : PatLeaf<(i8 14)>; // alt. COND_NG
def Mcasm_COND_G   : PatLeaf<(i8 15)>; // alt. COND_NLE

def i16immSExt8  : ImmLeaf<i16, [{ return isInt<8>(Imm); }]>;
def i32immSExt8  : ImmLeaf<i32, [{ return isInt<8>(Imm); }]>;
def i64immSExt8  : ImmLeaf<i64, [{ return isInt<8>(Imm); }]>;
def i64immSExt32 : ImmLeaf<i64, [{ return isInt<32>(Imm); }]>;
def i64timmSExt32 : TImmLeaf<i64, [{ return isInt<32>(Imm); }]>;

def i16relocImmSExt8 : PatLeaf<(i16 relocImm), [{
  return isSExtAbsoluteSymbolRef(8, N);
}]>;
def i32relocImmSExt8 : PatLeaf<(i32 relocImm), [{
  return isSExtAbsoluteSymbolRef(8, N);
}]>;
def i64relocImmSExt8 : PatLeaf<(i64 relocImm), [{
  return isSExtAbsoluteSymbolRef(8, N);
}]>;
def i64relocImmSExt32 : PatLeaf<(i64 relocImm), [{
  return isSExtAbsoluteSymbolRef(32, N);
}]>;

// If we have multiple users of an immediate, it's much smaller to reuse
// the register, rather than encode the immediate in every instruction.
// This has the risk of increasing register pressure from stretched live
// ranges, however, the immediates should be trivial to rematerialize by
// the RA in the event of high register pressure.
// TODO : This is currently enabled for stores and binary ops. There are more
// cases for which this can be enabled, though this catches the bulk of the
// issues.
// TODO2 : This should really also be enabled under O2, but there's currently
// an issue with RA where we don't pull the constants into their users
// when we rematerialize them. I'll follow-up on enabling O2 after we fix that
// issue.
// TODO3 : This is currently limited to single basic blocks (DAG creation
// pulls block immediates to the top and merges them if necessary).
// Eventually, it would be nice to allow ConstantHoisting to merge constants
// globally for potentially added savings.
//
def imm_su : PatLeaf<(imm), [{
    return !shouldAvoidImmediateInstFormsForSize(N);
}]> {
  // TODO : introduce the same check as in SDAG
  let GISelPredicateCode = [{ return true; }];
}

def i64immSExt32_su : PatLeaf<(i64immSExt32), [{
    return !shouldAvoidImmediateInstFormsForSize(N);
}]>;

def relocImm8_su : PatLeaf<(i8 relocImm), [{
    return !shouldAvoidImmediateInstFormsForSize(N);
}]>;
def relocImm16_su : PatLeaf<(i16 relocImm), [{
    return !shouldAvoidImmediateInstFormsForSize(N);
}]>;
def relocImm32_su : PatLeaf<(i32 relocImm), [{
    return !shouldAvoidImmediateInstFormsForSize(N);
}]>;

def i16relocImmSExt8_su : PatLeaf<(i16relocImmSExt8), [{
    return !shouldAvoidImmediateInstFormsForSize(N);
}]>;
def i32relocImmSExt8_su : PatLeaf<(i32relocImmSExt8), [{
    return !shouldAvoidImmediateInstFormsForSize(N);
}]>;
def i64relocImmSExt8_su : PatLeaf<(i64relocImmSExt8), [{
    return !shouldAvoidImmediateInstFormsForSize(N);
}]>;
def i64relocImmSExt32_su : PatLeaf<(i64relocImmSExt32), [{
    return !shouldAvoidImmediateInstFormsForSize(N);
}]>;

def i16immSExt8_su : PatLeaf<(i16immSExt8), [{
    return !shouldAvoidImmediateInstFormsForSize(N);
}]>;
def i32immSExt8_su : PatLeaf<(i32immSExt8), [{
    return !shouldAvoidImmediateInstFormsForSize(N);
}]>;
def i64immSExt8_su : PatLeaf<(i64immSExt8), [{
    return !shouldAvoidImmediateInstFormsForSize(N);
}]>;

// i64immZExt32 predicate - True if the 64-bit immediate fits in a 32-bit
// unsigned field.
def i64immZExt32 : ImmLeaf<i64, [{ return isUInt<32>(Imm); }]>;

def i64immZExt32SExt8 : ImmLeaf<i64, [{
  return isUInt<32>(Imm) && isInt<8>(static_cast<int32_t>(Imm));
}]>;

// Helper fragments for loads.

// It's safe to fold a zextload/extload from i1 as a regular i8 load. The
// upper bits are guaranteed to be zero and we were going to emit a MOV8rm
// which might get folded during peephole anyway.
def loadi8 : PatFrag<(ops node:$ptr), (i8 (unindexedload node:$ptr)), [{
  LoadSDNode *LD = cast<LoadSDNode>(N);
  ISD::LoadExtType ExtType = LD->getExtensionType();
  return ExtType == ISD::NON_EXTLOAD || ExtType == ISD::EXTLOAD ||
         ExtType == ISD::ZEXTLOAD;
}]> {
  let GISelPredicateCode = [{ return isa<GLoad>(MI); }];
}

// It's always safe to treat a anyext i16 load as a i32 load if the i16 is
// known to be 32-bit aligned or better. Ditto for i8 to i16.
def loadi16 : PatFrag<(ops node:$ptr), (i16 (unindexedload node:$ptr)), [{
  LoadSDNode *LD = cast<LoadSDNode>(N);
  ISD::LoadExtType ExtType = LD->getExtensionType();
  if (ExtType == ISD::NON_EXTLOAD)
    return true;
  if (ExtType == ISD::EXTLOAD && EnablePromoteAnyextLoad)
    return LD->getAlign() >= 2 && LD->isSimple();
  return false;
}]> {
  let GISelPredicateCode = [{
    auto &Load = cast<GLoad>(MI);
    LLT Ty = MRI.getType(Load.getDstReg());
    // Non extending load has MMO and destination types of the same size
    if (Load.getMemSizeInBits() == Ty.getSizeInBits())
       return true;
    return Load.getAlign() >= 2 && Load.isSimple();
  }];
}

def loadi32 : PatFrag<(ops node:$ptr), (i32 (unindexedload node:$ptr)), [{
  LoadSDNode *LD = cast<LoadSDNode>(N);
  ISD::LoadExtType ExtType = LD->getExtensionType();
  if (ExtType == ISD::NON_EXTLOAD)
    return true;
  if (ExtType == ISD::EXTLOAD && EnablePromoteAnyextLoad)
    return LD->getAlign() >= 4 && LD->isSimple();
  return false;
}]> {
  let GISelPredicateCode = [{
    auto &Load = cast<GLoad>(MI);
    LLT Ty = MRI.getType(Load.getDstReg());
    // Non extending load has MMO and destination types of the same size
    if (Load.getMemSizeInBits() == Ty.getSizeInBits())
       return true;
    return Load.getAlign() >= 4 && Load.isSimple();
  }];
}

def loadi64  : PatFrag<(ops node:$ptr), (i64 (load node:$ptr))>;
def loadf16  : PatFrag<(ops node:$ptr), (f16 (load node:$ptr))>;
def loadf32  : PatFrag<(ops node:$ptr), (f32 (load node:$ptr))>;
def loadf64  : PatFrag<(ops node:$ptr), (f64 (load node:$ptr))>;
def loadf80  : PatFrag<(ops node:$ptr), (f80 (load node:$ptr))>;
def loadf128 : PatFrag<(ops node:$ptr), (f128 (load node:$ptr))>;
def alignedloadf128 : PatFrag<(ops node:$ptr), (f128 (load node:$ptr)), [{
  LoadSDNode *Ld = cast<LoadSDNode>(N);
  return Ld->getAlign() >= Ld->getMemoryVT().getStoreSize();
}]>;
// Floating point not supported in Mcasm
// def memopf128 : PatFrag<(ops node:$ptr), (f128 (load node:$ptr)), [{
//   LoadSDNode *Ld = cast<LoadSDNode>(N);
//   return Subtarget->hasSSEUnalignedMem() ||
//          Ld->getAlign() >= Ld->getMemoryVT().getStoreSize();
// }]>;

def sextloadi16i8  : PatFrag<(ops node:$ptr), (i16 (sextloadi8 node:$ptr))>;
def sextloadi32i8  : PatFrag<(ops node:$ptr), (i32 (sextloadi8 node:$ptr))>;
def sextloadi32i16 : PatFrag<(ops node:$ptr), (i32 (sextloadi16 node:$ptr))>;
def sextloadi64i8  : PatFrag<(ops node:$ptr), (i64 (sextloadi8 node:$ptr))>;
def sextloadi64i16 : PatFrag<(ops node:$ptr), (i64 (sextloadi16 node:$ptr))>;
def sextloadi64i32 : PatFrag<(ops node:$ptr), (i64 (sextloadi32 node:$ptr))>;

def zextloadi8i1   : PatFrag<(ops node:$ptr), (i8  (zextloadi1 node:$ptr))>;
def zextloadi16i1  : PatFrag<(ops node:$ptr), (i16 (zextloadi1 node:$ptr))>;
def zextloadi32i1  : PatFrag<(ops node:$ptr), (i32 (zextloadi1 node:$ptr))>;
def zextloadi16i8  : PatFrag<(ops node:$ptr), (i16 (zextloadi8 node:$ptr))>;
def zextloadi32i8  : PatFrag<(ops node:$ptr), (i32 (zextloadi8 node:$ptr))>;
def zextloadi32i16 : PatFrag<(ops node:$ptr), (i32 (zextloadi16 node:$ptr))>;
def zextloadi64i1  : PatFrag<(ops node:$ptr), (i64 (zextloadi1 node:$ptr))>;
def zextloadi64i8  : PatFrag<(ops node:$ptr), (i64 (zextloadi8 node:$ptr))>;
def zextloadi64i16 : PatFrag<(ops node:$ptr), (i64 (zextloadi16 node:$ptr))>;
def zextloadi64i32 : PatFrag<(ops node:$ptr), (i64 (zextloadi32 node:$ptr))>;

def extloadi8i1    : PatFrag<(ops node:$ptr), (i8  (extloadi1 node:$ptr))>;
def extloadi16i1   : PatFrag<(ops node:$ptr), (i16 (extloadi1 node:$ptr))>;
def extloadi32i1   : PatFrag<(ops node:$ptr), (i32 (extloadi1 node:$ptr))>;
def extloadi16i8   : PatFrag<(ops node:$ptr), (i16 (extloadi8 node:$ptr))>;
def extloadi32i8   : PatFrag<(ops node:$ptr), (i32 (extloadi8 node:$ptr))>;
def extloadi32i16  : PatFrag<(ops node:$ptr), (i32 (extloadi16 node:$ptr))>;
def extloadi64i1   : PatFrag<(ops node:$ptr), (i64 (extloadi1 node:$ptr))>;
def extloadi64i8   : PatFrag<(ops node:$ptr), (i64 (extloadi8 node:$ptr))>;
def extloadi64i16  : PatFrag<(ops node:$ptr), (i64 (extloadi16 node:$ptr))>;

// We can treat an i8/i16 extending load to i64 as a 32 bit load if its known
// to be 4 byte aligned or better.
def extloadi64i32  : PatFrag<(ops node:$ptr), (i64 (unindexedload node:$ptr)), [{
  LoadSDNode *LD = cast<LoadSDNode>(N);
  ISD::LoadExtType ExtType = LD->getExtensionType();
  if (ExtType != ISD::EXTLOAD)
    return false;
  if (LD->getMemoryVT() == MVT::i32)
    return true;

  return LD->getAlign() >= 4 && LD->isSimple();
}]>;

// binary op with only one user
class binop_oneuse<SDPatternOperator operator>
    : PatFrag<(ops node:$A, node:$B),
              (operator node:$A, node:$B), [{
  return N->hasOneUse();
}]>;

def add_su : binop_oneuse<add>;
def and_su : binop_oneuse<and>;
def srl_su : binop_oneuse<srl>;

class binop_twouses<SDPatternOperator operator>
    : PatFrag<(ops node:$A, node:$B),
              (operator node:$A, node:$B), [{
  return N->hasNUsesOfValue(2, 0);
}]>;

def and_du : binop_twouses<and>;

// unary op with only one user
class unop_oneuse<SDPatternOperator operator>
    : PatFrag<(ops node:$A),
              (operator node:$A), [{
  return N->hasOneUse();
}]>;


def ineg_su : unop_oneuse<ineg>;
def trunc_su : unop_oneuse<trunc>;

def Mcasmadd_flag_nocf : PatFrag<(ops node:$lhs, node:$rhs),
                               (Mcasmadd_flag node:$lhs, node:$rhs), [{
  return hasNoCarryFlagUses(SDValue(N, 1));
}]>;

def Mcasmsub_flag_nocf : PatFrag<(ops node:$lhs, node:$rhs),
                               (Mcasmsub_flag node:$lhs, node:$rhs), [{
  // Only use DEC if the result is used.
  return !SDValue(N, 0).use_empty() && hasNoCarryFlagUses(SDValue(N, 1));
}]>;

def Mcasmtestpat : PatFrag<(ops node:$lhs, node:$rhs),
                         (Mcasmcmp (and_su node:$lhs, node:$rhs), 0)>;
def Mcasmctestpat : PatFrag<(ops node:$lhs, node:$rhs, node:$dcf, node:$cond),
                          (Mcasmctest (and_du node:$lhs, node:$rhs),
                            (and_du node:$lhs, node:$rhs), node:$dcf,
                            node:$cond, EFLAGS)>;

def Mcasmany_fcmp : PatFrags<(ops node:$lhs, node:$rhs),
                          [(Mcasmstrict_fcmp node:$lhs, node:$rhs),
                           (Mcasmfcmp node:$lhs, node:$rhs)]>;

def PrefetchWLevel : PatFrag<(ops), (i32 timm), [{
  return N->getSExtValue() <= 3;
}]>;

def Mcasmlock_add_nocf : PatFrag<(ops node:$lhs, node:$rhs),
                               (Mcasmlock_add node:$lhs, node:$rhs), [{
  return hasNoCarryFlagUses(SDValue(N, 0));
}]>;

def Mcasmlock_sub_nocf : PatFrag<(ops node:$lhs, node:$rhs),
                               (Mcasmlock_sub node:$lhs, node:$rhs), [{
  return hasNoCarryFlagUses(SDValue(N, 0));
}]>;

def Mcasmtcret_6regs : PatFrag<(ops node:$ptr, node:$off),
                             (Mcasmtcret node:$ptr, node:$off), [{
  // Mcasmtcret args: (*chain, ptr, imm, regs..., glue)
  unsigned NumRegs = 0;
  for (unsigned i = 3, e = N->getNumOperands(); i != e; ++i)
    if (isa<RegisterSDNode>(N->getOperand(i)) && ++NumRegs > 6)
      return false;
  return true;
}]>;

def Mcasmtcret_1reg : PatFrag<(ops node:$ptr, node:$off),
                             (Mcasmtcret node:$ptr, node:$off), [{
  // Mcasmtcret args: (*chain, ptr, imm, regs..., glue)
  unsigned NumRegs = 1;
  const SDValue& BasePtr = cast<LoadSDNode>(N->getOperand(1))->getBasePtr();
  if (isa<FrameIndexSDNode>(BasePtr))
    NumRegs = 3;
  else if (BasePtr->getNumOperands() && isa<GlobalAddressSDNode>(BasePtr->getOperand(0)))
    NumRegs = 3;
  for (unsigned i = 3, e = N->getNumOperands(); i != e; ++i)
    if (isa<RegisterSDNode>(N->getOperand(i)) && ( NumRegs-- == 0))
      return false;
  return true;
}]>;

// If this is an anyext of the remainder of an 8-bit sdivrem, use a MOVSX
// instead of a MOVZX. The sdivrem lowering will emit emit a MOVSX to move
// %ah to the lower byte of a register. By using a MOVSX here we allow a
// post-isel peephole to merge the two MOVSX instructions into one.
def anyext_sdiv : PatFrag<(ops node:$lhs), (anyext node:$lhs),[{
  return (N->getOperand(0).getOpcode() == ISD::SDIVREM &&
          N->getOperand(0).getResNo() == 1);
}]>;

// Any instruction that defines a 32-bit result leaves the high half of the
// register. Truncate can be lowered to EXTRACT_SUBREG. CopyFromReg may
// be copying from a truncate. AssertSext/AssertZext/AssertAlign aren't saying
// anything about the upper 32 bits, they're probably just qualifying a
// CopyFromReg. FREEZE may be coming from a a truncate. BitScan fall through
// values may not zero the upper bits correctly.
// Any other 32-bit operation will zero-extend up to 64 bits.
def def32 : PatLeaf<(i32 GR32:$src), [{
  return N->getOpcode() != ISD::TRUNCATE &&
         N->getOpcode() != TargetOpcode::EXTRACT_SUBREG &&
         N->getOpcode() != ISD::CopyFromReg &&
         N->getOpcode() != ISD::AssertSext &&
         N->getOpcode() != ISD::AssertZext &&
         N->getOpcode() != ISD::AssertAlign &&
         N->getOpcode() != ISD::FREEZE &&
         !((N->getOpcode() == McasmISD::BSF || N->getOpcode() == McasmISD::BSR) &&
           (!N->getOperand(0).isUndef() && !isa<ConstantSDNode>(N->getOperand(0))));
}]>;

// Treat an 'or' node is as an 'add' if the or'ed bits are known to be zero.
def or_is_add : PatFrag<(ops node:$lhs, node:$rhs), (or node:$lhs, node:$rhs),[{
  if (ConstantSDNode *CN = dyn_cast<ConstantSDNode>(N->getOperand(1)))
    return CurDAG->MaskedValueIsZero(N->getOperand(0), CN->getAPIntValue());

  KnownBits Known0 = CurDAG->computeKnownBits(N->getOperand(0), 0);
  KnownBits Known1 = CurDAG->computeKnownBits(N->getOperand(1), 0);
  return (~Known0.Zero & ~Known1.Zero) == 0;
}]>;

def shiftMask8 : PatFrag<(ops node:$lhs), (and node:$lhs, imm), [{
  return isUnneededShiftMask(N, 3);
}]>;

def shiftMask16 : PatFrag<(ops node:$lhs), (and node:$lhs, imm), [{
  return isUnneededShiftMask(N, 4);
}]>;

def shiftMask32 : PatFrag<(ops node:$lhs), (and node:$lhs, imm), [{
  return isUnneededShiftMask(N, 5);
}]>;

def shiftMask64 : PatFrag<(ops node:$lhs), (and node:$lhs, imm), [{
  return isUnneededShiftMask(N, 6);
}]>;

//===----------------------------------------------------------------------===//
// Pattern fragments to auto generate BMI instructions.
//===----------------------------------------------------------------------===//

def or_flag_nocf : PatFrag<(ops node:$lhs, node:$rhs),
                           (Mcasmor_flag node:$lhs, node:$rhs), [{
  return hasNoCarryFlagUses(SDValue(N, 1));
}]>;

def xor_flag_nocf : PatFrag<(ops node:$lhs, node:$rhs),
                            (Mcasmxor_flag node:$lhs, node:$rhs), [{
  return hasNoCarryFlagUses(SDValue(N, 1));
}]>;

def and_flag_nocf : PatFrag<(ops node:$lhs, node:$rhs),
                            (Mcasmand_flag node:$lhs, node:$rhs), [{
  return hasNoCarryFlagUses(SDValue(N, 1));
}]>;

//===----------------------------------------------------------------------===//
// FPStack specific DAG Nodes.
//===----------------------------------------------------------------------===//

def SDTMcasmFld       : SDTypeProfile<1, 1, [SDTCisFP<0>,
                                           SDTCisPtrTy<1>]>;
def SDTMcasmFst       : SDTypeProfile<0, 2, [SDTCisFP<0>,
                                           SDTCisPtrTy<1>]>;
def SDTMcasmFild      : SDTypeProfile<1, 1, [SDTCisFP<0>, SDTCisPtrTy<1>]>;
def SDTMcasmFist      : SDTypeProfile<0, 2, [SDTCisFP<0>, SDTCisPtrTy<1>]>;

def SDTMcasmCwdStore  : SDTypeProfile<0, 1, [SDTCisPtrTy<0>]>;
def SDTMcasmCwdLoad   : SDTypeProfile<0, 1, [SDTCisPtrTy<0>]>;
def SDTMcasmFPEnv     : SDTypeProfile<0, 1, [SDTCisPtrTy<0>]>;

def Mcasmfp80_add     : SDNode<"McasmISD::FP80_ADD", SDTFPBinOp, [SDNPCommutative]>;
def Mcasmstrict_fp80_add : SDNode<"McasmISD::STRICT_FP80_ADD", SDTFPBinOp,
                        [SDNPHasChain,SDNPCommutative]>;
def any_Mcasmfp80_add : PatFrags<(ops node:$lhs, node:$rhs),
                               [(Mcasmstrict_fp80_add node:$lhs, node:$rhs),
                                (Mcasmfp80_add node:$lhs, node:$rhs)]>;

def Mcasmfld          : SDNode<"McasmISD::FLD", SDTMcasmFld,
                             [SDNPHasChain, SDNPMayLoad, SDNPMemOperand]>;
def Mcasmfst          : SDNode<"McasmISD::FST", SDTMcasmFst,
                             [SDNPHasChain, SDNPMayStore, SDNPMemOperand]>;
def Mcasmfild         : SDNode<"McasmISD::FILD", SDTMcasmFild,
                             [SDNPHasChain, SDNPMayLoad, SDNPMemOperand]>;
def Mcasmfist         : SDNode<"McasmISD::FIST", SDTMcasmFist,
                             [SDNPHasChain, SDNPMayStore, SDNPMemOperand]>;
def Mcasmfp_to_mem : SDNode<"McasmISD::FP_TO_INT_IN_MEM", SDTMcasmFst,
                          [SDNPHasChain, SDNPMayStore, SDNPMemOperand]>;
def Mcasmfp_cwd_get16 : SDNode<"McasmISD::FNSTCW16m",          SDTMcasmCwdStore,
                             [SDNPHasChain, SDNPMayStore, SDNPSideEffect,
                              SDNPMemOperand]>;
def Mcasmfp_cwd_set16 : SDNode<"McasmISD::FLDCW16m",           SDTMcasmCwdLoad,
                             [SDNPHasChain, SDNPMayLoad, SDNPSideEffect,
                              SDNPMemOperand]>;
def Mcasmfpenv_get    : SDNode<"McasmISD::FNSTENVm",           SDTMcasmFPEnv,
                             [SDNPHasChain, SDNPMayStore, SDNPSideEffect,
                              SDNPMemOperand]>;
def Mcasmfpenv_set    : SDNode<"McasmISD::FLDENVm",            SDTMcasmFPEnv,
                             [SDNPHasChain, SDNPMayLoad, SDNPSideEffect,
                              SDNPMemOperand]>;

def Mcasmfstf32 : PatFrag<(ops node:$val, node:$ptr),
                        (Mcasmfst node:$val, node:$ptr), [{
  return cast<MemIntrinsicSDNode>(N)->getMemoryVT() == MVT::f32;
}]>;
def Mcasmfstf64 : PatFrag<(ops node:$val, node:$ptr),
                        (Mcasmfst node:$val, node:$ptr), [{
  return cast<MemIntrinsicSDNode>(N)->getMemoryVT() == MVT::f64;
}]>;
def Mcasmfstf80 : PatFrag<(ops node:$val, node:$ptr),
                        (Mcasmfst node:$val, node:$ptr), [{
  return cast<MemIntrinsicSDNode>(N)->getMemoryVT() == MVT::f80;
}]>;

def Mcasmfldf32 : PatFrag<(ops node:$ptr), (Mcasmfld node:$ptr), [{
  return cast<MemIntrinsicSDNode>(N)->getMemoryVT() == MVT::f32;
}]>;
def Mcasmfldf64 : PatFrag<(ops node:$ptr), (Mcasmfld node:$ptr), [{
  return cast<MemIntrinsicSDNode>(N)->getMemoryVT() == MVT::f64;
}]>;
def Mcasmfldf80 : PatFrag<(ops node:$ptr), (Mcasmfld node:$ptr), [{
  return cast<MemIntrinsicSDNode>(N)->getMemoryVT() == MVT::f80;
}]>;

def Mcasmfild16 : PatFrag<(ops node:$ptr), (Mcasmfild node:$ptr)> {
  let IsLoad = true;
  let MemoryVT = i16;
}

def Mcasmfild32 : PatFrag<(ops node:$ptr), (Mcasmfild node:$ptr)> {
  let IsLoad = true;
  let MemoryVT = i32;
}

def Mcasmfild64 : PatFrag<(ops node:$ptr), (Mcasmfild node:$ptr)> {
  let IsLoad = true;
  let MemoryVT = i64;
}

def Mcasmfist32 : PatFrag<(ops node:$val, node:$ptr),
                        (Mcasmfist node:$val, node:$ptr), [{
  return cast<MemIntrinsicSDNode>(N)->getMemoryVT() == MVT::i32;
}]>;

def Mcasmfist64 : PatFrag<(ops node:$val, node:$ptr),
                        (Mcasmfist node:$val, node:$ptr), [{
  return cast<MemIntrinsicSDNode>(N)->getMemoryVT() == MVT::i64;
}]>;

def Mcasmfp_to_i16mem
    : PatFrag<(ops node:$val, node:$ptr), (Mcasmfp_to_mem node:$val, node:$ptr)> {
  let IsStore = true;
  let MemoryVT = i16;
}

def Mcasmfp_to_i32mem
    : PatFrag<(ops node:$val, node:$ptr), (Mcasmfp_to_mem node:$val, node:$ptr)> {
  let IsStore = true;
  let MemoryVT = i32;
}

def Mcasmfp_to_i64mem
    : PatFrag<(ops node:$val, node:$ptr), (Mcasmfp_to_mem node:$val, node:$ptr)> {
  let IsStore = true;
  let MemoryVT = i64;
}

// MCASM_DISABLED_FP: //===----------------------------------------------------------------------===//
// MCASM_DISABLED_FP: // FPStack pattern fragments
// MCASM_DISABLED_FP: //===----------------------------------------------------------------------===//
// MCASM_DISABLED_FP: 
// MCASM_DISABLED_FP: def fpimm0 : FPImmLeaf<fAny, [{
// MCASM_DISABLED_FP:   return Imm.isExactlyValue(+0.0);
// MCASM_DISABLED_FP: }]>;
// MCASM_DISABLED_FP: 
// MCASM_DISABLED_FP: def fpimmneg0 : FPImmLeaf<fAny, [{
// MCASM_DISABLED_FP:   return Imm.isExactlyValue(-0.0);
// MCASM_DISABLED_FP: }]>;
// MCASM_DISABLED_FP: 
// MCASM_DISABLED_FP: def fpimm1 : FPImmLeaf<fAny, [{
// MCASM_DISABLED_FP:   return Imm.isExactlyValue(+1.0);
// MCASM_DISABLED_FP: }]>;
// MCASM_DISABLED_FP: 
// MCASM_DISABLED_FP: def fpimmneg1 : FPImmLeaf<fAny, [{
// MCASM_DISABLED_FP:   return Imm.isExactlyValue(-1.0);
// MCASM_DISABLED_FP: }]>;
