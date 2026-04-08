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
	jle	.L1
	movslq	%ecx, %r8
	leal	-1(%rcx), %eax
	pxor	%xmm2, %xmm2
	movl	%ecx, %ecx
	salq	$3, %r8
	leaq	8(%rdx,%rax,8), %r9
	.p2align 4,,10
	.p2align 3
.L4:
	movq	$0x000000000, (%rdx)
	xorl	%eax, %eax
	movapd	%xmm2, %xmm1
	.p2align 4,,10
	.p2align 3
.L3:
	movsd	(%rdi,%rax,8), %xmm0
	mulsd	(%rsi,%rax,8), %xmm0
	addq	$1, %rax
	addsd	%xmm0, %xmm1
	movsd	%xmm1, (%rdx)
	cmpq	%rax, %rcx
	jne	.L3
	addq	$8, %rdx
	addq	%r8, %rdi
	cmpq	%r9, %rdx
	jne	.L4
.L1:
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
