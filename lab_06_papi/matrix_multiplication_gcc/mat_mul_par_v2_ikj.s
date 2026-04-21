	.file	"mat_mul_par_papi.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"wersja cache blocking"
	.text
	.p2align 4
	.globl	mat_mul_par_papi
	.type	mat_mul_par_papi, @function
mat_mul_par_papi:
.LFB5512:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	.cfi_offset 15, -24
	movl	%ecx, %r15d
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$96, %rsp
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, 24(%rsp)
	movq	%rsi, 16(%rsp)
	movq	%rdx, 8(%rsp)
	call	omp_get_thread_num@PLT
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	testl	%r15d, %r15d
	jle	.L13
	movq	$0, 72(%rsp)
	leal	(%r15,%r15,2), %eax
	xorl	%r14d, %r14d
	sall	$4, %eax
	cltq
	movq	%rax, 80(%rsp)
	movslq	%r15d, %rax
	leaq	0(,%rax,8), %r13
.L3:
	movq	72(%rsp), %rax
	movq	8(%rsp), %rbx
	xorl	%r12d, %r12d
	movl	$47, %edi
	movq	$0, 64(%rsp)
	salq	$3, %rax
	addq	%rax, %rbx
	addq	24(%rsp), %rax
	movq	%rax, 32(%rsp)
	movq	%rbx, 48(%rsp)
	leal	47(%r14), %ebx
.L10:
	movq	16(%rsp), %rax
	movq	64(%rsp), %rsi
	movl	$0, 92(%rsp)
	movl	%r12d, %r11d
	leaq	(%rax,%rsi,8), %r10
	movq	32(%rsp), %rax
	leaq	(%rax,%r12,8), %rax
	movq	%rax, 40(%rsp)
	movq	48(%rsp), %rax
	movq	%rax, 56(%rsp)
.L9:
	movq	56(%rsp), %rdx
	movq	40(%rsp), %r9
	movl	%r14d, %r8d
.L7:
	vmovapd	(%rdx), %ymm12
	vmovapd	32(%rdx), %ymm11
	movq	%r10, %rax
	movq	%r9, %rsi
	vmovapd	64(%rdx), %ymm10
	vmovapd	96(%rdx), %ymm9
	movl	%r11d, %ecx
	vmovapd	128(%rdx), %ymm8
	vmovapd	160(%rdx), %ymm7
	vmovapd	192(%rdx), %ymm6
	vmovapd	224(%rdx), %ymm5
	vmovapd	256(%rdx), %ymm4
	vmovapd	288(%rdx), %ymm3
	vmovapd	320(%rdx), %ymm2
	vmovapd	352(%rdx), %ymm1
	.p2align 4,,10
	.p2align 3
.L4:
	vbroadcastsd	(%rsi), %ymm0
	vfmadd231pd	(%rax), %ymm0, %ymm12
	incl	%ecx
	addq	$8, %rsi
	vmovapd	%ymm12, (%rdx)
	vfmadd231pd	32(%rax), %ymm0, %ymm11
	vmovapd	%ymm11, 32(%rdx)
	vfmadd231pd	64(%rax), %ymm0, %ymm10
	vmovapd	%ymm10, 64(%rdx)
	vfmadd231pd	96(%rax), %ymm0, %ymm9
	vmovapd	%ymm9, 96(%rdx)
	vfmadd231pd	128(%rax), %ymm0, %ymm8
	vmovapd	%ymm8, 128(%rdx)
	vfmadd231pd	160(%rax), %ymm0, %ymm7
	vmovapd	%ymm7, 160(%rdx)
	vfmadd231pd	192(%rax), %ymm0, %ymm6
	vmovapd	%ymm6, 192(%rdx)
	vfmadd231pd	224(%rax), %ymm0, %ymm5
	vmovapd	%ymm5, 224(%rdx)
	vfmadd231pd	256(%rax), %ymm0, %ymm4
	vmovapd	%ymm4, 256(%rdx)
	vfmadd231pd	288(%rax), %ymm0, %ymm3
	vmovapd	%ymm3, 288(%rdx)
	vfmadd231pd	320(%rax), %ymm0, %ymm2
	vmovapd	%ymm2, 320(%rdx)
	vfmadd231pd	352(%rax), %ymm0, %ymm1
	addq	%r13, %rax
	vmovapd	%ymm1, 352(%rdx)
	cmpl	%edi, %ecx
	jle	.L4
	incl	%r8d
	addq	%r13, %r9
	addq	%r13, %rdx
	cmpl	%ebx, %r8d
	jle	.L7
	addl	$48, 92(%rsp)
	movl	92(%rsp), %eax
	addq	$384, %r10
	addq	$384, 56(%rsp)
	cmpl	%eax, %r15d
	jg	.L9
	addq	$48, %r12
	movq	80(%rsp), %rsi
	addl	$48, %edi
	addq	%rsi, 64(%rsp)
	cmpl	%r12d, %r15d
	jg	.L10
	addl	$48, %r14d
	addq	%rsi, 72(%rsp)
	cmpl	%r14d, %r15d
	jg	.L3
	vzeroupper
.L13:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5512:
	.size	mat_mul_par_papi, .-mat_mul_par_papi
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
