# mark_description "Intel(R) C Intel(R) 64 Compiler Classic for applications running on Intel(R) 64, Version 2021.7.1 Build 2022";
# mark_description "1019_000000";
# mark_description "-no-vec -Wno-unused-result -S -O3";
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
        xorl      %r8d, %r8d                                    #12.3
        testl     %ecx, %ecx                                    #12.13
        jle       ..B1.22       # Prob 9%                       #12.13
                                # LOE rdx rbx rbp rsi rdi r8 r12 r13 r14 r15 ecx
..B1.2:                         # Preds ..B1.1
                                # Execution count [0.00e+00]
        movl      %ecx, %r10d                                   #14.5
        xorl      %r11d, %r11d                                  #12.3
        movslq    %ecx, %r9                                     #15.19
        xorl      %eax, %eax                                    #12.3
        incl      %eax                                          #12.3
        shrl      $1, %r10d                                     #14.5
        movq      %r13, -8(%rsp)                                #12.3[spill]
	.cfi_offset 13, -16
        xorl      %r13d, %r13d                                  #12.3
        movq      %r14, -40(%rsp)                               #12.3[spill]
        movq      %r15, -32(%rsp)                               #12.3[spill]
        movq      %rbx, -24(%rsp)                               #12.3[spill]
        movq      %rbp, -16(%rsp)                               #12.3[spill]
	.cfi_offset 3, -32
	.cfi_offset 6, -24
	.cfi_offset 14, -48
	.cfi_offset 15, -40
                                # LOE rdx rsi rdi r8 r9 r11 r12 eax ecx r10d r13d
..B1.3:                         # Preds ..B1.20 ..B1.2
                                # Execution count [0.00e+00]
        xorl      %ebx, %ebx                                    #13.5
        movq      %rbx, (%rdx,%r8,8)                            #13.5
        pxor      %xmm1, %xmm1                                  #13.5
        cmpl      $6, %ecx                                      #14.5
        jle       ..B1.14       # Prob 50%                      #14.5
                                # LOE rdx rsi rdi r8 r9 r11 r12 eax ecx r10d r13d xmm1
..B1.4:                         # Preds ..B1.3
                                # Execution count [0.00e+00]
        lea       (%rdx,%r8,8), %r14                            #15.7
        movq      %r14, %rbx                                    #15.22
        lea       (,%r9,8), %rbp                                #14.5
        subq      %rsi, %rbx                                    #15.22
        cmpq      %rbp, %rbx                                    #14.5
        jge       ..B1.6        # Prob 50%                      #14.5
                                # LOE rdx rbx rbp rsi rdi r8 r9 r11 r12 r14 eax ecx r10d r13d xmm1
..B1.5:                         # Preds ..B1.4
                                # Execution count [0.00e+00]
        negq      %rbx                                          #15.7
        cmpq      $8, %rbx                                      #14.5
        jl        ..B1.14       # Prob 50%                      #14.5
                                # LOE rdx rbp rsi rdi r8 r9 r11 r12 r14 eax ecx r10d r13d xmm1
..B1.6:                         # Preds ..B1.4 ..B1.5
                                # Execution count [0.00e+00]
        lea       (,%r9,8), %rbx                                #15.13
        imulq     %r8, %rbx                                     #15.19
        addq      %rdi, %rbx                                    #15.19
        subq      %rbx, %r14                                    #15.13
        cmpq      %rbp, %r14                                    #14.5
        jge       ..B1.8        # Prob 50%                      #14.5
                                # LOE rdx rsi rdi r8 r9 r11 r12 r14 eax ecx r10d r13d xmm1
..B1.7:                         # Preds ..B1.6
                                # Execution count [0.00e+00]
        negq      %r14                                          #15.7
        cmpq      $8, %r14                                      #14.5
        jl        ..B1.14       # Prob 50%                      #14.5
                                # LOE rdx rsi rdi r8 r9 r11 r12 eax ecx r10d r13d xmm1
..B1.8:                         # Preds ..B1.6 ..B1.7
                                # Execution count [2.50e+00]
        movl      %eax, %r14d                                   #14.5
        movl      %r13d, %ebp                                   #14.5
        testl     %r10d, %r10d                                  #14.5
        je        ..B1.12       # Prob 10%                      #14.5
                                # LOE rdx rsi rdi r8 r9 r11 r12 eax ecx ebp r10d r13d r14d xmm1
..B1.9:                         # Preds ..B1.8
                                # Execution count [2.25e+00]
        movl      %r8d, %ebx                                    #15.7
        pxor      %xmm1, %xmm1                                  #15.7
        imull     %ecx, %ebx                                    #15.19
        movaps    %xmm1, %xmm0                                  #15.7
                                # LOE rdx rsi rdi r8 r9 r11 r12 eax ecx ebx ebp r10d r13d xmm0 xmm1
..B1.10:                        # Preds ..B1.10 ..B1.9
                                # Execution count [6.25e+00]
        movslq    %ebp, %r15                                    #15.7
        lea       (%rbx,%rbp,2), %r14d                          #15.19
        movslq    %r14d, %r14                                   #15.19
        incl      %ebp                                          #14.5
        shlq      $4, %r15                                      #15.7
        movsd     (%rdi,%r14,8), %xmm2                          #15.13
        movsd     8(%rdi,%r14,8), %xmm3                         #15.13
        mulsd     (%rsi,%r15), %xmm2                            #15.22
        mulsd     8(%rsi,%r15), %xmm3                           #15.22
        addsd     %xmm2, %xmm1                                  #15.7
        addsd     %xmm3, %xmm0                                  #15.7
        cmpl      %r10d, %ebp                                   #14.5
        jb        ..B1.10       # Prob 64%                      #14.5
                                # LOE rdx rsi rdi r8 r9 r11 r12 eax ecx ebx ebp r10d r13d xmm0 xmm1
..B1.11:                        # Preds ..B1.10
                                # Execution count [2.25e+00]
        addsd     %xmm0, %xmm1                                  #15.7
        movsd     %xmm1, (%rdx,%r8,8)                           #15.7
        lea       1(%rbp,%rbp), %r14d                           #15.7
                                # LOE rdx rsi rdi r8 r9 r11 r12 eax ecx r10d r13d r14d xmm1
..B1.12:                        # Preds ..B1.11 ..B1.8
                                # Execution count [2.50e+00]
        lea       -1(%r14), %ebx                                #14.5
        cmpl      %ecx, %ebx                                    #14.5
        jae       ..B1.20       # Prob 10%                      #14.5
                                # LOE rdx rsi rdi r8 r9 r11 r12 eax ecx r10d r13d r14d xmm1
..B1.13:                        # Preds ..B1.12
                                # Execution count [2.25e+00]
        movslq    %r14d, %r14                                   #15.19
        lea       (%r11,%r14), %rbx                             #15.19
        movsd     -8(%rdi,%rbx,8), %xmm0                        #15.13
        mulsd     -8(%rsi,%r14,8), %xmm0                        #15.22
        addsd     %xmm0, %xmm1                                  #15.7
        movsd     %xmm1, (%rdx,%r8,8)                           #15.7
        jmp       ..B1.20       # Prob 100%                     #15.7
                                # LOE rdx rsi rdi r8 r9 r11 r12 eax ecx r10d r13d
..B1.14:                        # Preds ..B1.3 ..B1.5 ..B1.7
                                # Execution count [2.50e+00]
        movl      %eax, %r14d                                   #14.5
        movl      %r13d, %ebp                                   #14.5
        testl     %r10d, %r10d                                  #14.5
        je        ..B1.18       # Prob 10%                      #14.5
                                # LOE rdx rsi rdi r8 r9 r11 r12 eax ecx ebp r10d r13d r14d
..B1.15:                        # Preds ..B1.14
                                # Execution count [2.25e+00]
        movl      %r8d, %ebx                                    #15.7
        movsd     (%rdx,%r8,8), %xmm0                           #15.7
        imull     %ecx, %ebx                                    #15.19
        .align    16,0x90
                                # LOE rdx rsi rdi r8 r9 r11 r12 eax ecx ebx ebp r10d r13d xmm0
..B1.16:                        # Preds ..B1.16 ..B1.15
                                # Execution count [6.25e+00]
        movslq    %ebp, %r15                                    #15.7
        lea       (%rbx,%rbp,2), %r14d                          #15.19
        movslq    %r14d, %r14                                   #15.19
        incl      %ebp                                          #14.5
        shlq      $4, %r15                                      #15.7
        movsd     (%rdi,%r14,8), %xmm1                          #15.13
        mulsd     (%rsi,%r15), %xmm1                            #15.22
        addsd     %xmm1, %xmm0                                  #15.7
        movsd     %xmm0, (%rdx,%r8,8)                           #15.7
        movsd     8(%rdi,%r14,8), %xmm2                         #15.13
        mulsd     8(%rsi,%r15), %xmm2                           #15.22
        addsd     %xmm2, %xmm0                                  #15.7
        movsd     %xmm0, (%rdx,%r8,8)                           #15.7
        cmpl      %r10d, %ebp                                   #14.5
        jb        ..B1.16       # Prob 64%                      #14.5
                                # LOE rdx rsi rdi r8 r9 r11 r12 eax ecx ebx ebp r10d r13d xmm0
..B1.17:                        # Preds ..B1.16
                                # Execution count [2.25e+00]
        lea       1(%rbp,%rbp), %r14d                           #15.7
                                # LOE rdx rsi rdi r8 r9 r11 r12 eax ecx r10d r13d r14d
..B1.18:                        # Preds ..B1.17 ..B1.14
                                # Execution count [2.50e+00]
        lea       -1(%r14), %ebx                                #14.5
        cmpl      %ecx, %ebx                                    #14.5
        jae       ..B1.20       # Prob 10%                      #14.5
                                # LOE rdx rsi rdi r8 r9 r11 r12 eax ecx r10d r13d r14d
..B1.19:                        # Preds ..B1.18
                                # Execution count [2.25e+00]
        movslq    %r14d, %r14                                   #15.19
        lea       (%r11,%r14), %rbx                             #15.19
        movsd     -8(%rdi,%rbx,8), %xmm0                        #15.13
        mulsd     -8(%rsi,%r14,8), %xmm0                        #15.22
        addsd     (%rdx,%r8,8), %xmm0                           #15.7
        movsd     %xmm0, (%rdx,%r8,8)                           #15.7
                                # LOE rdx rsi rdi r8 r9 r11 r12 eax ecx r10d r13d
..B1.20:                        # Preds ..B1.18 ..B1.12 ..B1.13 ..B1.19
                                # Execution count [5.00e+00]
        incq      %r8                                           #12.3
        addq      %r9, %r11                                     #12.3
        cmpq      %r9, %r8                                      #12.3
        jb        ..B1.3        # Prob 82%                      #12.3
                                # LOE rdx rsi rdi r8 r9 r11 r12 eax ecx r10d r13d
..B1.21:                        # Preds ..B1.20
                                # Execution count [9.00e-01]
        movq      -8(%rsp), %r13                                #[spill]
	.cfi_restore 13
        movq      -40(%rsp), %r14                               #[spill]
	.cfi_restore 14
        movq      -32(%rsp), %r15                               #[spill]
	.cfi_restore 15
        movq      -24(%rsp), %rbx                               #[spill]
	.cfi_restore 3
        movq      -16(%rsp), %rbp                               #[spill]
	.cfi_restore 6
                                # LOE rbx rbp r12 r13 r14 r15
..B1.22:                        # Preds ..B1.1 ..B1.21
                                # Execution count [1.00e+00]
        ret                                                     #94.1
        .align    16,0x90
                                # LOE
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
