	.section .text
.LNDBG_TX:
# -- Machine type EFI2
# mark_description "Intel(R) C Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 12.0.4.191 Build 2011042";
# mark_description "7";
# mark_description "-O -openmp -g -S";
	.file "pi_spmd_simple.c"
	.text
..TXTST0:
# -- Begin  main, L_main_62__par_region0_2.27
# mark_begin;
       .align    16,0x90
	.globl main
main:
..B1.1:                         # Preds ..B1.0
..___tag_value_main.2:                                          #
..LN0:
  .file   1 "pi_spmd_simple.c"
   .loc    1  47  is_stmt 1
        pushq     %rbp                                          #47.1
..___tag_value_main.4:                                          #
..LN1:
        movq      %rsp, %rbp                                    #47.1
..___tag_value_main.5:                                          #
..LN2:
        andq      $-128, %rsp                                   #47.1
..LN3:
        subq      $256, %rsp                                    #47.1
..LN4:
        pushq     $3                                            #47.1
..LN5:
        popq      %rdi                                          #47.1
..LN6:
        movq      %rbx, 136(%rsp)                               #47.1
..___tag_value_main.8:                                          #
..LN7:
        movq      %r15, 8(%rsp)                                 #47.1
..___tag_value_main.10:                                         #
..LN8:
        movq      %r14, 112(%rsp)                               #47.1
..___tag_value_main.12:                                         #
..LN9:
        movq      %r13, 120(%rsp)                               #47.1
..___tag_value_main.14:                                         #
..LN10:
        movq      %r12, 128(%rsp)                               #47.1
..___tag_value_main.16:                                         #
..LN11:
        call      __intel_new_proc_init                         #47.1
..___tag_value_main.18:                                         #
..LN12:
                                # LOE
..B1.36:                        # Preds ..B1.1
..LN13:
        stmxcsr   (%rsp)                                        #47.1
..LN14:
        movl      $.2.3_2_kmpc_loc_struct_pack.1, %edi          #47.1
..LN15:
        xorl      %esi, %esi                                    #47.1
..LN16:
        orl       $32832, (%rsp)                                #47.1
..LN17:
        xorl      %eax, %eax                                    #47.1
..LN18:
        ldmxcsr   (%rsp)                                        #47.1
..LN19:
        call      __kmpc_begin                                  #47.1
..LN20:
                                # LOE
..B1.2:                         # Preds ..B1.36
..LN21:
        movl      $.2.3_2_kmpc_loc_struct_pack.12, %edi         #47.1
..LN22:
        xorl      %eax, %eax                                    #47.1
..LN23:
        call      __kmpc_global_thread_num                      #47.1
..LN24:
                                # LOE eax
..B1.37:                        # Preds ..B1.2
..LN25:
   .loc    1  53  is_stmt 1
        movq      $0x3e45798ee2308c3a, %rdx                     #53.24
..LN26:
   .loc    1  47  is_stmt 1
        movl      %eax, (%rsp)                                  #47.1
..LN27:
   .loc    1  56  is_stmt 1
        movl      $1, %r12d                                     #56.9
..LN28:
   .loc    1  53  is_stmt 1
        movq      %rdx, step(%rip)                              #53.4
        movl      $1, %ebx                                      #
..LN29:
                                # LOE rbx r12d
..B1.3:                         # Preds ..B1.22 ..B1.37
..LN30:
   .loc    1  58  is_stmt 1
        movl      %r12d, %edi                                   #58.7
..LN31:
        call      ompc_set_num_threads                          #58.7
..LN32:
                                # LOE rbx r12d
..B1.4:                         # Preds ..B1.3
..LN33:
   .loc    1  60  is_stmt 1
        call      omp_get_wtime                                 #60.20
..LN34:
                                # LOE rbx r12d xmm0
..B1.38:                        # Preds ..B1.4
..LN35:
        movsd     %xmm0, 144(%rsp)                              #60.20
..LN36:
                                # LOE rbx r12d
..B1.5:                         # Preds ..B1.38
..LN37:
   .loc    1  62  is_stmt 1
        movl      $.2.3_2_kmpc_loc_struct_pack.29, %edi         #62.7
..LN38:
        xorl      %eax, %eax                                    #62.7
..LN39:
        call      __kmpc_ok_to_fork                             #62.7
..LN40:
                                # LOE rbx eax r12d
..B1.6:                         # Preds ..B1.5
..LN41:
        testl     %eax, %eax                                    #62.7
..LN42:
        je        ..B1.8        # Prob 50%                      #62.7
..LN43:
                                # LOE rbx r12d
..B1.7:                         # Preds ..B1.6
..LN44:
        movl      $L_main_62__par_region0_2.27, %edx            #62.7
..LN45:
        movl      $.2.3_2_kmpc_loc_struct_pack.29, %edi         #62.7
..LN46:
        pushq     $1                                            #62.7
..LN47:
        popq      %rsi                                          #62.7
..LN48:
        lea       16(%rsp), %rcx                                #62.7
..LN49:
        xorl      %eax, %eax                                    #62.7
..LN50:
        call      __kmpc_fork_call                              #62.7
..LN51:
        jmp       ..B1.11       # Prob 100%                     #62.7
..LN52:
                                # LOE rbx r12d
..B1.8:                         # Preds ..B1.6
..LN53:
        movl      $.2.3_2_kmpc_loc_struct_pack.29, %edi         #62.7
..LN54:
        xorl      %eax, %eax                                    #62.7
..LN55:
        movl      (%rsp), %esi                                  #62.7
..LN56:
        call      __kmpc_serialized_parallel                    #62.7
..LN57:
                                # LOE rbx r12d
..B1.9:                         # Preds ..B1.8
..LN58:
        movl      $___kmpv_zeromain_0, %esi                     #62.7
..LN59:
        lea       (%rsp), %rdi                                  #62.7
..LN60:
        lea       16(%rsp), %rdx                                #62.7
..LN61:
        call      L_main_62__par_region0_2.27                   #62.7
..LN62:
                                # LOE rbx r12d
..B1.10:                        # Preds ..B1.9
..LN63:
        movl      $.2.3_2_kmpc_loc_struct_pack.29, %edi         #62.7
..LN64:
        xorl      %eax, %eax                                    #62.7
..LN65:
        movl      (%rsp), %esi                                  #62.7
..LN66:
        call      __kmpc_end_serialized_parallel                #62.7
..LN67:
                                # LOE rbx r12d
..B1.11:                        # Preds ..B1.7 ..B1.10
..LN68:
   .loc    1  82  is_stmt 1
        pxor      %xmm2, %xmm2                                  #82.6
..LN69:
                                # LOE rbx r12d xmm2
..B1.12:                        # Preds ..B1.11
..LN70:
        cmpq      $4, %rbx                                      #82.2
..LN71:
        jl        ..B1.33       # Prob 10%                      #82.2
..LN72:
                                # LOE rbx r12d xmm2
..B1.13:                        # Preds ..B1.12
..LN73:
        movl      %ebx, %edx                                    #82.2
..LN74:
   .loc    1  49  is_stmt 1
..LN75:
   .loc    1  82  is_stmt 1
        movl      %edx, %eax                                    #82.2
..LN76:
   .loc    1  49  is_stmt 1
        pxor      %xmm2, %xmm2                                  #49.24
..LN77:
   .loc    1  82  is_stmt 1
        andl      $3, %eax                                      #82.2
..LN78:
   .loc    1  49  is_stmt 1
        pxor      %xmm0, %xmm0                                  #49.24
..LN79:
   .loc    1  82  is_stmt 1
        subl      %eax, %edx                                    #82.2
..LN80:
        xorl      %eax, %eax                                    #82.2
..LN81:
        movslq    %edx, %rdx                                    #82.2
..LN82:
                                # LOE rax rdx rbx r12d xmm0 xmm2
..B1.14:                        # Preds ..B1.14 ..B1.13
..LN83:
   .loc    1  83  is_stmt 1
        addpd     16(%rsp,%rax,8), %xmm2                        #83.6
..LN84:
        addpd     32(%rsp,%rax,8), %xmm0                        #83.6
..LN85:
   .loc    1  82  is_stmt 1
        addq      $4, %rax                                      #82.2
..LN86:
        cmpq      %rdx, %rax                                    #82.2
..LN87:
        jb        ..B1.14       # Prob 91%                      #82.2
..LN88:
                                # LOE rax rdx rbx r12d xmm0 xmm2
..B1.15:                        # Preds ..B1.14
..LN89:
   .loc    1  49  is_stmt 1
        addpd     %xmm0, %xmm2                                  #49.24
..LN90:
        movaps    %xmm2, %xmm0                                  #49.24
..LN91:
        unpckhpd  %xmm2, %xmm0                                  #49.24
..LN92:
        addsd     %xmm0, %xmm2                                  #49.24
..LN93:
                                # LOE rdx rbx r12d xmm2
..B1.16:                        # Preds ..B1.15 ..B1.33
..LN94:
   .loc    1  82  is_stmt 1
        cmpq      %rbx, %rdx                                    #82.2
..LN95:
        jae       ..B1.20       # Prob 10%                      #82.2
..LN96:
                                # LOE rdx rbx r12d xmm2
..B1.18:                        # Preds ..B1.16 ..B1.18
..LN97:
   .loc    1  83  is_stmt 1
        addsd     16(%rsp,%rdx,8), %xmm2                        #83.6
..LN98:
   .loc    1  82  is_stmt 1
        incq      %rdx                                          #82.2
..LN99:
        cmpq      %rbx, %rdx                                    #82.2
..LN100:
        jb        ..B1.18       # Prob 91%                      #82.2
..LN101:
                                # LOE rdx rbx r12d xmm2
..B1.20:                        # Preds ..B1.18 ..B1.16
..LN102:
   .loc    1  85  is_stmt 1
        mulsd     step(%rip), %xmm2                             #85.19
..LN103:
   .loc    1  86  is_stmt 1
        movsd     %xmm2, 152(%rsp)                              #86.18
..LN104:
        call      omp_get_wtime                                 #86.18
..LN105:
                                # LOE rbx r12d xmm0
..B1.40:                        # Preds ..B1.20
        movsd     152(%rsp), %xmm2                              #
..LN106:
        movaps    %xmm0, %xmm1                                  #86.18
..LN107:
                                # LOE rbx r12d xmm1 xmm2
..B1.21:                        # Preds ..B1.40
..LN108:
   .loc    1  87  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #87.7
..LN109:
        movl      %r12d, %esi                                   #87.7
..LN110:
        movaps    %xmm2, %xmm0                                  #87.7
..LN111:
        movl      $2, %eax                                      #87.7
..LN112:
   .loc    1  86  is_stmt 1
        subsd     144(%rsp), %xmm1                              #86.36
..LN113:
   .loc    1  87  is_stmt 1
        call      printf                                        #87.7
..LN114:
                                # LOE rbx r12d
..B1.22:                        # Preds ..B1.21
..LN115:
   .loc    1  56  is_stmt 1
        incl      %r12d                                         #56.29
..LN116:
        incq      %rbx                                          #56.29
..LN117:
        cmpl      $12, %r12d                                    #56.16
..LN118:
        jle       ..B1.3        # Prob 91%                      #56.16
..LN119:
                                # LOE rbx r12d
..B1.23:                        # Preds ..B1.22
..LN120:
   .loc    1  89  is_stmt 1
        movl      $.2.3_2_kmpc_loc_struct_pack.20, %edi         #89.1
..LN121:
        xorl      %eax, %eax                                    #89.1
..LN122:
        call      __kmpc_end                                    #89.1
..LN123:
                                # LOE
..B1.24:                        # Preds ..B1.23
..LN124:
        xorl      %eax, %eax                                    #89.1
..LN125:
        movq      8(%rsp), %r15                                 #89.1
..___tag_value_main.23:                                         #
..LN126:
        movq      112(%rsp), %r14                               #89.1
..___tag_value_main.24:                                         #
..LN127:
        movq      120(%rsp), %r13                               #89.1
..___tag_value_main.25:                                         #
..LN128:
        movq      128(%rsp), %r12                               #89.1
..___tag_value_main.26:                                         #
..LN129:
        movq      136(%rsp), %rbx                               #89.1
..___tag_value_main.27:                                         #
..LN130:
        movq      %rbp, %rsp                                    #89.1
..LN131:
        popq      %rbp                                          #89.1
..___tag_value_main.29:                                         #
..LN132:
        ret                                                     #89.1
..___tag_value_main.31:                                         #
..LN133:
                                # LOE
L_main_62__par_region0_2.27:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
..B1.25:                        # Preds ..B1.0
..LN134:
   .loc    1  62  is_stmt 1
        pushq     %rbp                                          #62.7
..___tag_value_main.33:                                         #
..LN135:
        movq      %rsp, %rbp                                    #62.7
..___tag_value_main.34:                                         #
..LN136:
        andq      $-128, %rsp                                   #62.7
..LN137:
        subq      $256, %rsp                                    #62.7
..LN138:
        movq      %rbx, 136(%rsp)                               #62.7
..___tag_value_main.37:                                         #
..LN139:
        movq      %r15, 8(%rsp)                                 #62.7
..___tag_value_main.39:                                         #
..LN140:
        movq      %rdx, %r15                                    #62.7
..LN141:
        movq      %r14, 112(%rsp)                               #62.7
..___tag_value_main.41:                                         #
..LN142:
        movq      %r13, 120(%rsp)                               #62.7
..___tag_value_main.43:                                         #
..LN143:
        movq      %r12, 128(%rsp)                               #62.7
..___tag_value_main.45:                                         #
..LN144:
   .loc    1  65  is_stmt 1
        call      omp_get_thread_num                            #65.13
..___tag_value_main.47:                                         #
..LN145:
                                # LOE r15 eax
..B1.41:                        # Preds ..B1.25
..LN146:
        movl      %eax, %r14d                                   #65.13
..LN147:
                                # LOE r15 r14d
..B1.26:                        # Preds ..B1.41
..LN148:
   .loc    1  66  is_stmt 1
        call      omp_get_num_threads                           #66.21
..LN149:
                                # LOE r15 eax r14d
..B1.42:                        # Preds ..B1.26
..LN150:
   .loc    1  69  is_stmt 1
        movslq    %r14d, %rbx                                   #69.4
..LN151:
   .loc    1  66  is_stmt 1
        movl      %eax, %r13d                                   #66.21
        movslq    %r13d, %r12                                   #
..LN152:
   .loc    1  71  is_stmt 1
        testl     %r14d, %r14d                                  #71.19
..LN153:
   .loc    1  69  is_stmt 1
        movq      $0, (%r15,%rbx,8)                             #69.4
..LN154:
   .loc    1  71  is_stmt 1
        jne       ..B1.28       # Prob 78%                      #71.19
..LN155:
                                # LOE rbx r12 r15 r13d r14d
..B1.27:                        # Preds ..B1.42
..LN156:
   .loc    1  72  is_stmt 1
        movl      $.L_2__STRING.0, %edi                         #72.14
..LN157:
        movl      %r13d, %esi                                   #72.14
..LN158:
        xorl      %eax, %eax                                    #72.14
..LN159:
        call      printf                                        #72.14
..LN160:
                                # LOE rbx r12 r15 r13d r14d
..B1.28:                        # Preds ..B1.27 ..B1.42
        movq      %rbx, %rax                                    #
..LN161:
   .loc    1  74  is_stmt 1
        cmpq      $100000000, %rbx                              #74.17
..LN162:
        jge       ..B1.32       # Prob 10%                      #74.17
..LN163:
                                # LOE rax rbx r12 r15 r13d r14d
..B1.29:                        # Preds ..B1.28
..LN164:
   .loc    1  76  is_stmt 1
        movsd     step(%rip), %xmm2                             #76.17
..LN165:
   .loc    1  78  is_stmt 1
        movsd     (%r15,%rbx,8), %xmm3                          #78.15
..LN166:
   .loc    1  76  is_stmt 1
        movsd     .L_2il0floatpacket.48(%rip), %xmm1            #76.12
..LN167:
   .loc    1  77  is_stmt 1
        movsd     .L_2il0floatpacket.50(%rip), %xmm0            #77.14
..LN168:
                                # LOE rax rbx r12 r15 r13d r14d xmm0 xmm1 xmm2 xmm3
..B1.30:                        # Preds ..B1.30 ..B1.29
..LN169:
   .loc    1  76  is_stmt 1
        pxor      %xmm4, %xmm4                                  #76.10
..LN170:
   .loc    1  74  is_stmt 1
        addq      %r12, %rax                                    #74.28
..LN171:
   .loc    1  76  is_stmt 1
        cvtsi2sd  %r14d, %xmm4                                  #76.10
..LN172:
   .loc    1  77  is_stmt 1
        movsd     .L_2il0floatpacket.49(%rip), %xmm5            #77.20
..LN173:
   .loc    1  74  is_stmt 1
        addl      %r13d, %r14d                                  #74.28
..LN174:
        cmpq      $100000000, %rax                              #74.17
..LN175:
   .loc    1  76  is_stmt 1
        addsd     %xmm1, %xmm4                                  #76.12
..LN176:
        mulsd     %xmm2, %xmm4                                  #76.17
..LN177:
   .loc    1  77  is_stmt 1
        mulsd     %xmm4, %xmm4                                  #77.20
..LN178:
        addsd     %xmm0, %xmm4                                  #77.20
..LN179:
        divsd     %xmm4, %xmm5                                  #77.20
..LN180:
   .loc    1  78  is_stmt 1
        addsd     %xmm5, %xmm3                                  #78.25
..LN181:
   .loc    1  74  is_stmt 1
        jl        ..B1.30       # Prob 82%                      #74.17
..LN182:
                                # LOE rax rbx r12 r15 r13d r14d xmm0 xmm1 xmm2 xmm3
..B1.31:                        # Preds ..B1.30
..LN183:
   .loc    1  78  is_stmt 1
        movsd     %xmm3, (%r15,%rbx,8)                          #78.5
..LN184:
                                # LOE
..B1.32:                        # Preds ..B1.28 ..B1.31
..LN185:
   .loc    1  62  is_stmt 1
        xorl      %eax, %eax                                    #62.7
..LN186:
        movq      8(%rsp), %r15                                 #62.7
..___tag_value_main.52:                                         #
..LN187:
        movq      112(%rsp), %r14                               #62.7
..___tag_value_main.53:                                         #
..LN188:
        movq      120(%rsp), %r13                               #62.7
..___tag_value_main.54:                                         #
..LN189:
        movq      128(%rsp), %r12                               #62.7
..___tag_value_main.55:                                         #
..LN190:
        movq      136(%rsp), %rbx                               #62.7
..___tag_value_main.56:                                         #
..LN191:
        movq      %rbp, %rsp                                    #62.7
..LN192:
        popq      %rbp                                          #62.7
..___tag_value_main.58:                                         #
..LN193:
        ret                                                     #62.7
..___tag_value_main.60:                                         #
..LN194:
                                # LOE
..B1.33:                        # Preds ..B1.12                 # Infreq
..LN195:
   .loc    1  82  is_stmt 1
        xorl      %edx, %edx                                    #82.2
..LN196:
        jmp       ..B1.16       # Prob 100%                     #82.2
        .align    16,0x90
..___tag_value_main.68:                                         #
..LN197:
                                # LOE rdx rbx r12d xmm2
..LN198:
# mark_end;
	.type	main,@function
	.size	main,.-main
..LNmain.199:
.LNmain:
	.section .gcc_except_table, "a"
	.align 4
main$$LSDA:
	.byte	255
	.byte	0
	.uleb128	..___tag_value_main.72 - ..___tag_value_main.71
..___tag_value_main.71:
	.byte	1
	.uleb128	..___tag_value_main.70 - ..___tag_value_main.69
..___tag_value_main.69:
..___tag_value_main.70:
	.long	0x00000000,0x00000000
..___tag_value_main.72:
	.data
	.align 4
	.align 4
.2.3_2_kmpc_loc_struct_pack.1:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.3_2__kmpc_loc_pack.0
	.align 4
.2.3_2__kmpc_loc_pack.0:
	.byte	59
	.byte	47
	.byte	108
	.byte	111
	.byte	99
	.byte	97
	.byte	108
	.byte	47
	.byte	109
	.byte	97
	.byte	116
	.byte	115
	.byte	98
	.byte	114
	.byte	111
	.byte	114
	.byte	47
	.byte	68
	.byte	114
	.byte	111
	.byte	112
	.byte	98
	.byte	111
	.byte	120
	.byte	47
	.byte	77
	.byte	83
	.byte	80
	.byte	47
	.byte	79
	.byte	77
	.byte	80
	.byte	47
	.byte	115
	.byte	111
	.byte	108
	.byte	117
	.byte	116
	.byte	105
	.byte	111
	.byte	110
	.byte	115
	.byte	47
	.byte	112
	.byte	105
	.byte	95
	.byte	115
	.byte	112
	.byte	109
	.byte	100
	.byte	95
	.byte	115
	.byte	105
	.byte	109
	.byte	112
	.byte	108
	.byte	101
	.byte	46
	.byte	99
	.byte	59
	.byte	109
	.byte	97
	.byte	105
	.byte	110
	.byte	59
	.byte	52
	.byte	55
	.byte	59
	.byte	52
	.byte	55
	.byte	59
	.byte	59
	.align 4
.2.3_2_kmpc_loc_struct_pack.12:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.3_2__kmpc_loc_pack.11
	.align 4
.2.3_2__kmpc_loc_pack.11:
	.byte	59
	.byte	47
	.byte	108
	.byte	111
	.byte	99
	.byte	97
	.byte	108
	.byte	47
	.byte	109
	.byte	97
	.byte	116
	.byte	115
	.byte	98
	.byte	114
	.byte	111
	.byte	114
	.byte	47
	.byte	68
	.byte	114
	.byte	111
	.byte	112
	.byte	98
	.byte	111
	.byte	120
	.byte	47
	.byte	77
	.byte	83
	.byte	80
	.byte	47
	.byte	79
	.byte	77
	.byte	80
	.byte	47
	.byte	115
	.byte	111
	.byte	108
	.byte	117
	.byte	116
	.byte	105
	.byte	111
	.byte	110
	.byte	115
	.byte	47
	.byte	112
	.byte	105
	.byte	95
	.byte	115
	.byte	112
	.byte	109
	.byte	100
	.byte	95
	.byte	115
	.byte	105
	.byte	109
	.byte	112
	.byte	108
	.byte	101
	.byte	46
	.byte	99
	.byte	59
	.byte	109
	.byte	97
	.byte	105
	.byte	110
	.byte	59
	.byte	52
	.byte	55
	.byte	59
	.byte	52
	.byte	55
	.byte	59
	.byte	59
	.align 4
.2.3_2_kmpc_loc_struct_pack.29:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.3_2__kmpc_loc_pack.28
	.align 4
.2.3_2__kmpc_loc_pack.28:
	.byte	59
	.byte	47
	.byte	108
	.byte	111
	.byte	99
	.byte	97
	.byte	108
	.byte	47
	.byte	109
	.byte	97
	.byte	116
	.byte	115
	.byte	98
	.byte	114
	.byte	111
	.byte	114
	.byte	47
	.byte	68
	.byte	114
	.byte	111
	.byte	112
	.byte	98
	.byte	111
	.byte	120
	.byte	47
	.byte	77
	.byte	83
	.byte	80
	.byte	47
	.byte	79
	.byte	77
	.byte	80
	.byte	47
	.byte	115
	.byte	111
	.byte	108
	.byte	117
	.byte	116
	.byte	105
	.byte	111
	.byte	110
	.byte	115
	.byte	47
	.byte	112
	.byte	105
	.byte	95
	.byte	115
	.byte	112
	.byte	109
	.byte	100
	.byte	95
	.byte	115
	.byte	105
	.byte	109
	.byte	112
	.byte	108
	.byte	101
	.byte	46
	.byte	99
	.byte	59
	.byte	109
	.byte	97
	.byte	105
	.byte	110
	.byte	59
	.byte	54
	.byte	50
	.byte	59
	.byte	56
	.byte	48
	.byte	59
	.byte	59
	.align 4
.2.3_2_kmpc_loc_struct_pack.20:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.3_2__kmpc_loc_pack.19
	.align 4
.2.3_2__kmpc_loc_pack.19:
	.byte	59
	.byte	47
	.byte	108
	.byte	111
	.byte	99
	.byte	97
	.byte	108
	.byte	47
	.byte	109
	.byte	97
	.byte	116
	.byte	115
	.byte	98
	.byte	114
	.byte	111
	.byte	114
	.byte	47
	.byte	68
	.byte	114
	.byte	111
	.byte	112
	.byte	98
	.byte	111
	.byte	120
	.byte	47
	.byte	77
	.byte	83
	.byte	80
	.byte	47
	.byte	79
	.byte	77
	.byte	80
	.byte	47
	.byte	115
	.byte	111
	.byte	108
	.byte	117
	.byte	116
	.byte	105
	.byte	111
	.byte	110
	.byte	115
	.byte	47
	.byte	112
	.byte	105
	.byte	95
	.byte	115
	.byte	112
	.byte	109
	.byte	100
	.byte	95
	.byte	115
	.byte	105
	.byte	109
	.byte	112
	.byte	108
	.byte	101
	.byte	46
	.byte	99
	.byte	59
	.byte	109
	.byte	97
	.byte	105
	.byte	110
	.byte	59
	.byte	56
	.byte	57
	.byte	59
	.byte	56
	.byte	57
	.byte	59
	.byte	59
	.data
# -- End  main, L_main_62__par_region0_2.27
	.bss
	.align 4
	.align 4
___kmpv_zeromain_0:
	.type	___kmpv_zeromain_0,@object
	.size	___kmpv_zeromain_0,4
	.space 4	# pad
	.section .rodata, "a"
	.align 8
	.align 8
.L_2il0floatpacket.47:
	.long	0xe2308c3a,0x3e45798e
	.type	.L_2il0floatpacket.47,@object
	.size	.L_2il0floatpacket.47,8
	.align 8
.L_2il0floatpacket.48:
	.long	0x00000000,0x3fe00000
	.type	.L_2il0floatpacket.48,@object
	.size	.L_2il0floatpacket.48,8
	.align 8
.L_2il0floatpacket.49:
	.long	0x00000000,0x40100000
	.type	.L_2il0floatpacket.49,@object
	.size	.L_2il0floatpacket.49,8
	.align 8
.L_2il0floatpacket.50:
	.long	0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.50,@object
	.size	.L_2il0floatpacket.50,8
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
.L_2__STRING.0:
	.byte	32
	.byte	110
	.byte	117
	.byte	109
	.byte	95
	.byte	116
	.byte	104
	.byte	114
	.byte	101
	.byte	97
	.byte	100
	.byte	115
	.byte	32
	.byte	61
	.byte	32
	.byte	37
	.byte	100
	.byte	0
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,18
	.section .rodata.str1.32, "aMS",@progbits,1
	.align 32
	.align 4
.L_2__STRING.1:
	.byte	10
	.byte	32
	.byte	112
	.byte	105
	.byte	32
	.byte	105
	.byte	115
	.byte	32
	.byte	37
	.byte	102
	.byte	32
	.byte	105
	.byte	110
	.byte	32
	.byte	37
	.byte	102
	.byte	32
	.byte	115
	.byte	101
	.byte	99
	.byte	111
	.byte	110
	.byte	100
	.byte	115
	.byte	32
	.byte	37
	.byte	100
	.byte	32
	.byte	116
	.byte	104
	.byte	114
	.byte	100
	.byte	115
	.byte	32
	.byte	10
	.byte	0
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,36
	.data
	.comm step,8,8
# mark_proc_addr_taken L_main_62__par_region0_2.27;
	.section .note.GNU-stack, ""
	.global step#
// -- Begin DWARF2 SEGMENT .debug_info
	.section .debug_info
.debug_info_seg:
	.align 1
	.4byte 0x0000029f
	.2byte 0x0002
	.4byte .debug_abbrev_seg
	.byte 0x08
//	DW_TAG_compile_unit:
	.byte 0x01
//	DW_AT_comp_dir:
	.8byte 0x6d2f6c61636f6c2f
	.8byte 0x2f726f7262737461
	.8byte 0x2f786f62706f7244
	.8byte 0x2f504d4f2f50534d
	.8byte 0x6e6f6974756c6f73
	.2byte 0x0073
//	DW_AT_language:
	.byte 0x01
//	DW_AT_name:
	.8byte 0x5f646d70735f6970
	.8byte 0x632e656c706d6973
	.byte 0x00
//	DW_AT_producer:
	.8byte 0x2952286c65746e49
	.8byte 0x6c65746e49204320
	.8byte 0x4320343620295228
	.8byte 0x2072656c69706d6f
	.8byte 0x6120726f66204558
	.8byte 0x69746163696c7070
	.8byte 0x6e6e757220736e6f
	.8byte 0x49206e6f20676e69
	.8byte 0x202952286c65746e
	.8byte 0x73726556202c3436
	.8byte 0x302e3231206e6f69
	.8byte 0x42203139312e342e
	.8byte 0x31303220646c6975
	.8byte 0x46200a3732343031
	.8byte 0x6d61532073657869
	.8byte 0x6567616b6e694c65
	.8byte 0x6d654d20656d614e
	.8byte 0x746e696f50726562
	.4byte 0x0a737265
	.byte 0x00
//	DW_AT_stmt_list:
	.4byte .debug_line_seg
//	DW_TAG_base_type:
	.byte 0x02
//	DW_AT_byte_size:
	.byte 0x04
//	DW_AT_encoding:
	.byte 0x05
//	DW_AT_name:
	.4byte 0x00746e69
//	DW_TAG_subprogram:
	.byte 0x03
//	DW_AT_decl_line:
	.byte 0x2e
//	DW_AT_decl_column:
	.byte 0x05
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_inline:
	.byte 0x00
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000000e1
//	DW_AT_prototyped:
	.byte 0x00
//	DW_AT_name:
	.4byte 0x6e69616d
	.byte 0x00
	.4byte 0x6e69616d
	.byte 0x00
//	DW_AT_frame_base:
	.2byte 0x7702
	.byte 0x00
//	DW_AT_low_pc:
	.8byte main
//	DW_AT_high_pc:
	.8byte ..LNmain.199
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_variable:
	.byte 0x04
//	DW_AT_decl_line:
	.byte 0x30
//	DW_AT_decl_column:
	.byte 0x08
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0069
//	DW_AT_type:
	.4byte 0x000000e1
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x30
//	DW_AT_decl_column:
	.byte 0x0a
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x006a
//	DW_AT_type:
	.4byte 0x000000e1
//	DW_AT_location:
	.2byte 0x5c01
//	DW_TAG_variable:
	.byte 0x04
//	DW_AT_decl_line:
	.byte 0x31
//	DW_AT_decl_column:
	.byte 0x0b
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x6970
	.byte 0x00
//	DW_AT_type:
	.4byte 0x00000258
//	DW_TAG_variable:
	.byte 0x04
//	DW_AT_decl_line:
	.byte 0x31
//	DW_AT_decl_column:
	.byte 0x0f
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.8byte 0x6d75735f6c6c7566
	.byte 0x00
//	DW_AT_type:
	.4byte 0x00000258
//	DW_TAG_variable:
	.byte 0x04
//	DW_AT_decl_line:
	.byte 0x32
//	DW_AT_decl_column:
	.byte 0x0b
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.8byte 0x69745f7472617473
	.2byte 0x656d
	.byte 0x00
//	DW_AT_type:
	.4byte 0x00000258
//	DW_TAG_variable:
	.byte 0x04
//	DW_AT_decl_line:
	.byte 0x32
//	DW_AT_decl_column:
	.byte 0x17
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.8byte 0x656d69745f6e7572
	.byte 0x00
//	DW_AT_type:
	.4byte 0x00000258
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x33
//	DW_AT_decl_column:
	.byte 0x0b
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x006d7573
//	DW_AT_type:
	.4byte 0x00000262
//	DW_AT_location:
	.2byte 0x9102
	.byte 0x10
//	DW_TAG_lexical_block:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0x3f
//	DW_AT_decl_column:
	.byte 0x07
//	DW_AT_decl_file:
	.byte 0x01
//	DW_TAG_variable:
	.byte 0x04
//	DW_AT_decl_line:
	.byte 0x40
//	DW_AT_decl_column:
	.byte 0x0d
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0069
//	DW_AT_type:
	.4byte 0x000000e1
//	DW_TAG_variable:
	.byte 0x04
//	DW_AT_decl_line:
	.byte 0x41
//	DW_AT_decl_column:
	.byte 0x08
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x6469
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000e1
//	DW_TAG_variable:
	.byte 0x04
//	DW_AT_decl_line:
	.byte 0x42
//	DW_AT_decl_column:
	.byte 0x08
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.8byte 0x61657268746d756e
	.2byte 0x7364
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000e1
//	DW_TAG_variable:
	.byte 0x04
//	DW_AT_decl_line:
	.byte 0x43
//	DW_AT_decl_column:
	.byte 0x0b
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0078
//	DW_AT_type:
	.4byte 0x00000258
//	DW_TAG_lexical_block:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0x4a
//	DW_AT_decl_column:
	.byte 0x2a
//	DW_AT_decl_file:
	.byte 0x01
//	DW_TAG_variable:
	.byte 0x04
//	DW_AT_decl_line:
	.byte 0x4b
//	DW_AT_decl_column:
	.byte 0x0d
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0074
//	DW_AT_type:
	.4byte 0x00000258
	.byte 0x00
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x07
//	DW_AT_decl_line:
	.byte 0x3e
//	DW_AT_decl_column:
	.byte 0x07
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_artificial:
	.byte 0x01
//	DW_AT_inline:
	.byte 0x00
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_prototyped:
	.byte 0x00
//	DW_AT_name:
	.8byte 0x365f6e69616d5f4c
	.8byte 0x725f7261705f5f32
	.8byte 0x325f306e6f696765
	.4byte 0x0037325f
//	DW_AT_low_pc:
	.8byte L_main_62__par_region0_2.27
//	DW_AT_high_pc:
	.8byte ..LN195
//	DW_AT_external:
	.byte 0x00
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x3e
//	DW_AT_decl_column:
	.byte 0x07
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x006d7573
//	DW_AT_type:
	.4byte 0x00000262
//	DW_AT_location:
	.2byte 0x7102
	.byte 0x00
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x3e
//	DW_AT_decl_column:
	.byte 0x07
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0069
//	DW_AT_type:
	.4byte 0x000000e1
//	DW_AT_location:
	.2byte 0x5e01
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x3e
//	DW_AT_decl_column:
	.byte 0x07
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x6469
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000e1
//	DW_AT_location:
	.2byte 0x5e01
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x3e
//	DW_AT_decl_column:
	.byte 0x07
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.8byte 0x61657268746d756e
	.2byte 0x7364
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000e1
//	DW_AT_location:
	.2byte 0x5d01
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x3e
//	DW_AT_decl_column:
	.byte 0x07
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0078
//	DW_AT_type:
	.4byte 0x00000258
//	DW_AT_location:
	.2byte 0x6501
//	DW_TAG_variable:
	.byte 0x04
//	DW_AT_decl_line:
	.byte 0x3e
//	DW_AT_decl_column:
	.byte 0x07
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0074
//	DW_AT_type:
	.4byte 0x00000258
	.byte 0x00
	.byte 0x00
//	DW_TAG_base_type:
	.byte 0x02
//	DW_AT_byte_size:
	.byte 0x08
//	DW_AT_encoding:
	.byte 0x04
//	DW_AT_name:
	.4byte 0x62756f64
	.2byte 0x656c
	.byte 0x00
//	DW_TAG_array_type:
	.byte 0x08
//	DW_AT_type:
	.4byte 0x00000258
//	DW_AT_byte_size:
	.byte 0x60
//	DW_TAG_subrange_type:
	.byte 0x09
//	DW_AT_upper_bound:
	.byte 0x0b
	.byte 0x00
//	DW_TAG_variable:
	.byte 0x04
//	DW_AT_decl_line:
	.byte 0x2c
//	DW_AT_decl_column:
	.byte 0x0d
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.8byte 0x706574735f6d756e
	.2byte 0x0073
//	DW_AT_type:
	.4byte 0x0000027e
//	DW_TAG_base_type:
	.byte 0x02
//	DW_AT_byte_size:
	.byte 0x08
//	DW_AT_encoding:
	.byte 0x05
//	DW_AT_name:
	.4byte 0x676e6f6c
	.byte 0x00
//	DW_TAG_variable:
	.byte 0x0a
//	DW_AT_decl_line:
	.byte 0x2d
//	DW_AT_decl_column:
	.byte 0x08
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x70657473
	.byte 0x00
//	DW_AT_type:
	.4byte 0x00000258
//	DW_AT_location:
	.2byte 0x0309
	.8byte step
//	DW_AT_external:
	.byte 0x01
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x00
// -- Begin DWARF2 SEGMENT .debug_line
	.section .debug_line
.debug_line_seg:
	.align 1
// -- Begin DWARF2 SEGMENT .debug_abbrev
	.section .debug_abbrev
.debug_abbrev_seg:
	.align 1
	.byte 0x01
	.byte 0x11
	.byte 0x01
	.byte 0x1b
	.byte 0x08
	.byte 0x13
	.byte 0x0b
	.byte 0x03
	.byte 0x08
	.byte 0x25
	.byte 0x08
	.byte 0x10
	.byte 0x06
	.2byte 0x0000
	.byte 0x02
	.byte 0x24
	.byte 0x00
	.byte 0x0b
	.byte 0x0b
	.byte 0x3e
	.byte 0x0b
	.byte 0x03
	.byte 0x08
	.2byte 0x0000
	.byte 0x03
	.byte 0x2e
	.byte 0x01
	.byte 0x3b
	.byte 0x0b
	.byte 0x39
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x20
	.byte 0x0b
	.byte 0x32
	.byte 0x0b
	.byte 0x49
	.byte 0x13
	.byte 0x27
	.byte 0x0c
	.byte 0x03
	.byte 0x08
	.2byte 0x4087
	.byte 0x08
	.byte 0x40
	.byte 0x0a
	.byte 0x11
	.byte 0x01
	.byte 0x12
	.byte 0x01
	.byte 0x3f
	.byte 0x0c
	.2byte 0x0000
	.byte 0x04
	.byte 0x34
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x39
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x32
	.byte 0x0b
	.byte 0x03
	.byte 0x08
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x05
	.byte 0x34
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x39
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x32
	.byte 0x0b
	.byte 0x03
	.byte 0x08
	.byte 0x49
	.byte 0x13
	.byte 0x02
	.byte 0x0a
	.2byte 0x0000
	.byte 0x06
	.byte 0x0b
	.byte 0x01
	.byte 0x3b
	.byte 0x0b
	.byte 0x39
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.2byte 0x0000
	.byte 0x07
	.byte 0x2e
	.byte 0x01
	.byte 0x3b
	.byte 0x0b
	.byte 0x39
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x34
	.byte 0x0c
	.byte 0x20
	.byte 0x0b
	.byte 0x32
	.byte 0x0b
	.byte 0x27
	.byte 0x0c
	.byte 0x03
	.byte 0x08
	.byte 0x11
	.byte 0x01
	.byte 0x12
	.byte 0x01
	.byte 0x3f
	.byte 0x0c
	.2byte 0x0000
	.byte 0x08
	.byte 0x01
	.byte 0x01
	.byte 0x49
	.byte 0x13
	.byte 0x0b
	.byte 0x0b
	.2byte 0x0000
	.byte 0x09
	.byte 0x21
	.byte 0x00
	.byte 0x2f
	.byte 0x0b
	.2byte 0x0000
	.byte 0x0a
	.byte 0x34
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x39
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x32
	.byte 0x0b
	.byte 0x03
	.byte 0x08
	.byte 0x49
	.byte 0x13
	.byte 0x02
	.byte 0x0a
	.byte 0x3f
	.byte 0x0c
	.2byte 0x0000
	.byte 0x00
// -- Begin DWARF2 SEGMENT .debug_frame
	.section .debug_frame
.debug_frame_seg:
	.align 1
	.4byte 0x00000014
	.8byte 0x78010001ffffffff
	.8byte 0x0000019008070c10
	.4byte 0x00000000
	.4byte 0x000002b4
	.4byte .debug_frame_seg
	.8byte ..___tag_value_main.2
	.8byte ..___tag_value_main.68-..___tag_value_main.2
	.byte 0x04
	.4byte ..___tag_value_main.4-..___tag_value_main.2
	.4byte 0x0410070c
	.4byte ..___tag_value_main.5-..___tag_value_main.4
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_main.8-..___tag_value_main.5
	.8byte 0xff800d1c380e0310
	.8byte 0xffffff880d1affff
	.4byte 0x03030922
	.byte 0x04
	.4byte ..___tag_value_main.10-..___tag_value_main.8
	.8byte 0xff800d1c380e0f10
	.8byte 0xffffff080d1affff
	.4byte 0x0f0f0922
	.byte 0x04
	.4byte ..___tag_value_main.12-..___tag_value_main.10
	.8byte 0xff800d1c380e0e10
	.8byte 0xffffff700d1affff
	.4byte 0x0e0e0922
	.byte 0x04
	.4byte ..___tag_value_main.14-..___tag_value_main.12
	.8byte 0xff800d1c380e0d10
	.8byte 0xffffff780d1affff
	.4byte 0x0d0d0922
	.byte 0x04
	.4byte ..___tag_value_main.16-..___tag_value_main.14
	.8byte 0xff800d1c380e0c10
	.8byte 0xffffff800d1affff
	.4byte 0x0c0c0922
	.byte 0x04
	.4byte ..___tag_value_main.18-..___tag_value_main.16
	.8byte 0xff800d1c380e0310
	.8byte 0xffffff880d1affff
	.8byte 0x800d1c380e0c1022
	.8byte 0xffff800d1affffff
	.8byte 0x0d1c380e0d1022ff
	.8byte 0xff780d1affffff80
	.8byte 0x1c380e0e1022ffff
	.8byte 0x700d1affffff800d
	.8byte 0x380e0f1022ffffff
	.8byte 0x0d1affffff800d1c
	.4byte 0xffffff08
	.2byte 0x0422
	.4byte ..___tag_value_main.23-..___tag_value_main.18
	.4byte 0x040f0f09
	.4byte ..___tag_value_main.24-..___tag_value_main.23
	.4byte 0x040e0e09
	.4byte ..___tag_value_main.25-..___tag_value_main.24
	.4byte 0x040d0d09
	.4byte ..___tag_value_main.26-..___tag_value_main.25
	.4byte 0x040c0c09
	.4byte ..___tag_value_main.27-..___tag_value_main.26
	.4byte 0x04030309
	.4byte ..___tag_value_main.29-..___tag_value_main.27
	.4byte 0x0908070c
	.2byte 0x0606
	.byte 0x04
	.4byte ..___tag_value_main.31-..___tag_value_main.29
	.4byte 0x0410060c
	.4byte ..___tag_value_main.33-..___tag_value_main.31
	.4byte 0x0410070c
	.4byte ..___tag_value_main.34-..___tag_value_main.33
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_main.37-..___tag_value_main.34
	.8byte 0xff800d1c380e0310
	.8byte 0xffffff880d1affff
	.4byte 0x03030922
	.byte 0x04
	.4byte ..___tag_value_main.39-..___tag_value_main.37
	.8byte 0xff800d1c380e0f10
	.8byte 0xffffff080d1affff
	.4byte 0x0f0f0922
	.byte 0x04
	.4byte ..___tag_value_main.41-..___tag_value_main.39
	.8byte 0xff800d1c380e0e10
	.8byte 0xffffff700d1affff
	.4byte 0x0e0e0922
	.byte 0x04
	.4byte ..___tag_value_main.43-..___tag_value_main.41
	.8byte 0xff800d1c380e0d10
	.8byte 0xffffff780d1affff
	.4byte 0x0d0d0922
	.byte 0x04
	.4byte ..___tag_value_main.45-..___tag_value_main.43
	.8byte 0xff800d1c380e0c10
	.8byte 0xffffff800d1affff
	.4byte 0x0c0c0922
	.byte 0x04
	.4byte ..___tag_value_main.47-..___tag_value_main.45
	.8byte 0xff800d1c380e0310
	.8byte 0xffffff880d1affff
	.8byte 0x800d1c380e0c1022
	.8byte 0xffff800d1affffff
	.8byte 0x0d1c380e0d1022ff
	.8byte 0xff780d1affffff80
	.8byte 0x1c380e0e1022ffff
	.8byte 0x700d1affffff800d
	.8byte 0x380e0f1022ffffff
	.8byte 0x0d1affffff800d1c
	.4byte 0xffffff08
	.2byte 0x0422
	.4byte ..___tag_value_main.52-..___tag_value_main.47
	.4byte 0x040f0f09
	.4byte ..___tag_value_main.53-..___tag_value_main.52
	.4byte 0x040e0e09
	.4byte ..___tag_value_main.54-..___tag_value_main.53
	.4byte 0x040d0d09
	.4byte ..___tag_value_main.55-..___tag_value_main.54
	.4byte 0x040c0c09
	.4byte ..___tag_value_main.56-..___tag_value_main.55
	.4byte 0x04030309
	.4byte ..___tag_value_main.58-..___tag_value_main.56
	.4byte 0x0908070c
	.2byte 0x0606
	.byte 0x04
	.4byte ..___tag_value_main.60-..___tag_value_main.58
	.8byte 0x1c380e031010060c
	.8byte 0x880d1affffff800d
	.8byte 0x0c10028622ffffff
	.8byte 0xffffff800d1c380e
	.8byte 0x1022ffffff800d1a
	.8byte 0xffff800d1c380e0d
	.8byte 0x22ffffff780d1aff
	.8byte 0xff800d1c380e0e10
	.8byte 0xffffff700d1affff
	.8byte 0x800d1c380e0f1022
	.8byte 0xffff080d1affffff
	.2byte 0x22ff
	.byte 0x00
// -- Begin DWARF2 SEGMENT .eh_frame
	.section .eh_frame,"a",@progbits
.eh_frame_seg:
	.align 8
	.4byte 0x00000014
	.8byte 0x7801000100000000
	.8byte 0x0000019008070c10
	.4byte 0x00000000
	.4byte 0x000002b4
	.4byte 0x0000001c
	.8byte ..___tag_value_main.2
	.8byte ..___tag_value_main.68-..___tag_value_main.2
	.byte 0x04
	.4byte ..___tag_value_main.4-..___tag_value_main.2
	.4byte 0x0410070c
	.4byte ..___tag_value_main.5-..___tag_value_main.4
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_main.8-..___tag_value_main.5
	.8byte 0xff800d1c380e0310
	.8byte 0xffffff880d1affff
	.4byte 0x03030922
	.byte 0x04
	.4byte ..___tag_value_main.10-..___tag_value_main.8
	.8byte 0xff800d1c380e0f10
	.8byte 0xffffff080d1affff
	.4byte 0x0f0f0922
	.byte 0x04
	.4byte ..___tag_value_main.12-..___tag_value_main.10
	.8byte 0xff800d1c380e0e10
	.8byte 0xffffff700d1affff
	.4byte 0x0e0e0922
	.byte 0x04
	.4byte ..___tag_value_main.14-..___tag_value_main.12
	.8byte 0xff800d1c380e0d10
	.8byte 0xffffff780d1affff
	.4byte 0x0d0d0922
	.byte 0x04
	.4byte ..___tag_value_main.16-..___tag_value_main.14
	.8byte 0xff800d1c380e0c10
	.8byte 0xffffff800d1affff
	.4byte 0x0c0c0922
	.byte 0x04
	.4byte ..___tag_value_main.18-..___tag_value_main.16
	.8byte 0xff800d1c380e0310
	.8byte 0xffffff880d1affff
	.8byte 0x800d1c380e0c1022
	.8byte 0xffff800d1affffff
	.8byte 0x0d1c380e0d1022ff
	.8byte 0xff780d1affffff80
	.8byte 0x1c380e0e1022ffff
	.8byte 0x700d1affffff800d
	.8byte 0x380e0f1022ffffff
	.8byte 0x0d1affffff800d1c
	.4byte 0xffffff08
	.2byte 0x0422
	.4byte ..___tag_value_main.23-..___tag_value_main.18
	.4byte 0x040f0f09
	.4byte ..___tag_value_main.24-..___tag_value_main.23
	.4byte 0x040e0e09
	.4byte ..___tag_value_main.25-..___tag_value_main.24
	.4byte 0x040d0d09
	.4byte ..___tag_value_main.26-..___tag_value_main.25
	.4byte 0x040c0c09
	.4byte ..___tag_value_main.27-..___tag_value_main.26
	.4byte 0x04030309
	.4byte ..___tag_value_main.29-..___tag_value_main.27
	.4byte 0x0908070c
	.2byte 0x0606
	.byte 0x04
	.4byte ..___tag_value_main.31-..___tag_value_main.29
	.4byte 0x0410060c
	.4byte ..___tag_value_main.33-..___tag_value_main.31
	.4byte 0x0410070c
	.4byte ..___tag_value_main.34-..___tag_value_main.33
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_main.37-..___tag_value_main.34
	.8byte 0xff800d1c380e0310
	.8byte 0xffffff880d1affff
	.4byte 0x03030922
	.byte 0x04
	.4byte ..___tag_value_main.39-..___tag_value_main.37
	.8byte 0xff800d1c380e0f10
	.8byte 0xffffff080d1affff
	.4byte 0x0f0f0922
	.byte 0x04
	.4byte ..___tag_value_main.41-..___tag_value_main.39
	.8byte 0xff800d1c380e0e10
	.8byte 0xffffff700d1affff
	.4byte 0x0e0e0922
	.byte 0x04
	.4byte ..___tag_value_main.43-..___tag_value_main.41
	.8byte 0xff800d1c380e0d10
	.8byte 0xffffff780d1affff
	.4byte 0x0d0d0922
	.byte 0x04
	.4byte ..___tag_value_main.45-..___tag_value_main.43
	.8byte 0xff800d1c380e0c10
	.8byte 0xffffff800d1affff
	.4byte 0x0c0c0922
	.byte 0x04
	.4byte ..___tag_value_main.47-..___tag_value_main.45
	.8byte 0xff800d1c380e0310
	.8byte 0xffffff880d1affff
	.8byte 0x800d1c380e0c1022
	.8byte 0xffff800d1affffff
	.8byte 0x0d1c380e0d1022ff
	.8byte 0xff780d1affffff80
	.8byte 0x1c380e0e1022ffff
	.8byte 0x700d1affffff800d
	.8byte 0x380e0f1022ffffff
	.8byte 0x0d1affffff800d1c
	.4byte 0xffffff08
	.2byte 0x0422
	.4byte ..___tag_value_main.52-..___tag_value_main.47
	.4byte 0x040f0f09
	.4byte ..___tag_value_main.53-..___tag_value_main.52
	.4byte 0x040e0e09
	.4byte ..___tag_value_main.54-..___tag_value_main.53
	.4byte 0x040d0d09
	.4byte ..___tag_value_main.55-..___tag_value_main.54
	.4byte 0x040c0c09
	.4byte ..___tag_value_main.56-..___tag_value_main.55
	.4byte 0x04030309
	.4byte ..___tag_value_main.58-..___tag_value_main.56
	.4byte 0x0908070c
	.2byte 0x0606
	.byte 0x04
	.4byte ..___tag_value_main.60-..___tag_value_main.58
	.8byte 0x1c380e031010060c
	.8byte 0x880d1affffff800d
	.8byte 0x0c10028622ffffff
	.8byte 0xffffff800d1c380e
	.8byte 0x1022ffffff800d1a
	.8byte 0xffff800d1c380e0d
	.8byte 0x22ffffff780d1aff
	.8byte 0xff800d1c380e0e10
	.8byte 0xffffff700d1affff
	.8byte 0x800d1c380e0f1022
	.8byte 0xffff080d1affffff
	.2byte 0x22ff
	.byte 0x00
	.section .text
.LNDBG_TXe:
# End
