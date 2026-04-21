	.file	"mat_mul_driver.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Default matrix size %d - adjusted for block size %d to %d\n"
	.align 8
.LC6:
	.string	"mat_mul_par: nr_oper %lf, %lf\n"
	.align 8
.LC10:
	.string	"Execution time - %lf, \tGFLOPS = %lf \t( flop/cycle = %lf  - %lf GHz )\n\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB5512:
	.cfi_startproc
	endbr64
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	movl	$1056, %r8d
	movl	$48, %ecx
	pushq	-8(%r10)
	movl	$1080, %edx
	movl	$1, %edi
	leaq	.LC1(%rip), %rsi
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r14
	pushq	%r13
	.cfi_escape 0x10,0xe,0x2,0x76,0x78
	.cfi_escape 0x10,0xd,0x2,0x76,0x70
	xorl	%r13d, %r13d
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x60,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x68
	subq	$80, %rsp
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	-80(%rbp), %rdi
	movl	$8921088, %edx
	movl	$64, %esi
	call	posix_memalign@PLT
	leaq	-72(%rbp), %rdi
	movl	$8921088, %edx
	movl	$64, %esi
	testl	%eax, %eax
	cmove	-80(%rbp), %r13
	xorl	%r12d, %r12d
	call	posix_memalign@PLT
	movl	$8921088, %edx
	leaq	-64(%rbp), %rdi
	movl	$64, %esi
	testl	%eax, %eax
	cmove	-72(%rbp), %r12
	xorl	%r14d, %r14d
	call	posix_memalign@PLT
	vmovdqa	.LC0(%rip), %ymm3
	vmovdqa	.LC2(%rip), %ymm4
	leaq	8921088(%r13), %rdx
	testl	%eax, %eax
	vmovapd	.LC3(%rip), %ymm1
	cmove	-64(%rbp), %r14
	movq	%r13, %rax
	vmovdqa	%ymm3, %ymm5
	.p2align 4,,10
	.p2align 3
.L5:
	vmovdqa	%ymm5, %ymm0
	addq	$64, %rax
	vpaddd	%ymm4, %ymm5, %ymm5
	vcvtdq2pd	%xmm0, %ymm2
	vdivpd	%ymm1, %ymm2, %ymm2
	vextracti128	$0x1, %ymm0, %xmm0
	vcvtdq2pd	%xmm0, %ymm0
	vdivpd	%ymm1, %ymm0, %ymm0
	vmovapd	%ymm2, -64(%rax)
	vmovapd	%ymm0, -32(%rax)
	cmpq	%rax, %rdx
	jne	.L5
	vmovdqa	.LC4(%rip), %ymm5
	movq	%r12, %rax
	leaq	8921088(%r12), %rdx
	.p2align 4,,10
	.p2align 3
.L6:
	vmovdqa	%ymm3, %ymm0
	addq	$64, %rax
	vpaddd	%ymm4, %ymm3, %ymm3
	vpsubd	%ymm0, %ymm5, %ymm0
	vcvtdq2pd	%xmm0, %ymm2
	vdivpd	%ymm1, %ymm2, %ymm2
	vextracti128	$0x1, %ymm0, %xmm0
	vcvtdq2pd	%xmm0, %ymm0
	vdivpd	%ymm1, %ymm0, %ymm0
	vmovapd	%ymm2, -64(%rax)
	vmovapd	%ymm0, -32(%rax)
	cmpq	%rax, %rdx
	jne	.L6
	movl	$8921088, %edx
	xorl	%esi, %esi
	movq	%r14, %rdi
	vzeroupper
	call	memset@PLT
	vmovsd	.LC5(%rip), %xmm2
	vxorpd	%xmm1, %xmm1, %xmm1
	leaq	.LC6(%rip), %rsi
	movl	$1, %edi
	movl	$2, %eax
	vmovsd	%xmm2, %xmm2, %xmm0
	call	__printf_chk@PLT
	call	omp_get_wtime@PLT
	movl	$1056, %ecx
	movq	%r14, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	vmovsd	%xmm0, -88(%rbp)
	call	mat_mul_par_papi@PLT
	call	omp_get_wtime@PLT
	vsubsd	-88(%rbp), %xmm0, %xmm0
	movq	.LC5(%rip), %rax
	leaq	.LC10(%rip), %rsi
	vmovsd	.LC9(%rip), %xmm3
	movl	$1, %edi
	vmovq	%rax, %xmm2
	movl	$4, %eax
	vdivsd	%xmm0, %xmm2, %xmm1
	vmovsd	.LC8(%rip), %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vmulsd	%xmm2, %xmm1, %xmm1
	vmulsd	%xmm2, %xmm1, %xmm1
	vmovsd	%xmm1, %xmm1, %xmm2
	call	__printf_chk@PLT
	movq	%r13, %rdi
	call	free@PLT
	movq	%r12, %rdi
	call	free@PLT
	movq	%r14, %rdi
	call	free@PLT
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L12
	addq	$80, %rsp
	xorl	%eax, %eax
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L12:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE5512:
	.size	main, .-main
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.align 32
.LC2:
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.align 32
.LC3:
	.long	0
	.long	1093567616
	.long	0
	.long	1093567616
	.long	0
	.long	1093567616
	.long	0
	.long	1093567616
	.align 32
.LC4:
	.long	1115136
	.long	1115136
	.long	1115136
	.long	1115136
	.long	1115136
	.long	1115136
	.long	1115136
	.long	1115136
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC5:
	.long	0
	.long	1105300512
	.align 8
.LC8:
	.long	0
	.long	1062207488
	.align 8
.LC9:
	.long	0
	.long	1072693248
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
