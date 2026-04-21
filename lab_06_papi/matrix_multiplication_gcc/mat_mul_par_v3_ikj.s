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
	pushq	%r14
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	movl	%ecx, %r14d
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	andq	$-32, %rsp
	subq	$96, %rsp
	movq	%rsi, 32(%rsp)
	movq	%rdx, 24(%rsp)
	call	omp_get_thread_num@PLT
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	testl	%r14d, %r14d
	jle	.L22
	leal	(%r14,%r14,2), %eax
	movl	$0, 92(%rsp)
	addq	$384, %rbx
	movq	$0, 56(%rsp)
	sall	$4, %eax
	movslq	%eax, %r12
	leaq	0(,%r12,8), %rax
	movq	%r12, %r15
	movl	%r14d, %r12d
	movq	%rax, 48(%rsp)
	movslq	%r14d, %rax
	leaq	0(,%rax,8), %r13
.L3:
	movq	24(%rsp), %rax
	movq	56(%rsp), %rsi
	movq	%rbx, 72(%rsp)
	movq	$0, 80(%rsp)
	leaq	(%rax,%rsi,8), %rax
	movq	%rbx, 16(%rsp)
	movq	%rax, 40(%rsp)
	movq	$0, 64(%rsp)
.L15:
	movq	32(%rsp), %rax
	movq	64(%rsp), %rbx
	xorl	%r14d, %r14d
	movq	40(%rsp), %r11
	leaq	(%rax,%rbx,8), %rbx
.L14:
	movl	$48, 88(%rsp)
	movq	%r11, %rcx
	movq	72(%rsp), %r10
	addq	$384, %r11
	movq	%r11, %r8
.L12:
	leaq	-384(%r10), %r9
	movq	%rbx, %rsi
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L25:
	leaq	8(%rsi), %rdx
	movq	%rcx, %rax
	subq	%rdx, %rax
	cmpq	$16, %rax
	jbe	.L16
	vbroadcastsd	(%rdi), %ymm0
	vmovupd	(%rsi), %ymm1
	vfmadd213pd	(%rcx), %ymm0, %ymm1
	vmovupd	%ymm1, (%rcx)
	vmovupd	32(%rsi), %ymm1
	vfmadd213pd	32(%rcx), %ymm0, %ymm1
	vmovupd	%ymm1, 32(%rcx)
	vmovupd	64(%rsi), %ymm1
	vfmadd213pd	64(%rcx), %ymm0, %ymm1
	vmovupd	%ymm1, 64(%rcx)
	vmovupd	96(%rsi), %ymm1
	vfmadd213pd	96(%rcx), %ymm0, %ymm1
	vmovupd	%ymm1, 96(%rcx)
	vmovupd	128(%rsi), %ymm1
	vfmadd213pd	128(%rcx), %ymm0, %ymm1
	vmovupd	%ymm1, 128(%rcx)
	vmovupd	160(%rsi), %ymm1
	vfmadd213pd	160(%rcx), %ymm0, %ymm1
	vmovupd	%ymm1, 160(%rcx)
	vmovupd	192(%rsi), %ymm1
	vfmadd213pd	192(%rcx), %ymm0, %ymm1
	vmovupd	%ymm1, 192(%rcx)
	vmovupd	224(%rsi), %ymm1
	vfmadd213pd	224(%rcx), %ymm0, %ymm1
	vmovupd	%ymm1, 224(%rcx)
	vmovupd	256(%rsi), %ymm1
	vfmadd213pd	256(%rcx), %ymm0, %ymm1
	vmovupd	%ymm1, 256(%rcx)
	vmovupd	288(%rsi), %ymm1
	vfmadd213pd	288(%rcx), %ymm0, %ymm1
	vmovupd	%ymm1, 288(%rcx)
	vmovupd	320(%rsi), %ymm1
	vfmadd213pd	320(%rcx), %ymm0, %ymm1
	vmovupd	352(%rcx), %ymm3
	vmovupd	%ymm1, 320(%rcx)
	vfmadd132pd	352(%rsi), %ymm3, %ymm0
	addq	%r13, %rsi
	vmovupd	%ymm0, 352(%rcx)
	cmpq	%r10, %r9
	je	.L6
.L10:
	movq	%r9, %rdi
	addq	$8, %r9
	cmpq	%r8, %rdi
	setnb	%al
	cmpq	%r9, %rcx
	setnb	%dl
	orb	%dl, %al
	jne	.L25
.L16:
	movq	%rsi, %rdx
	movq	%rcx, %rax
	.p2align 4,,10
	.p2align 3
.L4:
	vmovsd	(%rdx), %xmm0
	vmovsd	(%rax), %xmm2
	addq	$8, %rax
	addq	$8, %rdx
	vfmadd132sd	(%rdi), %xmm2, %xmm0
	vmovsd	%xmm0, -8(%rax)
	cmpq	%rax, %r8
	jne	.L4
	addq	%r13, %rsi
	cmpq	%r10, %r9
	jne	.L10
.L6:
	addq	%r13, %rcx
	addq	%r13, %r8
	leaq	(%r9,%r13), %r10
	decl	88(%rsp)
	jne	.L12
	addq	$48, %r14
	addq	$384, %rbx
	cmpl	%r14d, %r12d
	jg	.L14
	addq	$48, 80(%rsp)
	movq	80(%rsp), %rax
	addq	$384, 72(%rsp)
	addq	%r15, 64(%rsp)
	cmpl	%eax, %r12d
	jg	.L15
	addl	$48, 92(%rsp)
	movl	92(%rsp), %eax
	movq	16(%rsp), %rbx
	addq	%r15, 56(%rsp)
	addq	48(%rsp), %rbx
	cmpl	%eax, %r12d
	jg	.L3
	vzeroupper
.L22:
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
