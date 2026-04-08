	.file	"mat_vec.c"
	.text
	.p2align 4
	.globl	mat_vec
	.type	mat_vec, @function
mat_vec:
.LFB39:
	.cfi_startproc
	endbr64
	testl	%ecx, %ecx
	jle	.L11
	movl	%ecx, %r11d
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdx, %r9
	xorl	%r10d, %r10d
	leal	-1(%r11), %eax
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movslq	%ecx, %rbp
	pxor	%xmm3, %xmm3
	leaq	8(%rdx,%rax,8), %r12
	movl	%r11d, %eax
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%r11d, %ebx
	shrl	%eax
	salq	$3, %rbp
	movq	%rdi, %rcx
	andl	$-2, %ebx
	leal	-1(%rax), %r8d
	addq	$1, %r8
	salq	$4, %r8
	.p2align 4,,10
	.p2align 3
.L6:
	movl	%r10d, %eax
	cmpl	$1, %r11d
	je	.L7
	xorl	%eax, %eax
	movapd	%xmm3, %xmm1
	.p2align 4,,10
	.p2align 3
.L4:
	movupd	(%rcx,%rax), %xmm0
	movupd	(%rsi,%rax), %xmm4
	addq	$16, %rax
	mulpd	%xmm4, %xmm0
	addsd	%xmm0, %xmm1
	unpckhpd	%xmm0, %xmm0
	addsd	%xmm0, %xmm1
	cmpq	%rax, %r8
	jne	.L4
	leal	(%r10,%rbx), %eax
	movslq	%ebx, %rdx
	cmpl	%ebx, %r11d
	je	.L5
.L3:
	cltq
	movsd	(%rsi,%rdx,8), %xmm0
	mulsd	(%rdi,%rax,8), %xmm0
	addsd	%xmm0, %xmm1
.L5:
	movsd	%xmm1, (%r9)
	addq	$8, %r9
	addl	%r11d, %r10d
	addq	%rbp, %rcx
	cmpq	%r12, %r9
	jne	.L6
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	.cfi_restore_state
	movapd	%xmm3, %xmm1
	xorl	%edx, %edx
	jmp	.L3
.L11:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	ret
	.cfi_endproc
.LFE39:
	.size	mat_vec, .-mat_vec
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04.3) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
