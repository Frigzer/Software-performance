# mark_description "Intel(R) C Intel(R) 64 Compiler Classic for applications running on Intel(R) 64, Version 2021.7.1 Build 2022";
# mark_description "1019_000000";
# mark_description "-Wno-unused-result -S -O3";
	.file "mat_vec.c"
	.text
..TXTST0:
.L_2__routine_start_mat_vec_0:
# -- Begin  mat_vec
	.text
# mark_begin;
       .align    16,0x90
	.globl mat_vec
# --- mat_vec(double *, double *, double *, int)
mat_vec:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %ecx
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_mat_vec.1:
..L2:
                                                          #7.1
        movq      %rdi, %r9                                     #7.1
        movslq    %ecx, %r10                                    #7.1
        xorl      %r8d, %r8d                                    #20.3
        testq     %r10, %r10                                    #20.19
        jle       ..B1.26       # Prob 9%                       #20.19
                                # LOE rdx rbx rbp rsi r8 r9 r10 r12 r13 r14 r15 ecx
..B1.3:                         # Preds ..B1.1 ..B1.24
                                # Execution count [4.50e+00]
        pxor      %xmm0, %xmm0                                  #21.16
        cmpq      $8, %r10                                      #24.5
        jl        ..B1.27       # Prob 10%                      #24.5
                                # LOE rdx rbx rbp rsi r8 r9 r10 r12 r13 r14 r15 ecx xmm0
..B1.4:                         # Preds ..B1.3
                                # Execution count [4.50e+00]
        movq      %r9, %rax                                     #24.5
        andq      $15, %rax                                     #24.5
        testl     %eax, %eax                                    #24.5
        je        ..B1.7        # Prob 50%                      #24.5
                                # LOE rdx rbx rbp rsi r8 r9 r10 r12 r13 r14 r15 eax ecx xmm0
..B1.5:                         # Preds ..B1.4
                                # Execution count [4.50e+00]
        testb     $7, %al                                       #24.5
        jne       ..B1.27       # Prob 10%                      #24.5
                                # LOE rdx rbx rbp rsi r8 r9 r10 r12 r13 r14 r15 ecx xmm0
..B1.6:                         # Preds ..B1.5
                                # Execution count [2.25e+00]
        movl      $1, %eax                                      #24.5
                                # LOE rdx rbx rbp rsi r8 r9 r10 r12 r13 r14 r15 eax ecx xmm0
..B1.7:                         # Preds ..B1.6 ..B1.4
                                # Execution count [4.50e+00]
        movl      %eax, %r11d                                   #24.5
        lea       8(%r11), %rdi                                 #24.5
        cmpq      %rdi, %r10                                    #24.5
        jl        ..B1.27       # Prob 10%                      #24.5
                                # LOE rdx rbx rbp rsi r8 r9 r10 r11 r12 r13 r14 r15 eax ecx xmm0
..B1.8:                         # Preds ..B1.7
                                # Execution count [5.00e+00]
        movl      %ecx, %edi                                    #24.5
        subl      %eax, %edi                                    #24.5
        andl      $7, %edi                                      #24.5
        negl      %edi                                          #24.5
        addl      %ecx, %edi                                    #24.5
        movslq    %edi, %rdi                                    #24.5
        testl     %eax, %eax                                    #24.5
        movl      $0, %eax                                      #24.5
        jbe       ..B1.12       # Prob 10%                      #24.5
                                # LOE rax rdx rbx rbp rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 ecx xmm0
..B1.10:                        # Preds ..B1.8 ..B1.10
                                # Execution count [2.50e+01]
        movsd     (%rsi,%rax,8), %xmm1                          #25.24
        mulsd     (%r9,%rax,8), %xmm1                           #25.24
        incq      %rax                                          #24.5
        addsd     %xmm1, %xmm0                                  #25.9
        cmpq      %r11, %rax                                    #24.5
        jb        ..B1.10       # Prob 82%                      #24.5
                                # LOE rax rdx rbx rbp rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 ecx xmm0
..B1.12:                        # Preds ..B1.10 ..B1.8
                                # Execution count [2.50e+01]
        lea       (%rsi,%r11,8), %rax                           #25.24
        pxor      %xmm2, %xmm2                                  #21.16
        pxor      %xmm3, %xmm3                                  #21.16
        movaps    %xmm2, %xmm1                                  #21.16
        movsd     %xmm0, %xmm3                                  #21.16
        movaps    %xmm1, %xmm0                                  #21.16
        testq     $15, %rax                                     #24.5
        je        ..B1.16       # Prob 60%                      #24.5
                                # LOE rdx rbx rbp rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 ecx xmm0 xmm1 xmm2 xmm3
..B1.13:                        # Preds ..B1.12
                                # Execution count [4.50e+00]
        lea       (%r9,%r11,8), %rax                            #24.5
        .align    16,0x90
                                # LOE rax rdx rbx rbp rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 ecx xmm0 xmm1 xmm2 xmm3
..B1.14:                        # Preds ..B1.14 ..B1.13
                                # Execution count [2.50e+01]
        movups    (%rsi,%r11,8), %xmm4                          #25.24
        movups    16(%rsi,%r11,8), %xmm5                        #25.24
        movups    32(%rsi,%r11,8), %xmm6                        #25.24
        movups    48(%rsi,%r11,8), %xmm7                        #25.24
        mulpd     (%rax), %xmm4                                 #25.24
        mulpd     16(%rax), %xmm5                               #25.24
        mulpd     32(%rax), %xmm6                               #25.24
        mulpd     48(%rax), %xmm7                               #25.24
        addpd     %xmm4, %xmm3                                  #25.9
        addpd     %xmm5, %xmm2                                  #25.9
        addpd     %xmm6, %xmm1                                  #25.9
        addpd     %xmm7, %xmm0                                  #25.9
        addq      $8, %r11                                      #24.5
        addq      $64, %rax                                     #24.5
        cmpq      %rdi, %r11                                    #24.5
        jb        ..B1.14       # Prob 82%                      #24.5
        jmp       ..B1.19       # Prob 100%                     #24.5
                                # LOE rax rdx rbx rbp rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 ecx xmm0 xmm1 xmm2 xmm3
..B1.16:                        # Preds ..B1.12
                                # Execution count [4.50e+00]
        lea       (%r9,%r11,8), %rax                            #24.5
        .align    16,0x90
                                # LOE rax rdx rbx rbp rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 ecx xmm0 xmm1 xmm2 xmm3
..B1.17:                        # Preds ..B1.17 ..B1.16
                                # Execution count [2.50e+01]
        movups    (%rsi,%r11,8), %xmm4                          #25.24
        movups    16(%rsi,%r11,8), %xmm5                        #25.24
        movups    32(%rsi,%r11,8), %xmm6                        #25.24
        movups    48(%rsi,%r11,8), %xmm7                        #25.24
        addq      $8, %r11                                      #24.5
        mulpd     (%rax), %xmm4                                 #25.24
        mulpd     16(%rax), %xmm5                               #25.24
        mulpd     32(%rax), %xmm6                               #25.24
        mulpd     48(%rax), %xmm7                               #25.24
        addpd     %xmm4, %xmm3                                  #25.9
        addpd     %xmm5, %xmm2                                  #25.9
        addpd     %xmm6, %xmm1                                  #25.9
        addpd     %xmm7, %xmm0                                  #25.9
        addq      $64, %rax                                     #24.5
        cmpq      %rdi, %r11                                    #24.5
        jb        ..B1.17       # Prob 82%                      #24.5
                                # LOE rax rdx rbx rbp rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 ecx xmm0 xmm1 xmm2 xmm3
..B1.19:                        # Preds ..B1.17 ..B1.14
                                # Execution count [4.50e+00]
        addpd     %xmm2, %xmm3                                  #21.16
        addpd     %xmm0, %xmm1                                  #21.16
        addpd     %xmm1, %xmm3                                  #21.16
        movaps    %xmm3, %xmm0                                  #21.16
        unpckhpd  %xmm3, %xmm0                                  #21.16
        addsd     %xmm0, %xmm3                                  #21.16
        movaps    %xmm3, %xmm0                                  #21.16
                                # LOE rdx rbx rbp rsi rdi r8 r9 r10 r12 r13 r14 r15 ecx xmm0
..B1.20:                        # Preds ..B1.19 ..B1.27
                                # Execution count [5.00e+00]
        cmpq      %r10, %rdi                                    #24.5
        jae       ..B1.24       # Prob 10%                      #24.5
                                # LOE rdx rbx rbp rsi rdi r8 r9 r10 r12 r13 r14 r15 ecx xmm0
..B1.22:                        # Preds ..B1.20 ..B1.22
                                # Execution count [2.50e+01]
        movsd     (%rsi,%rdi,8), %xmm1                          #25.24
        mulsd     (%r9,%rdi,8), %xmm1                           #25.24
        incq      %rdi                                          #24.5
        addsd     %xmm1, %xmm0                                  #25.9
        cmpq      %r10, %rdi                                    #24.5
        jb        ..B1.22       # Prob 82%                      #24.5
                                # LOE rdx rbx rbp rsi rdi r8 r9 r10 r12 r13 r14 r15 ecx xmm0
..B1.24:                        # Preds ..B1.22 ..B1.20
                                # Execution count [5.00e+00]
        movsd     %xmm0, (%rdx,%r8,8)                           #29.5
        incq      %r8                                           #20.3
        lea       (%r9,%r10,8), %r9                             #20.3
        cmpq      %r10, %r8                                     #20.3
        jb        ..B1.3        # Prob 82%                      #20.3
                                # LOE rdx rbx rbp rsi r8 r9 r10 r12 r13 r14 r15 ecx
..B1.26:                        # Preds ..B1.24 ..B1.1
                                # Execution count [1.00e+00]
        ret                                                     #94.1
                                # LOE
..B1.27:                        # Preds ..B1.3 ..B1.5 ..B1.7
                                # Execution count [4.50e-01]: Infreq
        xorl      %edi, %edi                                    #24.5
        jmp       ..B1.20       # Prob 100%                     #24.5
        .align    16,0x90
                                # LOE rdx rbx rbp rsi rdi r8 r9 r10 r12 r13 r14 r15 ecx xmm0
	.cfi_endproc
# mark_end;
	.type	mat_vec,@function
	.size	mat_vec,.-mat_vec
..LNmat_vec.0:
	.data
# -- End  mat_vec
	.data
	.section .note.GNU-stack, ""
# End
