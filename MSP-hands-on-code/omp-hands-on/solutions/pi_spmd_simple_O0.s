	.section .text
.LNDBG_TX:
# -- Machine type EFI2
# mark_description "Intel(R) C Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 12.0.4.191 Build 2011042";
# mark_description "7";
# mark_description "-O0 -openmp -g -S";
	.file "pi_spmd_simple.c"
	.bss
	.align 4
	.align 4
___kmpv_zeromain_0:
	.type	___kmpv_zeromain_0,@object
	.size	___kmpv_zeromain_0,4
	.space 4	# pad
	.data
	.align 8
	.align 8
num_steps:
	.long	0x05f5e100,0x00000000
	.type	num_steps,@object
	.size	num_steps,8
	.section .rodata, "a"
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
	.space 2	# pad
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
	.text
..TXTST0:
# -- Begin  main, L_main_62__par_region0_2.27
# mark_begin;
       .align    2,0x90
	.globl main
main:
..B1.1:                         # Preds ..B1.0
..___tag_value_main.2:                                          #
..LN0:
  .file   1 "pi_spmd_simple.c"
   .loc    1  47  is_stmt 1
        pushq     %rbp                                          #47.1
..LN1:
        movq      %rsp, %rbp                                    #47.1
..___tag_value_main.4:                                          #
..LN2:
        subq      $288, %rsp                                    #47.1
..LN3:
        movq      %r15, -64(%rbp)                               #47.1
..___tag_value_main.7:                                          #
..LN4:
        movq      %r14, -72(%rbp)                               #47.1
..___tag_value_main.9:                                          #
..LN5:
        movq      %r13, -80(%rbp)                               #47.1
..___tag_value_main.11:                                         #
..LN6:
        movq      %r12, -88(%rbp)                               #47.1
..___tag_value_main.13:                                         #
..LN7:
        movq      %rbx, -96(%rbp)                               #47.1
..___tag_value_main.15:                                         #
..LN8:
        movl      $.2.1_2_kmpc_loc_struct_pack.1, %eax          #47.1
..LN9:
        movl      $0, %edx                                      #47.1
..LN10:
        movq      %rax, %rdi                                    #47.1
..LN11:
        movq      %rdx, %rsi                                    #47.1
..LN12:
        movl      $0, %eax                                      #47.1
..LN13:
        call      __kmpc_begin                                  #47.1
..___tag_value_main.17:                                         #
..LN14:
                                # LOE
..B1.2:                         # Preds ..B1.1
..LN15:
        movl      $.2.1_2_kmpc_loc_struct_pack.12, %eax         #47.1
..LN16:
        movq      %rax, %rdi                                    #47.1
..LN17:
        movl      $0, %eax                                      #47.1
..LN18:
        call      __kmpc_global_thread_num                      #47.1
..LN19:
                                # LOE eax
..B1.27:                        # Preds ..B1.2
..LN20:
        movl      %eax, -44(%rbp)                               #47.1
..LN21:
        movl      -44(%rbp), %eax                               #47.1
..LN22:
        movl      %eax, -40(%rbp)                               #47.1
..LN23:
   .loc    1  49  is_stmt 1
        pxor      %xmm0, %xmm0                                  #49.24
..LN24:
        movsd     %xmm0, -160(%rbp)                             #49.24
..LN25:
   .loc    1  53  is_stmt 1
        movsd     .L_2il0floatpacket.49(%rip), %xmm0            #53.4
..LN26:
        movq      num_steps(%rip), %rax                         #53.24
..LN27:
        cvtsi2sdq %rax, %xmm1                                   #53.24
..LN28:
..LN29:
        divsd     %xmm1, %xmm0                                  #53.24
..LN30:
        movsd     %xmm0, step(%rip)                             #53.4
..LN31:
   .loc    1  56  is_stmt 1
        movl      $1, -36(%rbp)                                 #56.9
..LN32:
        movl      -36(%rbp), %eax                               #56.13
..LN33:
        cmpl      $12, %eax                                     #56.16
..LN34:
        jg        ..B1.16       # Prob 50%                      #56.16
..LN35:
                                # LOE
..B1.3:                         # Preds ..B1.15 ..B1.27
..LN36:
   .loc    1  58  is_stmt 1
        movl      -36(%rbp), %eax                               #58.27
..LN37:
        movl      %eax, %edi                                    #58.7
..LN38:
        call      ompc_set_num_threads                          #58.7
..LN39:
                                # LOE
..B1.4:                         # Preds ..B1.3
..LN40:
   .loc    1  59  is_stmt 1
        pxor      %xmm0, %xmm0                                  #59.7
..LN41:
        movsd     %xmm0, -160(%rbp)                             #59.7
..LN42:
   .loc    1  60  is_stmt 1
        call      omp_get_wtime                                 #60.20
..LN43:
                                # LOE xmm0
..B1.28:                        # Preds ..B1.4
..LN44:
        movsd     %xmm0, -152(%rbp)                             #60.20
..LN45:
                                # LOE
..B1.5:                         # Preds ..B1.28
..LN46:
        movsd     -152(%rbp), %xmm0                             #60.20
..LN47:
        movsd     %xmm0, -128(%rbp)                             #60.7
..LN48:
   .loc    1  62  is_stmt 1
        movl      $.2.1_2_kmpc_loc_struct_pack.29, %eax         #62.7
..LN49:
        movq      %rax, %rdi                                    #62.7
..LN50:
        movl      $0, %eax                                      #62.7
..LN51:
        call      __kmpc_ok_to_fork                             #62.7
..LN52:
                                # LOE eax
..B1.29:                        # Preds ..B1.5
..LN53:
        movl      %eax, -24(%rbp)                               #62.7
..LN54:
                                # LOE
..B1.6:                         # Preds ..B1.29
..LN55:
        movl      -24(%rbp), %eax                               #62.7
..LN56:
        testl     %eax, %eax                                    #62.7
..LN57:
        jne       ..B1.10       # Prob 50%                      #62.7
..LN58:
                                # LOE
..B1.7:                         # Preds ..B1.6
..LN59:
        movl      $.2.1_2_kmpc_loc_struct_pack.29, %eax         #62.7
..LN60:
        movl      -40(%rbp), %edx                               #62.7
..LN61:
        movq      %rax, %rdi                                    #62.7
..LN62:
        movl      %edx, %esi                                    #62.7
..LN63:
        movl      $0, %eax                                      #62.7
..LN64:
        call      __kmpc_serialized_parallel                    #62.7
..LN65:
                                # LOE
..B1.8:                         # Preds ..B1.7
..LN66:
        lea       -40(%rbp), %rax                               #62.7
..LN67:
        movl      $___kmpv_zeromain_0, %edx                     #62.7
..LN68:
        lea       -288(%rbp), %rcx                              #62.7
..LN69:
        movq      %rax, %rdi                                    #62.7
..LN70:
        movq      %rdx, %rsi                                    #62.7
..LN71:
        movq      %rcx, %rdx                                    #62.7
..LN72:
        call      L_main_62__par_region0_2.27                   #62.7
..LN73:
                                # LOE
..B1.9:                         # Preds ..B1.8
..LN74:
        movl      $.2.1_2_kmpc_loc_struct_pack.29, %eax         #62.7
..LN75:
        movl      -40(%rbp), %edx                               #62.7
..LN76:
        movq      %rax, %rdi                                    #62.7
..LN77:
        movl      %edx, %esi                                    #62.7
..LN78:
        movl      $0, %eax                                      #62.7
..LN79:
        call      __kmpc_end_serialized_parallel                #62.7
..LN80:
        jmp       ..B1.11       # Prob 100%                     #62.7
..LN81:
                                # LOE
..B1.10:                        # Preds ..B1.6
..LN82:
        movl      $.2.1_2_kmpc_loc_struct_pack.29, %eax         #62.7
..LN83:
        movl      $1, %edx                                      #62.7
..LN84:
        movl      $L_main_62__par_region0_2.27, %ecx            #62.7
..LN85:
        lea       -288(%rbp), %rbx                              #62.7
..LN86:
        movq      %rax, %rdi                                    #62.7
..LN87:
        movl      %edx, %esi                                    #62.7
..LN88:
        movq      %rcx, %rdx                                    #62.7
..LN89:
        movq      %rbx, %rcx                                    #62.7
..LN90:
        movl      $0, %eax                                      #62.7
..LN91:
        call      __kmpc_fork_call                              #62.7
..LN92:
                                # LOE
..B1.11:                        # Preds ..B1.10 ..B1.9
..LN93:
   .loc    1  82  is_stmt 1
        pxor      %xmm0, %xmm0                                  #82.6
..LN94:
        movsd     %xmm0, -160(%rbp)                             #82.6
..LN95:
        movl      $0, -20(%rbp)                                 #82.22
..LN96:
        movl      -20(%rbp), %eax                               #82.26
..LN97:
        movl      -36(%rbp), %edx                               #82.28
..LN98:
        cmpl      %edx, %eax                                    #82.28
..LN99:
        jge       ..B1.13       # Prob 50%                      #82.28
..LN100:
                                # LOE
..B1.12:                        # Preds ..B1.12 ..B1.11
..LN101:
   .loc    1  83  is_stmt 1
        lea       -288(%rbp), %rax                              #83.18
..LN102:
        movslq    -20(%rbp), %rdx                               #83.22
..LN103:
        imulq     $8, %rdx, %rdx                                #83.18
..LN104:
        addq      %rdx, %rax                                    #83.6
..LN105:
        movsd     -160(%rbp), %xmm0                             #83.6
..LN106:
        movsd     (%rax), %xmm1                                 #83.18
..LN107:
        addsd     %xmm1, %xmm0                                  #83.6
..LN108:
        movsd     %xmm0, -160(%rbp)                             #83.6
..LN109:
   .loc    1  82  is_stmt 1
        movl      $1, %eax                                      #82.30
..LN110:
        addl      -20(%rbp), %eax                               #82.30
..LN111:
        movl      %eax, -20(%rbp)                               #82.30
..LN112:
        movl      -20(%rbp), %eax                               #82.26
..LN113:
        movl      -36(%rbp), %edx                               #82.28
..LN114:
        cmpl      %edx, %eax                                    #82.28
..LN115:
        jl        ..B1.12       # Prob 50%                      #82.28
..LN116:
                                # LOE
..B1.13:                        # Preds ..B1.12 ..B1.11
..LN117:
   .loc    1  85  is_stmt 1
        movsd     step(%rip), %xmm0                             #85.12
..LN118:
        movsd     -160(%rbp), %xmm1                             #85.19
..LN119:
        mulsd     %xmm1, %xmm0                                  #85.19
..LN120:
        movsd     %xmm0, -120(%rbp)                             #85.7
..LN121:
   .loc    1  86  is_stmt 1
        call      omp_get_wtime                                 #86.18
..LN122:
                                # LOE xmm0
..B1.30:                        # Preds ..B1.13
..LN123:
        movsd     %xmm0, -112(%rbp)                             #86.18
..LN124:
                                # LOE
..B1.14:                        # Preds ..B1.30
..LN125:
        movsd     -112(%rbp), %xmm0                             #86.18
..LN126:
        movsd     -128(%rbp), %xmm1                             #86.36
..LN127:
        subsd     %xmm1, %xmm0                                  #86.36
..LN128:
        movsd     %xmm0, -104(%rbp)                             #86.7
..LN129:
   .loc    1  87  is_stmt 1
        movl      $.L_2__STRING.1, %eax                         #87.14
..LN130:
        movsd     -120(%rbp), %xmm0                             #87.54
..LN131:
        movsd     -104(%rbp), %xmm1                             #87.57
..LN132:
        movl      -36(%rbp), %edx                               #87.66
..LN133:
        movq      %rax, %rdi                                    #87.7
..LN134:
        movl      %edx, %esi                                    #87.7
..LN135:
        movl      $2, %eax                                      #87.7
..LN136:
        call      printf                                        #87.7
..LN137:
                                # LOE eax
..B1.31:                        # Preds ..B1.14
..LN138:
        movl      %eax, -16(%rbp)                               #87.66
..LN139:
                                # LOE
..B1.15:                        # Preds ..B1.31
..LN140:
   .loc    1  56  is_stmt 1
        movl      $1, %eax                                      #56.29
..LN141:
        addl      -36(%rbp), %eax                               #56.29
..LN142:
        movl      %eax, -36(%rbp)                               #56.29
..LN143:
        movl      -36(%rbp), %eax                               #56.13
..LN144:
        cmpl      $12, %eax                                     #56.16
..LN145:
        jle       ..B1.3        # Prob 50%                      #56.16
..LN146:
                                # LOE
..B1.16:                        # Preds ..B1.15 ..B1.27
..LN147:
   .loc    1  89  is_stmt 1
        movl      $.2.1_2_kmpc_loc_struct_pack.20, %eax         #89.1
..LN148:
        movq      %rax, %rdi                                    #89.1
..LN149:
        movl      $0, %eax                                      #89.1
..LN150:
        call      __kmpc_end                                    #89.1
..LN151:
                                # LOE
..B1.17:                        # Preds ..B1.16
..LN152:
        movl      $0, %eax                                      #89.1
..LN153:
        movq      -96(%rbp), %rbx                               #89.1
..___tag_value_main.22:                                         #
..LN154:
        movq      -88(%rbp), %r12                               #89.1
..___tag_value_main.23:                                         #
..LN155:
        movq      -80(%rbp), %r13                               #89.1
..___tag_value_main.24:                                         #
..LN156:
        movq      -72(%rbp), %r14                               #89.1
..___tag_value_main.25:                                         #
..LN157:
        movq      -64(%rbp), %r15                               #89.1
..___tag_value_main.26:                                         #
..LN158:
        leave                                                   #89.1
..___tag_value_main.28:                                         #
..LN159:
        ret                                                     #89.1
..___tag_value_main.29:                                         #
..LN160:
                                # LOE
..B1.18:                        # Preds ..B1.24 ..B1.23
..LN161:
   .loc    1  62  is_stmt 1
        movl      $0, %eax                                      #62.7
..LN162:
        movq      -96(%rbp), %rbx                               #62.7
..___tag_value_main.35:                                         #
..LN163:
        movq      -88(%rbp), %r12                               #62.7
..___tag_value_main.36:                                         #
..LN164:
        movq      -80(%rbp), %r13                               #62.7
..___tag_value_main.37:                                         #
..LN165:
        movq      -72(%rbp), %r14                               #62.7
..___tag_value_main.38:                                         #
..LN166:
        movq      -64(%rbp), %r15                               #62.7
..___tag_value_main.39:                                         #
..LN167:
        leave                                                   #62.7
..___tag_value_main.41:                                         #
..LN168:
        ret                                                     #62.7
..LN169:
                                # LOE
L_main_62__par_region0_2.27:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
..B1.19:                        # Preds ..B1.0
..LN170:
        pushq     %rbp                                          #62.7
..LN171:
        movq      %rsp, %rbp                                    #62.7
..___tag_value_main.43:                                         #
..LN172:
        subq      $288, %rsp                                    #62.7
..LN173:
        movq      %r15, -64(%rbp)                               #62.7
..___tag_value_main.46:                                         #
..LN174:
        movq      %r14, -72(%rbp)                               #62.7
..___tag_value_main.48:                                         #
..LN175:
        movq      %r13, -80(%rbp)                               #62.7
..___tag_value_main.50:                                         #
..LN176:
        movq      %r12, -88(%rbp)                               #62.7
..___tag_value_main.52:                                         #
..LN177:
        movq      %rbx, -96(%rbp)                               #62.7
..___tag_value_main.54:                                         #
..LN178:
        movq      %rdi, -184(%rbp)                              #62.7
..LN179:
        movq      %rsi, -176(%rbp)                              #62.7
..LN180:
        movq      %rdx, -168(%rbp)                              #62.7
..LN181:
   .loc    1  65  is_stmt 1
        call      omp_get_thread_num                            #65.13
..___tag_value_main.56:                                         #
..LN182:
                                # LOE eax
..B1.32:                        # Preds ..B1.19
..LN183:
        movl      %eax, -56(%rbp)                               #65.13
..LN184:
                                # LOE
..B1.20:                        # Preds ..B1.32
..LN185:
        movl      -56(%rbp), %eax                               #65.13
..LN186:
        movl      %eax, -52(%rbp)                               #65.11
..LN187:
   .loc    1  66  is_stmt 1
        call      omp_get_num_threads                           #66.21
..LN188:
                                # LOE eax
..B1.33:                        # Preds ..B1.20
..LN189:
        movl      %eax, -48(%rbp)                               #66.21
..LN190:
                                # LOE
..B1.21:                        # Preds ..B1.33
..LN191:
        movl      -48(%rbp), %eax                               #66.21
..LN192:
        movl      %eax, -32(%rbp)                               #66.19
..LN193:
   .loc    1  69  is_stmt 1
        pxor      %xmm0, %xmm0                                  #69.4
..LN194:
        movslq    -52(%rbp), %rax                               #69.8
..LN195:
        imulq     $8, %rax, %rax                                #69.4
..LN196:
        addq      -168(%rbp), %rax                              #69.4
..LN197:
        movsd     %xmm0, (%rax)                                 #69.4
..LN198:
   .loc    1  71  is_stmt 1
        movl      -52(%rbp), %eax                               #71.13
..LN199:
        testl     %eax, %eax                                    #71.19
..LN200:
        jne       ..B1.23       # Prob 50%                      #71.19
..LN201:
                                # LOE
..B1.22:                        # Preds ..B1.21
..LN202:
   .loc    1  72  is_stmt 1
        movl      $.L_2__STRING.0, %eax                         #72.21
..LN203:
        movl      -32(%rbp), %edx                               #72.41
..LN204:
        movq      %rax, %rdi                                    #72.14
..LN205:
        movl      %edx, %esi                                    #72.14
..LN206:
        movl      $0, %eax                                      #72.14
..LN207:
        call      printf                                        #72.14
..LN208:
                                # LOE eax
..B1.34:                        # Preds ..B1.22
..LN209:
        movl      %eax, -192(%rbp)                              #72.41
..LN210:
                                # LOE
..B1.23:                        # Preds ..B1.34 ..B1.21
..LN211:
   .loc    1  74  is_stmt 1
        movl      -52(%rbp), %eax                               #74.11
..LN212:
        movl      %eax, -28(%rbp)                               #74.9
..LN213:
        movslq    -28(%rbp), %rax                               #74.14
..LN214:
        movq      num_steps(%rip), %rdx                         #74.17
..LN215:
        cmpq      %rdx, %rax                                    #74.17
..LN216:
        jge       ..B1.18       # Prob 50%                      #74.17
..LN217:
                                # LOE
..B1.24:                        # Preds ..B1.24 ..B1.23
..LN218:
   .loc    1  76  is_stmt 1
        movl      -28(%rbp), %eax                               #76.10
..LN219:
        cvtsi2sd  %eax, %xmm0                                   #76.10
..LN220:
..LN221:
        movsd     .L_2il0floatpacket.47(%rip), %xmm1            #76.12
..LN222:
        addsd     %xmm1, %xmm0                                  #76.12
..LN223:
        movsd     step(%rip), %xmm1                             #76.17
..LN224:
        mulsd     %xmm1, %xmm0                                  #76.17
..LN225:
        movsd     %xmm0, -144(%rbp)                             #76.5
..LN226:
   .loc    1  77  is_stmt 1
        movsd     .L_2il0floatpacket.48(%rip), %xmm0            #77.9
..LN227:
        movsd     -144(%rbp), %xmm1                             #77.18
..LN228:
        movsd     -144(%rbp), %xmm2                             #77.20
..LN229:
        mulsd     %xmm2, %xmm1                                  #77.20
..LN230:
        movsd     .L_2il0floatpacket.49(%rip), %xmm2            #77.5
..LN231:
        addsd     %xmm2, %xmm1                                  #77.20
..LN232:
        divsd     %xmm1, %xmm0                                  #77.20
..LN233:
        movsd     %xmm0, -136(%rbp)                             #77.5
..LN234:
   .loc    1  78  is_stmt 1
        movslq    -52(%rbp), %rax                               #78.19
..LN235:
        imulq     $8, %rax, %rax                                #78.15
..LN236:
        addq      -168(%rbp), %rax                              #78.5
..LN237:
        movsd     (%rax), %xmm0                                 #78.15
..LN238:
        movsd     -136(%rbp), %xmm1                             #78.25
..LN239:
        addsd     %xmm1, %xmm0                                  #78.25
..LN240:
        movslq    -52(%rbp), %rax                               #78.9
..LN241:
        imulq     $8, %rax, %rax                                #78.5
..LN242:
        addq      -168(%rbp), %rax                              #78.5
..LN243:
        movsd     %xmm0, (%rax)                                 #78.5
..LN244:
   .loc    1  74  is_stmt 1
        movl      -32(%rbp), %eax                               #74.31
..LN245:
        addl      -28(%rbp), %eax                               #74.28
..LN246:
        movl      %eax, -28(%rbp)                               #74.28
..LN247:
        movslq    -28(%rbp), %rax                               #74.14
..LN248:
        movq      num_steps(%rip), %rdx                         #74.17
..LN249:
        cmpq      %rdx, %rax                                    #74.17
..LN250:
        jl        ..B1.24       # Prob 50%                      #74.17
..LN251:
        jmp       ..B1.18       # Prob 100%                     #74.17
        .align    2,0x90
..___tag_value_main.62:                                         #
..LN252:
                                # LOE
..LN253:
# mark_end;
	.type	main,@function
	.size	main,.-main
..LNmain.254:
.LNmain:
	.section .gcc_except_table, "a"
	.align 4
main$$LSDA:
	.byte	255
	.byte	0
	.uleb128	..___tag_value_main.66 - ..___tag_value_main.65
..___tag_value_main.65:
	.byte	1
	.uleb128	..___tag_value_main.64 - ..___tag_value_main.63
..___tag_value_main.63:
..___tag_value_main.64:
	.long	0x00000000,0x00000000
..___tag_value_main.66:
	.data
	.align 4
.2.1_2_kmpc_loc_struct_pack.1:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.1_2__kmpc_loc_pack.0
	.align 4
.2.1_2__kmpc_loc_pack.0:
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
.2.1_2_kmpc_loc_struct_pack.12:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.1_2__kmpc_loc_pack.11
	.align 4
.2.1_2__kmpc_loc_pack.11:
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
.2.1_2_kmpc_loc_struct_pack.29:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.1_2__kmpc_loc_pack.28
	.align 4
.2.1_2__kmpc_loc_pack.28:
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
.2.1_2_kmpc_loc_struct_pack.20:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.1_2__kmpc_loc_pack.19
	.align 4
.2.1_2__kmpc_loc_pack.19:
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
	.section .rodata, "a"
	.align 8
.L_2il0floatpacket.47:
	.long	0x00000000,0x3fe00000
	.type	.L_2il0floatpacket.47,@object
	.size	.L_2il0floatpacket.47,8
	.align 8
.L_2il0floatpacket.48:
	.long	0x00000000,0x40100000
	.type	.L_2il0floatpacket.48,@object
	.size	.L_2il0floatpacket.48,8
	.align 8
.L_2il0floatpacket.49:
	.long	0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.49,@object
	.size	.L_2il0floatpacket.49,8
	.data
	.comm step,8,8
# mark_proc_addr_taken L_main_62__par_region0_2.27;
	.section .note.GNU-stack, ""
	.global step#
// -- Begin DWARF2 SEGMENT .debug_info
	.section .debug_info
.debug_info_seg:
	.align 1
	.4byte 0x000002da
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
//	DW_AT_low_pc:
	.8byte main
//	DW_AT_high_pc:
	.8byte ..LNmain.254
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
//	DW_AT_location:
	.2byte 0x7602
	.byte 0x6c
//	DW_TAG_variable:
	.byte 0x04
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
	.2byte 0x7602
	.byte 0x5c
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
	.4byte 0x00000289
//	DW_AT_location:
	.4byte 0x7f887603
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
	.4byte 0x00000289
//	DW_AT_location:
	.4byte 0x7ee07603
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
	.4byte 0x00000289
//	DW_AT_location:
	.4byte 0x7f807603
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
	.4byte 0x00000289
//	DW_AT_location:
	.4byte 0x7f987603
//	DW_TAG_variable:
	.byte 0x04
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
	.4byte 0x00000293
//	DW_AT_location:
	.4byte 0x7de07603
//	DW_TAG_lexical_block:
	.byte 0x05
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
//	DW_AT_location:
	.4byte 0x7de07603
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
//	DW_AT_location:
	.4byte 0x7de07603
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
//	DW_AT_location:
	.4byte 0x7de07603
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
	.4byte 0x00000289
//	DW_AT_location:
	.4byte 0x7de07603
//	DW_TAG_lexical_block:
	.byte 0x05
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
	.4byte 0x00000289
//	DW_AT_location:
	.4byte 0x7de07603
	.byte 0x00
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x06
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
	.8byte ..LNmain.254
//	DW_AT_external:
	.byte 0x00
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
	.4byte 0x006d7573
//	DW_AT_type:
	.4byte 0x00000293
//	DW_AT_location:
	.4byte 0x7ed87604
	.byte 0x06
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
	.2byte 0x0069
//	DW_AT_type:
	.4byte 0x000000e1
//	DW_AT_location:
	.2byte 0x7602
	.byte 0x64
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
	.2byte 0x6469
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000e1
//	DW_AT_location:
	.2byte 0x7602
	.byte 0x4c
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
	.8byte 0x61657268746d756e
	.2byte 0x7364
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000e1
//	DW_AT_location:
	.2byte 0x7602
	.byte 0x60
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
	.2byte 0x0078
//	DW_AT_type:
	.4byte 0x00000289
//	DW_AT_location:
	.4byte 0x7ef07603
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
	.4byte 0x00000289
//	DW_AT_location:
	.4byte 0x7ef87603
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
	.byte 0x07
//	DW_AT_type:
	.4byte 0x00000289
//	DW_AT_byte_size:
	.byte 0x60
//	DW_TAG_subrange_type:
	.byte 0x08
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
	.4byte 0x000002b9
//	DW_AT_location:
	.2byte 0x0309
	.8byte num_steps
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
	.byte 0x09
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
	.4byte 0x00000289
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
	.byte 0x02
	.byte 0x0a
	.2byte 0x0000
	.byte 0x05
	.byte 0x0b
	.byte 0x01
	.byte 0x3b
	.byte 0x0b
	.byte 0x39
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.2byte 0x0000
	.byte 0x06
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
	.byte 0x07
	.byte 0x01
	.byte 0x01
	.byte 0x49
	.byte 0x13
	.byte 0x0b
	.byte 0x0b
	.2byte 0x0000
	.byte 0x08
	.byte 0x21
	.byte 0x00
	.byte 0x2f
	.byte 0x0b
	.2byte 0x0000
	.byte 0x09
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
	.4byte 0x0000011c
	.4byte .debug_frame_seg
	.8byte ..___tag_value_main.2
	.8byte ..___tag_value_main.62-..___tag_value_main.2
	.byte 0x04
	.4byte ..___tag_value_main.4-..___tag_value_main.2
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_main.7-..___tag_value_main.4
	.4byte 0x0f090a8f
	.2byte 0x040f
	.4byte ..___tag_value_main.9-..___tag_value_main.7
	.4byte 0x0e090b8e
	.2byte 0x040e
	.4byte ..___tag_value_main.11-..___tag_value_main.9
	.4byte 0x0d090c8d
	.2byte 0x040d
	.4byte ..___tag_value_main.13-..___tag_value_main.11
	.4byte 0x0c090d8c
	.2byte 0x040c
	.4byte ..___tag_value_main.15-..___tag_value_main.13
	.4byte 0x03090e83
	.2byte 0x0403
	.4byte ..___tag_value_main.17-..___tag_value_main.15
	.8byte 0x0b8e0c8d0d8c0e83
	.2byte 0x0a8f
	.byte 0x04
	.4byte ..___tag_value_main.22-..___tag_value_main.17
	.4byte 0x04030309
	.4byte ..___tag_value_main.23-..___tag_value_main.22
	.4byte 0x040c0c09
	.4byte ..___tag_value_main.24-..___tag_value_main.23
	.4byte 0x040d0d09
	.4byte ..___tag_value_main.25-..___tag_value_main.24
	.4byte 0x040e0e09
	.4byte ..___tag_value_main.26-..___tag_value_main.25
	.4byte 0x040f0f09
	.4byte ..___tag_value_main.28-..___tag_value_main.26
	.4byte 0x04060609
	.4byte ..___tag_value_main.29-..___tag_value_main.28
	.8byte 0x0c8d0d8c02860e83
	.4byte 0x0a8f0b8e
	.byte 0x04
	.4byte ..___tag_value_main.35-..___tag_value_main.29
	.4byte 0x04030309
	.4byte ..___tag_value_main.36-..___tag_value_main.35
	.4byte 0x040c0c09
	.4byte ..___tag_value_main.37-..___tag_value_main.36
	.4byte 0x040d0d09
	.4byte ..___tag_value_main.38-..___tag_value_main.37
	.4byte 0x040e0e09
	.4byte ..___tag_value_main.39-..___tag_value_main.38
	.4byte 0x040f0f09
	.4byte ..___tag_value_main.41-..___tag_value_main.39
	.4byte 0x04060609
	.4byte ..___tag_value_main.43-..___tag_value_main.41
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_main.46-..___tag_value_main.43
	.4byte 0x0f090a8f
	.2byte 0x040f
	.4byte ..___tag_value_main.48-..___tag_value_main.46
	.4byte 0x0e090b8e
	.2byte 0x040e
	.4byte ..___tag_value_main.50-..___tag_value_main.48
	.4byte 0x0d090c8d
	.2byte 0x040d
	.4byte ..___tag_value_main.52-..___tag_value_main.50
	.4byte 0x0c090d8c
	.2byte 0x040c
	.4byte ..___tag_value_main.54-..___tag_value_main.52
	.4byte 0x03090e83
	.2byte 0x0403
	.4byte ..___tag_value_main.56-..___tag_value_main.54
	.8byte 0x0b8e0c8d0d8c0e83
	.2byte 0x0a8f
	.byte 0x00
// -- Begin DWARF2 SEGMENT .eh_frame
	.section .eh_frame,"a",@progbits
.eh_frame_seg:
	.align 8
	.4byte 0x00000014
	.8byte 0x7801000100000000
	.8byte 0x0000019008070c10
	.4byte 0x00000000
	.4byte 0x0000011c
	.4byte 0x0000001c
	.8byte ..___tag_value_main.2
	.8byte ..___tag_value_main.62-..___tag_value_main.2
	.byte 0x04
	.4byte ..___tag_value_main.4-..___tag_value_main.2
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_main.7-..___tag_value_main.4
	.4byte 0x0f090a8f
	.2byte 0x040f
	.4byte ..___tag_value_main.9-..___tag_value_main.7
	.4byte 0x0e090b8e
	.2byte 0x040e
	.4byte ..___tag_value_main.11-..___tag_value_main.9
	.4byte 0x0d090c8d
	.2byte 0x040d
	.4byte ..___tag_value_main.13-..___tag_value_main.11
	.4byte 0x0c090d8c
	.2byte 0x040c
	.4byte ..___tag_value_main.15-..___tag_value_main.13
	.4byte 0x03090e83
	.2byte 0x0403
	.4byte ..___tag_value_main.17-..___tag_value_main.15
	.8byte 0x0b8e0c8d0d8c0e83
	.2byte 0x0a8f
	.byte 0x04
	.4byte ..___tag_value_main.22-..___tag_value_main.17
	.4byte 0x04030309
	.4byte ..___tag_value_main.23-..___tag_value_main.22
	.4byte 0x040c0c09
	.4byte ..___tag_value_main.24-..___tag_value_main.23
	.4byte 0x040d0d09
	.4byte ..___tag_value_main.25-..___tag_value_main.24
	.4byte 0x040e0e09
	.4byte ..___tag_value_main.26-..___tag_value_main.25
	.4byte 0x040f0f09
	.4byte ..___tag_value_main.28-..___tag_value_main.26
	.4byte 0x04060609
	.4byte ..___tag_value_main.29-..___tag_value_main.28
	.8byte 0x0c8d0d8c02860e83
	.4byte 0x0a8f0b8e
	.byte 0x04
	.4byte ..___tag_value_main.35-..___tag_value_main.29
	.4byte 0x04030309
	.4byte ..___tag_value_main.36-..___tag_value_main.35
	.4byte 0x040c0c09
	.4byte ..___tag_value_main.37-..___tag_value_main.36
	.4byte 0x040d0d09
	.4byte ..___tag_value_main.38-..___tag_value_main.37
	.4byte 0x040e0e09
	.4byte ..___tag_value_main.39-..___tag_value_main.38
	.4byte 0x040f0f09
	.4byte ..___tag_value_main.41-..___tag_value_main.39
	.4byte 0x04060609
	.4byte ..___tag_value_main.43-..___tag_value_main.41
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_main.46-..___tag_value_main.43
	.4byte 0x0f090a8f
	.2byte 0x040f
	.4byte ..___tag_value_main.48-..___tag_value_main.46
	.4byte 0x0e090b8e
	.2byte 0x040e
	.4byte ..___tag_value_main.50-..___tag_value_main.48
	.4byte 0x0d090c8d
	.2byte 0x040d
	.4byte ..___tag_value_main.52-..___tag_value_main.50
	.4byte 0x0c090d8c
	.2byte 0x040c
	.4byte ..___tag_value_main.54-..___tag_value_main.52
	.4byte 0x03090e83
	.2byte 0x0403
	.4byte ..___tag_value_main.56-..___tag_value_main.54
	.8byte 0x0b8e0c8d0d8c0e83
	.2byte 0x0a8f
	.byte 0x00
	.section .text
.LNDBG_TXe:
# End
