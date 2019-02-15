	.file	"Multigrid0.c"
	.text
	.p2align 4,,15
	.globl	alloc_matrix
	.type	alloc_matrix, @function
alloc_matrix:
.LFB43:
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
	testl	%ebp, %ebp
	movq	%rax, %r13
	jle	.L1
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
.L1:
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
.LFE43:
	.size	alloc_matrix, .-alloc_matrix
	.p2align 4,,15
	.globl	dealloc_matrix
	.type	dealloc_matrix, @function
dealloc_matrix:
.LFB44:
	.cfi_startproc
	testl	%esi, %esi
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
	jle	.L8
	leal	-1(%rsi), %eax
	movq	%rdi, %rbx
	leaq	8(%rdi,%rax,8), %rbp
	.p2align 4,,10
	.p2align 3
.L9:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%rbp, %rbx
	jne	.L9
.L8:
	popq	%rbx
	.cfi_def_cfa_offset 24
	movq	%r12, %rdi
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	free@PLT
	.cfi_endproc
.LFE44:
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
.LFB45:
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
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbp
	movq	%rsi, %rdi
	leaq	.LC0(%rip), %rsi
	movl	%edx, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	call	fopen@PLT
	testq	%rax, %rax
	je	.L18
	testl	%ebx, %ebx
	jle	.L17
	movq	%rax, %r12
	leal	-1(%rbx), %eax
	leaq	.LC1(%rip), %r13
	leaq	8(%rbp,%rax,8), %r15
	leaq	8(,%rax,8), %r14
	.p2align 4,,10
	.p2align 3
.L15:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L16:
	movq	0(%rbp), %rdx
	xorl	%eax, %eax
	movq	%r13, %rsi
	movq	%r12, %rdi
	addq	%rbx, %rdx
	addq	$8, %rbx
	call	__isoc99_fscanf@PLT
	cmpq	%rbx, %r14
	jne	.L16
	addq	$8, %rbp
	cmpq	%r15, %rbp
	jne	.L15
.L17:
	movl	$1, %eax
.L12:
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
.L18:
	.cfi_restore_state
	movl	$-1, %eax
	jmp	.L12
	.cfi_endproc
.LFE45:
	.size	read_data, .-read_data
	.p2align 4,,15
	.globl	get_m
	.type	get_m, @function
get_m:
.LFB46:
	.cfi_startproc
	testl	%edi, %edi
	jle	.L27
	leal	-1(%rdi), %eax
	cmpl	$8, %eax
	jbe	.L28
	movl	%edi, %edx
	movdqa	.LC2(%rip), %xmm0
	shrl	$2, %edx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L24:
	addl	$1, %eax
	pslld	$1, %xmm0
	cmpl	%edx, %eax
	jb	.L24
	movdqa	%xmm0, %xmm2
	movdqa	%xmm0, %xmm1
	psrlq	$32, %xmm0
	movl	%edi, %ecx
	psrldq	$8, %xmm2
	pmuludq	%xmm2, %xmm1
	psrlq	$32, %xmm2
	pshufd	$8, %xmm1, %xmm1
	pmuludq	%xmm2, %xmm0
	andl	$-4, %ecx
	pshufd	$8, %xmm0, %xmm0
	cmpl	%ecx, %edi
	leal	1(%rcx), %edx
	punpckldq	%xmm0, %xmm1
	movdqa	%xmm1, %xmm0
	psrldq	$4, %xmm1
	pmuludq	%xmm1, %xmm0
	movd	%xmm0, %eax
	je	.L30
.L23:
	leal	1(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L21
	leal	2(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L21
	leal	3(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L21
	leal	4(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L21
	leal	5(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L21
	leal	6(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L21
	leal	7(%rdx), %ecx
	addl	%eax, %eax
	cmpl	%ecx, %edi
	jl	.L21
	addl	%eax, %eax
	addl	$8, %edx
	leal	(%rax,%rax), %ecx
	cmpl	%edx, %edi
	cmovge	%ecx, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L27:
	movl	$1, %eax
.L21:
	rep ret
	.p2align 4,,10
	.p2align 3
.L30:
	rep ret
	.p2align 4,,10
	.p2align 3
.L28:
	movl	$1, %eax
	movl	$1, %edx
	jmp	.L23
	.cfi_endproc
.LFE46:
	.size	get_m, .-get_m
	.section	.rodata.str1.1
.LC3:
	.string	"\n"
	.text
	.p2align 4,,15
	.globl	fill_f
	.type	fill_f, @function
fill_f:
.LFB47:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdi, %r14
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	leaq	.LC3(%rip), %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	%esi, %ebx
	subq	$48, %rsp
	.cfi_def_cfa_offset 96
	movsd	%xmm0, (%rsp)
	call	puts@PLT
	testl	%ebx, %ebx
	jle	.L31
	movsd	(%rsp), %xmm4
	leal	-1(%rbx), %ebp
	xorl	%r13d, %r13d
	movapd	%xmm4, %xmm7
	addq	$1, %rbp
	mulsd	%xmm4, %xmm7
	movsd	%xmm7, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L33:
	pxor	%xmm1, %xmm1
	xorl	%ebx, %ebx
	movsd	.LC4(%rip), %xmm0
	cvtsi2sd	%r13d, %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm1, 8(%rsp)
	mulsd	(%rsp), %xmm0
	call	sin@PLT
	movsd	8(%rsp), %xmm1
	movsd	%xmm0, 24(%rsp)
	movsd	.LC6(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	mulsd	(%rsp), %xmm0
	call	sin@PLT
	movq	(%r14,%r13,8), %r12
	movsd	%xmm0, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L34:
	pxor	%xmm2, %xmm2
	movsd	.LC4(%rip), %xmm0
	cvtsi2sd	%ebx, %xmm2
	mulsd	%xmm2, %xmm0
	movsd	%xmm2, 16(%rsp)
	mulsd	(%rsp), %xmm0
	call	sin@PLT
	movsd	16(%rsp), %xmm2
	movsd	%xmm0, 8(%rsp)
	movsd	.LC5(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	mulsd	(%rsp), %xmm0
	call	sin@PLT
	movsd	8(%rsp), %xmm1
	mulsd	40(%rsp), %xmm1
	mulsd	%xmm1, %xmm0
	mulsd	24(%rsp), %xmm0
	mulsd	32(%rsp), %xmm0
	movsd	%xmm0, (%r12,%rbx,8)
	addq	$1, %rbx
	cmpq	%rbx, %rbp
	jne	.L34
	addq	$1, %r13
	cmpq	%rbp, %r13
	jne	.L33
.L31:
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
.LFE47:
	.size	fill_f, .-fill_f
	.p2align 4,,15
	.globl	L1_norm
	.type	L1_norm, @function
L1_norm:
.LFB48:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L41
	leal	-1(%rsi), %eax
	pxor	%xmm0, %xmm0
	movq	.LC8(%rip), %xmm2
	salq	$3, %rax
	leaq	8(%rax,%rdi), %rsi
	leaq	8(%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L39:
	movq	(%rdi), %rax
	leaq	(%rcx,%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L40:
	movsd	(%rax), %xmm1
	addq	$8, %rax
	cmpq	%rax, %rdx
	andpd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	jne	.L40
	addq	$8, %rdi
	cmpq	%rsi, %rdi
	jne	.L39
	rep ret
.L41:
	pxor	%xmm0, %xmm0
	ret
	.cfi_endproc
.LFE48:
	.size	L1_norm, .-L1_norm
	.p2align 4,,15
	.globl	L2_norm
	.type	L2_norm, @function
L2_norm:
.LFB49:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L48
	leal	-1(%rsi), %eax
	pxor	%xmm2, %xmm2
	pxor	%xmm0, %xmm0
	salq	$3, %rax
	leaq	8(%rax,%rdi), %rsi
	leaq	8(%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L45:
	movq	(%rdi), %rax
	leaq	(%rcx,%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L46:
	movsd	(%rax), %xmm1
	addq	$8, %rax
	cmpq	%rax, %rdx
	mulsd	%xmm1, %xmm1
	addsd	%xmm1, %xmm0
	jne	.L46
	addq	$8, %rdi
	cmpq	%rsi, %rdi
	jne	.L45
	ucomisd	%xmm0, %xmm2
	sqrtsd	%xmm0, %xmm1
	ja	.L54
	movapd	%xmm1, %xmm0
	ret
.L48:
	pxor	%xmm1, %xmm1
	movapd	%xmm1, %xmm0
	ret
.L54:
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movsd	%xmm1, 8(%rsp)
	call	sqrt@PLT
	movsd	8(%rsp), %xmm1
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	movapd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE49:
	.size	L2_norm, .-L2_norm
	.p2align 4,,15
	.globl	Max_norm
	.type	Max_norm, @function
Max_norm:
.LFB50:
	.cfi_startproc
	movq	(%rdi), %rax
	testl	%esi, %esi
	movsd	(%rax), %xmm0
	jle	.L55
	leal	-1(%rsi), %eax
	movq	.LC8(%rip), %xmm2
	salq	$3, %rax
	leaq	8(%rdi,%rax), %rsi
	leaq	8(%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L60:
	movq	(%rdi), %rax
	leaq	(%rcx,%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L59:
	movsd	(%rax), %xmm1
	addq	$8, %rax
	cmpq	%rax, %rdx
	andpd	%xmm2, %xmm1
	maxsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	jne	.L59
	addq	$8, %rdi
	cmpq	%rdi, %rsi
	jne	.L60
.L55:
	rep ret
	.cfi_endproc
.LFE50:
	.size	Max_norm, .-Max_norm
	.p2align 4,,15
	.globl	L_def
	.type	L_def, @function
L_def:
.LFB51:
	.cfi_startproc
	leal	-1(%rcx), %eax
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
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	cmpl	$1, %eax
	movq	%rdi, -40(%rsp)
	movq	%rsi, -32(%rsp)
	movq	%rdx, -24(%rsp)
	movl	%eax, -12(%rsp)
	jle	.L64
	leal	-3(%rcx), %eax
	movsd	.LC9(%rip), %xmm2
	movapd	.LC10(%rip), %xmm1
	movl	$8, %r15d
	movl	%eax, -16(%rsp)
	leaq	16(,%rax,8), %rax
	movapd	%xmm2, %xmm3
	movapd	%xmm2, %xmm4
	movq	%rax, -48(%rsp)
	leal	-2(%rcx), %eax
	movl	%eax, -68(%rsp)
	.p2align 4,,10
	.p2align 3
.L72:
	movq	-40(%rsp), %rax
	movq	(%rax,%r15), %rcx
	movq	-8(%rax,%r15), %rdi
	movq	8(%rax,%r15), %r8
	movq	-24(%rsp), %rax
	movq	(%rax,%r15), %r14
	movq	-32(%rsp), %rax
	movq	(%rax,%r15), %r9
	leaq	8(%rdi), %rax
	leaq	24(%r9), %r10
	leaq	8(%r9), %rsi
	cmpq	%rax, %r10
	leaq	24(%rdi), %rax
	setbe	%r11b
	cmpq	%rax, %rsi
	setnb	%al
	orl	%eax, %r11d
	leaq	32(%rcx), %rax
	cmpq	%rax, %rsi
	setnb	%dl
	cmpq	%r10, %rcx
	setnb	%al
	orl	%edx, %eax
	andl	%r11d, %eax
	cmpl	$5, -68(%rsp)
	leaq	24(%r8), %r11
	seta	%dl
	andl	%edx, %eax
	leaq	8(%r8), %rdx
	cmpq	%rdx, %r10
	setbe	%dl
	cmpq	%r11, %rsi
	setnb	%r11b
	orl	%r11d, %edx
	testb	%dl, %al
	je	.L73
	leaq	8(%r14), %rax
	leaq	24(%r14), %rdx
	cmpq	%rax, %r10
	setbe	%al
	cmpq	%rdx, %rsi
	setnb	%dl
	orb	%dl, %al
	je	.L73
	movq	%rcx, %rdx
	shrq	$3, %rdx
	andl	$1, %edx
	cmpl	$1, %edx
	sbbl	%eax, %eax
	addl	$2, %eax
	cmpl	-16(%rsp), %eax
	ja	.L74
	testl	%edx, %edx
	movl	$1, -72(%rsp)
	je	.L68
	movsd	8(%rcx), %xmm0
	movl	$2, -72(%rsp)
	mulsd	%xmm4, %xmm0
	subsd	8(%rdi), %xmm0
	subsd	8(%r8), %xmm0
	subsd	(%rcx), %xmm0
	subsd	16(%rcx), %xmm0
	subsd	8(%r14), %xmm0
	movsd	%xmm0, 8(%r9)
.L68:
	movl	-68(%rsp), %eax
	movq	%rcx, -56(%rsp)
	xorl	%esi, %esi
	subl	%edx, %eax
	addq	$1, %rdx
	salq	$3, %rdx
	movl	%eax, -64(%rsp)
	shrl	%eax
	movl	%eax, -60(%rsp)
	leaq	(%rcx,%rdx), %r13
	leaq	-8(%rcx,%rdx), %rbx
	leaq	8(%rcx,%rdx), %r11
	movl	-60(%rsp), %ecx
	leaq	(%rdi,%rdx), %r12
	leaq	(%r8,%rdx), %rbp
	leaq	(%r14,%rdx), %r10
	xorl	%eax, %eax
	addq	%r9, %rdx
	.p2align 4,,10
	.p2align 3
.L69:
	movupd	0(%r13,%rax), %xmm0
	addl	$1, %esi
	mulpd	%xmm1, %xmm0
	movupd	(%r12,%rax), %xmm5
	movupd	0(%rbp,%rax), %xmm6
	subpd	%xmm5, %xmm0
	movupd	(%r10,%rax), %xmm7
	subpd	%xmm6, %xmm0
	subpd	(%rbx,%rax), %xmm0
	subpd	(%r11,%rax), %xmm0
	subpd	%xmm7, %xmm0
	movups	%xmm0, (%rdx,%rax)
	addq	$16, %rax
	cmpl	%ecx, %esi
	jb	.L69
	movl	-64(%rsp), %ebx
	movl	-72(%rsp), %edx
	movq	-56(%rsp), %rcx
	movl	%ebx, %eax
	andl	$-2, %eax
	addl	%eax, %edx
	cmpl	%eax, %ebx
	je	.L71
.L67:
	movslq	%edx, %rax
	addl	$1, %edx
	cmpl	-12(%rsp), %edx
	movsd	(%rcx,%rax,8), %xmm0
	mulsd	%xmm3, %xmm0
	subsd	(%rdi,%rax,8), %xmm0
	subsd	(%r8,%rax,8), %xmm0
	subsd	-8(%rcx,%rax,8), %xmm0
	subsd	8(%rcx,%rax,8), %xmm0
	subsd	(%r14,%rax,8), %xmm0
	movsd	%xmm0, (%r9,%rax,8)
	jge	.L71
	movslq	%edx, %rdx
	movsd	(%rcx,%rdx,8), %xmm0
	mulsd	%xmm3, %xmm0
	subsd	(%rdi,%rdx,8), %xmm0
	subsd	(%r8,%rdx,8), %xmm0
	subsd	-8(%rcx,%rdx,8), %xmm0
	subsd	8(%rcx,%rdx,8), %xmm0
	subsd	(%r14,%rdx,8), %xmm0
	movsd	%xmm0, (%r9,%rdx,8)
.L71:
	addq	$8, %r15
	cmpq	-48(%rsp), %r15
	jne	.L72
.L64:
	popq	%rbx
	.cfi_remember_state
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
	.p2align 4,,10
	.p2align 3
.L73:
	.cfi_restore_state
	movq	-48(%rsp), %rdx
	movl	$8, %eax
	.p2align 4,,10
	.p2align 3
.L66:
	movsd	(%rcx,%rax), %xmm0
	mulsd	%xmm2, %xmm0
	subsd	(%rdi,%rax), %xmm0
	subsd	(%r8,%rax), %xmm0
	subsd	-8(%rcx,%rax), %xmm0
	subsd	8(%rcx,%rax), %xmm0
	subsd	(%r14,%rax), %xmm0
	movsd	%xmm0, (%r9,%rax)
	addq	$8, %rax
	cmpq	%rdx, %rax
	jne	.L66
	jmp	.L71
	.p2align 4,,10
	.p2align 3
.L74:
	movl	$1, %edx
	jmp	.L67
	.cfi_endproc
.LFE51:
	.size	L_def, .-L_def
	.p2align 4,,15
	.globl	GS_update
	.type	GS_update, @function
GS_update:
.LFB52:
	.cfi_startproc
	cmpl	$2, %edx
	jle	.L94
	leal	-3(%rdx), %eax
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%ecx, %ecx
	movsd	.LC11(%rip), %xmm2
	leaq	8(,%rax,8), %rbx
	leaq	16(,%rax,8), %r11
	.p2align 4,,10
	.p2align 3
.L90:
	movq	8(%rdi,%rcx), %rdx
	movq	(%rdi,%rcx), %r10
	movl	$8, %eax
	movq	16(%rdi,%rcx), %r9
	movq	8(%rsi,%rcx), %r8
	movsd	(%rdx), %xmm1
	.p2align 4,,10
	.p2align 3
.L89:
	movsd	(%r10,%rax), %xmm0
	addsd	(%r9,%rax), %xmm0
	addsd	%xmm1, %xmm0
	addsd	8(%rdx,%rax), %xmm0
	addsd	(%r8,%rax), %xmm0
	movapd	%xmm0, %xmm1
	mulsd	%xmm2, %xmm1
	movsd	%xmm1, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%rax, %r11
	jne	.L89
	addq	$8, %rcx
	cmpq	%rcx, %rbx
	jne	.L90
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L94:
	.cfi_restore 3
	rep ret
	.cfi_endproc
.LFE52:
	.size	GS_update, .-GS_update
	.p2align 4,,15
	.globl	set_BC
	.type	set_BC, @function
set_BC:
.LFB53:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L97
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
.L99:
	movq	(%rdi,%rax), %rdx
	movq	$0x000000000, (%r10,%rax)
	movq	$0x000000000, (%r8,%rax)
	addq	$8, %rax
	cmpq	%rcx, %rax
	movq	$0x000000000, (%rdx)
	movq	$0x000000000, (%rdx,%r9)
	jne	.L99
.L97:
	rep ret
	.cfi_endproc
.LFE53:
	.size	set_BC, .-set_BC
	.p2align 4,,15
	.globl	res_R
	.type	res_R, @function
res_R:
.LFB54:
	.cfi_startproc
	testl	%edx, %edx
	jle	.L101
	leal	-1(%rdx), %eax
	movsd	.LC9(%rip), %xmm1
	salq	$4, %rax
	leaq	16(%rdi,%rax), %r9
	leaq	16(%rax), %r8
	.p2align 4,,10
	.p2align 3
.L103:
	movq	(%rdi), %rax
	movq	(%rsi), %rdx
	leaq	(%r8,%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L104:
	movsd	(%rax), %xmm0
	addq	$16, %rax
	addq	$8, %rdx
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rdx)
	cmpq	%rax, %rcx
	jne	.L104
	addq	$16, %rdi
	addq	$8, %rsi
	cmpq	%r9, %rdi
	jne	.L103
.L101:
	rep ret
	.cfi_endproc
.LFE54:
	.size	res_R, .-res_R
	.p2align 4,,15
	.globl	prol_P
	.type	prol_P, @function
prol_P:
.LFB55:
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
	movl	%ecx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	testl	%edx, %edx
	movq	%rdi, 48(%rsp)
	movq	%rsi, 56(%rsp)
	jle	.L107
	leal	-1(%rdx), %eax
	movq	%rdi, %rbx
	leaq	8(%rdi,%rax,8), %r13
	leaq	8(,%rax,8), %rbp
	.p2align 4,,10
	.p2align 3
.L108:
	movq	(%rbx), %rdi
	xorl	%esi, %esi
	movq	%rbp, %rdx
	addq	$8, %rbx
	call	memset@PLT
	cmpq	%r13, %rbx
	jne	.L108
.L107:
	cmpl	$1, %r12d
	jle	.L106
	leal	-2(%r12), %eax
	movsd	.LC14(%rip), %xmm5
	movapd	.LC12(%rip), %xmm3
	leaq	8(,%rax,8), %rax
	movapd	.LC13(%rip), %xmm4
	movq	%rax, 40(%rsp)
	leal	-1(%r12), %eax
	xorl	%r12d, %r12d
	leaq	0(,%rax,8), %rdx
	movq	%rax, %rsi
	movl	%eax, 36(%rsp)
	movl	%esi, %r13d
	andl	$-2, %esi
	movq	%rdx, 64(%rsp)
	movq	%rax, %rdx
	leaq	8(,%rax,8), %rax
	salq	$4, %rdx
	shrl	%r13d
	movl	%esi, 88(%rsp)
	movq	%rax, 72(%rsp)
	movslq	%esi, %rax
	movq	%rdx, 80(%rsp)
	leaq	0(,%rax,8), %rbp
	leal	(%rsi,%rsi), %eax
	movl	%r13d, 92(%rsp)
	movslq	%eax, %r15
	leaq	8(%rbp), %rbx
	movq	%rbp, %rax
	leaq	8(,%r15,8), %r14
	movq	%r12, %rbp
	movq	%rax, %r12
	movq	%rbx, (%rsp)
	.p2align 4,,10
	.p2align 3
.L115:
	movq	56(%rsp), %rcx
	movq	48(%rsp), %rbx
	movq	72(%rsp), %r10
	movq	80(%rsp), %r11
	movq	64(%rsp), %rdi
	movq	(%rcx,%rbp), %rax
	movq	(%rbx,%rbp,2), %rdx
	movq	8(%rcx,%rbp), %rsi
	movq	8(%rbx,%rbp,2), %rcx
	leaq	(%rax,%r10), %rbx
	leaq	(%rdx,%r11), %r8
	leaq	(%rax,%rdi), %r13
	addq	%rsi, %r10
	leaq	(%rcx,%r11), %r9
	leaq	(%rsi,%rdi), %r11
	movq	%rbx, 8(%rsp)
	leaq	8(%rax), %rbx
	movq	%r10, 16(%rsp)
	movq	%r13, 24(%rsp)
	cmpq	%r8, %rbx
	setnb	%r10b
	cmpq	8(%rsp), %rdx
	setnb	%dil
	orl	%edi, %r10d
	cmpq	%r8, %rax
	setnb	%dil
	cmpq	%r13, %rdx
	setnb	%r13b
	orl	%r13d, %edi
	andl	%edi, %r10d
	cmpl	$11, 36(%rsp)
	seta	%dil
	andl	%edi, %r10d
	cmpq	%r9, %rax
	setnb	%r13b
	cmpq	24(%rsp), %rcx
	setnb	%dil
	orl	%edi, %r13d
	andl	%r10d, %r13d
	cmpq	8(%rsp), %rcx
	setnb	%dil
	cmpq	%rbx, %r9
	setbe	%r10b
	orl	%r10d, %edi
	leaq	8(%rsi), %r10
	andl	%edi, %r13d
	cmpq	%r11, %rdx
	setnb	%bl
	cmpq	%r8, %rsi
	setnb	%dil
	orl	%edi, %ebx
	andl	%ebx, %r13d
	cmpq	16(%rsp), %rdx
	setnb	%dil
	cmpq	%r8, %r10
	leaq	32(%rdx), %r8
	setnb	%bl
	orl	%ebx, %edi
	andl	%edi, %r13d
	leaq	32(%rcx), %rdi
	cmpq	%rdi, %rdx
	setnb	%dil
	cmpq	%r8, %rcx
	setnb	%r8b
	orl	%r8d, %edi
	andl	%edi, %r13d
	cmpq	%r11, %rcx
	setnb	%dil
	cmpq	%r9, %rsi
	setnb	%r8b
	orl	%r8d, %edi
	testb	%dil, %r13b
	je	.L110
	cmpq	16(%rsp), %rcx
	setnb	%dil
	cmpq	%r10, %r9
	setbe	%r8b
	orb	%r8b, %dil
	je	.L110
	movl	92(%rsp), %ebx
	movq	%rax, %rdi
	movq	%rsi, %r8
	movq	%rdx, %r10
	movq	%rcx, %r9
	xorl	%r11d, %r11d
	.p2align 4,,10
	.p2align 3
.L111:
	movupd	(%rdi), %xmm0
	addl	$1, %r11d
	addq	$16, %rdi
	addq	$16, %r8
	addq	$32, %r10
	movupd	-8(%rdi), %xmm2
	addq	$32, %r9
	movapd	%xmm0, %xmm6
	addpd	%xmm0, %xmm2
	movupd	-16(%r8), %xmm1
	addpd	%xmm0, %xmm1
	mulpd	%xmm3, %xmm2
	mulpd	%xmm3, %xmm1
	unpckhpd	%xmm2, %xmm0
	unpcklpd	%xmm2, %xmm6
	movapd	%xmm1, %xmm2
	movups	%xmm0, -16(%r10)
	movups	%xmm6, -32(%r10)
	movupd	-8(%rdi), %xmm7
	movupd	-16(%rdi), %xmm0
	addpd	%xmm7, %xmm0
	movupd	-16(%r8), %xmm7
	addpd	%xmm7, %xmm0
	movupd	-8(%r8), %xmm7
	addpd	%xmm7, %xmm0
	mulpd	%xmm4, %xmm0
	unpcklpd	%xmm0, %xmm2
	unpckhpd	%xmm0, %xmm1
	movups	%xmm2, -32(%r9)
	movups	%xmm1, -16(%r9)
	cmpl	%ebx, %r11d
	jb	.L111
	movl	88(%rsp), %edi
	cmpl	%edi, 36(%rsp)
	je	.L114
	leaq	(%rax,%r12), %rdi
	leaq	(%rsi,%r12), %r8
	movq	(%rsp), %rbx
	movsd	(%rdi), %xmm0
	addq	%rbx, %rax
	movsd	%xmm0, (%rdx,%r15,8)
	movsd	.LC14(%rip), %xmm0
	movsd	(%rdi), %xmm1
	addsd	(%r8), %xmm1
	mulsd	%xmm0, %xmm1
	movsd	%xmm1, (%rcx,%r15,8)
	movsd	(%rdi), %xmm1
	addsd	(%rax), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rdx,%r14)
	movsd	(%rdi), %xmm0
	movsd	(%rsi,%rbx), %xmm1
	addsd	(%rax), %xmm0
	addsd	(%r8), %xmm0
	addsd	%xmm0, %xmm1
	movsd	.LC11(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rcx,%r14)
.L114:
	addq	$8, %rbp
	cmpq	40(%rsp), %rbp
	jne	.L115
.L106:
	addq	$104, %rsp
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
	.p2align 4,,10
	.p2align 3
.L110:
	.cfi_restore_state
	movq	40(%rsp), %r8
	movsd	.LC11(%rip), %xmm0
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L113:
	movsd	(%rax), %xmm1
	addq	$8, %rax
	movsd	%xmm1, (%rdx,%rdi,2)
	movsd	-8(%rax), %xmm1
	addsd	(%rsi,%rdi), %xmm1
	mulsd	%xmm5, %xmm1
	movsd	%xmm1, (%rcx,%rdi,2)
	movsd	-8(%rax), %xmm1
	addsd	(%rax), %xmm1
	mulsd	%xmm5, %xmm1
	movsd	%xmm1, 8(%rdx,%rdi,2)
	movsd	-8(%rax), %xmm1
	addsd	(%rax), %xmm1
	addsd	(%rsi,%rdi), %xmm1
	addsd	8(%rsi,%rdi), %xmm1
	mulsd	%xmm0, %xmm1
	movsd	%xmm1, 8(%rcx,%rdi,2)
	addq	$8, %rdi
	cmpq	%r8, %rdi
	jne	.L113
	jmp	.L114
	.cfi_endproc
.LFE55:
	.size	prol_P, .-prol_P
	.p2align 4,,15
	.globl	multigrid_vcycle
	.type	multigrid_vcycle, @function
multigrid_vcycle:
.LFB42:
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
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$216, %rsp
	.cfi_def_cfa_offset 272
	testl	%edi, %edi
	jle	.L171
	leal	-1(%rdi), %r8d
	cmpl	$8, %r8d
	jbe	.L172
	movl	%edi, %ecx
	movdqa	.LC2(%rip), %xmm2
	shrl	$2, %ecx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L130:
	addl	$1, %eax
	pslld	$1, %xmm2
	cmpl	%eax, %ecx
	ja	.L130
	movdqa	%xmm2, %xmm3
	movl	%edi, %ecx
	andl	$-4, %ecx
	psrldq	$8, %xmm3
	movdqa	%xmm3, %xmm4
	psrlq	$32, %xmm3
	cmpl	%edi, %ecx
	leal	1(%rcx), %eax
	pmuludq	%xmm2, %xmm4
	psrlq	$32, %xmm2
	pmuludq	%xmm3, %xmm2
	pshufd	$8, %xmm4, %xmm3
	pshufd	$8, %xmm2, %xmm2
	punpckldq	%xmm2, %xmm3
	movdqa	%xmm3, %xmm2
	psrldq	$4, %xmm3
	pmuludq	%xmm3, %xmm2
	movd	%xmm2, 8(%rsp)
	je	.L131
.L129:
	leal	1(%rax), %ecx
	sall	8(%rsp)
	movl	8(%rsp), %ebx
	cmpl	%ecx, %edi
	jl	.L131
	leal	2(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, 8(%rsp)
	cmpl	%ecx, %edi
	jl	.L131
	leal	3(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, 8(%rsp)
	cmpl	%ecx, %edi
	jl	.L131
	leal	4(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, 8(%rsp)
	cmpl	%ecx, %edi
	jl	.L131
	leal	5(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, 8(%rsp)
	cmpl	%ecx, %edi
	jl	.L131
	leal	6(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, 8(%rsp)
	cmpl	%ecx, %edi
	jl	.L131
	leal	7(%rax), %ecx
	addl	%ebx, %ebx
	movl	%ebx, 8(%rsp)
	cmpl	%ecx, %edi
	jl	.L131
	addl	%ebx, %ebx
	addl	$8, %eax
	leal	(%rbx,%rbx), %ecx
	cmpl	%eax, %edi
	cmovl	%ebx, %ecx
	movl	%ecx, 8(%rsp)
.L131:
	movl	8(%rsp), %eax
	cmpl	$1, %edi
	leal	1(%rax), %ebp
	jle	.L128
	leal	-2(%rdi), %eax
	cmpl	$8, %eax
	jbe	.L173
	movl	%r8d, %ecx
	movdqa	.LC2(%rip), %xmm2
	shrl	$2, %ecx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L133:
	addl	$1, %eax
	pslld	$1, %xmm2
	cmpl	%eax, %ecx
	ja	.L133
	movdqa	%xmm2, %xmm3
	movl	%r8d, %r9d
	andl	$-4, %r9d
	psrldq	$8, %xmm3
	movdqa	%xmm3, %xmm4
	psrlq	$32, %xmm3
	cmpl	%r8d, %r9d
	leal	1(%r9), %ecx
	pmuludq	%xmm2, %xmm4
	psrlq	$32, %xmm2
	pmuludq	%xmm3, %xmm2
	pshufd	$8, %xmm4, %xmm3
	pshufd	$8, %xmm2, %xmm2
	punpckldq	%xmm2, %xmm3
	movdqa	%xmm3, %xmm2
	psrldq	$4, %xmm3
	pmuludq	%xmm3, %xmm2
	movd	%xmm2, %eax
	je	.L134
.L132:
	leal	1(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L134
	leal	2(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L134
	leal	3(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L134
	leal	4(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L134
	leal	5(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L134
	leal	6(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L134
	leal	7(%rcx), %r8d
	addl	%eax, %eax
	cmpl	%r8d, %edi
	jle	.L134
	addl	%eax, %eax
	addl	$8, %ecx
	leal	(%rax,%rax), %r8d
	cmpl	%ecx, %edi
	cmovg	%r8d, %eax
.L134:
	addl	$1, %eax
	movl	%eax, 128(%rsp)
.L135:
	leal	-1(%rbp), %ebx
	movslq	%ebp, %r14
	movl	%edi, 132(%rsp)
	leaq	0(,%r14,8), %rax
	movsd	%xmm1, 24(%rsp)
	movq	%rdx, 200(%rsp)
	leaq	8(,%rbx,8), %r13
	movsd	%xmm0, 136(%rsp)
	movq	%rsi, %r12
	movq	%rax, %rdi
	movq	%rax, 56(%rsp)
	call	malloc@PLT
	movl	%ebx, 12(%rsp)
	movq	%rbx, 64(%rsp)
	movq	%rax, %rbx
	movq	%r13, 96(%rsp)
	movq	%rax, 16(%rsp)
	addq	%rax, %r13
	movq	%rax, 152(%rsp)
	.p2align 4,,10
	.p2align 3
.L137:
	movl	$8, %esi
	movq	%r14, %rdi
	addq	$8, %rbx
	call	calloc@PLT
	movq	%rax, -8(%rbx)
	cmpq	%rbx, %r13
	jne	.L137
	movslq	128(%rsp), %r13
	leaq	0(,%r13,8), %rax
	movq	%rax, %rdi
	movq	%rax, 40(%rsp)
	call	malloc@PLT
	leal	-1(%r13), %esi
	movq	%rbx, 80(%rsp)
	movq	%rax, 32(%rsp)
	movq	%rax, 160(%rsp)
	movq	%rax, %rbx
	leaq	8(,%rsi,8), %r15
	movq	%rsi, 72(%rsp)
	movq	%r15, 48(%rsp)
	addq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L138:
	movl	$8, %esi
	movq	%r13, %rdi
	addq	$8, %rbx
	call	calloc@PLT
	movq	%rax, -8(%rbx)
	cmpq	%rbx, %r15
	jne	.L138
	movq	56(%rsp), %rdi
	movq	%rbx, 176(%rsp)
	movq	80(%rsp), %rbx
	call	malloc@PLT
	movq	96(%rsp), %r15
	movq	%rbx, 56(%rsp)
	movq	%rax, %rbx
	movq	%rax, 88(%rsp)
	movq	%rax, 168(%rsp)
	addq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L139:
	movl	$8, %esi
	movq	%r14, %rdi
	addq	$8, %rbx
	call	calloc@PLT
	movq	%rax, -8(%rbx)
	cmpq	%rbx, %r15
	jne	.L139
	movq	40(%rsp), %rdi
	movq	%rbx, 184(%rsp)
	movq	56(%rsp), %rbx
	call	malloc@PLT
	movq	48(%rsp), %r14
	movq	%rax, %r15
	movq	%rax, 80(%rsp)
	movq	%rax, 144(%rsp)
	addq	%rax, %r14
	.p2align 4,,10
	.p2align 3
.L140:
	movl	$8, %esi
	movq	%r13, %rdi
	addq	$8, %r15
	call	calloc@PLT
	movq	%rax, -8(%r15)
	cmpq	%r15, %r14
	jne	.L140
	movl	8(%rsp), %eax
	movsd	.LC11(%rip), %xmm2
	movq	200(%rsp), %r14
	movsd	24(%rsp), %xmm1
	movsd	.LC9(%rip), %xmm4
	movq	%rbx, 104(%rsp)
	subl	$2, %eax
	movapd	%xmm2, %xmm3
	leaq	8(,%rax,8), %rsi
	leaq	16(,%rax,8), %r13
	movq	72(%rsp), %rax
	movq	%r15, 192(%rsp)
	movq	%rsi, 40(%rsp)
	movq	16(%rsp), %rsi
	salq	$4, %rax
	movq	%rax, 120(%rsp)
	leaq	16(%rsi,%rax), %rax
	movq	%rax, 112(%rsp)
	movq	64(%rsp), %rax
	leaq	8(,%rax,8), %rax
	movq	%rax, %rbx
.L141:
	divsd	24(%rsp), %xmm1
	ucomisd	.LC15(%rip), %xmm1
	jbe	.L208
	xorl	%ecx, %ecx
	cmpl	$1, 8(%rsp)
	movq	40(%rsp), %r9
	je	.L166
	.p2align 4,,10
	.p2align 3
.L143:
	movq	8(%r12,%rcx), %rdx
	movq	(%r12,%rcx), %r8
	movl	$8, %eax
	movq	16(%r12,%rcx), %rdi
	movq	8(%r14,%rcx), %rsi
	movsd	(%rdx), %xmm0
	.p2align 4,,10
	.p2align 3
.L142:
	movsd	(%r8,%rax), %xmm1
	addsd	(%rdi,%rax), %xmm1
	addsd	%xmm1, %xmm0
	addsd	8(%rdx,%rax), %xmm0
	addsd	(%rsi,%rax), %xmm0
	mulsd	%xmm2, %xmm0
	movsd	%xmm0, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%rax, %r13
	jne	.L142
	addq	$8, %rcx
	cmpq	%rcx, %r9
	jne	.L143
.L166:
	movq	16(%rsp), %r15
	movq	%r12, %rdi
	movl	%ebp, %ecx
	movq	%r14, %rdx
	movsd	%xmm3, 64(%rsp)
	movsd	%xmm4, 56(%rsp)
	movq	%r15, %rsi
	movsd	%xmm2, 48(%rsp)
	call	L_def
	movq	120(%rsp), %rax
	movq	%r15, %rsi
	movq	32(%rsp), %rdi
	movq	112(%rsp), %r9
	movsd	48(%rsp), %xmm2
	leaq	16(%rax), %r8
	movsd	56(%rsp), %xmm4
	movsd	64(%rsp), %xmm3
	.p2align 4,,10
	.p2align 3
.L144:
	movq	(%rsi), %rax
	movq	(%rdi), %rdx
	leaq	(%r8,%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L145:
	movsd	(%rax), %xmm0
	addq	$16, %rax
	addq	$8, %rdx
	mulsd	%xmm4, %xmm0
	movsd	%xmm0, -8(%rdx)
	cmpq	%rax, %rcx
	jne	.L145
	addq	$16, %rsi
	addq	$8, %rdi
	cmpq	%r9, %rsi
	jne	.L144
	movl	132(%rsp), %eax
	movq	80(%rsp), %r15
	movsd	%xmm3, 72(%rsp)
	movq	32(%rsp), %rdx
	movsd	24(%rsp), %xmm1
	movsd	136(%rsp), %xmm0
	leal	-1(%rax), %edi
	movq	%r15, %rsi
	movsd	%xmm4, 64(%rsp)
	movsd	%xmm2, 56(%rsp)
	call	multigrid_vcycle
	movq	%r15, %rsi
	movq	88(%rsp), %r15
	movl	%ebp, %edx
	movl	128(%rsp), %ecx
	movq	%r15, %rdi
	call	prol_P
	movsd	56(%rsp), %xmm2
	movq	%r13, 48(%rsp)
	movsd	64(%rsp), %xmm4
	xorl	%r10d, %r10d
	movsd	72(%rsp), %xmm3
	movq	%r15, %r13
	.p2align 4,,10
	.p2align 3
.L147:
	movq	0(%r13,%r10), %r9
	movq	(%r12,%r10), %rdi
	leaq	16(%r9), %rax
	cmpq	%rax, %rdi
	leaq	16(%rdi), %rax
	setnb	%dl
	cmpq	%rax, %r9
	setnb	%al
	orb	%al, %dl
	je	.L178
	cmpl	$9, %ebp
	jbe	.L178
	movq	%rdi, %rdx
	shrq	$3, %rdx
	andl	$1, %edx
	cmpl	$1, %edx
	sbbl	%eax, %eax
	addl	$2, %eax
	cmpl	12(%rsp), %eax
	ja	.L151
	xorl	%r8d, %r8d
	testl	%edx, %edx
	je	.L152
	movsd	(%rdi), %xmm0
	movl	$1, %r8d
	subsd	(%r9), %xmm0
	movsd	%xmm0, (%rdi)
.L152:
	movl	%ebp, %r15d
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	subl	%edx, %r15d
	salq	$3, %rdx
	movl	%r15d, %r11d
	leaq	(%rdi,%rdx), %rsi
	addq	%r9, %rdx
	shrl	%r11d
	.p2align 4,,10
	.p2align 3
.L153:
	movapd	(%rsi,%rax), %xmm0
	addl	$1, %ecx
	movupd	(%rdx,%rax), %xmm5
	subpd	%xmm5, %xmm0
	movaps	%xmm0, (%rsi,%rax)
	addq	$16, %rax
	cmpl	%r11d, %ecx
	jb	.L153
	movl	%r15d, %eax
	andl	$-2, %eax
	addl	%eax, %r8d
	cmpl	%r15d, %eax
	je	.L150
	movslq	%r8d, %rdx
	addl	$1, %r8d
	leaq	(%rdi,%rdx,8), %rax
	cmpl	%ebp, %r8d
	movsd	(%rax), %xmm0
	subsd	(%r9,%rdx,8), %xmm0
	movsd	%xmm0, (%rax)
	jge	.L150
.L170:
	movslq	%r8d, %r8
	leaq	(%rdi,%r8,8), %rax
	movsd	(%rax), %xmm0
	subsd	(%r9,%r8,8), %xmm0
	movsd	%xmm0, (%rax)
.L150:
	addq	$8, %r10
	cmpq	%r10, %rbx
	jne	.L147
	xorl	%ecx, %ecx
	cmpl	$1, 8(%rsp)
	movq	48(%rsp), %r13
	movq	40(%rsp), %r9
	je	.L156
	.p2align 4,,10
	.p2align 3
.L155:
	movq	8(%r12,%rcx), %rdx
	movq	(%r12,%rcx), %r8
	movl	$8, %eax
	movq	16(%r12,%rcx), %rdi
	movq	8(%r14,%rcx), %rsi
	movsd	(%rdx), %xmm0
	.p2align 4,,10
	.p2align 3
.L159:
	movsd	(%r8,%rax), %xmm1
	addsd	(%rdi,%rax), %xmm1
	addsd	%xmm1, %xmm0
	addsd	8(%rdx,%rax), %xmm0
	addsd	(%rsi,%rax), %xmm0
	mulsd	%xmm3, %xmm0
	movsd	%xmm0, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%r13, %rax
	jne	.L159
	addq	$8, %rcx
	cmpq	%r9, %rcx
	jne	.L155
.L156:
	movq	16(%rsp), %rcx
	pxor	%xmm0, %xmm0
	movq	96(%rsp), %rsi
	movq	104(%rsp), %rdi
	.p2align 4,,10
	.p2align 3
.L160:
	movq	(%rcx), %rax
	leaq	(%rsi,%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L161:
	movsd	(%rax), %xmm1
	addq	$8, %rax
	cmpq	%rax, %rdx
	mulsd	%xmm1, %xmm1
	addsd	%xmm1, %xmm0
	jne	.L161
	addq	$8, %rcx
	cmpq	%rdi, %rcx
	jne	.L160
	pxor	%xmm7, %xmm7
	sqrtsd	%xmm0, %xmm1
	ucomisd	%xmm0, %xmm7
	jbe	.L141
	movsd	%xmm3, 72(%rsp)
	movsd	%xmm4, 64(%rsp)
	movsd	%xmm2, 56(%rsp)
	movsd	%xmm1, 48(%rsp)
	call	sqrt@PLT
	movsd	72(%rsp), %xmm3
	movsd	64(%rsp), %xmm4
	movsd	56(%rsp), %xmm2
	movsd	48(%rsp), %xmm1
	jmp	.L141
	.p2align 4,,10
	.p2align 3
.L178:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L149:
	movsd	(%rdi,%rax), %xmm0
	subsd	(%r9,%rax), %xmm0
	movsd	%xmm0, (%rdi,%rax)
	addq	$8, %rax
	cmpq	%rax, %rbx
	jne	.L149
	jmp	.L150
	.p2align 4,,10
	.p2align 3
.L151:
	movsd	(%rdi), %xmm0
	movl	$1, %r8d
	subsd	(%r9), %xmm0
	movsd	%xmm0, (%rdi)
	jmp	.L170
	.p2align 4,,10
	.p2align 3
.L208:
	movq	152(%rsp), %rbp
	movq	104(%rsp), %rbx
	.p2align 4,,10
	.p2align 3
.L164:
	movq	0(%rbp), %rdi
	addq	$8, %rbp
	call	free@PLT
	cmpq	%rbx, %rbp
	jne	.L164
	movq	16(%rsp), %rdi
	call	free@PLT
	movq	160(%rsp), %rbx
	movq	176(%rsp), %rbp
	.p2align 4,,10
	.p2align 3
.L167:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%rbp, %rbx
	jne	.L167
	movq	32(%rsp), %rdi
	call	free@PLT
	movq	168(%rsp), %rbx
	movq	184(%rsp), %rbp
	.p2align 4,,10
	.p2align 3
.L168:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%rbp, %rbx
	jne	.L168
	movq	88(%rsp), %rdi
	call	free@PLT
	movq	144(%rsp), %rbx
	movq	192(%rsp), %rbp
	.p2align 4,,10
	.p2align 3
.L169:
	movq	(%rbx), %rdi
	addq	$8, %rbx
	call	free@PLT
	cmpq	%rbp, %rbx
	jne	.L169
	movq	80(%rsp), %rdi
	addq	$216, %rsp
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
	jmp	free@PLT
.L171:
	.cfi_restore_state
	movl	$2, %ebp
	movl	$1, 8(%rsp)
.L128:
	cmpl	$1, %edi
	jne	.L174
	mulsd	%xmm0, %xmm0
	movq	8(%rdx), %rdx
	movq	8(%rsi), %rax
	mulsd	8(%rdx), %xmm0
	movsd	%xmm0, 8(%rax)
	addq	$216, %rsp
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
.L172:
	.cfi_restore_state
	movl	$1, %eax
	movl	$1, 8(%rsp)
	jmp	.L129
.L173:
	movl	$1, %ecx
	movl	$1, %eax
	jmp	.L132
.L174:
	movl	$2, 128(%rsp)
	jmp	.L135
	.cfi_endproc
.LFE42:
	.size	multigrid_vcycle, .-multigrid_vcycle
	.p2align 4,,15
	.globl	u_update
	.type	u_update, @function
u_update:
.LFB56:
	.cfi_startproc
	testl	%edx, %edx
	jle	.L234
	leal	-1(%rdx), %eax
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
	xorl	%r11d, %r11d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	leaq	8(,%rax,8), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rax, %r12
	.p2align 4,,10
	.p2align 3
.L213:
	movq	(%rsi,%r11), %r10
	movq	(%rdi,%r11), %r8
	leaq	16(%r10), %rax
	cmpq	%rax, %r8
	leaq	16(%r8), %rax
	setnb	%cl
	cmpq	%rax, %r10
	setnb	%al
	orb	%al, %cl
	je	.L225
	cmpl	$9, %edx
	jbe	.L225
	movq	%r8, %rcx
	shrq	$3, %rcx
	andl	$1, %ecx
	cmpl	$1, %ecx
	sbbl	%eax, %eax
	addl	$2, %eax
	cmpl	%r12d, %eax
	ja	.L217
	xorl	%r9d, %r9d
	testl	%ecx, %ecx
	je	.L218
	movsd	(%r8), %xmm0
	movl	$1, %r9d
	subsd	(%r10), %xmm0
	movsd	%xmm0, (%r8)
.L218:
	movl	%edx, %r13d
	xorl	%eax, %eax
	xorl	%r15d, %r15d
	subl	%ecx, %r13d
	salq	$3, %rcx
	movl	%r13d, %ebx
	leaq	(%r8,%rcx), %r14
	addq	%r10, %rcx
	shrl	%ebx
	.p2align 4,,10
	.p2align 3
.L219:
	movapd	(%r14,%rax), %xmm0
	addl	$1, %r15d
	movupd	(%rcx,%rax), %xmm1
	subpd	%xmm1, %xmm0
	movaps	%xmm0, (%r14,%rax)
	addq	$16, %rax
	cmpl	%ebx, %r15d
	jb	.L219
	movl	%r13d, %eax
	andl	$-2, %eax
	addl	%eax, %r9d
	cmpl	%eax, %r13d
	je	.L216
	movslq	%r9d, %rcx
	addl	$1, %r9d
	leaq	(%r8,%rcx,8), %rax
	cmpl	%r9d, %edx
	movsd	(%rax), %xmm0
	subsd	(%r10,%rcx,8), %xmm0
	movsd	%xmm0, (%rax)
	jle	.L216
.L223:
	movslq	%r9d, %r9
	leaq	(%r8,%r9,8), %rax
	movsd	(%rax), %xmm0
	subsd	(%r10,%r9,8), %xmm0
	movsd	%xmm0, (%rax)
.L216:
	addq	$8, %r11
	cmpq	%rbp, %r11
	jne	.L213
	popq	%rbx
	.cfi_remember_state
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
	.p2align 4,,10
	.p2align 3
.L225:
	.cfi_restore_state
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L215:
	movsd	(%r8,%rax), %xmm0
	subsd	(%r10,%rax), %xmm0
	movsd	%xmm0, (%r8,%rax)
	addq	$8, %rax
	cmpq	%rbp, %rax
	jne	.L215
	jmp	.L216
	.p2align 4,,10
	.p2align 3
.L217:
	movsd	(%r8), %xmm0
	movl	$1, %r9d
	subsd	(%r10), %xmm0
	movsd	%xmm0, (%r8)
	jmp	.L223
.L234:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	rep ret
	.cfi_endproc
.LFE56:
	.size	u_update, .-u_update
	.p2align 4,,15
	.globl	set_zeros
	.type	set_zeros, @function
set_zeros:
.LFB57:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L242
	leal	-1(%rsi), %eax
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	leaq	8(%rdi,%rax,8), %r12
	leaq	8(,%rax,8), %rbp
	.p2align 4,,10
	.p2align 3
.L239:
	movq	(%rbx), %rdi
	xorl	%esi, %esi
	movq	%rbp, %rdx
	addq	$8, %rbx
	call	memset@PLT
	cmpq	%r12, %rbx
	jne	.L239
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L242:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	rep ret
	.cfi_endproc
.LFE57:
	.size	set_zeros, .-set_zeros
	.p2align 4,,15
	.globl	verify
	.type	verify, @function
verify:
.LFB58:
	.cfi_startproc
	testl	%edx, %edx
	jle	.L253
	leal	-1(%rdx), %eax
	movq	.LC8(%rip), %xmm2
	movsd	.LC15(%rip), %xmm1
	xorl	%r9d, %r9d
	leaq	8(,%rax,8), %r8
.L247:
	movq	(%rdi,%r9), %rcx
	movq	(%rsi,%r9), %rdx
	movsd	(%rcx), %xmm0
	subsd	(%rdx), %xmm0
	andpd	%xmm2, %xmm0
	ucomisd	%xmm1, %xmm0
	ja	.L252
	movl	$8, %eax
	jmp	.L249
	.p2align 4,,10
	.p2align 3
.L248:
	movsd	(%rcx,%rax), %xmm0
	subsd	(%rdx,%rax), %xmm0
	addq	$8, %rax
	andpd	%xmm2, %xmm0
	ucomisd	%xmm1, %xmm0
	ja	.L252
.L249:
	cmpq	%rax, %r8
	jne	.L248
	addq	$8, %r9
	cmpq	%r8, %r9
	jne	.L247
.L253:
	movl	$1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L252:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE58:
	.size	verify, .-verify
	.section	.rodata.str1.1
.LC17:
	.string	"\nResult OK!"
.LC18:
	.string	"\nResult not OK!"
.LC20:
	.string	"time = %lf s\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movl	$513, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$64, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movl	$29793, %eax
	movl	$1680762733, 49(%rsp)
	movb	$0, 55(%rsp)
	movw	%ax, 53(%rsp)
	call	alloc_matrix
	movl	$513, %edi
	movq	%rax, %r12
	call	alloc_matrix
	movl	$513, %edi
	movq	%rax, %rbp
	call	alloc_matrix
	leaq	49(%rsp), %rsi
	movl	$513, %edx
	movq	%r12, %rdi
	movq	%rax, %rbx
	call	read_data
	movsd	.LC16(%rip), %xmm0
	movl	$513, %esi
	movq	%rbx, %rdi
	call	fill_f
	movl	$513, %esi
	movq	%rbx, %rdi
	call	L2_norm
	leaq	16(%rsp), %rdi
	xorl	%esi, %esi
	movsd	%xmm0, 8(%rsp)
	call	gettimeofday@PLT
	movsd	8(%rsp), %xmm1
	movq	%rbx, %rdx
	movsd	.LC16(%rip), %xmm0
	movq	%rbp, %rsi
	movl	$9, %edi
	call	multigrid_vcycle
	leaq	32(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday@PLT
	movl	$513, %edx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	verify
	testl	%eax, %eax
	jne	.L262
	leaq	.LC18(%rip), %rdi
	call	puts@PLT
.L259:
	pxor	%xmm0, %xmm0
	leaq	.LC20(%rip), %rsi
	movsd	.LC19(%rip), %xmm2
	movl	$1, %edi
	pxor	%xmm1, %xmm1
	movl	$1, %eax
	cvtsi2sdq	40(%rsp), %xmm0
	divsd	%xmm2, %xmm0
	cvtsi2sdq	32(%rsp), %xmm1
	addsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	24(%rsp), %xmm1
	divsd	%xmm2, %xmm1
	pxor	%xmm2, %xmm2
	cvtsi2sdq	16(%rsp), %xmm2
	addsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
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
	jne	.L263
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
.L262:
	.cfi_restore_state
	leaq	.LC17(%rip), %rdi
	call	puts@PLT
	jmp	.L259
.L263:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.section	.rodata.str1.1
.LC21:
	.string	"%lf "
	.text
	.p2align 4,,15
	.globl	print_matrix
	.type	print_matrix, @function
print_matrix:
.LFB59:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L270
	leal	-1(%rsi), %eax
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	leaq	.LC21(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	leaq	8(%rdi,%rax,8), %r14
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	leaq	8(,%rax,8), %r13
	movq	%rdi, %rbp
	.p2align 4,,10
	.p2align 3
.L266:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L267:
	movq	0(%rbp), %rax
	movq	%r12, %rsi
	movl	$1, %edi
	movsd	(%rax,%rbx), %xmm0
	movl	$1, %eax
	addq	$8, %rbx
	call	__printf_chk@PLT
	cmpq	%rbx, %r13
	jne	.L267
	movl	$10, %edi
	addq	$8, %rbp
	call	putchar@PLT
	cmpq	%r14, %rbp
	jne	.L266
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
.L270:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	rep ret
	.cfi_endproc
.LFE59:
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
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC2:
	.long	1
	.long	1
	.long	1
	.long	1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC4:
	.long	1413754136
	.long	1074340347
	.align 8
.LC5:
	.long	3700601565
	.long	1075168253
	.align 8
.LC6:
	.long	450716388
	.long	1074906499
	.section	.rodata.cst16
	.align 16
.LC8:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC9:
	.long	0
	.long	1074790400
	.section	.rodata.cst16
	.align 16
.LC10:
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.section	.rodata.cst8
	.align 8
.LC11:
	.long	0
	.long	1070596096
	.section	.rodata.cst16
	.align 16
.LC12:
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.align 16
.LC13:
	.long	0
	.long	1070596096
	.long	0
	.long	1070596096
	.section	.rodata.cst8
	.align 8
.LC14:
	.long	0
	.long	1071644672
	.align 8
.LC15:
	.long	2296604913
	.long	1055193269
	.align 8
.LC16:
	.long	0
	.long	1063256064
	.align 8
.LC19:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
