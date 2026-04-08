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
        pushq     %r15                                          #7.1
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
        pushq     %rbx                                          #7.1
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
        pushq     %rbp                                          #7.1
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
        movq      %rsi, %r11                                    #7.1
        xorl      %esi, %esi                                    #53.3
        xorl      %r9d, %r9d                                    #54.17
        movslq    %ecx, %rbp                                    #7.1
        xorl      %r8d, %r8d                                    #54.17
        xorl      %r10d, %r10d                                  #54.17
        testl     %ecx, %ecx                                    #53.19
        jle       ..B1.14       # Prob 9%                       #53.19
                                # LOE rdx rbp rdi r9 r10 r11 r12 r13 r14 ecx esi r8d
..B1.2:                         # Preds ..B1.1
                                # Execution count [9.00e-01]
        movl      %ecx, %eax                                    #58.26
        lea       -4(%rcx), %ebx                                #58.26
        sarl      $1, %eax                                      #58.26
        shrl      $30, %eax                                     #58.26
        addl      %ecx, %eax                                    #58.26
        sarl      $2, %eax                                      #58.26
        movl      %eax, %r15d                                   #58.5
        andl      $-2, %r15d                                    #58.5
        movl      %r15d, -24(%rsp)                              #58.5[spill]
        movq      %r12, -48(%rsp)                               #58.5[spill]
        movq      %r13, -40(%rsp)                               #58.5[spill]
        movq      %r14, -32(%rsp)                               #58.5[spill]
	.cfi_offset 12, -80
	.cfi_offset 13, -72
	.cfi_offset 14, -64
                                # LOE rdx rbp rdi r9 r10 r11 eax ecx ebx esi r8d
..B1.3:                         # Preds ..B1.12 ..B1.2
                                # Execution count [5.00e+00]
        pxor      %xmm1, %xmm1                                  #54.17
        movaps    %xmm1, %xmm0                                  #54.29
        movaps    %xmm0, %xmm3                                  #54.41
        movaps    %xmm3, %xmm2                                  #54.53
        testl     %ebx, %ebx                                    #58.26
        js        ..B1.12       # Prob 50%                      #58.26
                                # LOE rdx rbp rdi r9 r10 r11 eax ecx ebx esi r8d xmm0 xmm1 xmm2 xmm3
..B1.4:                         # Preds ..B1.3
                                # Execution count [4.50e+00]
        cmpl      $2, %eax                                      #58.5
        jl        ..B1.15       # Prob 10%                      #58.5
                                # LOE rdx rbp rdi r9 r10 r11 eax ecx ebx esi r8d xmm0 xmm1 xmm2 xmm3
..B1.5:                         # Preds ..B1.4
                                # Execution count [4.50e+00]
        movl      -24(%rsp), %r15d                              #58.5[spill]
        xorl      %r14d, %r14d                                  #58.5
        pxor      %xmm1, %xmm1                                  #54.17
        lea       (%rdi,%r9,8), %r13                            #7.1
        movaps    %xmm1, %xmm0                                  #54.29
        movq      %r11, %r12                                    #59.9
        movaps    %xmm0, %xmm3                                  #54.41
        movl      %ecx, -16(%rsp)                               #59.9[spill]
        movl      %r15d, %ecx                                   #59.9
        movaps    %xmm3, %xmm2                                  #54.53
                                # LOE rdx rbp rdi r9 r10 r11 r12 r13 eax ecx ebx esi r8d r14d r15d xmm0 xmm1 xmm2 xmm3
..B1.6:                         # Preds ..B1.6 ..B1.5
                                # Execution count [2.50e+01]
        movsd     24(%r13), %xmm11                              #59.17
        addl      $2, %r14d                                     #58.5
        movsd     16(%r13), %xmm9                               #59.17
        movsd     8(%r13), %xmm7                                #59.17
        movsd     (%r13), %xmm5                                 #59.17
        movsd     24(%r12), %xmm10                              #59.29
        movsd     16(%r12), %xmm8                               #59.29
        movsd     8(%r12), %xmm6                                #59.29
        movsd     (%r12), %xmm4                                 #59.29
        movhpd    56(%r12), %xmm10                              #59.29
        movhpd    48(%r12), %xmm8                               #59.29
        movhpd    40(%r12), %xmm6                               #59.29
        movhpd    32(%r12), %xmm4                               #59.29
        addq      $64, %r12                                     #58.5
        movhpd    56(%r13), %xmm11                              #59.17
        movhpd    48(%r13), %xmm9                               #59.17
        movhpd    40(%r13), %xmm7                               #59.17
        movhpd    32(%r13), %xmm5                               #59.17
        addq      $64, %r13                                     #58.5
        mulpd     %xmm4, %xmm5                                  #59.29
        mulpd     %xmm6, %xmm7                                  #60.29
        mulpd     %xmm8, %xmm9                                  #61.29
        mulpd     %xmm10, %xmm11                                #62.29
        addpd     %xmm5, %xmm1                                  #59.9
        addpd     %xmm7, %xmm0                                  #60.9
        addpd     %xmm9, %xmm3                                  #61.9
        addpd     %xmm11, %xmm2                                 #62.9
        cmpl      %ecx, %r14d                                   #58.5
        jb        ..B1.6        # Prob 82%                      #58.5
                                # LOE rdx rbp rdi r9 r10 r11 r12 r13 eax ecx ebx esi r8d r14d r15d xmm0 xmm1 xmm2 xmm3
..B1.7:                         # Preds ..B1.6
                                # Execution count [4.50e+00]
        movaps    %xmm2, %xmm4                                  #54.53
        movaps    %xmm3, %xmm5                                  #54.41
        movaps    %xmm0, %xmm6                                  #54.29
        movaps    %xmm1, %xmm7                                  #54.17
        unpckhpd  %xmm2, %xmm4                                  #54.53
        unpckhpd  %xmm3, %xmm5                                  #54.41
        addsd     %xmm4, %xmm2                                  #54.53
        addsd     %xmm5, %xmm3                                  #54.41
        unpckhpd  %xmm0, %xmm6                                  #54.29
        unpckhpd  %xmm1, %xmm7                                  #54.17
        addsd     %xmm6, %xmm0                                  #54.29
        addsd     %xmm7, %xmm1                                  #54.17
        movl      -16(%rsp), %ecx                               #[spill]
                                # LOE rdx rbp rdi r9 r10 r11 eax ecx ebx esi r8d r15d xmm0 xmm1 xmm2 xmm3
..B1.8:                         # Preds ..B1.7 ..B1.15
                                # Execution count [5.00e+00]
        movslq    %r15d, %r12                                   #58.5
        shlq      $5, %r12                                      #59.29
        cmpl      %eax, %r15d                                   #58.5
        jae       ..B1.12       # Prob 10%                      #58.5
        .align    16,0x90
                                # LOE rdx rbp rdi r9 r10 r11 r12 eax ecx ebx esi r8d r15d xmm0 xmm1 xmm2 xmm3
..B1.10:                        # Preds ..B1.8 ..B1.10
                                # Execution count [2.50e+01]
        lea       (%r8,%r15,4), %r13d                           #59.9
        incl      %r15d                                         #58.5
        movslq    %r13d, %r13                                   #59.9
        movsd     (%rdi,%r13,8), %xmm4                          #59.17
        movsd     8(%rdi,%r13,8), %xmm5                         #60.17
        movsd     16(%rdi,%r13,8), %xmm6                        #61.17
        movsd     24(%rdi,%r13,8), %xmm7                        #62.17
        mulsd     (%r12,%r11), %xmm4                            #59.29
        mulsd     8(%r12,%r11), %xmm5                           #60.29
        mulsd     16(%r12,%r11), %xmm6                          #61.29
        addsd     %xmm4, %xmm1                                  #59.9
        mulsd     24(%r12,%r11), %xmm7                          #62.29
        addsd     %xmm5, %xmm0                                  #60.9
        addsd     %xmm6, %xmm3                                  #61.9
        addsd     %xmm7, %xmm2                                  #62.9
        addq      $32, %r12                                     #58.5
        cmpl      %eax, %r15d                                   #58.5
        jb        ..B1.10       # Prob 82%                      #58.5
                                # LOE rdx rbp rdi r9 r10 r11 r12 eax ecx ebx esi r8d r15d xmm0 xmm1 xmm2 xmm3
..B1.12:                        # Preds ..B1.10 ..B1.8 ..B1.3
                                # Execution count [5.00e+00]
        incl      %esi                                          #53.3
        addq      %rbp, %r9                                     #53.3
        addl      %ecx, %r8d                                    #53.3
        addsd     %xmm0, %xmm1                                  #66.25
        addsd     %xmm3, %xmm1                                  #66.32
        addsd     %xmm2, %xmm1                                  #66.39
        movsd     %xmm1, (%rdx,%r10,8)                          #68.5
        incq      %r10                                          #53.3
        cmpl      %ecx, %esi                                    #53.3
        jb        ..B1.3        # Prob 82%                      #53.3
                                # LOE rdx rbp rdi r9 r10 r11 eax ecx ebx esi r8d
..B1.13:                        # Preds ..B1.12
                                # Execution count [9.00e-01]
        movq      -48(%rsp), %r12                               #[spill]
	.cfi_restore 12
        movq      -40(%rsp), %r13                               #[spill]
	.cfi_restore 13
        movq      -32(%rsp), %r14                               #[spill]
	.cfi_restore 14
                                # LOE r12 r13 r14
..B1.14:                        # Preds ..B1.13 ..B1.1
                                # Execution count [1.00e+00]
	.cfi_restore 6
        popq      %rbp                                          #94.1
	.cfi_def_cfa_offset 24
	.cfi_restore 3
        popq      %rbx                                          #94.1
	.cfi_def_cfa_offset 16
	.cfi_restore 15
        popq      %r15                                          #94.1
	.cfi_def_cfa_offset 8
        ret                                                     #94.1
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -24
	.cfi_offset 6, -32
	.cfi_offset 12, -80
	.cfi_offset 13, -72
	.cfi_offset 14, -64
	.cfi_offset 15, -16
                                # LOE
..B1.15:                        # Preds ..B1.4
                                # Execution count [4.50e-01]: Infreq
        xorl      %r15d, %r15d                                  #58.5
        jmp       ..B1.8        # Prob 100%                     #58.5
        .align    16,0x90
                                # LOE rdx rbp rdi r9 r10 r11 eax ecx ebx esi r8d r15d xmm0 xmm1 xmm2 xmm3
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
