	.file	"mat_vec.c"
	.text
	.p2align 4
	.globl	mat_vec
	.type	mat_vec, @function
mat_vec:
.LFB39:
	.cfi_startproc
	endbr64
	movl	%ecx, %r9d
	testl	%ecx, %ecx
	jle	.L1
	leal	-4(%rcx), %r8d
	movslq	%ecx, %r10
	leal	-1(%rcx), %eax
	shrl	$2, %r8d
	salq	$3, %r10
	leaq	8(%rdx,%rax,8), %r11
	addl	$1, %r8d
	.p2align 4,,10
	.p2align 3
.L5:
	cmpl	$3, %r9d
	jle	.L7
	pxor	%xmm1, %xmm1
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	movapd	%xmm1, %xmm2
	.p2align 4,,10
	.p2align 3
.L4:
	movupd	(%rsi,%rax), %xmm0
	movupd	(%rdi,%rax), %xmm3
	addl	$1, %ecx
	movupd	16(%rdi,%rax), %xmm4
	mulpd	%xmm3, %xmm0
	addpd	%xmm0, %xmm2
	movupd	16(%rsi,%rax), %xmm0
	addq	$32, %rax
	mulpd	%xmm4, %xmm0
	addpd	%xmm0, %xmm1
	cmpl	%ecx, %r8d
	ja	.L4
	movapd	%xmm2, %xmm5
	unpckhpd	%xmm5, %xmm5
	movapd	%xmm5, %xmm0
	addsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	unpckhpd	%xmm1, %xmm1
	addsd	%xmm1, %xmm0
.L3:
	movsd	%xmm0, (%rdx)
	addq	$8, %rdx
	addq	%r10, %rdi
	cmpq	%rdx, %r11
	jne	.L5
.L1:
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	pxor	%xmm0, %xmm0
	jmp	.L3
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
