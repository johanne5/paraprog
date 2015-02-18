	.section .text
.LNDBG_TX:
# -- Machine type EFI2
# mark_description "Intel(R) C Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 12.0.4.191 Build 2011042";
# mark_description "7";
# mark_description "-openmp -O -g -S";
	.file "forces.c"
	.text
..TXTST0:
# -- Begin  forces, L_forces_102__tree_reduce1_2.120
# mark_begin;
       .align    16,0x90
	.globl forces
forces:
# parameter 1(npart): %edi
# parameter 2(x): %rsi
# parameter 3(f): %rdx
# parameter 4(side): %xmm0
# parameter 5(rcoff): %xmm1
..B1.1:                         # Preds ..B1.0
..___tag_value_forces.2:                                        #
..LN0:
  .file   1 "forces.c"
   .loc    1  8  is_stmt 1
        subq      $264, %rsp                                    #8.71
..___tag_value_forces.4:                                        #
..LN1:
   .loc    1  11  is_stmt 1
        xorl      %eax, %eax                                    #11.1
..LN2:
   .loc    1  8  is_stmt 1
        movq      %rbx, 112(%rsp)                               #8.71
..___tag_value_forces.6:                                        #
..LN3:
        movl      %edi, %ebx                                    #8.71
..LN4:
   .loc    1  11  is_stmt 1
        movl      $.2.3_2_kmpc_loc_struct_pack.12, %edi         #11.1
..LN5:
   .loc    1  8  is_stmt 1
        movq      %rbp, 120(%rsp)                               #8.71
..___tag_value_forces.8:                                        #
..LN6:
        movq      %r15, 80(%rsp)                                #8.71
..___tag_value_forces.10:                                       #
..LN7:
        movq      %rdx, %r15                                    #8.71
..LN8:
        movq      %r14, 88(%rsp)                                #8.71
..___tag_value_forces.12:                                       #
..LN9:
        movq      %r13, 96(%rsp)                                #8.71
..___tag_value_forces.14:                                       #
..LN10:
        movq      %rsi, %r13                                    #8.71
..LN11:
        movq      %r12, 104(%rsp)                               #8.71
..___tag_value_forces.16:                                       #
..LN12:
        movsd     %xmm1, 248(%rsp)                              #8.71
..LN13:
        movsd     %xmm0, 256(%rsp)                              #8.71
..LN14:
   .loc    1  11  is_stmt 1
        call      __kmpc_global_thread_num                      #11.1
..___tag_value_forces.18:                                       #
..LN15:
                                # LOE r13 r15 eax ebx
..B1.35:                        # Preds ..B1.1
..LN16:
        movl      %eax, %ebp                                    #11.1
..LN17:
        movl      $.2.3_2_kmpc_loc_struct_pack.60, %r12d        #11.1
..LN18:
        movq      %r12, %rdi                                    #11.1
..LN19:
        movl      %ebp, %esi                                    #11.1
..LN20:
        xorl      %eax, %eax                                    #11.1
..LN21:
        call      __kmpc_single                                 #11.1
..LN22:
                                # LOE r12 r13 r15 eax ebx ebp
..B1.2:                         # Preds ..B1.35
..LN23:
        cmpl      $1, %eax                                      #11.1
..LN24:
        jne       ..B1.4        # Prob 50%                      #11.1
..LN25:
                                # LOE r12 r13 r15 ebx ebp
..B1.3:                         # Preds ..B1.2
..LN26:
        movq      %r12, %rdi                                    #11.1
..LN27:
        movl      %ebp, %esi                                    #11.1
..LN28:
        xorl      %eax, %eax                                    #11.1
..LN29:
   .loc    1  13  is_stmt 1
        xorl      %edx, %edx                                    #13.5
..LN30:
        movq      %rdx, vir(%rip)                               #13.5
..LN31:
   .loc    1  14  is_stmt 1
        movq      %rdx, epot(%rip)                              #14.5
..LN32:
   .loc    1  11  is_stmt 1
        call      __kmpc_end_single                             #11.1
..LN33:
                                # LOE r13 r15 ebx ebp
..B1.4:                         # Preds ..B1.3 ..B1.2
..LN34:
        movl      $.2.3_2_kmpc_loc_struct_pack.68, %edi         #11.1
..LN35:
        movl      %ebp, %esi                                    #11.1
..LN36:
        xorl      %eax, %eax                                    #11.1
..LN37:
        call      __kmpc_barrier                                #11.1
..LN38:
                                # LOE r13 r15 ebx ebp
..B1.5:                         # Preds ..B1.4
..LN39:
   .loc    1  18  is_stmt 1
        lea       (%rbx,%rbx,2), %r12d                          #18.23
..LN40:
        testl     %r12d, %r12d                                  #18.23
..LN41:
        jle       ..B1.10       # Prob 10%                      #18.23
..LN42:
                                # LOE r13 r15 ebx ebp r12d
..B1.6:                         # Preds ..B1.5
..LN43:
   .loc    1  17  is_stmt 1
        xorl      %r10d, %r10d                                  #17.1
..LN44:
        movl      $.2.3_2_kmpc_loc_struct_pack.76, %edi         #17.1
..LN45:
        movl      %ebp, %esi                                    #17.1
..LN46:
        movl      $33, %edx                                     #17.1
..LN47:
        xorl      %eax, %eax                                    #17.1
..LN48:
        lea       176(%rsp), %rcx                               #17.1
..LN49:
        movl      $3, %r14d                                     #17.1
..LN50:
        lea       168(%rsp), %r8                                #17.1
..LN51:
        decl      %r12d                                         #17.1
..LN52:
        lea       172(%rsp), %r9                                #17.1
..LN53:
        movl      %r10d, 168(%rsp)                              #17.1
..LN54:
        lea       180(%rsp), %r11                               #17.1
..LN55:
        movq      %r11, (%rsp)                                  #17.1
..LN56:
   .loc    1  18  is_stmt 1
        movl      %r14d, 8(%rsp)                                #18.29
..LN57:
   .loc    1  17  is_stmt 1
        movl      %r12d, 172(%rsp)                              #17.1
..LN58:
        movl      %r10d, 176(%rsp)                              #17.1
..LN59:
        movl      %r14d, 180(%rsp)                              #17.1
..LN60:
        movl      $32, 16(%rsp)                                 #17.1
..LN61:
        call      __kmpc_for_static_init_4                      #17.1
..LN62:
                                # LOE r13 r15 ebx ebp r12d
..B1.7:                         # Preds ..B1.6
..LN63:
   .loc    1  38  is_stmt 1
        movsd     .L_2il0floatpacket.128(%rip), %xmm0           #38.18
..LN64:
   .loc    1  17  is_stmt 1
        xorl      %edx, %edx                                    #17.1
..LN65:
   .loc    1  38  is_stmt 1
        movsd     256(%rsp), %xmm1                              #38.23
..LN66:
   .loc    1  52  is_stmt 1
        movl      %r12d, %r8d                                   #52.29
..LN67:
   .loc    1  39  is_stmt 1
        movsd     .L_2il0floatpacket.129(%rip), %xmm3           #39.18
..LN68:
   .loc    1  50  is_stmt 1
        movsd     248(%rsp), %xmm2                              #50.23
..LN69:
   .loc    1  38  is_stmt 1
        mulsd     %xmm1, %xmm0                                  #38.23
..LN70:
   .loc    1  39  is_stmt 1
        mulsd     %xmm3, %xmm1                                  #39.22
..LN71:
   .loc    1  50  is_stmt 1
        mulsd     %xmm2, %xmm2                                  #50.23
..LN72:
   .loc    1  30  is_stmt 1
        movslq    %ebx, %rbx                                    #30.27
..LN73:
   .loc    1  17  is_stmt 1
        movslq    168(%rsp), %rsi                               #17.1
        movq      %rsi, %rcx                                    #
..LN74:
        movq      %rdx, 160(%rsp)                               #17.1
..LN75:
        movq      %rdx, 152(%rsp)                               #17.1
..LN76:
   .loc    1  50  is_stmt 1
        movsd     %xmm2, 248(%rsp)                              #50.23
..LN77:
   .loc    1  30  is_stmt 1
        lea       (%rbx,%rbx,2), %rbx                           #30.27
..LN78:
   .loc    1  17  is_stmt 1
        movl      172(%rsp), %edi                               #17.1
..LN79:
        movslq    180(%rsp), %rdx                               #17.1
..LN80:
        movslq    %r12d, %rax                                   #17.1
..LN81:
   .loc    1  52  is_stmt 1
        movsd     .L_2il0floatpacket.130(%rip), %xmm2           #52.29
..LN82:
        movsd     %xmm1, 232(%rsp)                              #52.29
..LN83:
        movsd     %xmm0, 240(%rsp)                              #52.29
..LN84:
        movq      %r13, 144(%rsp)                               #52.29
..LN85:
        jmp       ..B1.8        # Prob 100%                     #52.29
..LN86:
                                # LOE rax rdx rcx rbx rsi r15 ebp edi r8d
..B1.30:                        # Preds ..B1.29
        movq      56(%rsp), %rdx                                #
        movq      48(%rsp), %rcx                                #
        movq      40(%rsp), %rsi                                #
..LN87:
   .loc    1  17  is_stmt 1
        addq      %rdx, %rcx                                    #17.1
..LN88:
        addq      %rdx, %rsi                                    #17.1
..LN89:
        movl      72(%rsp), %edi                                #
        movq      64(%rsp), %rax                                #
..LN90:
        addl      %edx, %edi                                    #17.1
        movl      32(%rsp), %r8d                                #
..LN91:
                                # LOE rax rdx rcx rbx rsi r15 ebp edi r8d
..B1.8:                         # Preds ..B1.30 ..B1.7
..LN92:
        cmpq      %rax, %rsi                                    #17.1
..LN93:
        jle       ..B1.18       # Prob 50%                      #17.1
..LN94:
                                # LOE rax rdx rcx rbx rsi r15 ebp edi r8d
..B1.9:                         # Preds ..B1.8
..LN95:
        movl      $.2.3_2_kmpc_loc_struct_pack.76, %edi         #17.1
..LN96:
        movl      %ebp, %esi                                    #17.1
..LN97:
        xorl      %eax, %eax                                    #17.1
..LN98:
        call      __kmpc_for_static_fini                        #17.1
..LN99:
                                # LOE ebp
..B1.10:                        # Preds ..B1.9 ..B1.5
..LN100:
   .loc    1  102  is_stmt 1
        movl      $.2.3_2_kmpc_loc_struct_pack.113, %edi        #102.5
..LN101:
        movl      %ebp, %esi                                    #102.5
..LN102:
        movl      $2, %edx                                      #102.5
..LN103:
        movl      $16, %ecx                                     #102.5
..LN104:
        movl      $L_forces_102__tree_reduce1_2.120, %r9d       #102.5
..LN105:
        lea       152(%rsp), %r8                                #102.5
..LN106:
        xorl      %eax, %eax                                    #102.5
..LN107:
        movq      $forces_kmpc_tree_reduct_lock_0, (%rsp)       #102.5
..LN108:
        call      __kmpc_reduce                                 #102.5
..LN109:
                                # LOE eax ebp
..B1.11:                        # Preds ..B1.10
..LN110:
        cmpl      $1, %eax                                      #102.5
..LN111:
        jne       ..B1.13       # Prob 50%                      #102.5
..LN112:
                                # LOE eax ebp
..B1.12:                        # Preds ..B1.11
..LN113:
        movsd     epot(%rip), %xmm0                             #102.5
..LN114:
        movl      $forces_kmpc_tree_reduct_lock_0, %edx         #102.5
..LN115:
        movsd     vir(%rip), %xmm1                              #102.5
..LN116:
        movl      $.2.3_2_kmpc_loc_struct_pack.113, %edi        #102.5
..LN117:
        movl      %ebp, %esi                                    #102.5
..LN118:
        xorl      %eax, %eax                                    #102.5
..LN119:
        addsd     152(%rsp), %xmm0                              #102.5
..LN120:
        addsd     160(%rsp), %xmm1                              #102.5
..LN121:
        movsd     %xmm0, epot(%rip)                             #102.5
..LN122:
        movsd     %xmm1, vir(%rip)                              #102.5
..LN123:
        call      __kmpc_end_reduce                             #102.5
..LN124:
        jmp       ..B1.17       # Prob 100%                     #102.5
..LN125:
                                # LOE
..B1.13:                        # Preds ..B1.11
..LN126:
        cmpl      $2, %eax                                      #102.5
..LN127:
        jne       ..B1.17       # Prob 50%                      #102.5
..LN128:
                                # LOE ebp
..B1.14:                        # Preds ..B1.13
..LN129:
        movsd     152(%rsp), %xmm0                              #102.5
..LN130:
        movl      $epot, %edx                                   #102.5
..LN131:
        movl      $.2.3_2_kmpc_loc_struct_pack.113, %edi        #102.5
..LN132:
        movl      %ebp, %esi                                    #102.5
..LN133:
        pushq     $1                                            #102.5
..LN134:
        popq      %rax                                          #102.5
..LN135:
        call      __kmpc_atomic_float8_add                      #102.5
..LN136:
                                # LOE ebp
..B1.15:                        # Preds ..B1.14
..LN137:
        movsd     160(%rsp), %xmm0                              #102.5
..LN138:
        movl      $vir, %edx                                    #102.5
..LN139:
        movl      $.2.3_2_kmpc_loc_struct_pack.113, %edi        #102.5
..LN140:
        movl      %ebp, %esi                                    #102.5
..LN141:
        pushq     $1                                            #102.5
..LN142:
        popq      %rax                                          #102.5
..LN143:
        call      __kmpc_atomic_float8_add                      #102.5
..LN144:
                                # LOE ebp
..B1.16:                        # Preds ..B1.15
..LN145:
        movl      $forces_kmpc_tree_reduct_lock_0, %edx         #102.5
..LN146:
        movl      $.2.3_2_kmpc_loc_struct_pack.113, %edi        #102.5
..LN147:
        movl      %ebp, %esi                                    #102.5
..LN148:
        xorl      %eax, %eax                                    #102.5
..LN149:
        call      __kmpc_end_reduce                             #102.5
..LN150:
                                # LOE
..B1.17:                        # Preds ..B1.12 ..B1.16 ..B1.13
..LN151:
   .loc    1  103  is_stmt 1
        movq      80(%rsp), %r15                                #103.3
..___tag_value_forces.24:                                       #
..LN152:
        movq      88(%rsp), %r14                                #103.3
..___tag_value_forces.25:                                       #
..LN153:
        movq      96(%rsp), %r13                                #103.3
..___tag_value_forces.26:                                       #
..LN154:
        movq      104(%rsp), %r12                               #103.3
..___tag_value_forces.27:                                       #
..LN155:
        movq      112(%rsp), %rbx                               #103.3
..___tag_value_forces.28:                                       #
..LN156:
        movq      120(%rsp), %rbp                               #103.3
..___tag_value_forces.29:                                       #
..LN157:
        addq      $264, %rsp                                    #103.3
..___tag_value_forces.31:                                       #
..LN158:
        ret                                                     #103.3
..___tag_value_forces.32:                                       #
..LN159:
                                # LOE
..B1.18:                        # Preds ..B1.8
..LN160:
   .loc    1  17  is_stmt 1
        cmpl      %r8d, %edi                                    #17.1
..LN161:
        movq      %rcx, %r14                                    #17.1
..LN162:
        movq      %rax, 64(%rsp)                                #17.1
..LN163:
        movq      %rsi, %r13                                    #17.1
..LN164:
        cmovge    %r8d, %edi                                    #17.1
..LN165:
        pxor      %xmm0, %xmm0                                  #17.1
..LN166:
        movslq    %edi, %r12                                    #17.1
..LN167:
        movl      %edi, 72(%rsp)                                #17.1
..LN168:
        movq      %rdx, 56(%rsp)                                #17.1
..LN169:
        movq      %rcx, 48(%rsp)                                #17.1
..LN170:
        movq      %rsi, 40(%rsp)                                #17.1
..LN171:
        movl      %r8d, 32(%rsp)                                #17.1
..LN172:
                                # LOE rbx r12 r13 r14 r15 ebp
..B1.19:                        # Preds ..B1.29 ..B1.18
..LN173:
   .loc    1  23  is_stmt 1
..LN174:
   .loc    1  24  is_stmt 1
..LN175:
   .loc    1  25  is_stmt 1
..LN176:
   .loc    1  30  is_stmt 1
        lea       3(%r14), %rax                                 #30.16
..LN177:
   .loc    1  23  is_stmt 1
        pxor      %xmm0, %xmm0                                  #23.18
..LN178:
   .loc    1  24  is_stmt 1
        pxor      %xmm1, %xmm1                                  #24.18
..LN179:
   .loc    1  25  is_stmt 1
        pxor      %xmm2, %xmm2                                  #25.18
..LN180:
   .loc    1  30  is_stmt 1
        cmpq      %rbx, %rax                                    #30.27
..LN181:
        jge       ..B1.27       # Prob 10%                      #30.27
..LN182:
                                # LOE rax rbx r12 r13 r14 r15 ebp xmm0 xmm1 xmm2
..B1.20:                        # Preds ..B1.19
        movq      %r12, 128(%rsp)                               #
        movsd     %xmm2, 184(%rsp)                              #
        movsd     %xmm1, 200(%rsp)                              #
        movsd     %xmm0, 192(%rsp)                              #
        movq      %r14, 136(%rsp)                               #
        movq      %rbx, 224(%rsp)                               #
        movq      %rax, %rbx                                    #
        movq      144(%rsp), %r12                               #
..LN183:
                                # LOE rbx r12 r13 r15 ebp
..B1.21:                        # Preds ..B1.25 ..B1.20
..LN184:
   .loc    1  34  is_stmt 1
        movsd     (%r12,%r13,8), %xmm0                          #34.21
..LN185:
   .loc    1  38  is_stmt 1
        movsd     240(%rsp), %xmm4                              #38.31
..LN186:
        movsd     256(%rsp), %xmm6                              #38.31
..LN187:
        movaps    %xmm6, %xmm2                                  #38.31
..LN188:
   .loc    1  40  is_stmt 1
        movaps    %xmm6, %xmm3                                  #40.31
..LN189:
   .loc    1  39  is_stmt 1
        movsd     232(%rsp), %xmm7                              #39.31
..LN190:
   .loc    1  42  is_stmt 1
        movaps    %xmm6, %xmm8                                  #42.31
..LN191:
   .loc    1  35  is_stmt 1
        movsd     8(%r12,%r13,8), %xmm1                         #35.21
..LN192:
   .loc    1  36  is_stmt 1
        movsd     16(%r12,%r13,8), %xmm5                        #36.21
..LN193:
   .loc    1  50  is_stmt 1
        movsd     248(%rsp), %xmm11                             #50.23
..LN194:
   .loc    1  34  is_stmt 1
        subsd     (%r12,%rbx,8), %xmm0                          #34.26
..LN195:
   .loc    1  35  is_stmt 1
        subsd     8(%r12,%rbx,8), %xmm1                         #35.28
..LN196:
   .loc    1  36  is_stmt 1
        subsd     16(%r12,%rbx,8), %xmm5                        #36.28
..LN197:
   .loc    1  38  is_stmt 1
        comisd    %xmm0, %xmm4                                  #38.31
..LN198:
        addsd     %xmm0, %xmm2                                  #38.31
..LN199:
   .loc    1  40  is_stmt 1
        addsd     %xmm1, %xmm3                                  #40.31
..LN200:
   .loc    1  42  is_stmt 1
        addsd     %xmm5, %xmm8                                  #42.31
..LN201:
   .loc    1  38  is_stmt 1
        ja        ..L39         # Prob 50%                      #38.31
..LN202:
        movaps    %xmm0, %xmm2                                  #38.31
..L39:                                                          #
..LN203:
   .loc    1  39  is_stmt 1
        comisd    %xmm7, %xmm2                                  #39.31
..LN204:
        movaps    %xmm2, %xmm0                                  #39.31
..LN205:
        subsd     %xmm6, %xmm0                                  #39.31
..LN206:
        ja        ..L40         # Prob 50%                      #39.31
..LN207:
        movaps    %xmm2, %xmm0                                  #39.31
..L40:                                                          #
..LN208:
   .loc    1  40  is_stmt 1
        comisd    %xmm1, %xmm4                                  #40.31
..LN209:
        ja        ..L41         # Prob 50%                      #40.31
..LN210:
        movaps    %xmm1, %xmm3                                  #40.31
..L41:                                                          #
..LN211:
   .loc    1  41  is_stmt 1
        comisd    %xmm7, %xmm3                                  #41.31
..LN212:
        movaps    %xmm3, %xmm2                                  #41.31
..LN213:
        subsd     %xmm6, %xmm2                                  #41.31
..LN214:
        ja        ..L42         # Prob 50%                      #41.31
..LN215:
        movaps    %xmm3, %xmm2                                  #41.31
..L42:                                                          #
..LN216:
   .loc    1  42  is_stmt 1
        comisd    %xmm5, %xmm4                                  #42.31
..LN217:
   .loc    1  45  is_stmt 1
        movaps    %xmm2, %xmm9                                  #45.30
..LN218:
   .loc    1  42  is_stmt 1
        ja        ..L43         # Prob 50%                      #42.31
..LN219:
        movaps    %xmm5, %xmm8                                  #42.31
..L43:                                                          #
..LN220:
   .loc    1  43  is_stmt 1
        comisd    %xmm7, %xmm8                                  #43.31
..LN221:
   .loc    1  45  is_stmt 1
        mulsd     %xmm2, %xmm9                                  #45.30
..LN222:
   .loc    1  43  is_stmt 1
        movaps    %xmm8, %xmm1                                  #43.31
..LN223:
   .loc    1  45  is_stmt 1
        movaps    %xmm0, %xmm7                                  #45.24
..LN224:
        mulsd     %xmm0, %xmm7                                  #45.24
..LN225:
   .loc    1  43  is_stmt 1
        subsd     %xmm6, %xmm1                                  #43.31
..LN226:
        ja        ..L44         # Prob 50%                      #43.31
..LN227:
        movaps    %xmm8, %xmm1                                  #43.31
..L44:                                                          #
..LN228:
   .loc    1  45  is_stmt 1
        movaps    %xmm1, %xmm10                                 #45.36
..LN229:
        addsd     %xmm9, %xmm7                                  #45.30
..LN230:
        mulsd     %xmm1, %xmm10                                 #45.36
..LN231:
        addsd     %xmm10, %xmm7                                 #45.36
..LN232:
   .loc    1  50  is_stmt 1
        comisd    %xmm7, %xmm11                                 #50.23
..LN233:
        jb        ..B1.25       # Prob 50%                      #50.23
..LN234:
                                # LOE rbx r12 r13 r15 ebp xmm0 xmm1 xmm2 xmm7
..B1.22:                        # Preds ..B1.21
..LN235:
   .loc    1  52  is_stmt 1
        movsd     .L_2il0floatpacket.130(%rip), %xmm4           #52.33
..LN236:
   .loc    1  75  is_stmt 1
        lea       (%r15,%rbx,8), %r14                           #75.6
..LN237:
   .loc    1  52  is_stmt 1
        movaps    %xmm4, %xmm10                                 #52.33
..LN238:
   .loc    1  75  is_stmt 1
        movl      $.2.3_2_kmpc_loc_struct_pack.20, %edi         #75.6
..LN239:
   .loc    1  52  is_stmt 1
        divsd     %xmm7, %xmm10                                 #52.33
..LN240:
   .loc    1  53  is_stmt 1
        movaps    %xmm10, %xmm6                                 #53.33
..LN241:
   .loc    1  75  is_stmt 1
        movl      %ebp, %esi                                    #75.6
..LN242:
   .loc    1  53  is_stmt 1
        mulsd     %xmm10, %xmm6                                 #53.33
..LN243:
   .loc    1  75  is_stmt 1
        movq      %r14, %rdx                                    #75.6
..LN244:
   .loc    1  53  is_stmt 1
        mulsd     %xmm10, %xmm6                                 #53.37
..LN245:
   .loc    1  75  is_stmt 1
        movl      $1, %eax                                      #75.6
..LN246:
   .loc    1  55  is_stmt 1
        movaps    %xmm6, %xmm3                                  #55.42
..LN247:
   .loc    1  58  is_stmt 1
        movaps    %xmm6, %xmm5                                  #58.33
..LN248:
   .loc    1  54  is_stmt 1
        mulsd     %xmm6, %xmm10                                 #54.34
..LN249:
   .loc    1  55  is_stmt 1
        subsd     .L_2il0floatpacket.129(%rip), %xmm3           #55.42
..LN250:
   .loc    1  58  is_stmt 1
        subsd     %xmm4, %xmm5                                  #58.33
..LN251:
   .loc    1  55  is_stmt 1
        mulsd     %xmm3, %xmm10                                 #55.42
..LN252:
   .loc    1  58  is_stmt 1
        mulsd     %xmm5, %xmm6                                  #58.33
..LN253:
   .loc    1  59  is_stmt 1
        mulsd     %xmm10, %xmm7                                 #59.25
..LN254:
   .loc    1  61  is_stmt 1
        mulsd     %xmm10, %xmm0                                 #61.25
..LN255:
   .loc    1  58  is_stmt 1
        addsd     152(%rsp), %xmm6                              #58.11
..LN256:
   .loc    1  62  is_stmt 1
        mulsd     %xmm10, %xmm2                                 #62.25
..LN257:
   .loc    1  63  is_stmt 1
        mulsd     %xmm10, %xmm1                                 #63.25
..LN258:
   .loc    1  59  is_stmt 1
        movsd     160(%rsp), %xmm8                              #59.11
..LN259:
   .loc    1  62  is_stmt 1
        movsd     200(%rsp), %xmm9                              #62.11
..LN260:
   .loc    1  59  is_stmt 1
        subsd     %xmm7, %xmm8                                  #59.11
..LN261:
   .loc    1  62  is_stmt 1
        addsd     %xmm2, %xmm9                                  #62.11
..LN262:
   .loc    1  61  is_stmt 1
        movsd     192(%rsp), %xmm7                              #61.11
..LN263:
   .loc    1  63  is_stmt 1
        movsd     184(%rsp), %xmm11                             #63.11
..LN264:
   .loc    1  61  is_stmt 1
        addsd     %xmm0, %xmm7                                  #61.11
..LN265:
   .loc    1  63  is_stmt 1
        addsd     %xmm1, %xmm11                                 #63.11
..LN266:
   .loc    1  58  is_stmt 1
        movsd     %xmm6, 152(%rsp)                              #58.11
..LN267:
   .loc    1  59  is_stmt 1
        movsd     %xmm8, 160(%rsp)                              #59.11
..LN268:
   .loc    1  61  is_stmt 1
        movsd     %xmm7, 192(%rsp)                              #61.11
..LN269:
   .loc    1  62  is_stmt 1
        movsd     %xmm9, 200(%rsp)                              #62.11
..LN270:
   .loc    1  63  is_stmt 1
        movsd     %xmm11, 184(%rsp)                             #63.11
..LN271:
   .loc    1  75  is_stmt 1
        movsd     %xmm2, 208(%rsp)                              #75.6
..LN272:
        movsd     %xmm1, 216(%rsp)                              #75.6
..LN273:
        call      __kmpc_atomic_float8_sub                      #75.6
..LN274:
                                # LOE rbx r12 r13 r14 r15 ebp
..B1.23:                        # Preds ..B1.22
        movsd     208(%rsp), %xmm2                              #
..LN275:
   .loc    1  77  is_stmt 1
        lea       8(%r14), %rdx                                 #77.6
..LN276:
        movl      $.2.3_2_kmpc_loc_struct_pack.28, %edi         #77.6
..LN277:
        movl      %ebp, %esi                                    #77.6
..LN278:
        movaps    %xmm2, %xmm0                                  #77.6
..LN279:
        movl      $1, %eax                                      #77.6
..LN280:
        call      __kmpc_atomic_float8_sub                      #77.6
..LN281:
                                # LOE rbx r12 r13 r14 r15 ebp
..B1.24:                        # Preds ..B1.23
        movsd     216(%rsp), %xmm1                              #
..LN282:
   .loc    1  79  is_stmt 1
        addq      $16, %r14                                     #79.6
..LN283:
        movl      $.2.3_2_kmpc_loc_struct_pack.36, %edi         #79.6
..LN284:
        movl      %ebp, %esi                                    #79.6
..LN285:
        movq      %r14, %rdx                                    #79.6
..LN286:
        movl      $1, %eax                                      #79.6
..LN287:
        movaps    %xmm1, %xmm0                                  #79.6
..LN288:
        call      __kmpc_atomic_float8_sub                      #79.6
..LN289:
                                # LOE rbx r12 r13 r15 ebp
..B1.25:                        # Preds ..B1.24 ..B1.21
..LN290:
   .loc    1  30  is_stmt 1
        addq      $3, %rbx                                      #30.30
..LN291:
        cmpq      224(%rsp), %rbx                               #30.27
..LN292:
        jl        ..B1.21       # Prob 82%                      #30.27
..LN293:
                                # LOE rbx r12 r13 r15 ebp
..B1.26:                        # Preds ..B1.25
        movsd     184(%rsp), %xmm2                              #
        movsd     200(%rsp), %xmm1                              #
        movsd     192(%rsp), %xmm0                              #
        movq      136(%rsp), %r14                               #
        movq      128(%rsp), %r12                               #
        movq      224(%rsp), %rbx                               #
..LN294:
                                # LOE rbx r12 r13 r14 r15 ebp xmm0 xmm1 xmm2
..B1.27:                        # Preds ..B1.26 ..B1.19
..LN295:
   .loc    1  89  is_stmt 1
        movl      $.2.3_2_kmpc_loc_struct_pack.44, %edi         #89.2
..LN296:
        movl      %ebp, %esi                                    #89.2
..LN297:
        movl      $.gomp_critical_user_, %edx                   #89.2
..LN298:
        xorl      %eax, %eax                                    #89.2
..LN299:
        movsd     %xmm0, 192(%rsp)                              #89.2
..LN300:
        movsd     %xmm1, 200(%rsp)                              #89.2
..LN301:
        movsd     %xmm2, 184(%rsp)                              #89.2
..LN302:
        call      __kmpc_critical                               #89.2
..LN303:
                                # LOE rbx r12 r13 r14 r15 ebp
..B1.28:                        # Preds ..B1.27
        movsd     184(%rsp), %xmm2                              #
..LN304:
   .loc    1  91  is_stmt 1
        movl      $.2.3_2_kmpc_loc_struct_pack.52, %edi         #91.2
        movsd     200(%rsp), %xmm1                              #
..LN305:
        movl      %ebp, %esi                                    #91.2
        movsd     192(%rsp), %xmm0                              #
..LN306:
        movl      $.gomp_critical_user_, %edx                   #91.2
..LN307:
        xorl      %eax, %eax                                    #91.2
..LN308:
   .loc    1  89  is_stmt 1
        addsd     (%r15,%r13,8), %xmm0                          #89.2
..LN309:
   .loc    1  90  is_stmt 1
        addsd     8(%r15,%r13,8), %xmm1                         #90.2
..LN310:
   .loc    1  91  is_stmt 1
        addsd     16(%r15,%r13,8), %xmm2                        #91.2
..LN311:
   .loc    1  89  is_stmt 1
        movsd     %xmm0, (%r15,%r13,8)                          #89.2
..LN312:
   .loc    1  90  is_stmt 1
        movsd     %xmm1, 8(%r15,%r13,8)                         #90.2
..LN313:
   .loc    1  91  is_stmt 1
        movsd     %xmm2, 16(%r15,%r13,8)                        #91.2
..LN314:
        call      __kmpc_end_critical                           #91.2
..LN315:
                                # LOE rbx r12 r13 r14 r15 ebp
..B1.29:                        # Preds ..B1.28
..LN316:
   .loc    1  18  is_stmt 1
        addq      $3, %r13                                      #18.26
..LN317:
        addq      $3, %r14                                      #18.26
..LN318:
        cmpq      %r12, %r13                                    #18.23
..LN319:
        jle       ..B1.19       # Prob 82%                      #18.23
..LN320:
        jmp       ..B1.30       # Prob 100%                     #18.23
..___tag_value_forces.45:                                       #
..LN321:
                                # LOE rbx r12 r13 r14 r15 ebp
L_forces_102__tree_reduce1_2.120:
# parameter 1: %rdi
# parameter 2: %rsi
..B1.31:                        # Preds ..B1.0
..LN322:
   .loc    1  102  is_stmt 1
        subq      $264, %rsp                                    #102.5
..___tag_value_forces.52:                                       #
..LN323:
        movsd     (%rsi), %xmm0                                 #102.5
..LN324:
        movsd     8(%rsi), %xmm1                                #102.5
..LN325:
        movq      %rbp, 120(%rsp)                               #102.5
..___tag_value_forces.54:                                       #
..LN326:
        movq      %rbx, 112(%rsp)                               #102.5
..___tag_value_forces.56:                                       #
..LN327:
        movq      %r15, 80(%rsp)                                #102.5
..___tag_value_forces.58:                                       #
..LN328:
        movq      %r14, 88(%rsp)                                #102.5
..___tag_value_forces.60:                                       #
..LN329:
        movq      %r13, 96(%rsp)                                #102.5
..___tag_value_forces.62:                                       #
..LN330:
        movq      %r12, 104(%rsp)                               #102.5
..___tag_value_forces.64:                                       #
..LN331:
        movq      80(%rsp), %r15                                #102.5
..LN332:
        movq      88(%rsp), %r14                                #102.5
..LN333:
        movq      96(%rsp), %r13                                #102.5
..LN334:
        movq      104(%rsp), %r12                               #102.5
..LN335:
        movq      112(%rsp), %rbx                               #102.5
..LN336:
        movq      120(%rsp), %rbp                               #102.5
..LN337:
        addsd     (%rdi), %xmm0                                 #102.5
..LN338:
        addsd     8(%rdi), %xmm1                                #102.5
..LN339:
        movsd     %xmm0, (%rdi)                                 #102.5
..LN340:
        movsd     %xmm1, 8(%rdi)                                #102.5
..LN341:
        addq      $264, %rsp                                    #102.5
..___tag_value_forces.67:                                       #
..LN342:
        ret                                                     #102.5
        .align    16,0x90
..___tag_value_forces.69:                                       #
..LN343:
                                # LOE
..LN344:
# mark_end;
	.type	forces,@function
	.size	forces,.-forces
..LNforces.345:
.LNforces:
	.data
	.align 4
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
	.byte	77
	.byte	111
	.byte	108
	.byte	68
	.byte	121
	.byte	110
	.byte	47
	.byte	77
	.byte	111
	.byte	108
	.byte	68
	.byte	121
	.byte	110
	.byte	83
	.byte	111
	.byte	108
	.byte	50
	.byte	47
	.byte	102
	.byte	111
	.byte	114
	.byte	99
	.byte	101
	.byte	115
	.byte	46
	.byte	99
	.byte	59
	.byte	102
	.byte	111
	.byte	114
	.byte	99
	.byte	101
	.byte	115
	.byte	59
	.byte	49
	.byte	49
	.byte	59
	.byte	49
	.byte	49
	.byte	59
	.byte	59
	.space 2	# pad
	.align 4
.2.3_2_kmpc_loc_struct_pack.60:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.3_2__kmpc_loc_pack.59
	.align 4
.2.3_2__kmpc_loc_pack.59:
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
	.byte	77
	.byte	111
	.byte	108
	.byte	68
	.byte	121
	.byte	110
	.byte	47
	.byte	77
	.byte	111
	.byte	108
	.byte	68
	.byte	121
	.byte	110
	.byte	83
	.byte	111
	.byte	108
	.byte	50
	.byte	47
	.byte	102
	.byte	111
	.byte	114
	.byte	99
	.byte	101
	.byte	115
	.byte	46
	.byte	99
	.byte	59
	.byte	102
	.byte	111
	.byte	114
	.byte	99
	.byte	101
	.byte	115
	.byte	59
	.byte	49
	.byte	49
	.byte	59
	.byte	49
	.byte	49
	.byte	59
	.byte	59
	.space 2	# pad
	.align 4
.2.3_2_kmpc_loc_struct_pack.68:
	.long	0
	.long	322
	.long	0
	.long	0
	.quad	.2.3_2__kmpc_loc_pack.67
	.align 4
.2.3_2__kmpc_loc_pack.67:
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
	.byte	77
	.byte	111
	.byte	108
	.byte	68
	.byte	121
	.byte	110
	.byte	47
	.byte	77
	.byte	111
	.byte	108
	.byte	68
	.byte	121
	.byte	110
	.byte	83
	.byte	111
	.byte	108
	.byte	50
	.byte	47
	.byte	102
	.byte	111
	.byte	114
	.byte	99
	.byte	101
	.byte	115
	.byte	46
	.byte	99
	.byte	59
	.byte	102
	.byte	111
	.byte	114
	.byte	99
	.byte	101
	.byte	115
	.byte	59
	.byte	49
	.byte	49
	.byte	59
	.byte	49
	.byte	49
	.byte	59
	.byte	59
	.space 2	# pad
	.align 4
.2.3_2_kmpc_loc_struct_pack.76:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.3_2__kmpc_loc_pack.75
	.align 4
.2.3_2__kmpc_loc_pack.75:
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
	.byte	77
	.byte	111
	.byte	108
	.byte	68
	.byte	121
	.byte	110
	.byte	47
	.byte	77
	.byte	111
	.byte	108
	.byte	68
	.byte	121
	.byte	110
	.byte	83
	.byte	111
	.byte	108
	.byte	50
	.byte	47
	.byte	102
	.byte	111
	.byte	114
	.byte	99
	.byte	101
	.byte	115
	.byte	46
	.byte	99
	.byte	59
	.byte	102
	.byte	111
	.byte	114
	.byte	99
	.byte	101
	.byte	115
	.byte	59
	.byte	49
	.byte	55
	.byte	59
	.byte	49
	.byte	48
	.byte	50
	.byte	59
	.byte	59
	.space 1	# pad
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
	.byte	77
	.byte	111
	.byte	108
	.byte	68
	.byte	121
	.byte	110
	.byte	47
	.byte	77
	.byte	111
	.byte	108
	.byte	68
	.byte	121
	.byte	110
	.byte	83
	.byte	111
	.byte	108
	.byte	50
	.byte	47
	.byte	102
	.byte	111
	.byte	114
	.byte	99
	.byte	101
	.byte	115
	.byte	46
	.byte	99
	.byte	59
	.byte	102
	.byte	111
	.byte	114
	.byte	99
	.byte	101
	.byte	115
	.byte	59
	.byte	55
	.byte	53
	.byte	59
	.byte	55
	.byte	53
	.byte	59
	.byte	59
	.space 2	# pad
	.align 4
.2.3_2_kmpc_loc_struct_pack.28:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.3_2__kmpc_loc_pack.27
	.align 4
.2.3_2__kmpc_loc_pack.27:
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
	.byte	77
	.byte	111
	.byte	108
	.byte	68
	.byte	121
	.byte	110
	.byte	47
	.byte	77
	.byte	111
	.byte	108
	.byte	68
	.byte	121
	.byte	110
	.byte	83
	.byte	111
	.byte	108
	.byte	50
	.byte	47
	.byte	102
	.byte	111
	.byte	114
	.byte	99
	.byte	101
	.byte	115
	.byte	46
	.byte	99
	.byte	59
	.byte	102
	.byte	111
	.byte	114
	.byte	99
	.byte	101
	.byte	115
	.byte	59
	.byte	55
	.byte	55
	.byte	59
	.byte	55
	.byte	55
	.byte	59
	.byte	59
	.space 2	# pad
	.align 4
.2.3_2_kmpc_loc_struct_pack.36:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.3_2__kmpc_loc_pack.35
	.align 4
.2.3_2__kmpc_loc_pack.35:
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
	.byte	77
	.byte	111
	.byte	108
	.byte	68
	.byte	121
	.byte	110
	.byte	47
	.byte	77
	.byte	111
	.byte	108
	.byte	68
	.byte	121
	.byte	110
	.byte	83
	.byte	111
	.byte	108
	.byte	50
	.byte	47
	.byte	102
	.byte	111
	.byte	114
	.byte	99
	.byte	101
	.byte	115
	.byte	46
	.byte	99
	.byte	59
	.byte	102
	.byte	111
	.byte	114
	.byte	99
	.byte	101
	.byte	115
	.byte	59
	.byte	55
	.byte	57
	.byte	59
	.byte	55
	.byte	57
	.byte	59
	.byte	59
	.space 2	# pad
	.align 4
.2.3_2_kmpc_loc_struct_pack.44:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.3_2__kmpc_loc_pack.43
	.align 4
.2.3_2__kmpc_loc_pack.43:
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
	.byte	77
	.byte	111
	.byte	108
	.byte	68
	.byte	121
	.byte	110
	.byte	47
	.byte	77
	.byte	111
	.byte	108
	.byte	68
	.byte	121
	.byte	110
	.byte	83
	.byte	111
	.byte	108
	.byte	50
	.byte	47
	.byte	102
	.byte	111
	.byte	114
	.byte	99
	.byte	101
	.byte	115
	.byte	46
	.byte	99
	.byte	59
	.byte	102
	.byte	111
	.byte	114
	.byte	99
	.byte	101
	.byte	115
	.byte	59
	.byte	56
	.byte	55
	.byte	59
	.byte	56
	.byte	55
	.byte	59
	.byte	59
	.space 2	# pad
	.align 4
.2.3_2_kmpc_loc_struct_pack.52:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.3_2__kmpc_loc_pack.51
	.align 4
.2.3_2__kmpc_loc_pack.51:
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
	.byte	77
	.byte	111
	.byte	108
	.byte	68
	.byte	121
	.byte	110
	.byte	47
	.byte	77
	.byte	111
	.byte	108
	.byte	68
	.byte	121
	.byte	110
	.byte	83
	.byte	111
	.byte	108
	.byte	50
	.byte	47
	.byte	102
	.byte	111
	.byte	114
	.byte	99
	.byte	101
	.byte	115
	.byte	46
	.byte	99
	.byte	59
	.byte	102
	.byte	111
	.byte	114
	.byte	99
	.byte	101
	.byte	115
	.byte	59
	.byte	57
	.byte	50
	.byte	59
	.byte	57
	.byte	50
	.byte	59
	.byte	59
	.space 2	# pad
	.align 4
.2.3_2_kmpc_loc_struct_pack.113:
	.long	0
	.long	18
	.long	0
	.long	0
	.quad	.2.3_2__kmpc_loc_pack.112
	.align 4
.2.3_2__kmpc_loc_pack.112:
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
	.byte	77
	.byte	111
	.byte	108
	.byte	68
	.byte	121
	.byte	110
	.byte	47
	.byte	77
	.byte	111
	.byte	108
	.byte	68
	.byte	121
	.byte	110
	.byte	83
	.byte	111
	.byte	108
	.byte	50
	.byte	47
	.byte	102
	.byte	111
	.byte	114
	.byte	99
	.byte	101
	.byte	115
	.byte	46
	.byte	99
	.byte	59
	.byte	102
	.byte	111
	.byte	114
	.byte	99
	.byte	101
	.byte	115
	.byte	59
	.byte	49
	.byte	48
	.byte	50
	.byte	59
	.byte	49
	.byte	48
	.byte	50
	.byte	59
	.byte	59
	.data
# -- End  forces, L_forces_102__tree_reduce1_2.120
	.section .rodata, "a"
	.align 8
	.align 8
.L_2il0floatpacket.128:
	.long	0x00000000,0xbfe00000
	.type	.L_2il0floatpacket.128,@object
	.size	.L_2il0floatpacket.128,8
	.align 8
.L_2il0floatpacket.129:
	.long	0x00000000,0x3fe00000
	.type	.L_2il0floatpacket.129,@object
	.size	.L_2il0floatpacket.129,8
	.align 8
.L_2il0floatpacket.130:
	.long	0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.130,@object
	.size	.L_2il0floatpacket.130,8
	.data
	.comm .gomp_critical_user_,32,8
	.comm forces_kmpc_tree_reduct_lock_0,32,8
# mark_proc_addr_taken L_forces_102__tree_reduce1_2.120;
	.section .note.GNU-stack, ""
// -- Begin DWARF2 SEGMENT .debug_info
	.section .debug_info
.debug_info_seg:
	.align 1
	.4byte 0x00000336
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
	.8byte 0x4d2f6e79446c6f4d
	.8byte 0x6c6f536e79446c6f
	.2byte 0x0032
//	DW_AT_language:
	.byte 0x01
//	DW_AT_name:
	.8byte 0x632e736563726f66
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
	.byte 0x00
//	DW_AT_encoding:
	.byte 0x05
//	DW_AT_name:
	.4byte 0x64696f76
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x03
//	DW_AT_decl_line:
	.byte 0x08
//	DW_AT_decl_column:
	.byte 0x03
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_inline:
	.byte 0x00
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000000e1
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x63726f66
	.2byte 0x7365
	.byte 0x00
//	DW_TAG_formal_parameter:
	.byte 0x04
//	DW_AT_decl_line:
	.byte 0x08
//	DW_AT_decl_column:
	.byte 0x0e
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000301
//	DW_AT_name:
	.4byte 0x7261706e
	.2byte 0x0074
//	DW_AT_location:
	.2byte 0x5501
//	DW_TAG_formal_parameter:
	.byte 0x04
//	DW_AT_decl_line:
	.byte 0x08
//	DW_AT_decl_column:
	.byte 0x1c
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000308
//	DW_AT_name:
	.2byte 0x0078
//	DW_AT_location:
	.2byte 0x5401
//	DW_TAG_formal_parameter:
	.byte 0x04
//	DW_AT_decl_line:
	.byte 0x08
//	DW_AT_decl_column:
	.byte 0x28
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000308
//	DW_AT_name:
	.2byte 0x0066
//	DW_AT_location:
	.2byte 0x5101
//	DW_TAG_formal_parameter:
	.byte 0x04
//	DW_AT_decl_line:
	.byte 0x08
//	DW_AT_decl_column:
	.byte 0x34
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000030d
//	DW_AT_name:
	.4byte 0x65646973
	.byte 0x00
//	DW_AT_location:
	.2byte 0x6101
//	DW_TAG_formal_parameter:
	.byte 0x04
//	DW_AT_decl_line:
	.byte 0x08
//	DW_AT_decl_column:
	.byte 0x41
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000030d
//	DW_AT_name:
	.4byte 0x666f6372
	.2byte 0x0066
//	DW_AT_location:
	.2byte 0x6201
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x0a
//	DW_AT_decl_column:
	.byte 0x07
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0069
//	DW_AT_type:
	.4byte 0x00000301
//	DW_TAG_lexical_block:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0x12
//	DW_AT_decl_column:
	.byte 0x20
//	DW_AT_decl_file:
	.byte 0x01
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x17
//	DW_AT_decl_column:
	.byte 0x0e
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x00697866
//	DW_AT_type:
	.4byte 0x0000030d
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x18
//	DW_AT_decl_column:
	.byte 0x0e
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x00697966
//	DW_AT_type:
	.4byte 0x0000030d
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x19
//	DW_AT_decl_column:
	.byte 0x0e
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x00697a66
//	DW_AT_type:
	.4byte 0x0000030d
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x1a
//	DW_AT_decl_column:
	.byte 0x0b
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x006a
//	DW_AT_type:
	.4byte 0x00000301
//	DW_TAG_lexical_block:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0x1e
//	DW_AT_decl_column:
	.byte 0x24
//	DW_AT_decl_file:
	.byte 0x01
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x22
//	DW_AT_decl_column:
	.byte 0x10
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7878
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000030d
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x23
//	DW_AT_decl_column:
	.byte 0x10
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7979
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000030d
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x24
//	DW_AT_decl_column:
	.byte 0x10
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7a7a
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000030d
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x2d
//	DW_AT_decl_column:
	.byte 0x10
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x6472
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000030d
//	DW_TAG_lexical_block:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0x32
//	DW_AT_decl_column:
	.byte 0x1e
//	DW_AT_decl_file:
	.byte 0x01
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x34
//	DW_AT_decl_column:
	.byte 0x12
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x00647272
//	DW_AT_type:
	.4byte 0x0000030d
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x35
//	DW_AT_decl_column:
	.byte 0x12
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x33647272
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000030d
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x36
//	DW_AT_decl_column:
	.byte 0x12
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x34647272
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000030d
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x37
//	DW_AT_decl_column:
	.byte 0x12
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x38343172
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000030d
	.byte 0x00
	.byte 0x00
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x07
//	DW_AT_decl_line:
	.byte 0x12
//	DW_AT_decl_column:
	.byte 0x0a
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
	.4byte 0x63726f66
	.2byte 0x7365
	.byte 0x00
//	DW_AT_low_pc:
	.8byte forces
//	DW_AT_high_pc:
	.8byte ..LNforces.345
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_variable:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0x11
//	DW_AT_decl_column:
	.byte 0x01
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x00697866
//	DW_AT_type:
	.4byte 0x0000030d
//	DW_AT_location:
	.2byte 0x6801
//	DW_TAG_variable:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0x11
//	DW_AT_decl_column:
	.byte 0x01
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x00697966
//	DW_AT_type:
	.4byte 0x0000030d
//	DW_AT_location:
	.2byte 0x6a01
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x11
//	DW_AT_decl_column:
	.byte 0x01
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x00697a66
//	DW_AT_type:
	.4byte 0x0000030d
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x11
//	DW_AT_decl_column:
	.byte 0x01
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x006a
//	DW_AT_type:
	.4byte 0x00000301
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x11
//	DW_AT_decl_column:
	.byte 0x01
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7878
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000030d
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x11
//	DW_AT_decl_column:
	.byte 0x01
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7979
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000030d
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x11
//	DW_AT_decl_column:
	.byte 0x01
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7a7a
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000030d
//	DW_TAG_variable:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0x11
//	DW_AT_decl_column:
	.byte 0x01
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x6472
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000030d
//	DW_AT_location:
	.2byte 0x6801
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x11
//	DW_AT_decl_column:
	.byte 0x01
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x00647272
//	DW_AT_type:
	.4byte 0x0000030d
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x11
//	DW_AT_decl_column:
	.byte 0x01
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x33647272
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000030d
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x11
//	DW_AT_decl_column:
	.byte 0x01
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x34647272
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000030d
//	DW_TAG_variable:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0x11
//	DW_AT_decl_column:
	.byte 0x01
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x38343172
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000030d
//	DW_AT_location:
	.2byte 0x6b01
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x11
//	DW_AT_decl_column:
	.byte 0x01
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0069
//	DW_AT_type:
	.4byte 0x00000301
//	DW_TAG_variable:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0x05
//	DW_AT_decl_column:
	.byte 0x11
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x746f7065
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000030d
//	DW_AT_location:
	.4byte 0x7f907603
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x05
//	DW_AT_decl_column:
	.byte 0x11
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x746f7065
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000030d
//	DW_TAG_variable:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0x05
//	DW_AT_decl_column:
	.byte 0x17
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x00726976
//	DW_AT_type:
	.4byte 0x0000030d
//	DW_AT_location:
	.4byte 0x7f987603
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x05
//	DW_AT_decl_column:
	.byte 0x17
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x00726976
//	DW_AT_type:
	.4byte 0x0000030d
	.byte 0x00
	.byte 0x00
//	DW_TAG_base_type:
	.byte 0x02
//	DW_AT_byte_size:
	.byte 0x04
//	DW_AT_encoding:
	.byte 0x05
//	DW_AT_name:
	.4byte 0x00746e69
//	DW_TAG_pointer_type:
	.byte 0x09
//	DW_AT_type:
	.4byte 0x0000030d
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
//	DW_TAG_variable:
	.byte 0x0a
//	DW_AT_decl_line:
	.byte 0x05
//	DW_AT_decl_column:
	.byte 0x11
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x746f7065
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000030d
//	DW_AT_declaration:
	.byte 0x01
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_variable:
	.byte 0x0a
//	DW_AT_decl_line:
	.byte 0x05
//	DW_AT_decl_column:
	.byte 0x17
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_accessibility:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x00726976
//	DW_AT_type:
	.4byte 0x0000030d
//	DW_AT_declaration:
	.byte 0x01
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
	.2byte 0x0000
	.byte 0x04
	.byte 0x05
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x39
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x49
	.byte 0x13
	.byte 0x03
	.byte 0x08
	.byte 0x02
	.byte 0x0a
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
	.byte 0x09
	.byte 0x0f
	.byte 0x00
	.byte 0x49
	.byte 0x13
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
	.byte 0x3c
	.byte 0x0c
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
	.8byte ..___tag_value_forces.2
	.8byte ..___tag_value_forces.69-..___tag_value_forces.2
	.byte 0x04
	.4byte ..___tag_value_forces.4-..___tag_value_forces.2
	.4byte 0x0290070c
	.byte 0x04
	.4byte ..___tag_value_forces.6-..___tag_value_forces.4
	.4byte 0x03091483
	.2byte 0x0403
	.4byte ..___tag_value_forces.8-..___tag_value_forces.6
	.4byte 0x06091386
	.2byte 0x0406
	.4byte ..___tag_value_forces.10-..___tag_value_forces.8
	.4byte 0x0f09188f
	.2byte 0x040f
	.4byte ..___tag_value_forces.12-..___tag_value_forces.10
	.4byte 0x0e09178e
	.2byte 0x040e
	.4byte ..___tag_value_forces.14-..___tag_value_forces.12
	.4byte 0x0d09168d
	.2byte 0x040d
	.4byte ..___tag_value_forces.16-..___tag_value_forces.14
	.4byte 0x0c09158c
	.2byte 0x040c
	.4byte ..___tag_value_forces.18-..___tag_value_forces.16
	.8byte 0x168d158c13861483
	.4byte 0x188f178e
	.byte 0x04
	.4byte ..___tag_value_forces.24-..___tag_value_forces.18
	.4byte 0x040f0f09
	.4byte ..___tag_value_forces.25-..___tag_value_forces.24
	.4byte 0x040e0e09
	.4byte ..___tag_value_forces.26-..___tag_value_forces.25
	.4byte 0x040d0d09
	.4byte ..___tag_value_forces.27-..___tag_value_forces.26
	.4byte 0x040c0c09
	.4byte ..___tag_value_forces.28-..___tag_value_forces.27
	.4byte 0x04030309
	.4byte ..___tag_value_forces.29-..___tag_value_forces.28
	.4byte 0x04060609
	.4byte ..___tag_value_forces.31-..___tag_value_forces.29
	.4byte 0x0408070c
	.4byte ..___tag_value_forces.32-..___tag_value_forces.31
	.8byte 0x138614830290070c
	.8byte 0x188f178e168d158c
	.byte 0x04
	.4byte ..___tag_value_forces.45-..___tag_value_forces.32
	.8byte 0x0c09060609030309
	.8byte 0x090e0e090d0d090c
	.2byte 0x0f0f
	.byte 0x04
	.4byte ..___tag_value_forces.52-..___tag_value_forces.45
	.4byte 0x0290070c
	.byte 0x04
	.4byte ..___tag_value_forces.54-..___tag_value_forces.52
	.4byte 0x06091386
	.2byte 0x0406
	.4byte ..___tag_value_forces.56-..___tag_value_forces.54
	.4byte 0x03091483
	.2byte 0x0403
	.4byte ..___tag_value_forces.58-..___tag_value_forces.56
	.4byte 0x0f09188f
	.2byte 0x040f
	.4byte ..___tag_value_forces.60-..___tag_value_forces.58
	.4byte 0x0e09178e
	.2byte 0x040e
	.4byte ..___tag_value_forces.62-..___tag_value_forces.60
	.4byte 0x0d09168d
	.2byte 0x040d
	.4byte ..___tag_value_forces.64-..___tag_value_forces.62
	.4byte 0x0c09158c
	.2byte 0x040c
	.4byte ..___tag_value_forces.67-..___tag_value_forces.64
	.4byte 0x0008070c
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
	.8byte ..___tag_value_forces.2
	.8byte ..___tag_value_forces.69-..___tag_value_forces.2
	.byte 0x04
	.4byte ..___tag_value_forces.4-..___tag_value_forces.2
	.4byte 0x0290070c
	.byte 0x04
	.4byte ..___tag_value_forces.6-..___tag_value_forces.4
	.4byte 0x03091483
	.2byte 0x0403
	.4byte ..___tag_value_forces.8-..___tag_value_forces.6
	.4byte 0x06091386
	.2byte 0x0406
	.4byte ..___tag_value_forces.10-..___tag_value_forces.8
	.4byte 0x0f09188f
	.2byte 0x040f
	.4byte ..___tag_value_forces.12-..___tag_value_forces.10
	.4byte 0x0e09178e
	.2byte 0x040e
	.4byte ..___tag_value_forces.14-..___tag_value_forces.12
	.4byte 0x0d09168d
	.2byte 0x040d
	.4byte ..___tag_value_forces.16-..___tag_value_forces.14
	.4byte 0x0c09158c
	.2byte 0x040c
	.4byte ..___tag_value_forces.18-..___tag_value_forces.16
	.8byte 0x168d158c13861483
	.4byte 0x188f178e
	.byte 0x04
	.4byte ..___tag_value_forces.24-..___tag_value_forces.18
	.4byte 0x040f0f09
	.4byte ..___tag_value_forces.25-..___tag_value_forces.24
	.4byte 0x040e0e09
	.4byte ..___tag_value_forces.26-..___tag_value_forces.25
	.4byte 0x040d0d09
	.4byte ..___tag_value_forces.27-..___tag_value_forces.26
	.4byte 0x040c0c09
	.4byte ..___tag_value_forces.28-..___tag_value_forces.27
	.4byte 0x04030309
	.4byte ..___tag_value_forces.29-..___tag_value_forces.28
	.4byte 0x04060609
	.4byte ..___tag_value_forces.31-..___tag_value_forces.29
	.4byte 0x0408070c
	.4byte ..___tag_value_forces.32-..___tag_value_forces.31
	.8byte 0x138614830290070c
	.8byte 0x188f178e168d158c
	.byte 0x04
	.4byte ..___tag_value_forces.45-..___tag_value_forces.32
	.8byte 0x0c09060609030309
	.8byte 0x090e0e090d0d090c
	.2byte 0x0f0f
	.byte 0x04
	.4byte ..___tag_value_forces.52-..___tag_value_forces.45
	.4byte 0x0290070c
	.byte 0x04
	.4byte ..___tag_value_forces.54-..___tag_value_forces.52
	.4byte 0x06091386
	.2byte 0x0406
	.4byte ..___tag_value_forces.56-..___tag_value_forces.54
	.4byte 0x03091483
	.2byte 0x0403
	.4byte ..___tag_value_forces.58-..___tag_value_forces.56
	.4byte 0x0f09188f
	.2byte 0x040f
	.4byte ..___tag_value_forces.60-..___tag_value_forces.58
	.4byte 0x0e09178e
	.2byte 0x040e
	.4byte ..___tag_value_forces.62-..___tag_value_forces.60
	.4byte 0x0d09168d
	.2byte 0x040d
	.4byte ..___tag_value_forces.64-..___tag_value_forces.62
	.4byte 0x0c09158c
	.2byte 0x040c
	.4byte ..___tag_value_forces.67-..___tag_value_forces.64
	.4byte 0x0008070c
	.section .text
.LNDBG_TXe:
# End
