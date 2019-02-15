	.file	"Multigrid0.c"
	.text
	.p2align 4,,15
	.globl	alloc_matrix
	.type	alloc_matrix, @function
alloc_matrix:
.LFB52:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movslq	%edi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	leaq	0(,%rbp,8), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	call	malloc@PLT
	movq	%rax, %r13
	testl	%ebp, %ebp
	jle	.L5
	movq	%rax, %rbx
	leal	-1(%rbp), %eax
	leaq	8(%r13,%rax,8), %r12
	.p2align 4,,10
	.p2align 3
.L3:
	movl	$8, %esi
	movq	%rbp, %rdi
	addq	$8, %rbx
	call	calloc@PLT
	movq	%rax, -8(%rbx)
	cmpq	%r12, %rbx
	jne	.L3
.L5:
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	movq	%r13, %rax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE52:
	.size	alloc_matrix, .-alloc_matrix
	.p2align 4,,15
	.globl	dealloc_matrix
	.type	dealloc_matrix, @function
dealloc_matrix:
.LFB53:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	testl	%esi, %esi
	jle	.L9
	leal	-1(%rsi), %eax
	movq	%rdi, %rbx
	leaq	8(%rdi,%rax,8), %rbp
	.p2align 4,,10
	.p2align 3
.L10:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%rbp, %rbx
	jne	.L10
.L9:
	popq	%rbx
	.cfi_def_cfa_offset 24
	movq	%r12, %rdi
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	free@PLT
	.cfi_endproc
.LFE53:
	.size	dealloc_matrix, .-dealloc_matrix
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"r"
.LC1:
	.string	"%lf\n"
	.text
	.p2align 4,,15
	.globl	read_data
	.type	read_data, @function
read_data:
.LFB54:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	movq	%rsi, %rdi
	leaq	.LC0(%rip), %rsi
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edx, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	call	fopen@PLT
	testq	%rax, %rax
	je	.L19
	testl	%ebx, %ebx
	jle	.L18
	movq	%rax, %r12
	leal	-1(%rbx), %eax
	leaq	.LC1(%rip), %r13
	leaq	8(%rbp,%rax,8), %r15
	leaq	8(,%rax,8), %r14
	.p2align 4,,10
	.p2align 3
.L16:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L17:
	movq	0(%rbp), %rdx
	movq	%r13, %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	addq	%rbx, %rdx
	addq	$8, %rbx
	call	__isoc99_fscanf@PLT
	cmpq	%rbx, %r14
	jne	.L17
	addq	$8, %rbp
	cmpq	%r15, %rbp
	jne	.L16
.L18:
	movl	$1, %eax
.L21:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L19:
	.cfi_restore_state
	movl	$-1, %eax
	jmp	.L21
	.cfi_endproc
.LFE54:
	.size	read_data, .-read_data
	.p2align 4,,15
	.globl	get_m
	.type	get_m, @function
get_m:
.LFB55:
	.cfi_startproc
	testl	%edi, %edi
	jle	.L29
	leal	-1(%rdi), %eax
	cmpl	$11, %eax
	jbe	.L30
	movl	%edi, %edx
	vmovdqa	.LC2(%rip), %ymm0
	xorl	%eax, %eax
	shrl	$3, %edx
	.p2align 4,,10
	.p2align 3
.L26:
	addl	$1, %eax
	vpslld	$1, %ymm0, %ymm0
	cmpl	%edx, %eax
	jb	.L26
	vpxor	%xmm1, %xmm1, %xmm1
	movl	%edi, %ecx
	vperm2i128	$33, %ymm1, %ymm0, %ymm2
	andl	$-8, %ecx
	vpmulld	%ymm2, %ymm0, %ymm0
	leal	1(%rcx), %edx
	vperm2i128	$33, %ymm1, %ymm0, %ymm2
	vpalignr	$8, %ymm0, %ymm2, %ymm2
	vpmulld	%ymm2, %ymm0, %ymm0
	vperm2i128	$33, %ymm1, %ymm0, %ymm1
	vpalignr	$4, %ymm0, %ymm1, %ymm1
	vpmulld	%ymm1, %ymm0, %ymm0
	vmovd	%xmm0, %eax
	cmpl	%ecx, %edi
	je	.L34
	vzeroupper
.L25:
	leal	1(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L33
	leal	2(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L33
	leal	3(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L33
	leal	4(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L33
	leal	5(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L33
	leal	6(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L33
	leal	7(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L33
	leal	8(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L33
	leal	9(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L33
	leal	10(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L33
	addl	%eax, %eax
	addl	$11, %edx
	leal	(%rax,%rax), %ecx
	cmpl	%edx, %edi
	cmovge	%ecx, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L29:
	movl	$1, %eax
.L33:
	ret
	.p2align 4,,10
	.p2align 3
.L34:
	vzeroupper
	ret
	.p2align 4,,10
	.p2align 3
.L30:
	movl	$1, %eax
	movl	$1, %edx
	jmp	.L25
	.cfi_endproc
.LFE55:
	.size	get_m, .-get_m
	.section	.rodata.str1.1
.LC4:
	.string	"\n"
	.text
	.p2align 4,,15
	.globl	fill_f
	.type	fill_f, @function
fill_f:
.LFB56:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdi, %r13
	leaq	.LC4(%rip), %rdi
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	%esi, %ebx
	subq	$48, %rsp
	.cfi_def_cfa_offset 96
	vmovsd	%xmm0, 32(%rsp)
	call	puts@PLT
	testl	%ebx, %ebx
	jle	.L40
	vmovsd	32(%rsp), %xmm3
	subl	$1, %ebx
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm2, %xmm2, %xmm2
	addq	$2, %rbx
	movl	$1, %r12d
	vmulsd	%xmm3, %xmm3, %xmm7
	vmovsd	%xmm7, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L37:
	vmulsd	%xmm0, %xmm2, %xmm0
	movq	-8(%r13,%r12,8), %rbp
	movl	$1, %r14d
	vxorpd	%xmm2, %xmm2, %xmm2
	vmulsd	40(%rsp), %xmm0, %xmm5
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm5, 24(%rsp)
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L38:
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sd	%eax, %xmm1, %xmm1
	vmulsd	32(%rsp), %xmm1, %xmm1
	vmulsd	.LC5(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, 16(%rsp)
	call	sin@PLT
	vmovsd	16(%rsp), %xmm1
	vmovsd	%xmm0, 8(%rsp)
	vmulsd	.LC6(%rip), %xmm1, %xmm0
	call	sin@PLT
	vmovsd	8(%rsp), %xmm2
.L39:
	vmulsd	%xmm0, %xmm2, %xmm2
	movl	%r14d, %eax
	vmulsd	24(%rsp), %xmm2, %xmm2
	vmovsd	%xmm2, -8(%rbp,%r14,8)
	addq	$1, %r14
	cmpq	%rbx, %r14
	jne	.L38
	movl	%r12d, %eax
	addq	$1, %r12
	cmpq	%rbx, %r12
	je	.L40
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sd	%eax, %xmm1, %xmm1
	vmulsd	32(%rsp), %xmm1, %xmm1
	vmulsd	.LC5(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, 16(%rsp)
	call	sin@PLT
	vmovsd	16(%rsp), %xmm1
	vmovsd	%xmm0, 8(%rsp)
	vmulsd	.LC7(%rip), %xmm1, %xmm0
	call	sin@PLT
	vmovsd	8(%rsp), %xmm2
	jmp	.L37
	.p2align 4,,10
	.p2align 3
.L40:
	addq	$48, %rsp
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE56:
	.size	fill_f, .-fill_f
	.p2align 4,,15
	.globl	L1_norm
	.type	L1_norm, @function
L1_norm:
.LFB57:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L51
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	vmovq	.LC8(%rip), %xmm5
	leal	-1(%rsi), %eax
	pushq	-8(%r10)
	movq	%rax, %r9
	leaq	8(%rdi,%rax,8), %r11
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	.LC9(%rip), %ymm3
	pushq	%rbp
	vmovapd	%xmm5, %xmm4
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x70,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x78
	movl	$4, %r10d
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x68
	.p2align 4,,10
	.p2align 3
.L44:
	movq	(%rdi), %r8
	movq	%r8, %rax
	shrq	$3, %rax
	negq	%rax
	andl	$3, %eax
	leal	3(%rax), %edx
	cmpl	$4, %edx
	cmovb	%r10d, %edx
	cmpl	%r9d, %edx
	ja	.L52
	xorl	%ecx, %ecx
	testl	%eax, %eax
	je	.L49
	vmovsd	(%r8), %xmm1
	movl	$1, %ecx
	vandpd	%xmm5, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpl	$1, %eax
	je	.L49
	vmovsd	8(%r8), %xmm1
	movl	$2, %ecx
	vandpd	%xmm5, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpl	$3, %eax
	jne	.L49
	vmovsd	16(%r8), %xmm1
	movl	$3, %ecx
	vandpd	%xmm5, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
.L49:
	movl	%esi, %r12d
	leaq	(%r8,%rax,8), %rdx
	vxorpd	%xmm1, %xmm1, %xmm1
	subl	%eax, %r12d
	xorl	%eax, %eax
	movl	%r12d, %ebx
	shrl	$2, %ebx
	.p2align 4,,10
	.p2align 3
.L46:
	vandpd	(%rdx), %ymm3, %ymm2
	addl	$1, %eax
	addq	$32, %rdx
	vaddpd	%ymm2, %ymm1, %ymm1
	cmpl	%ebx, %eax
	jb	.L46
	vhaddpd	%ymm1, %ymm1, %ymm1
	movl	%r12d, %edx
	andl	$-4, %edx
	leal	(%rdx,%rcx), %eax
	vperm2f128	$1, %ymm1, %ymm1, %ymm2
	vaddpd	%ymm2, %ymm1, %ymm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpl	%edx, %r12d
	je	.L45
.L48:
	movslq	%eax, %rdx
	vmovsd	(%r8,%rdx,8), %xmm1
	leal	1(%rax), %edx
	vandpd	%xmm4, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpl	%edx, %esi
	jle	.L45
	movslq	%edx, %rdx
	vmovsd	(%r8,%rdx,8), %xmm1
	leal	2(%rax), %edx
	vandpd	%xmm4, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpl	%edx, %esi
	jle	.L45
	movslq	%edx, %rdx
	vmovsd	(%r8,%rdx,8), %xmm1
	leal	3(%rax), %edx
	vandpd	%xmm4, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpl	%edx, %esi
	jle	.L45
	movslq	%edx, %rdx
	vmovsd	(%r8,%rdx,8), %xmm1
	leal	4(%rax), %edx
	vandpd	%xmm4, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpl	%edx, %esi
	jle	.L45
	movslq	%edx, %rdx
	addl	$5, %eax
	vmovsd	(%r8,%rdx,8), %xmm1
	vandpd	%xmm4, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpl	%eax, %esi
	jle	.L45
	cltq
	vmovsd	(%r8,%rax,8), %xmm1
	vandpd	%xmm4, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
.L45:
	addq	$8, %rdi
	cmpq	%r11, %rdi
	jne	.L44
	vzeroupper
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L52:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L48
.L51:
	.cfi_def_cfa 7, 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	vxorpd	%xmm0, %xmm0, %xmm0
	ret
	.cfi_endproc
.LFE57:
	.size	L1_norm, .-L1_norm
	.p2align 4,,15
	.globl	L2_norm
	.type	L2_norm, @function
L2_norm:
.LFB58:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L89
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	leal	-1(%rsi), %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	andq	$-32, %rsp
	pushq	-8(%r10)
	movq	%rax, %r9
	leaq	8(%rdi,%rax,8), %r11
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x70,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x78
	movl	$4, %r10d
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x68
	.p2align 4,,10
	.p2align 3
.L72:
	movq	(%rdi), %r8
	movq	%r8, %rax
	shrq	$3, %rax
	negq	%rax
	andl	$3, %eax
	leal	3(%rax), %edx
	cmpl	$4, %edx
	cmovb	%r10d, %edx
	cmpl	%r9d, %edx
	ja	.L76
	xorl	%ecx, %ecx
	testl	%eax, %eax
	je	.L74
	vmovsd	(%r8), %xmm1
	movl	$1, %ecx
	vfmadd231sd	%xmm1, %xmm1, %xmm0
	cmpl	$1, %eax
	je	.L74
	vmovsd	8(%r8), %xmm1
	movl	$2, %ecx
	vfmadd231sd	%xmm1, %xmm1, %xmm0
	cmpl	$3, %eax
	jne	.L74
	vmovsd	16(%r8), %xmm1
	movl	$3, %ecx
	vfmadd231sd	%xmm1, %xmm1, %xmm0
.L74:
	movl	%esi, %r12d
	leaq	(%r8,%rax,8), %rdx
	vxorpd	%xmm1, %xmm1, %xmm1
	subl	%eax, %r12d
	xorl	%eax, %eax
	movl	%r12d, %ebx
	shrl	$2, %ebx
	.p2align 4,,10
	.p2align 3
.L70:
	vmovapd	(%rdx), %ymm2
	addl	$1, %eax
	addq	$32, %rdx
	vfmadd231pd	%ymm2, %ymm2, %ymm1
	cmpl	%ebx, %eax
	jb	.L70
	vhaddpd	%ymm1, %ymm1, %ymm1
	movl	%r12d, %edx
	andl	$-4, %edx
	leal	(%rdx,%rcx), %eax
	vperm2f128	$1, %ymm1, %ymm1, %ymm2
	vaddpd	%ymm2, %ymm1, %ymm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpl	%edx, %r12d
	je	.L69
.L73:
	movslq	%eax, %rdx
	vmovsd	(%r8,%rdx,8), %xmm1
	leal	1(%rax), %edx
	vfmadd231sd	%xmm1, %xmm1, %xmm0
	cmpl	%edx, %esi
	jle	.L69
	movslq	%edx, %rdx
	vmovsd	(%r8,%rdx,8), %xmm1
	leal	2(%rax), %edx
	vfmadd231sd	%xmm1, %xmm1, %xmm0
	cmpl	%edx, %esi
	jle	.L69
	movslq	%edx, %rdx
	vmovsd	(%r8,%rdx,8), %xmm1
	leal	3(%rax), %edx
	vfmadd231sd	%xmm1, %xmm1, %xmm0
	cmpl	%edx, %esi
	jle	.L69
	movslq	%edx, %rdx
	vmovsd	(%r8,%rdx,8), %xmm1
	leal	4(%rax), %edx
	vfmadd231sd	%xmm1, %xmm1, %xmm0
	cmpl	%edx, %esi
	jle	.L69
	movslq	%edx, %rdx
	addl	$5, %eax
	vmovsd	(%r8,%rdx,8), %xmm1
	vfmadd231sd	%xmm1, %xmm1, %xmm0
	cmpl	%eax, %esi
	jle	.L69
	cltq
	vmovsd	(%r8,%rax,8), %xmm1
	vfmadd231sd	%xmm1, %xmm1, %xmm0
.L69:
	addq	$8, %rdi
	cmpq	%r11, %rdi
	jne	.L72
	vsqrtsd	%xmm0, %xmm0, %xmm0
	vzeroupper
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L76:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L73
.L89:
	.cfi_def_cfa 7, 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	vxorpd	%xmm0, %xmm0, %xmm0
	ret
	.cfi_endproc
.LFE58:
	.size	L2_norm, .-L2_norm
	.p2align 4,,15
	.globl	Max_norm
	.type	Max_norm, @function
Max_norm:
.LFB59:
	.cfi_startproc
	movq	(%rdi), %rax
	vmovsd	(%rax), %xmm0
	testl	%esi, %esi
	jle	.L110
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	vmovq	.LC8(%rip), %xmm4
	leal	-1(%rsi), %eax
	pushq	-8(%r10)
	vmovapd	.LC9(%rip), %ymm2
	movq	%rax, %r9
	leaq	8(%rdi,%rax,8), %r11
	pushq	%rbp
	vmovapd	%xmm4, %xmm3
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x70,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x78
	movl	$4, %r10d
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x68
	.p2align 4,,10
	.p2align 3
.L92:
	movq	(%rdi), %r8
	movq	%r8, %rax
	shrq	$3, %rax
	negq	%rax
	andl	$3, %eax
	leal	3(%rax), %edx
	cmpl	$4, %edx
	cmovb	%r10d, %edx
	xorl	%ecx, %ecx
	cmpl	%r9d, %edx
	ja	.L96
	testl	%eax, %eax
	je	.L97
	vmovsd	(%r8), %xmm1
	movl	$1, %ecx
	vandpd	%xmm4, %xmm1, %xmm1
	vmaxsd	%xmm1, %xmm0, %xmm0
	cmpl	$1, %eax
	je	.L97
	vmovsd	8(%r8), %xmm1
	movl	$2, %ecx
	vandpd	%xmm4, %xmm1, %xmm1
	vmaxsd	%xmm1, %xmm0, %xmm0
	cmpl	$3, %eax
	jne	.L97
	vmovsd	16(%r8), %xmm1
	movl	$3, %ecx
	vandpd	%xmm4, %xmm1, %xmm1
	vmaxsd	%xmm1, %xmm0, %xmm0
.L97:
	movl	%esi, %r12d
	leaq	(%r8,%rax,8), %rdx
	vbroadcastsd	%xmm0, %ymm0
	subl	%eax, %r12d
	xorl	%eax, %eax
	movl	%r12d, %ebx
	shrl	$2, %ebx
	.p2align 4,,10
	.p2align 3
.L94:
	vandpd	(%rdx), %ymm2, %ymm1
	addl	$1, %eax
	addq	$32, %rdx
	vmaxpd	%ymm1, %ymm0, %ymm0
	cmpl	%ebx, %eax
	jb	.L94
	vperm2f128	$1, %ymm0, %ymm0, %ymm1
	movl	%r12d, %eax
	vmaxpd	%ymm0, %ymm1, %ymm1
	andl	$-4, %eax
	addl	%eax, %ecx
	vshufpd	$1, %ymm1, %ymm1, %ymm0
	vmaxpd	%ymm1, %ymm0, %ymm0
	cmpl	%eax, %r12d
	je	.L93
.L96:
	movslq	%ecx, %rax
	vmovsd	(%r8,%rax,8), %xmm1
	leal	1(%rcx), %eax
	vandpd	%xmm3, %xmm1, %xmm1
	vmaxsd	%xmm1, %xmm0, %xmm0
	cmpl	%eax, %esi
	jle	.L93
	cltq
	vmovsd	(%r8,%rax,8), %xmm1
	leal	2(%rcx), %eax
	vandpd	%xmm3, %xmm1, %xmm1
	vmaxsd	%xmm1, %xmm0, %xmm0
	cmpl	%eax, %esi
	jle	.L93
	cltq
	vmovsd	(%r8,%rax,8), %xmm1
	leal	3(%rcx), %eax
	vandpd	%xmm3, %xmm1, %xmm1
	vmaxsd	%xmm1, %xmm0, %xmm0
	cmpl	%eax, %esi
	jle	.L93
	cltq
	vmovsd	(%r8,%rax,8), %xmm1
	leal	4(%rcx), %eax
	vandpd	%xmm3, %xmm1, %xmm1
	vmaxsd	%xmm1, %xmm0, %xmm0
	cmpl	%eax, %esi
	jle	.L93
	cltq
	addl	$5, %ecx
	vmovsd	(%r8,%rax,8), %xmm1
	vandpd	%xmm3, %xmm1, %xmm1
	vmaxsd	%xmm1, %xmm0, %xmm0
	cmpl	%ecx, %esi
	jle	.L93
	movslq	%ecx, %rcx
	vmovsd	(%r8,%rcx,8), %xmm1
	vandpd	%xmm3, %xmm1, %xmm1
	vmaxsd	%xmm1, %xmm0, %xmm0
.L93:
	addq	$8, %rdi
	cmpq	%r11, %rdi
	jne	.L92
	vzeroupper
	popq	%rbx
	popq	%r10
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L110:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	ret
	.cfi_endproc
.LFE59:
	.size	Max_norm, .-Max_norm
	.p2align 4,,15
	.globl	L_def
	.type	L_def, @function
L_def:
.LFB60:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	leal	-1(%rcx), %eax
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, -104(%rbp)
	movq	%rsi, -112(%rbp)
	movq	%rdx, -120(%rbp)
	movl	%eax, -128(%rbp)
	cmpl	$1, %eax
	jle	.L139
	leal	-3(%rcx), %eax
	vmovsd	.LC10(%rip), %xmm3
	movl	$8, %r12d
	vmovapd	.LC11(%rip), %ymm1
	movl	%eax, -124(%rbp)
	leaq	16(,%rax,8), %rax
	movq	%r12, %r15
	movq	%rax, -96(%rbp)
	leal	-2(%rcx), %eax
	vmovapd	%xmm3, %xmm2
	vmovapd	%xmm3, %xmm4
	movl	%eax, -56(%rbp)
	.p2align 4,,10
	.p2align 3
.L122:
	movq	-104(%rbp), %rax
	movq	(%rax,%r15), %rdx
	movq	-8(%rax,%r15), %r14
	movq	8(%rax,%r15), %r8
	movq	-120(%rbp), %rax
	movq	(%rax,%r15), %r10
	movq	-112(%rbp), %rax
	movq	(%rax,%r15), %r11
	leaq	8(%r14), %rax
	leaq	40(%r11), %rdi
	leaq	8(%r11), %rsi
	cmpq	%rax, %rdi
	leaq	40(%r14), %rax
	setbe	%r9b
	cmpq	%rax, %rsi
	setnb	%al
	orl	%eax, %r9d
	leaq	48(%rdx), %rax
	cmpq	%rax, %rsi
	setnb	%cl
	cmpq	%rdi, %rdx
	setnb	%al
	orl	%ecx, %eax
	andl	%r9d, %eax
	cmpl	$5, -56(%rbp)
	leaq	40(%r8), %r9
	seta	%cl
	andl	%ecx, %eax
	leaq	8(%r8), %rcx
	cmpq	%rcx, %rdi
	setbe	%cl
	cmpq	%r9, %rsi
	setnb	%r9b
	orl	%r9d, %ecx
	testb	%cl, %al
	je	.L123
	leaq	8(%r10), %rax
	leaq	40(%r10), %rcx
	cmpq	%rax, %rdi
	setbe	%al
	cmpq	%rcx, %rsi
	setnb	%cl
	orb	%cl, %al
	je	.L123
	leaq	8(%rdx), %rax
	shrq	$3, %rax
	negq	%rax
	andl	$3, %eax
	leal	3(%rax), %ecx
	cmpl	-124(%rbp), %ecx
	ja	.L124
	movl	$1, -52(%rbp)
	testl	%eax, %eax
	je	.L117
	vmovsd	8(%rdx), %xmm0
	vfmsub213sd	8(%r14), %xmm4, %xmm0
	movl	$2, -52(%rbp)
	vsubsd	8(%r8), %xmm0, %xmm0
	vsubsd	(%rdx), %xmm0, %xmm0
	vsubsd	16(%rdx), %xmm0, %xmm0
	vsubsd	8(%r10), %xmm0, %xmm0
	vmovsd	%xmm0, 8(%r11)
	cmpl	$1, %eax
	je	.L117
	vmovsd	16(%rdx), %xmm0
	vfmsub213sd	16(%r14), %xmm4, %xmm0
	movl	$3, -52(%rbp)
	vsubsd	16(%r8), %xmm0, %xmm0
	vsubsd	8(%rdx), %xmm0, %xmm0
	vsubsd	24(%rdx), %xmm0, %xmm0
	vsubsd	16(%r10), %xmm0, %xmm0
	vmovsd	%xmm0, 16(%r11)
	cmpl	$3, %eax
	jne	.L117
	vmovsd	24(%rdx), %xmm0
	vfmsub213sd	24(%r14), %xmm4, %xmm0
	movl	$4, -52(%rbp)
	vsubsd	24(%r8), %xmm0, %xmm0
	vsubsd	16(%rdx), %xmm0, %xmm0
	vsubsd	32(%rdx), %xmm0, %xmm0
	vsubsd	24(%r10), %xmm0, %xmm0
	vmovsd	%xmm0, 24(%r11)
.L117:
	movl	-56(%rbp), %ebx
	leaq	8(,%rax,8), %rsi
	movq	%rdx, -80(%rbp)
	xorl	%ecx, %ecx
	leaq	(%rdx,%rsi), %r13
	leaq	8(%rdx,%rsi), %rdi
	movq	%r8, -88(%rbp)
	subl	%eax, %ebx
	leaq	-8(%rdx,%rsi), %rax
	leaq	(%r14,%rsi), %r12
	movl	%ebx, -60(%rbp)
	shrl	$2, %ebx
	leaq	(%r10,%rsi), %r9
	movl	%ebx, -64(%rbp)
	leaq	(%r8,%rsi), %rbx
	movl	-64(%rbp), %r8d
	addq	%r11, %rsi
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rdx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L119:
	vmovapd	0(%r13,%rax), %ymm0
	vfmsub213pd	(%r12,%rax), %ymm1, %ymm0
	addl	$1, %ecx
	vsubpd	(%rbx,%rax), %ymm0, %ymm0
	vsubpd	(%rdx,%rax), %ymm0, %ymm0
	vsubpd	(%rdi,%rax), %ymm0, %ymm0
	vsubpd	(%r9,%rax), %ymm0, %ymm0
	vmovupd	%ymm0, (%rsi,%rax)
	addq	$32, %rax
	cmpl	%r8d, %ecx
	jb	.L119
	movl	-60(%rbp), %ebx
	movl	-52(%rbp), %edi
	movq	-80(%rbp), %rdx
	movq	-88(%rbp), %r8
	movl	%ebx, %eax
	andl	$-4, %eax
	addl	%eax, %edi
	cmpl	%eax, %ebx
	je	.L121
.L116:
	movslq	%edi, %rax
	movl	-128(%rbp), %ebx
	vmovsd	(%rdx,%rax,8), %xmm0
	vfmsub213sd	(%r14,%rax,8), %xmm2, %xmm0
	vsubsd	(%r8,%rax,8), %xmm0, %xmm0
	vsubsd	-8(%rdx,%rax,8), %xmm0, %xmm0
	vsubsd	8(%rdx,%rax,8), %xmm0, %xmm0
	vsubsd	(%r10,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%r11,%rax,8)
	leal	1(%rdi), %eax
	cmpl	%ebx, %eax
	jge	.L121
	cltq
	vmovsd	(%rdx,%rax,8), %xmm0
	vfmsub213sd	(%r14,%rax,8), %xmm2, %xmm0
	vsubsd	(%r8,%rax,8), %xmm0, %xmm0
	vsubsd	-8(%rdx,%rax,8), %xmm0, %xmm0
	vsubsd	8(%rdx,%rax,8), %xmm0, %xmm0
	vsubsd	(%r10,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%r11,%rax,8)
	leal	2(%rdi), %eax
	cmpl	%eax, %ebx
	jle	.L121
	cltq
	vmovsd	(%rdx,%rax,8), %xmm0
	vfmsub213sd	(%r14,%rax,8), %xmm2, %xmm0
	vsubsd	(%r8,%rax,8), %xmm0, %xmm0
	vsubsd	-8(%rdx,%rax,8), %xmm0, %xmm0
	vsubsd	8(%rdx,%rax,8), %xmm0, %xmm0
	vsubsd	(%r10,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%r11,%rax,8)
	leal	3(%rdi), %eax
	cmpl	%eax, %ebx
	jle	.L121
	cltq
	vmovsd	(%rdx,%rax,8), %xmm0
	vfmsub213sd	(%r14,%rax,8), %xmm2, %xmm0
	vsubsd	(%r8,%rax,8), %xmm0, %xmm0
	vsubsd	-8(%rdx,%rax,8), %xmm0, %xmm0
	vsubsd	8(%rdx,%rax,8), %xmm0, %xmm0
	vsubsd	(%r10,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%r11,%rax,8)
	leal	4(%rdi), %eax
	cmpl	%eax, %ebx
	jle	.L121
	cltq
	addl	$5, %edi
	vmovsd	(%rdx,%rax,8), %xmm0
	vfmsub213sd	(%r14,%rax,8), %xmm2, %xmm0
	vsubsd	(%r8,%rax,8), %xmm0, %xmm0
	vsubsd	-8(%rdx,%rax,8), %xmm0, %xmm0
	vsubsd	8(%rdx,%rax,8), %xmm0, %xmm0
	vsubsd	(%r10,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%r11,%rax,8)
	cmpl	%edi, %ebx
	jle	.L121
	movslq	%edi, %rdi
	vmovsd	(%rdx,%rdi,8), %xmm0
	vfmsub213sd	(%r14,%rdi,8), %xmm2, %xmm0
	vsubsd	(%r8,%rdi,8), %xmm0, %xmm0
	vsubsd	-8(%rdx,%rdi,8), %xmm0, %xmm0
	vsubsd	8(%rdx,%rdi,8), %xmm0, %xmm0
	vsubsd	(%r10,%rdi,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%r11,%rdi,8)
.L121:
	addq	$8, %r15
	cmpq	%r15, -96(%rbp)
	jne	.L122
	vzeroupper
.L139:
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L123:
	.cfi_restore_state
	movq	-96(%rbp), %rcx
	movl	$8, %eax
	.p2align 4,,10
	.p2align 3
.L115:
	vmovsd	(%rdx,%rax), %xmm0
	vfmsub213sd	(%r14,%rax), %xmm3, %xmm0
	vsubsd	(%r8,%rax), %xmm0, %xmm0
	vsubsd	-8(%rdx,%rax), %xmm0, %xmm0
	vsubsd	8(%rdx,%rax), %xmm0, %xmm0
	vsubsd	(%r10,%rax), %xmm0, %xmm0
	vmovsd	%xmm0, (%r11,%rax)
	addq	$8, %rax
	cmpq	%rcx, %rax
	jne	.L115
	jmp	.L121
	.p2align 4,,10
	.p2align 3
.L124:
	movl	$1, %edi
	jmp	.L116
	.cfi_endproc
.LFE60:
	.size	L_def, .-L_def
	.p2align 4,,15
	.globl	GS_update
	.type	GS_update, @function
GS_update:
.LFB61:
	.cfi_startproc
	cmpl	$2, %edx
	jle	.L149
	leal	-3(%rdx), %eax
	vmovsd	.LC12(%rip), %xmm3
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%ecx, %ecx
	leaq	8(,%rax,8), %rbx
	leaq	16(,%rax,8), %r11
	.p2align 4,,10
	.p2align 3
.L144:
	movq	8(%rdi,%rcx), %rdx
	movq	(%rdi,%rcx), %r10
	movl	$8, %eax
	movq	16(%rdi,%rcx), %r9
	movq	8(%rsi,%rcx), %r8
	vmovsd	(%rdx), %xmm2
	.p2align 4,,10
	.p2align 3
.L143:
	vmovsd	(%r10,%rax), %xmm1
	vmovsd	8(%rdx,%rax), %xmm0
	vaddsd	(%r9,%rax), %xmm1, %xmm1
	vaddsd	(%r8,%rax), %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	vaddsd	%xmm2, %xmm0, %xmm2
	vmulsd	%xmm3, %xmm2, %xmm2
	vmovsd	%xmm2, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%rax, %r11
	jne	.L143
	addq	$8, %rcx
	cmpq	%rcx, %rbx
	jne	.L144
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L149:
	.cfi_restore 3
	ret
	.cfi_endproc
.LFE61:
	.size	GS_update, .-GS_update
	.p2align 4,,15
	.globl	set_BC
	.type	set_BC, @function
set_BC:
.LFB62:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L156
	movslq	%esi, %rax
	movq	(%rdi), %r10
	salq	$3, %rax
	leaq	-8(%rax), %r9
	movq	-8(%rdi,%rax), %r8
	leal	-1(%rsi), %eax
	leaq	8(,%rax,8), %rcx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L154:
	movq	(%rdi,%rax), %rdx
	movq	$0x000000000, (%r10,%rax)
	movq	$0x000000000, (%r8,%rax)
	addq	$8, %rax
	movq	$0x000000000, (%rdx)
	movq	$0x000000000, (%rdx,%r9)
	cmpq	%rcx, %rax
	jne	.L154
.L156:
	ret
	.cfi_endproc
.LFE62:
	.size	set_BC, .-set_BC
	.p2align 4,,15
	.globl	res_R
	.type	res_R, @function
res_R:
.LFB63:
	.cfi_startproc
	testl	%edx, %edx
	jle	.L176
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	leal	-1(%rdx), %eax
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	movq	%rax, %r13
	salq	$4, %rax
	pushq	%r12
	leaq	16(%rdi,%rax), %r15
	addq	$16, %rax
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movslq	%edx, %r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	movq	%r12, %r14
	movl	%r13d, %r9d
	salq	$3, %r12
	pushq	%rbx
	salq	$4, %r14
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movl	%r13d, %ebx
	shrl	$2, %r9d
	andl	$-4, %ebx
	movl	%ebx, -52(%rbp)
	movq	%rax, -64(%rbp)
	vmovsd	.LC10(%rip), %xmm2
	vmovapd	.LC11(%rip), %ymm1
	.p2align 4,,10
	.p2align 3
.L159:
	movq	(%rsi), %rcx
	movq	(%rdi), %rax
	leaq	(%rcx,%r12), %r8
	cmpq	%r8, %rax
	leaq	(%rax,%r14), %r8
	setnb	%r10b
	cmpq	%r8, %rcx
	setnb	%r8b
	orb	%r8b, %r10b
	je	.L166
	cmpl	$10, %edx
	jbe	.L166
	cmpl	$3, %r13d
	jbe	.L167
	movq	%rax, %r8
	movq	%rcx, %r11
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L163:
	vmovupd	(%r8), %ymm3
	addl	$1, %r10d
	addq	$64, %r8
	addq	$32, %r11
	vunpcklpd	-32(%r8), %ymm3, %ymm0
	vpermpd	$216, %ymm0, %ymm0
	vmulpd	%ymm1, %ymm0, %ymm0
	vmovupd	%ymm0, -32(%r11)
	cmpl	%r10d, %r9d
	ja	.L163
	movl	-52(%rbp), %r8d
.L162:
	leal	(%r8,%r8), %r10d
	movslq	%r8d, %rbx
	movslq	%r10d, %r10
	vmulsd	(%rax,%r10,8), %xmm2, %xmm0
	leaq	0(,%r10,8), %r11
	leal	1(%r8), %r10d
	vmovsd	%xmm0, (%rcx,%rbx,8)
	cmpl	%edx, %r10d
	jge	.L160
	vmulsd	16(%rax,%r11), %xmm2, %xmm0
	movslq	%r10d, %r10
	vmovsd	%xmm0, (%rcx,%r10,8)
	leal	2(%r8), %r10d
	cmpl	%r10d, %edx
	jle	.L160
	vmulsd	32(%rax,%r11), %xmm2, %xmm0
	movslq	%r10d, %r10
	addl	$3, %r8d
	vmovsd	%xmm0, (%rcx,%r10,8)
	cmpl	%r8d, %edx
	jle	.L160
	vmulsd	48(%rax,%r11), %xmm2, %xmm0
	movslq	%r8d, %r8
	vmovsd	%xmm0, (%rcx,%r8,8)
.L160:
	addq	$16, %rdi
	addq	$8, %rsi
	cmpq	%r15, %rdi
	jne	.L159
	vzeroupper
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L166:
	.cfi_restore_state
	movq	-64(%rbp), %rbx
	leaq	(%rax,%rbx), %r8
	.p2align 4,,10
	.p2align 3
.L161:
	vmulsd	(%rax), %xmm2, %xmm0
	addq	$16, %rax
	addq	$8, %rcx
	vmovsd	%xmm0, -8(%rcx)
	cmpq	%r8, %rax
	jne	.L161
	jmp	.L160
	.p2align 4,,10
	.p2align 3
.L167:
	xorl	%r8d, %r8d
	jmp	.L162
.L176:
	.cfi_def_cfa 7, 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	ret
	.cfi_endproc
.LFE63:
	.size	res_R, .-res_R
	.p2align 4,,15
	.globl	prol_P
	.type	prol_P, @function
prol_P:
.LFB64:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movl	%ecx, %r12d
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	subq	$96, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, -88(%rbp)
	movq	%rsi, -96(%rbp)
	testl	%edx, %edx
	jle	.L180
	leal	-1(%rdx), %eax
	movq	%rdi, %r14
	leaq	8(%rdi,%rax,8), %r13
	leaq	8(,%rax,8), %rbx
	.p2align 4,,10
	.p2align 3
.L181:
	movq	(%r14), %rdi
	movq	%rbx, %rdx
	xorl	%esi, %esi
	addq	$8, %r14
	call	memset@PLT
	cmpq	%r13, %r14
	jne	.L181
.L180:
	leal	-1(%r12), %r15d
	testl	%r15d, %r15d
	jle	.L201
	leal	-2(%r12), %eax
	xorl	%r14d, %r14d
	movl	%r15d, %r12d
	vmovsd	.LC15(%rip), %xmm6
	movl	%eax, -64(%rbp)
	leaq	8(,%rax,8), %rax
	shrl	$2, %r12d
	vmovsd	.LC12(%rip), %xmm8
	movq	%rax, -80(%rbp)
	movl	%r15d, %eax
	vmovapd	%xmm6, %xmm5
	vmovapd	.LC13(%rip), %ymm3
	leaq	0(,%rax,8), %rsi
	movl	%r15d, -60(%rbp)
	vmovapd	.LC14(%rip), %ymm4
	vmovapd	%xmm8, %xmm7
	movq	%rsi, -104(%rbp)
	movq	%rax, %rsi
	leaq	8(,%rax,8), %rax
	salq	$4, %rsi
	movq	%rax, -112(%rbp)
	movl	%r15d, %eax
	andl	$-4, %eax
	movq	%rsi, -120(%rbp)
	movl	%eax, -124(%rbp)
	movq	%r14, %rax
	movl	%r12d, %r14d
	movq	%rax, %r12
	.p2align 4,,10
	.p2align 3
.L189:
	movq	-96(%rbp), %rbx
	movq	-88(%rbp), %rcx
	movq	-112(%rbp), %r10
	movq	-120(%rbp), %r15
	movq	(%rbx,%r12), %rax
	movq	(%rcx,%r12,2), %rdx
	movq	8(%rbx,%r12), %rsi
	movq	-104(%rbp), %rdi
	leaq	(%rax,%r10), %rbx
	leaq	(%rdx,%r15), %r8
	movq	8(%rcx,%r12,2), %rcx
	movq	%rbx, -56(%rbp)
	leaq	8(%rax), %rbx
	leaq	(%rax,%rdi), %r13
	cmpq	%r8, %rbx
	leaq	(%rsi,%rdi), %r11
	leaq	(%rsi,%r10), %rdi
	setnb	%r10b
	cmpq	-56(%rbp), %rdx
	movq	%rdi, -72(%rbp)
	leaq	(%rcx,%r15), %r9
	setnb	%dil
	orl	%edi, %r10d
	cmpq	%r8, %rax
	setnb	%dil
	cmpq	%r13, %rdx
	setnb	%r15b
	orl	%r15d, %edi
	andl	%edi, %r10d
	cmpl	$3, -60(%rbp)
	seta	%dil
	andl	%edi, %r10d
	cmpq	%r9, %rax
	setnb	%r15b
	cmpq	%r13, %rcx
	movq	-72(%rbp), %r13
	setnb	%dil
	orl	%edi, %r15d
	andl	%r10d, %r15d
	cmpq	-56(%rbp), %rcx
	setnb	%dil
	cmpq	%rbx, %r9
	setbe	%r10b
	orl	%r10d, %edi
	leaq	8(%rsi), %r10
	andl	%edi, %r15d
	cmpq	%r11, %rdx
	setnb	%bl
	cmpq	%r8, %rsi
	setnb	%dil
	orl	%edi, %ebx
	andl	%ebx, %r15d
	cmpq	%r13, %rdx
	setnb	%dil
	cmpq	%r8, %r10
	leaq	64(%rdx), %r8
	setnb	%bl
	orl	%ebx, %edi
	andl	%edi, %r15d
	leaq	64(%rcx), %rdi
	cmpq	%rdi, %rdx
	setnb	%dil
	cmpq	%r8, %rcx
	setnb	%r8b
	orl	%r8d, %edi
	andl	%edi, %r15d
	cmpq	%r11, %rcx
	setnb	%dil
	cmpq	%r9, %rsi
	setnb	%r8b
	orl	%r8d, %edi
	testb	%dil, %r15b
	je	.L183
	cmpq	%r13, %rcx
	setnb	%dil
	cmpq	%r10, %r9
	setbe	%r8b
	orb	%r8b, %dil
	je	.L183
	cmpl	$2, -64(%rbp)
	jbe	.L190
	movq	%rax, %rdi
	movq	%rsi, %r8
	movq	%rdx, %r10
	movq	%rcx, %r9
	xorl	%r11d, %r11d
	.p2align 4,,10
	.p2align 3
.L185:
	vmovupd	(%rdi), %ymm2
	addl	$1, %r11d
	addq	$32, %rdi
	addq	$32, %r8
	vaddpd	-24(%rdi), %ymm2, %ymm0
	vaddpd	-32(%r8), %ymm2, %ymm1
	addq	$64, %r10
	addq	$64, %r9
	vpermpd	$68, %ymm2, %ymm10
	vpermpd	$238, %ymm2, %ymm2
	vmulpd	%ymm3, %ymm0, %ymm0
	vmulpd	%ymm3, %ymm1, %ymm1
	vpermpd	$68, %ymm0, %ymm9
	vpermpd	$238, %ymm0, %ymm0
	vshufpd	$12, %ymm0, %ymm2, %ymm0
	vshufpd	$12, %ymm9, %ymm10, %ymm9
	vmovupd	%ymm0, -32(%r10)
	vmovupd	%ymm9, -64(%r10)
	vmovupd	-24(%rdi), %ymm0
	vaddpd	-32(%rdi), %ymm0, %ymm2
	vpermpd	$68, %ymm1, %ymm9
	vmovupd	-24(%r8), %ymm0
	vaddpd	-32(%r8), %ymm0, %ymm0
	vpermpd	$238, %ymm1, %ymm1
	vaddpd	%ymm0, %ymm2, %ymm0
	vmulpd	%ymm4, %ymm0, %ymm0
	vpermpd	$68, %ymm0, %ymm2
	vpermpd	$238, %ymm0, %ymm0
	vshufpd	$12, %ymm2, %ymm9, %ymm2
	vshufpd	$12, %ymm0, %ymm1, %ymm0
	vmovupd	%ymm2, -64(%r9)
	vmovupd	%ymm0, -32(%r9)
	cmpl	%r11d, %r14d
	ja	.L185
	movl	-124(%rbp), %ebx
	movl	%ebx, %edi
	cmpl	%ebx, -60(%rbp)
	je	.L188
.L184:
	movslq	%edi, %r9
	leal	(%rdi,%rdi), %r8d
	movl	-60(%rbp), %r15d
	salq	$3, %r9
	movslq	%r8d, %r8
	leaq	(%rax,%r9), %r10
	leaq	(%rsi,%r9), %r11
	vmovsd	(%r10), %xmm0
	leaq	8(%rax,%r9), %rbx
	vmovsd	%xmm0, (%rdx,%r8,8)
	vmovsd	(%r10), %xmm0
	vaddsd	(%r11), %xmm0, %xmm0
	vmulsd	%xmm5, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r8,8)
	vmovsd	(%r10), %xmm0
	vaddsd	(%rbx), %xmm0, %xmm0
	addq	$1, %r8
	vmulsd	%xmm5, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%r8,8)
	vmovsd	8(%rsi,%r9), %xmm1
	vmovsd	(%r11), %xmm0
	vaddsd	(%rbx), %xmm1, %xmm1
	vaddsd	(%r10), %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	vmulsd	%xmm7, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r8,8)
	leal	1(%rdi), %r8d
	cmpl	%r15d, %r8d
	jge	.L188
	movslq	%r8d, %r9
	addl	%r8d, %r8d
	addl	$2, %edi
	salq	$3, %r9
	movslq	%r8d, %r8
	leaq	(%rax,%r9), %r10
	leaq	(%rsi,%r9), %r11
	vmovsd	(%r10), %xmm0
	leaq	8(%rax,%r9), %rbx
	vmovsd	%xmm0, (%rdx,%r8,8)
	vmovsd	(%r10), %xmm0
	vaddsd	(%r11), %xmm0, %xmm0
	vmulsd	%xmm5, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r8,8)
	vmovsd	(%r10), %xmm0
	vaddsd	(%rbx), %xmm0, %xmm0
	addq	$1, %r8
	vmulsd	%xmm5, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%r8,8)
	vmovsd	8(%rsi,%r9), %xmm1
	vmovsd	(%r10), %xmm0
	vaddsd	(%rbx), %xmm1, %xmm1
	vaddsd	(%r11), %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	vmulsd	%xmm7, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%r8,8)
	cmpl	%edi, %r15d
	jle	.L188
	movslq	%edi, %r8
	addl	%edi, %edi
	salq	$3, %r8
	movslq	%edi, %rdi
	leaq	(%rax,%r8), %r9
	leaq	(%rsi,%r8), %r10
	vmovsd	(%r9), %xmm0
	leaq	8(%rax,%r8), %rax
	vmovsd	%xmm0, (%rdx,%rdi,8)
	vmovsd	(%r9), %xmm0
	vaddsd	(%r10), %xmm0, %xmm0
	vmulsd	%xmm5, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%rdi,8)
	vmovsd	(%r9), %xmm0
	vaddsd	(%rax), %xmm0, %xmm0
	addq	$1, %rdi
	vmulsd	%xmm5, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rdi,8)
	vmovsd	8(%rsi,%r8), %xmm1
	vmovsd	(%r9), %xmm0
	vaddsd	(%rax), %xmm1, %xmm1
	vaddsd	(%r10), %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	vmulsd	%xmm7, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%rdi,8)
.L188:
	addq	$8, %r12
	cmpq	-80(%rbp), %r12
	jne	.L189
	vzeroupper
.L201:
	addq	$96, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L183:
	.cfi_restore_state
	movq	-80(%rbp), %r8
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L187:
	vmovsd	(%rax), %xmm0
	addq	$8, %rax
	vmovsd	%xmm0, (%rdx,%rdi,2)
	vmovsd	-8(%rax), %xmm0
	vaddsd	(%rsi,%rdi), %xmm0, %xmm0
	vmulsd	%xmm6, %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx,%rdi,2)
	vmovsd	-8(%rax), %xmm0
	vaddsd	(%rax), %xmm0, %xmm0
	vmulsd	%xmm6, %xmm0, %xmm0
	vmovsd	%xmm0, 8(%rdx,%rdi,2)
	vmovsd	-8(%rax), %xmm0
	vaddsd	(%rax), %xmm0, %xmm1
	vmovsd	(%rsi,%rdi), %xmm0
	vaddsd	8(%rsi,%rdi), %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	vmulsd	%xmm8, %xmm0, %xmm0
	vmovsd	%xmm0, 8(%rcx,%rdi,2)
	addq	$8, %rdi
	cmpq	%r8, %rdi
	jne	.L187
	jmp	.L188
	.p2align 4,,10
	.p2align 3
.L190:
	xorl	%edi, %edi
	jmp	.L184
	.cfi_endproc
.LFE64:
	.size	prol_P, .-prol_P
	.p2align 4,,15
	.globl	multigrid_vcycle
	.type	multigrid_vcycle, @function
multigrid_vcycle:
.LFB51:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	16(%rsp), %r13
	.cfi_def_cfa 13, 0
	andq	$-32, %rsp
	pushq	-8(%r13)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	.cfi_escape 0xf,0x3,0x76,0x68,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	pushq	%r12
	pushq	%rbx
	subq	$296, %rsp
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	testl	%edi, %edi
	jle	.L261
	leal	-1(%rdi), %eax
	movl	%eax, -108(%rbp)
	cmpl	$11, %eax
	jbe	.L262
	movl	%edi, %ecx
	vmovdqa	.LC2(%rip), %ymm2
	xorl	%eax, %eax
	shrl	$3, %ecx
	.p2align 4,,10
	.p2align 3
.L206:
	addl	$1, %eax
	vpslld	$1, %ymm2, %ymm2
	cmpl	%eax, %ecx
	ja	.L206
	vpxor	%xmm4, %xmm4, %xmm4
	movl	%edi, %ecx
	vperm2i128	$33, %ymm4, %ymm2, %ymm3
	andl	$-8, %ecx
	vpmulld	%ymm2, %ymm3, %ymm2
	leal	1(%rcx), %eax
	vperm2i128	$33, %ymm4, %ymm2, %ymm3
	vpalignr	$8, %ymm2, %ymm3, %ymm3
	vpmulld	%ymm3, %ymm2, %ymm2
	vperm2i128	$33, %ymm4, %ymm2, %ymm3
	vpalignr	$4, %ymm2, %ymm3, %ymm3
	vpmulld	%ymm3, %ymm2, %ymm2
	vmovd	%xmm2, -52(%rbp)
	cmpl	%edi, %ecx
	je	.L207
.L205:
	leal	1(%rax), %ecx
	sall	-52(%rbp)
	movl	-52(%rbp), %ebx
	cmpl	%ecx, %edi
	jl	.L207
	addl	%ebx, %ebx
	leal	2(%rax), %ecx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L207
	addl	%ebx, %ebx
	leal	3(%rax), %ecx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L207
	addl	%ebx, %ebx
	leal	4(%rax), %ecx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L207
	addl	%ebx, %ebx
	leal	5(%rax), %ecx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L207
	addl	%ebx, %ebx
	leal	6(%rax), %ecx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L207
	addl	%ebx, %ebx
	leal	7(%rax), %ecx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L207
	addl	%ebx, %ebx
	leal	8(%rax), %ecx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L207
	addl	%ebx, %ebx
	leal	9(%rax), %ecx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L207
	addl	%ebx, %ebx
	leal	10(%rax), %ecx
	movl	%ebx, -52(%rbp)
	cmpl	%ecx, %edi
	jl	.L207
	addl	%ebx, %ebx
	addl	$11, %eax
	leal	(%rbx,%rbx), %ecx
	cmpl	%eax, %edi
	cmovl	%ebx, %ecx
	movl	%ecx, -52(%rbp)
	.p2align 4,,10
	.p2align 3
.L207:
	movl	-52(%rbp), %eax
	leal	1(%rax), %r12d
	cmpl	$1, %edi
	jle	.L313
	leal	-2(%rdi), %eax
	cmpl	$11, %eax
	jbe	.L263
	movl	-108(%rbp), %ecx
	vmovdqa	.LC2(%rip), %ymm2
	xorl	%eax, %eax
	shrl	$3, %ecx
	.p2align 4,,10
	.p2align 3
.L209:
	addl	$1, %eax
	vpslld	$1, %ymm2, %ymm2
	cmpl	%eax, %ecx
	ja	.L209
	vpxor	%xmm4, %xmm4, %xmm4
	movl	-108(%rbp), %ebx
	vperm2i128	$33, %ymm4, %ymm2, %ymm3
	vpmulld	%ymm2, %ymm3, %ymm2
	movl	%ebx, %r8d
	andl	$-8, %r8d
	leal	1(%r8), %ecx
	vperm2i128	$33, %ymm4, %ymm2, %ymm3
	vpalignr	$8, %ymm2, %ymm3, %ymm3
	vpmulld	%ymm3, %ymm2, %ymm2
	vperm2i128	$33, %ymm4, %ymm2, %ymm3
	vpalignr	$4, %ymm2, %ymm3, %ymm3
	vpmulld	%ymm3, %ymm2, %ymm2
	vmovd	%xmm2, %eax
	cmpl	%ebx, %r8d
	je	.L210
.L208:
	leal	1(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L210
	leal	2(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L210
	leal	3(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L210
	leal	4(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L210
	leal	5(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L210
	leal	6(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L210
	leal	7(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L210
	leal	8(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L210
	leal	9(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L210
	leal	10(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L210
	addl	%eax, %eax
	addl	$11, %ecx
	leal	(%rax,%rax), %r8d
	cmpl	%ecx, %edi
	cmovg	%r8d, %eax
	.p2align 4,,10
	.p2align 3
.L210:
	addl	$1, %eax
	movl	%eax, -72(%rbp)
	vzeroupper
.L211:
	movslq	%r12d, %rbx
	movq	%rsi, %r13
	movq	%rdx, -88(%rbp)
	leaq	0(,%rbx,8), %rax
	vmovsd	%xmm1, -176(%rbp)
	movq	%rax, %rdi
	vmovsd	%xmm0, -272(%rbp)
	movq	%rax, -96(%rbp)
	call	malloc@PLT
	leal	-1(%r12), %esi
	movq	%rax, -80(%rbp)
	leaq	8(,%rsi,8), %r14
	movq	%rax, %r15
	movq	%rax, -328(%rbp)
	movl	%esi, -56(%rbp)
	movq	%rsi, -144(%rbp)
	movq	%r14, -120(%rbp)
	addq	%rax, %r14
	.p2align 4,,10
	.p2align 3
.L213:
	movl	$8, %esi
	movq	%rbx, %rdi
	addq	$8, %r15
	call	calloc@PLT
	movq	%rax, -8(%r15)
	cmpq	%r14, %r15
	jne	.L213
	movslq	-72(%rbp), %r14
	movq	%r15, -256(%rbp)
	leaq	0(,%r14,8), %rax
	movq	%rax, %rdi
	movq	%rax, -128(%rbp)
	call	malloc@PLT
	leal	-1(%r14), %esi
	movq	%rbx, -152(%rbp)
	movq	%rax, -104(%rbp)
	leaq	8(,%rsi,8), %r15
	movq	%rax, %rbx
	movq	%rax, -280(%rbp)
	movl	%esi, -68(%rbp)
	movq	%rsi, -136(%rbp)
	movq	%r15, -64(%rbp)
	addq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L214:
	movl	$8, %esi
	movq	%r14, %rdi
	addq	$8, %rbx
	call	calloc@PLT
	movq	%rax, -8(%rbx)
	cmpq	%r15, %rbx
	jne	.L214
	movq	-96(%rbp), %rdi
	movq	%rbx, -320(%rbp)
	movq	-152(%rbp), %rbx
	call	malloc@PLT
	movq	-120(%rbp), %r15
	movl	%r12d, -120(%rbp)
	movq	%rax, -96(%rbp)
	movq	%rax, %r12
	movq	%rax, -296(%rbp)
	addq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L215:
	movl	$8, %esi
	movq	%rbx, %rdi
	addq	$8, %r12
	call	calloc@PLT
	movq	%rax, -8(%r12)
	cmpq	%r15, %r12
	jne	.L215
	movq	-128(%rbp), %rdi
	movq	%r12, -312(%rbp)
	movl	-120(%rbp), %r12d
	call	malloc@PLT
	movq	-64(%rbp), %rbx
	movq	%rax, -168(%rbp)
	movq	%rax, %r15
	movq	%rax, -288(%rbp)
	addq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L216:
	movl	$8, %esi
	movq	%r14, %rdi
	addq	$8, %r15
	call	calloc@PLT
	movq	%rax, -8(%r15)
	cmpq	%rbx, %r15
	jne	.L216
	movl	-52(%rbp), %eax
	movq	-80(%rbp), %rdi
	movq	%r15, -304(%rbp)
	vmovsd	.LC10(%rip), %xmm4
	vmovapd	.LC11(%rip), %ymm3
	subl	$2, %eax
	vmovsd	.LC16(%rip), %xmm0
	vdivsd	-176(%rbp), %xmm0, %xmm7
	vmovsd	%xmm7, -216(%rbp)
	leaq	8(,%rax,8), %rbx
	movq	%rbx, -128(%rbp)
	leaq	16(,%rax,8), %rbx
	movq	-136(%rbp), %rax
	salq	$4, %rax
	movq	%rax, -248(%rbp)
	leaq	16(%rdi,%rax), %rax
	movq	-144(%rbp), %rdi
	movq	%rax, -64(%rbp)
	movq	%r14, %rax
	salq	$4, %rax
	leaq	8(,%rdi,8), %rsi
	movq	%rax, -232(%rbp)
	leaq	0(,%r14,8), %rax
	movq	%rax, -224(%rbp)
	movl	-68(%rbp), %eax
	movq	%rsi, -240(%rbp)
	movl	%eax, %r14d
	andl	$-4, %eax
	movl	%eax, -112(%rbp)
	addl	%eax, %eax
	shrl	$2, %r14d
	cltq
	salq	$3, %rax
	movq	%rax, -264(%rbp)
.L217:
	xorl	%ecx, %ecx
	cmpl	$1, -52(%rbp)
	vmovsd	.LC12(%rip), %xmm5
	je	.L254
	movq	-128(%rbp), %r9
	movq	-88(%rbp), %r10
	.p2align 4,,10
	.p2align 3
.L219:
	movq	8(%r13,%rcx), %rdx
	movq	0(%r13,%rcx), %r8
	movl	$8, %eax
	movq	16(%r13,%rcx), %rdi
	movq	8(%r10,%rcx), %rsi
	vmovsd	(%rdx), %xmm0
	.p2align 4,,10
	.p2align 3
.L218:
	vmovsd	8(%rdx,%rax), %xmm1
	vaddsd	(%rsi,%rax), %xmm1, %xmm2
	vmovsd	(%r8,%rax), %xmm1
	vaddsd	(%rdi,%rax), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm2, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vmulsd	%xmm5, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%rbx, %rax
	jne	.L218
	addq	$8, %rcx
	cmpq	%r9, %rcx
	jne	.L219
.L254:
	movq	-80(%rbp), %r15
	movq	-88(%rbp), %rdx
	movl	%r12d, %ecx
	movq	%r13, %rdi
	vmovapd	%ymm3, -208(%rbp)
	movq	%r15, %rsi
	vmovsd	%xmm4, -160(%rbp)
	vzeroupper
	call	L_def
	movq	%r15, %r8
	movq	-248(%rbp), %rax
	movslq	-112(%rbp), %r11
	movl	%r12d, -136(%rbp)
	leaq	16(%rax), %r15
	movq	%rbx, -144(%rbp)
	movq	-104(%rbp), %r9
	movq	%r15, -120(%rbp)
	movq	-232(%rbp), %r12
	leal	1(%r11), %r10d
	movq	%r13, -152(%rbp)
	movq	-224(%rbp), %rbx
	movl	-72(%rbp), %r15d
	movq	-264(%rbp), %r13
	vmovsd	-160(%rbp), %xmm4
	vmovapd	-208(%rbp), %ymm3
	.p2align 4,,10
	.p2align 3
.L220:
	movq	(%r9), %rdi
	movq	(%r8), %rsi
	leaq	(%rdi,%rbx), %rax
	cmpq	%rax, %rsi
	leaq	(%rsi,%r12), %rax
	setnb	%dl
	cmpq	%rax, %rdi
	setnb	%al
	orb	%al, %dl
	je	.L229
	cmpl	$10, %r15d
	jbe	.L229
	cmpl	$3, -68(%rbp)
	jbe	.L223
	movq	%rdi, %rcx
	movq	%rsi, %rax
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L224:
	vmovupd	(%rax), %ymm6
	vunpcklpd	32(%rax), %ymm6, %ymm0
	addl	$1, %edx
	addq	$32, %rcx
	addq	$64, %rax
	vpermpd	$216, %ymm0, %ymm0
	vmulpd	%ymm3, %ymm0, %ymm0
	vmovupd	%ymm0, -32(%rcx)
	cmpl	%edx, %r14d
	ja	.L224
	vmulsd	(%rsi,%r13), %xmm4, %xmm0
	movq	%r13, %rcx
	movl	%r10d, %eax
	vmovsd	%xmm0, (%rdi,%r11,8)
	cmpl	%r10d, %r15d
	jle	.L221
.L258:
	vmulsd	16(%rsi,%rcx), %xmm4, %xmm0
	movslq	%eax, %rdx
	vmovsd	%xmm0, (%rdi,%rdx,8)
	leal	1(%rax), %edx
	cmpl	%r15d, %edx
	jge	.L221
	vmulsd	32(%rsi,%rcx), %xmm4, %xmm0
	movslq	%edx, %rdx
	addl	$2, %eax
	vmovsd	%xmm0, (%rdi,%rdx,8)
	cmpl	%eax, %r15d
	jle	.L221
	vmulsd	48(%rsi,%rcx), %xmm4, %xmm0
	cltq
	vmovsd	%xmm0, (%rdi,%rax,8)
.L221:
	addq	$16, %r8
	addq	$8, %r9
	cmpq	-64(%rbp), %r8
	jne	.L220
	movq	-168(%rbp), %r15
	movl	-136(%rbp), %r12d
	vmovapd	%ymm3, -208(%rbp)
	movq	-144(%rbp), %rbx
	movq	-152(%rbp), %r13
	vmovsd	%xmm4, -160(%rbp)
	vmovsd	-176(%rbp), %xmm1
	vmovsd	-272(%rbp), %xmm0
	movq	%r15, %rsi
	movq	-104(%rbp), %rdx
	movl	-108(%rbp), %edi
	vzeroupper
	call	multigrid_vcycle
	movl	-72(%rbp), %ecx
	movq	-96(%rbp), %rdi
	movq	%r15, %rsi
	movl	%r12d, %edx
	call	prol_P
	movl	%r14d, -120(%rbp)
	xorl	%r10d, %r10d
	movq	-240(%rbp), %r15
	movq	%rbx, -136(%rbp)
	vmovsd	-160(%rbp), %xmm4
	movq	-96(%rbp), %rbx
	vmovapd	-208(%rbp), %ymm3
	.p2align 4,,10
	.p2align 3
.L230:
	movq	(%rbx,%r10), %r9
	movq	0(%r13,%r10), %rsi
	leaq	32(%r9), %rax
	cmpq	%rax, %rsi
	leaq	32(%rsi), %rax
	setnb	%dl
	cmpq	%rax, %r9
	setnb	%al
	orb	%al, %dl
	je	.L273
	cmpl	$8, %r12d
	jbe	.L273
	movq	%rsi, %rdx
	shrq	$3, %rdx
	negq	%rdx
	andl	$3, %edx
	leal	3(%rdx), %eax
	cmpl	-56(%rbp), %eax
	ja	.L234
	xorl	%r8d, %r8d
	testl	%edx, %edx
	je	.L235
	vmovsd	(%rsi), %xmm0
	vsubsd	(%r9), %xmm0, %xmm0
	movl	$1, %r8d
	vmovsd	%xmm0, (%rsi)
	cmpl	$1, %edx
	je	.L235
	vmovsd	8(%rsi), %xmm0
	vsubsd	8(%r9), %xmm0, %xmm0
	movl	$2, %r8d
	vmovsd	%xmm0, 8(%rsi)
	cmpl	$3, %edx
	jne	.L235
	vmovsd	16(%rsi), %xmm0
	vsubsd	16(%r9), %xmm0, %xmm0
	movl	$3, %r8d
	vmovsd	%xmm0, 16(%rsi)
.L235:
	movl	%r12d, %r14d
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	subl	%edx, %r14d
	salq	$3, %rdx
	movl	%r14d, %r11d
	leaq	(%rsi,%rdx), %rdi
	addq	%r9, %rdx
	shrl	$2, %r11d
	.p2align 4,,10
	.p2align 3
.L237:
	vmovapd	(%rdi,%rax), %ymm0
	vsubpd	(%rdx,%rax), %ymm0, %ymm0
	addl	$1, %ecx
	vmovapd	%ymm0, (%rdi,%rax)
	addq	$32, %rax
	cmpl	%ecx, %r11d
	ja	.L237
	movl	%r14d, %eax
	andl	$-4, %eax
	addl	%eax, %r8d
	cmpl	%r14d, %eax
	je	.L233
	movslq	%r8d, %rdx
	addl	$1, %r8d
	leaq	(%rsi,%rdx,8), %rax
	vmovsd	(%rax), %xmm0
	vsubsd	(%r9,%rdx,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
	cmpl	%r12d, %r8d
	jge	.L233
.L259:
	movslq	%r8d, %rdx
	leaq	(%rsi,%rdx,8), %rax
	vmovsd	(%rax), %xmm0
	vsubsd	(%r9,%rdx,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
	leal	1(%r8), %eax
	cmpl	%r12d, %eax
	jge	.L233
	cltq
	leaq	(%rsi,%rax,8), %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%r9,%rax,8), %xmm0, %xmm0
	leal	2(%r8), %eax
	vmovsd	%xmm0, (%rdx)
	cmpl	%r12d, %eax
	jge	.L233
	cltq
	leaq	(%rsi,%rax,8), %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%r9,%rax,8), %xmm0, %xmm0
	leal	3(%r8), %eax
	vmovsd	%xmm0, (%rdx)
	cmpl	%r12d, %eax
	jge	.L233
	cltq
	addl	$4, %r8d
	leaq	(%rsi,%rax,8), %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%r9,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx)
	cmpl	%r12d, %r8d
	jge	.L233
	movslq	%r8d, %r8
	leaq	(%rsi,%r8,8), %rax
	vmovsd	(%rax), %xmm0
	vsubsd	(%r9,%r8,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
.L233:
	addq	$8, %r10
	cmpq	%r15, %r10
	jne	.L230
	xorl	%ecx, %ecx
	cmpl	$1, -52(%rbp)
	movl	-120(%rbp), %r14d
	movq	-136(%rbp), %rbx
	vmovsd	.LC12(%rip), %xmm5
	je	.L240
	movq	-128(%rbp), %r9
	movq	-88(%rbp), %r10
	.p2align 4,,10
	.p2align 3
.L239:
	movq	8(%r13,%rcx), %rdx
	movq	0(%r13,%rcx), %r8
	movl	$8, %eax
	movq	16(%r13,%rcx), %rdi
	movq	8(%r10,%rcx), %rsi
	vmovsd	(%rdx), %xmm0
	.p2align 4,,10
	.p2align 3
.L243:
	vmovsd	8(%rdx,%rax), %xmm1
	vaddsd	(%rsi,%rax), %xmm1, %xmm2
	vmovsd	(%r8,%rax), %xmm1
	vaddsd	(%rdi,%rax), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm2, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vmulsd	%xmm5, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%rbx, %rax
	jne	.L243
	addq	$8, %rcx
	cmpq	%r9, %rcx
	jne	.L239
.L240:
	movq	-80(%rbp), %r15
	movq	-256(%rbp), %r10
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$4, %r9d
	movl	-56(%rbp), %r11d
	.p2align 4,,10
	.p2align 3
.L244:
	movq	(%r15), %rsi
	movq	%rsi, %rax
	shrq	$3, %rax
	negq	%rax
	andl	$3, %eax
	leal	3(%rax), %edx
	cmpl	$4, %edx
	cmovb	%r9d, %edx
	cmpl	%r11d, %edx
	ja	.L249
	xorl	%ecx, %ecx
	testl	%eax, %eax
	je	.L250
	vmovsd	(%rsi), %xmm0
	movl	$1, %ecx
	vfmadd231sd	%xmm0, %xmm0, %xmm2
	cmpl	$1, %eax
	je	.L250
	vmovsd	8(%rsi), %xmm0
	movl	$2, %ecx
	vfmadd231sd	%xmm0, %xmm0, %xmm2
	cmpl	$3, %eax
	jne	.L250
	vmovsd	16(%rsi), %xmm0
	movl	$3, %ecx
	vfmadd231sd	%xmm0, %xmm0, %xmm2
.L250:
	movl	%r12d, %r8d
	leaq	(%rsi,%rax,8), %rdx
	vxorpd	%xmm0, %xmm0, %xmm0
	subl	%eax, %r8d
	xorl	%eax, %eax
	movl	%r8d, %edi
	shrl	$2, %edi
	.p2align 4,,10
	.p2align 3
.L246:
	vmovapd	(%rdx), %ymm1
	addl	$1, %eax
	addq	$32, %rdx
	vfmadd231pd	%ymm1, %ymm1, %ymm0
	cmpl	%eax, %edi
	ja	.L246
	vhaddpd	%ymm0, %ymm0, %ymm0
	movl	%r8d, %eax
	andl	$-4, %eax
	addl	%eax, %ecx
	vperm2f128	$1, %ymm0, %ymm0, %ymm1
	vaddpd	%ymm1, %ymm0, %ymm0
	vaddsd	%xmm0, %xmm2, %xmm2
	cmpl	%r8d, %eax
	je	.L245
	movslq	%ecx, %rax
	addl	$1, %ecx
	vmovsd	(%rsi,%rax,8), %xmm0
	vfmadd231sd	%xmm0, %xmm0, %xmm2
	cmpl	%r12d, %ecx
	jge	.L245
.L260:
	movslq	%ecx, %rax
	vmovsd	(%rsi,%rax,8), %xmm0
	leal	1(%rcx), %eax
	vfmadd231sd	%xmm0, %xmm0, %xmm2
	cmpl	%r12d, %eax
	jge	.L245
	cltq
	vmovsd	(%rsi,%rax,8), %xmm0
	leal	2(%rcx), %eax
	vfmadd231sd	%xmm0, %xmm0, %xmm2
	cmpl	%r12d, %eax
	jge	.L245
	cltq
	vmovsd	(%rsi,%rax,8), %xmm0
	leal	3(%rcx), %eax
	vfmadd231sd	%xmm0, %xmm0, %xmm2
	cmpl	%r12d, %eax
	jge	.L245
	cltq
	addl	$4, %ecx
	vmovsd	(%rsi,%rax,8), %xmm0
	vfmadd231sd	%xmm0, %xmm0, %xmm2
	cmpl	%r12d, %ecx
	jge	.L245
	movslq	%ecx, %rcx
	vmovsd	(%rsi,%rcx,8), %xmm0
	vfmadd231sd	%xmm0, %xmm0, %xmm2
.L245:
	addq	$8, %r15
	cmpq	%r10, %r15
	jne	.L244
	vsqrtsd	%xmm2, %xmm2, %xmm2
	vmulsd	-216(%rbp), %xmm2, %xmm2
	vcomisd	.LC17(%rip), %xmm2
	ja	.L217
	movq	-328(%rbp), %rbx
	vzeroupper
	.p2align 4,,10
	.p2align 3
.L252:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%r15, %rbx
	jne	.L252
	movq	-80(%rbp), %rdi
	call	free@PLT
	movq	-280(%rbp), %rbx
	movq	-320(%rbp), %r12
	.p2align 4,,10
	.p2align 3
.L255:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%r12, %rbx
	jne	.L255
	movq	-104(%rbp), %rdi
	call	free@PLT
	movq	-296(%rbp), %rbx
	movq	-312(%rbp), %r12
	.p2align 4,,10
	.p2align 3
.L256:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%r12, %rbx
	jne	.L256
	movq	-96(%rbp), %rdi
	call	free@PLT
	movq	-288(%rbp), %rbx
	movq	-304(%rbp), %r12
	.p2align 4,,10
	.p2align 3
.L257:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%r12, %rbx
	jne	.L257
	movq	-168(%rbp), %rdi
	addq	$296, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	.cfi_remember_state
	.cfi_def_cfa 13, 0
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-16(%r13), %rsp
	.cfi_def_cfa 7, 16
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	free@PLT
	.p2align 4,,10
	.p2align 3
.L273:
	.cfi_restore_state
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L232:
	vmovsd	(%rsi,%rax), %xmm0
	vsubsd	(%r9,%rax), %xmm0, %xmm0
	vmovsd	%xmm0, (%rsi,%rax)
	addq	$8, %rax
	cmpq	%r15, %rax
	jne	.L232
	jmp	.L233
	.p2align 4,,10
	.p2align 3
.L229:
	movq	-120(%rbp), %rax
	addq	%rsi, %rax
	.p2align 4,,10
	.p2align 3
.L222:
	vmulsd	(%rsi), %xmm4, %xmm0
	addq	$16, %rsi
	addq	$8, %rdi
	vmovsd	%xmm0, -8(%rdi)
	cmpq	%rax, %rsi
	jne	.L222
	jmp	.L221
	.p2align 4,,10
	.p2align 3
.L249:
	vmovsd	(%rsi), %xmm0
	movl	$1, %ecx
	vfmadd231sd	%xmm0, %xmm0, %xmm2
	jmp	.L260
	.p2align 4,,10
	.p2align 3
.L223:
	vmulsd	(%rsi), %xmm4, %xmm0
	xorl	%ecx, %ecx
	movl	$1, %eax
	vmovsd	%xmm0, (%rdi)
	jmp	.L258
	.p2align 4,,10
	.p2align 3
.L234:
	vmovsd	(%rsi), %xmm0
	vsubsd	(%r9), %xmm0, %xmm0
	movl	$1, %r8d
	vmovsd	%xmm0, (%rsi)
	jmp	.L259
.L261:
	movl	$1, -52(%rbp)
	movl	$2, %r12d
.L204:
	cmpl	$1, %edi
	jne	.L264
	movq	8(%rdx), %rdx
	vmulsd	%xmm0, %xmm0, %xmm0
	movq	8(%rsi), %rax
	vmulsd	8(%rdx), %xmm0, %xmm0
	vmovsd	%xmm0, 8(%rax)
	addq	$296, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	.cfi_remember_state
	.cfi_def_cfa 13, 0
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-16(%r13), %rsp
	.cfi_def_cfa 7, 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L262:
	.cfi_restore_state
	movl	$1, %eax
	movl	$1, -52(%rbp)
	jmp	.L205
.L263:
	movl	$1, %eax
	movl	$1, %ecx
	jmp	.L208
.L264:
	leal	-1(%rdi), %eax
	movl	$2, -72(%rbp)
	movl	%eax, -108(%rbp)
	jmp	.L211
.L313:
	vzeroupper
	jmp	.L204
	.cfi_endproc
.LFE51:
	.size	multigrid_vcycle, .-multigrid_vcycle
	.p2align 4,,15
	.globl	u_update
	.type	u_update, @function
u_update:
.LFB65:
	.cfi_startproc
	testl	%edx, %edx
	jle	.L345
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	leal	-1(%rdx), %eax
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	leaq	8(,%rax,8), %r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	xorl	%r12d, %r12d
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movl	%eax, -52(%rbp)
	.p2align 4,,10
	.p2align 3
.L318:
	movq	(%rsi,%r12), %rbx
	movq	(%rdi,%r12), %r9
	leaq	32(%rbx), %rax
	cmpq	%rax, %r9
	leaq	32(%r9), %rax
	setnb	%cl
	cmpq	%rax, %rbx
	setnb	%al
	orb	%al, %cl
	je	.L333
	cmpl	$8, %edx
	jbe	.L333
	movq	%r9, %rcx
	shrq	$3, %rcx
	negq	%rcx
	andl	$3, %ecx
	leal	3(%rcx), %eax
	cmpl	-52(%rbp), %eax
	ja	.L322
	xorl	%r10d, %r10d
	testl	%ecx, %ecx
	je	.L323
	vmovsd	(%r9), %xmm0
	vsubsd	(%rbx), %xmm0, %xmm0
	movl	$1, %r10d
	vmovsd	%xmm0, (%r9)
	cmpl	$1, %ecx
	je	.L323
	vmovsd	8(%r9), %xmm0
	vsubsd	8(%rbx), %xmm0, %xmm0
	movl	$2, %r10d
	vmovsd	%xmm0, 8(%r9)
	cmpl	$3, %ecx
	jne	.L323
	vmovsd	16(%r9), %xmm0
	vsubsd	16(%rbx), %xmm0, %xmm0
	movl	$3, %r10d
	vmovsd	%xmm0, 16(%r9)
.L323:
	movl	%edx, %r14d
	xorl	%eax, %eax
	xorl	%r8d, %r8d
	subl	%ecx, %r14d
	salq	$3, %rcx
	movl	%r14d, %r13d
	leaq	(%r9,%rcx), %r11
	addq	%rbx, %rcx
	shrl	$2, %r13d
	.p2align 4,,10
	.p2align 3
.L325:
	vmovapd	(%r11,%rax), %ymm0
	vsubpd	(%rcx,%rax), %ymm0, %ymm0
	addl	$1, %r8d
	vmovapd	%ymm0, (%r11,%rax)
	addq	$32, %rax
	cmpl	%r8d, %r13d
	ja	.L325
	movl	%r14d, %eax
	andl	$-4, %eax
	addl	%eax, %r10d
	cmpl	%eax, %r14d
	je	.L321
	movslq	%r10d, %rcx
	addl	$1, %r10d
	leaq	(%r9,%rcx,8), %rax
	vmovsd	(%rax), %xmm0
	vsubsd	(%rbx,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
	cmpl	%r10d, %edx
	jle	.L321
.L329:
	movslq	%r10d, %rcx
	leaq	(%r9,%rcx,8), %rax
	vmovsd	(%rax), %xmm0
	vsubsd	(%rbx,%rcx,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
	leal	1(%r10), %eax
	cmpl	%eax, %edx
	jle	.L321
	cltq
	leaq	(%r9,%rax,8), %rcx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%rbx,%rax,8), %xmm0, %xmm0
	leal	2(%r10), %eax
	vmovsd	%xmm0, (%rcx)
	cmpl	%eax, %edx
	jle	.L321
	cltq
	leaq	(%r9,%rax,8), %rcx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%rbx,%rax,8), %xmm0, %xmm0
	leal	3(%r10), %eax
	vmovsd	%xmm0, (%rcx)
	cmpl	%eax, %edx
	jle	.L321
	cltq
	addl	$4, %r10d
	leaq	(%r9,%rax,8), %rcx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%rbx,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rcx)
	cmpl	%r10d, %edx
	jle	.L321
	movslq	%r10d, %r10
	leaq	(%r9,%r10,8), %rax
	vmovsd	(%rax), %xmm0
	vsubsd	(%rbx,%r10,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
.L321:
	addq	$8, %r12
	cmpq	%r12, %r15
	jne	.L318
	vzeroupper
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L333:
	.cfi_restore_state
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L320:
	vmovsd	(%r9,%rax), %xmm0
	vsubsd	(%rbx,%rax), %xmm0, %xmm0
	vmovsd	%xmm0, (%r9,%rax)
	addq	$8, %rax
	cmpq	%r15, %rax
	jne	.L320
	jmp	.L321
	.p2align 4,,10
	.p2align 3
.L322:
	vmovsd	(%r9), %xmm0
	vsubsd	(%rbx), %xmm0, %xmm0
	movl	$1, %r10d
	vmovsd	%xmm0, (%r9)
	jmp	.L329
.L345:
	.cfi_def_cfa 7, 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	ret
	.cfi_endproc
.LFE65:
	.size	u_update, .-u_update
	.p2align 4,,15
	.globl	set_zeros
	.type	set_zeros, @function
set_zeros:
.LFB66:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L354
	leal	-1(%rsi), %eax
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leaq	8(%rdi,%rax,8), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	8(,%rax,8), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	.p2align 4,,10
	.p2align 3
.L350:
	movq	(%rbx), %rdi
	movq	%rbp, %rdx
	xorl	%esi, %esi
	addq	$8, %rbx
	call	memset@PLT
	cmpq	%r12, %rbx
	jne	.L350
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L354:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	ret
	.cfi_endproc
.LFE66:
	.size	set_zeros, .-set_zeros
	.p2align 4,,15
	.globl	verify
	.type	verify, @function
verify:
.LFB67:
	.cfi_startproc
	testl	%edx, %edx
	jle	.L365
	leal	-1(%rdx), %eax
	vmovq	.LC8(%rip), %xmm2
	vmovsd	.LC17(%rip), %xmm1
	xorl	%r9d, %r9d
	leaq	8(,%rax,8), %r8
.L359:
	movq	(%rdi,%r9), %rcx
	movq	(%rsi,%r9), %rdx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%rdx), %xmm0, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	ja	.L364
	movl	$8, %eax
	jmp	.L361
	.p2align 4,,10
	.p2align 3
.L360:
	vmovsd	(%rcx,%rax), %xmm0
	vsubsd	(%rdx,%rax), %xmm0, %xmm0
	addq	$8, %rax
	vandpd	%xmm2, %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	ja	.L364
.L361:
	cmpq	%rax, %r8
	jne	.L360
	addq	$8, %r9
	cmpq	%r8, %r9
	jne	.L359
.L365:
	movl	$1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L364:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE67:
	.size	verify, .-verify
	.section	.rodata.str1.1
.LC19:
	.string	"\nResult OK!"
.LC20:
	.string	"\nResult not OK!"
.LC22:
	.string	"time = %lf s\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB50:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	$513, %edi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$64, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movl	$29793, %eax
	movb	$0, 55(%rsp)
	movl	$1680762733, 49(%rsp)
	movw	%ax, 53(%rsp)
	call	alloc_matrix
	movl	$513, %edi
	movq	%rax, %r12
	call	alloc_matrix
	movl	$513, %edi
	movq	%rax, %rbp
	call	alloc_matrix
	movl	$513, %edx
	leaq	49(%rsp), %rsi
	movq	%r12, %rdi
	movq	%rax, %rbx
	call	read_data
	movq	.LC18(%rip), %rax
	movl	$513, %esi
	movq	%rbx, %rdi
	vmovq	%rax, %xmm0
	call	fill_f
	movl	$513, %esi
	movq	%rbx, %rdi
	call	L2_norm
	xorl	%esi, %esi
	leaq	16(%rsp), %rdi
	vmovsd	%xmm0, 8(%rsp)
	call	gettimeofday@PLT
	movq	%rbx, %rdx
	movq	%rbp, %rsi
	movl	$9, %edi
	movq	.LC18(%rip), %rax
	vmovsd	8(%rsp), %xmm1
	vmovq	%rax, %xmm0
	call	multigrid_vcycle
	xorl	%esi, %esi
	leaq	32(%rsp), %rdi
	call	gettimeofday@PLT
	movl	$513, %edx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	verify
	testl	%eax, %eax
	jne	.L376
	leaq	.LC20(%rip), %rdi
	call	puts@PLT
.L372:
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm3, %xmm3, %xmm3
	vmovsd	.LC21(%rip), %xmm2
	vcvtsi2sdq	32(%rsp), %xmm1, %xmm1
	leaq	.LC22(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	vcvtsi2sdq	24(%rsp), %xmm0, %xmm0
	vcvtsi2sdq	16(%rsp), %xmm3, %xmm3
	vfnmadd132sd	%xmm2, %xmm1, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	40(%rsp), %xmm1, %xmm1
	vfmsub132sd	%xmm2, %xmm3, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	call	__printf_chk@PLT
	movl	$513, %esi
	movq	%r12, %rdi
	call	dealloc_matrix
	movl	$513, %esi
	movq	%rbp, %rdi
	call	dealloc_matrix
	movl	$513, %esi
	movq	%rbx, %rdi
	call	dealloc_matrix
	xorl	%eax, %eax
	movq	56(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L377
	addq	$64, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L376:
	.cfi_restore_state
	leaq	.LC19(%rip), %rdi
	call	puts@PLT
	jmp	.L372
.L377:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE50:
	.size	main, .-main
	.section	.rodata.str1.1
.LC23:
	.string	"%lf "
	.text
	.p2align 4,,15
	.globl	print_matrix
	.type	print_matrix, @function
print_matrix:
.LFB68:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L385
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	leal	-1(%rsi), %eax
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	leaq	8(%rdi,%rax,8), %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	leaq	8(,%rax,8), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	leaq	.LC23(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	.p2align 4,,10
	.p2align 3
.L380:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L381:
	movq	(%r14), %rax
	movq	%rbp, %rsi
	movl	$1, %edi
	vmovsd	(%rax,%rbx), %xmm0
	movl	$1, %eax
	addq	$8, %rbx
	call	__printf_chk@PLT
	cmpq	%rbx, %r12
	jne	.L381
	movl	$10, %edi
	addq	$8, %r14
	call	putchar@PLT
	cmpq	%r13, %r14
	jne	.L380
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L385:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	ret
	.cfi_endproc
.LFE68:
	.size	print_matrix, .-print_matrix
	.globl	epsilon
	.section	.rodata
	.align 8
	.type	epsilon, @object
	.size	epsilon, 8
epsilon:
	.long	2296604913
	.long	1055193269
	.globl	pi
	.align 8
	.type	pi, @object
	.size	pi, 8
pi:
	.long	1413754136
	.long	1074340347
	.globl	l
	.align 4
	.type	l, @object
	.size	l, 4
l:
	.long	9
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC2:
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC5:
	.long	1413754136
	.long	1074340347
	.align 8
.LC6:
	.long	3700601565
	.long	1075168253
	.align 8
.LC7:
	.long	450716388
	.long	1074906499
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC8:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst32
	.align 32
.LC9:
	.long	4294967295
	.long	2147483647
	.long	4294967295
	.long	2147483647
	.long	4294967295
	.long	2147483647
	.long	4294967295
	.long	2147483647
	.section	.rodata.cst8
	.align 8
.LC10:
	.long	0
	.long	1074790400
	.section	.rodata.cst32
	.align 32
.LC11:
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.section	.rodata.cst8
	.align 8
.LC12:
	.long	0
	.long	1070596096
	.section	.rodata.cst32
	.align 32
.LC13:
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.align 32
.LC14:
	.long	0
	.long	1070596096
	.long	0
	.long	1070596096
	.long	0
	.long	1070596096
	.long	0
	.long	1070596096
	.section	.rodata.cst8
	.align 8
.LC15:
	.long	0
	.long	1071644672
	.align 8
.LC16:
	.long	0
	.long	1072693248
	.align 8
.LC17:
	.long	2296604913
	.long	1055193269
	.align 8
.LC18:
	.long	0
	.long	1063256064
	.align 8
.LC21:
	.long	2696277389
	.long	1051772663
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
