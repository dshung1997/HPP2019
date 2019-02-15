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
	jle	.L24
	addl	$1, %edi
	movl	$1, %eax
	movl	$1, %edx
	.p2align 4,,10
	.p2align 3
.L23:
	addl	$1, %edx
	addl	%eax, %eax
	cmpl	%edx, %edi
	jne	.L23
	rep ret
	.p2align 4,,10
	.p2align 3
.L24:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE46:
	.size	get_m, .-get_m
	.section	.rodata.str1.1
.LC2:
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
	leaq	.LC2(%rip), %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	%esi, %ebx
	subq	$48, %rsp
	.cfi_def_cfa_offset 96
	movsd	%xmm0, (%rsp)
	call	puts@PLT
	testl	%ebx, %ebx
	jle	.L26
	movsd	(%rsp), %xmm4
	leal	-1(%rbx), %ebp
	xorl	%r13d, %r13d
	movapd	%xmm4, %xmm7
	addq	$1, %rbp
	mulsd	%xmm4, %xmm7
	movsd	%xmm7, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L28:
	pxor	%xmm1, %xmm1
	xorl	%ebx, %ebx
	movsd	.LC3(%rip), %xmm0
	cvtsi2sd	%r13d, %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm1, 8(%rsp)
	mulsd	(%rsp), %xmm0
	call	sin@PLT
	movsd	8(%rsp), %xmm1
	movsd	%xmm0, 24(%rsp)
	movsd	.LC5(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	mulsd	(%rsp), %xmm0
	call	sin@PLT
	movq	(%r14,%r13,8), %r12
	movsd	%xmm0, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L29:
	pxor	%xmm2, %xmm2
	movsd	.LC3(%rip), %xmm0
	cvtsi2sd	%ebx, %xmm2
	mulsd	%xmm2, %xmm0
	movsd	%xmm2, 16(%rsp)
	mulsd	(%rsp), %xmm0
	call	sin@PLT
	movsd	16(%rsp), %xmm2
	movsd	%xmm0, 8(%rsp)
	movsd	.LC4(%rip), %xmm0
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
	jne	.L29
	addq	$1, %r13
	cmpq	%rbp, %r13
	jne	.L28
.L26:
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
	jle	.L36
	leal	-1(%rsi), %eax
	pxor	%xmm0, %xmm0
	movq	.LC7(%rip), %xmm2
	salq	$3, %rax
	leaq	8(%rdi,%rax), %rsi
	leaq	8(%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L34:
	movq	(%rdi), %rax
	leaq	(%rcx,%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L35:
	movsd	(%rax), %xmm1
	addq	$8, %rax
	cmpq	%rax, %rdx
	andpd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	jne	.L35
	addq	$8, %rdi
	cmpq	%rsi, %rdi
	jne	.L34
	rep ret
.L36:
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
	jle	.L43
	leal	-1(%rsi), %eax
	pxor	%xmm2, %xmm2
	pxor	%xmm0, %xmm0
	salq	$3, %rax
	leaq	8(%rdi,%rax), %rsi
	leaq	8(%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L40:
	movq	(%rdi), %rax
	leaq	(%rcx,%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L41:
	movsd	(%rax), %xmm1
	addq	$8, %rax
	cmpq	%rax, %rdx
	mulsd	%xmm1, %xmm1
	addsd	%xmm1, %xmm0
	jne	.L41
	addq	$8, %rdi
	cmpq	%rsi, %rdi
	jne	.L40
	ucomisd	%xmm0, %xmm2
	sqrtsd	%xmm0, %xmm1
	ja	.L49
	movapd	%xmm1, %xmm0
	ret
.L43:
	pxor	%xmm1, %xmm1
	movapd	%xmm1, %xmm0
	ret
.L49:
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
	movq	(%rdi), %rdx
	testl	%esi, %esi
	movsd	(%rdx), %xmm0
	jle	.L50
	leal	-1(%rsi), %eax
	addq	$8, %rdi
	movapd	%xmm0, %xmm1
	movq	.LC7(%rip), %xmm2
	salq	$3, %rax
	leaq	(%rdi,%rax), %rsi
	leaq	8(%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L52:
	leaq	8(%rdx), %rax
	addq	%rcx, %rdx
	jmp	.L55
	.p2align 4,,10
	.p2align 3
.L54:
	movsd	(%rax), %xmm1
	addq	$8, %rax
.L55:
	andpd	%xmm2, %xmm1
	cmpq	%rdx, %rax
	maxsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	jne	.L54
	cmpq	%rsi, %rdi
	je	.L50
	movq	(%rdi), %rdx
	addq	$8, %rdi
	movsd	(%rdx), %xmm1
	jmp	.L52
	.p2align 4,,10
	.p2align 3
.L50:
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
	cmpl	$2, %ecx
	jle	.L64
	leal	-3(%rcx), %eax
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movsd	.LC8(%rip), %xmm1
	movl	$8, %r8d
	leaq	16(,%rax,8), %r9
	.p2align 4,,10
	.p2align 3
.L60:
	movq	(%rdi,%r8), %rcx
	movq	-8(%rdi,%r8), %rbp
	movl	$8, %eax
	movq	8(%rdi,%r8), %rbx
	movq	(%rdx,%r8), %r11
	movq	(%rsi,%r8), %r10
	.p2align 4,,10
	.p2align 3
.L59:
	movsd	(%rcx,%rax), %xmm0
	mulsd	%xmm1, %xmm0
	subsd	0(%rbp,%rax), %xmm0
	subsd	(%rbx,%rax), %xmm0
	subsd	-8(%rcx,%rax), %xmm0
	subsd	8(%rcx,%rax), %xmm0
	subsd	(%r11,%rax), %xmm0
	movsd	%xmm0, (%r10,%rax)
	addq	$8, %rax
	cmpq	%rax, %r9
	jne	.L59
	addq	$8, %r8
	cmpq	%r9, %r8
	jne	.L60
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L64:
	.cfi_restore 3
	.cfi_restore 6
	rep ret
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
	jle	.L74
	leal	-3(%rdx), %eax
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%ecx, %ecx
	movsd	.LC9(%rip), %xmm1
	leaq	8(,%rax,8), %rbx
	leaq	16(,%rax,8), %r11
	.p2align 4,,10
	.p2align 3
.L70:
	movq	(%rdi,%rcx), %r10
	movq	16(%rdi,%rcx), %r9
	movl	$8, %eax
	movq	8(%rdi,%rcx), %rdx
	movq	8(%rsi,%rcx), %r8
	.p2align 4,,10
	.p2align 3
.L69:
	movsd	(%r10,%rax), %xmm0
	addsd	(%r9,%rax), %xmm0
	addsd	-8(%rdx,%rax), %xmm0
	addsd	8(%rdx,%rax), %xmm0
	addsd	(%r8,%rax), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%rax, %r11
	jne	.L69
	addq	$8, %rcx
	cmpq	%rcx, %rbx
	jne	.L70
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L74:
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
	jle	.L77
	movslq	%esi, %rax
	movq	(%rdi), %rcx
	salq	$3, %rax
	leaq	-8(%rax), %r9
	movq	-8(%rdi,%rax), %r8
	leal	-1(%rsi), %eax
	movq	%rcx, %rdx
	leaq	8(,%rax,8), %rsi
	xorl	%eax, %eax
	jmp	.L79
	.p2align 4,,10
	.p2align 3
.L80:
	movq	(%rdi,%rax), %rdx
.L79:
	movq	$0x000000000, (%rcx,%rax)
	movq	$0x000000000, (%r8,%rax)
	addq	$8, %rax
	cmpq	%rsi, %rax
	movq	$0x000000000, (%rdx)
	movq	$0x000000000, (%rdx,%r9)
	jne	.L80
.L77:
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
	jle	.L81
	leal	-1(%rdx), %eax
	movsd	.LC8(%rip), %xmm1
	salq	$4, %rax
	leaq	16(%rdi,%rax), %r9
	leaq	16(%rax), %r8
	.p2align 4,,10
	.p2align 3
.L83:
	movq	(%rdi), %rax
	movq	(%rsi), %rdx
	leaq	(%r8,%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L84:
	movsd	(%rax), %xmm0
	addq	$16, %rax
	addq	$8, %rdx
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rdx)
	cmpq	%rax, %rcx
	jne	.L84
	addq	$16, %rdi
	addq	$8, %rsi
	cmpq	%r9, %rdi
	jne	.L83
.L81:
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
	testl	%edx, %edx
	jle	.L87
	leal	-1(%rdx), %eax
	movq	%rdi, %r8
	salq	$3, %rax
	leaq	8(%rdi,%rax), %r10
	leaq	8(%rax), %r9
	.p2align 4,,10
	.p2align 3
.L88:
	movq	(%r8), %rax
	leaq	(%r9,%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L89:
	movq	$0x000000000, (%rax)
	addq	$8, %rax
	cmpq	%rax, %rdx
	jne	.L89
	addq	$8, %r8
	cmpq	%r10, %r8
	jne	.L88
.L87:
	cmpl	$1, %ecx
	jle	.L86
	leal	-2(%rcx), %eax
	movsd	.LC10(%rip), %xmm1
	movsd	.LC9(%rip), %xmm2
	xorl	%r10d, %r10d
	leaq	8(,%rax,8), %r11
	.p2align 4,,10
	.p2align 3
.L92:
	movq	(%rdi,%r10,2), %r9
	movq	8(%rsi,%r10), %rcx
	xorl	%eax, %eax
	movq	8(%rdi,%r10,2), %r8
	movq	(%rsi,%r10), %rdx
	.p2align 4,,10
	.p2align 3
.L91:
	movsd	(%rdx), %xmm0
	addq	$8, %rdx
	movsd	%xmm0, (%r9,%rax,2)
	movsd	-8(%rdx), %xmm0
	addsd	(%rcx,%rax), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%r8,%rax,2)
	movsd	-8(%rdx), %xmm0
	addsd	(%rdx), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%r9,%rax,2)
	movsd	-8(%rdx), %xmm0
	addsd	(%rdx), %xmm0
	addsd	(%rcx,%rax), %xmm0
	addsd	8(%rcx,%rax), %xmm0
	mulsd	%xmm2, %xmm0
	movsd	%xmm0, 8(%r8,%rax,2)
	addq	$8, %rax
	cmpq	%rax, %r11
	jne	.L91
	addq	$8, %r10
	cmpq	%r11, %r10
	jne	.L92
.L86:
	rep ret
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
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	testl	%edi, %edi
	jle	.L109
	leal	1(%rdi), %ecx
	movl	$1, %eax
	movl	$1, %ebx
	.p2align 4,,10
	.p2align 3
.L98:
	addl	$1, %eax
	addl	%ebx, %ebx
	cmpl	%eax, %ecx
	jne	.L98
	addl	$1, %ebx
	cmpl	$1, %edi
	jle	.L97
	movl	$1, %eax
	movl	$1, %ebp
	.p2align 4,,10
	.p2align 3
.L99:
	addl	$1, %eax
	addl	%ebp, %ebp
	cmpl	%eax, %edi
	jne	.L99
	addl	$1, %ebp
.L101:
	movl	%edi, %r15d
	movl	%ebx, %edi
	movsd	%xmm0, 32(%rsp)
	movsd	%xmm1, 16(%rsp)
	movq	%rdx, (%rsp)
	movq	%rsi, %r13
	call	alloc_matrix
	movl	%ebp, %edi
	movq	%rax, %r14
	call	alloc_matrix
	movl	%ebx, %edi
	movq	%rax, 24(%rsp)
	call	alloc_matrix
	movl	%ebp, %edi
	movq	%rax, %r12
	call	alloc_matrix
	movsd	16(%rsp), %xmm3
	movq	%rax, 8(%rsp)
	movapd	%xmm3, %xmm0
	divsd	%xmm3, %xmm0
	ucomisd	.LC11(%rip), %xmm0
	jbe	.L103
	leal	-1(%r15), %eax
	movl	%eax, 44(%rsp)
	leal	-1(%rbx), %eax
	leaq	8(,%rax,8), %r15
.L108:
	movq	(%rsp), %rsi
	movq	%r13, %rdi
	movl	%ebx, %edx
	call	GS_update
	movq	(%rsp), %rdx
	movl	%ebx, %ecx
	movq	%r14, %rsi
	call	L_def
	movq	24(%rsp), %r10
	movl	%ebp, %edx
	movq	%r14, %rdi
	movq	%r10, %rsi
	call	res_R
	movq	8(%rsp), %rsi
	movl	44(%rsp), %edi
	movq	%r10, %rdx
	movsd	16(%rsp), %xmm1
	movsd	32(%rsp), %xmm0
	call	multigrid_vcycle
	movq	8(%rsp), %rsi
	movl	%ebp, %ecx
	movl	%ebx, %edx
	movq	%r12, %rdi
	call	prol_P
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L105:
	movq	0(%r13,%rsi), %rdx
	movq	(%r12,%rsi), %rcx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L106:
	movsd	(%rdx,%rax), %xmm0
	subsd	(%rcx,%rax), %xmm0
	movsd	%xmm0, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%rax, %r15
	jne	.L106
	addq	$8, %rsi
	cmpq	%r15, %rsi
	jne	.L105
	movq	(%rsp), %rsi
	movl	%ebx, %edx
	movq	%r13, %rdi
	call	GS_update
	movl	%ebx, %esi
	movq	%r14, %rdi
	call	L2_norm
	divsd	16(%rsp), %xmm0
	ucomisd	.LC11(%rip), %xmm0
	ja	.L108
.L103:
	movl	%ebx, %esi
	movq	%r14, %rdi
	call	dealloc_matrix
	movq	24(%rsp), %rdi
	movl	%ebp, %esi
	call	dealloc_matrix
	movl	%ebx, %esi
	movq	%r12, %rdi
	call	dealloc_matrix
	movq	8(%rsp), %rdi
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%ebp, %esi
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
	jmp	dealloc_matrix
.L109:
	.cfi_restore_state
	movl	$2, %ebx
.L97:
	cmpl	$1, %edi
	jne	.L110
	mulsd	%xmm0, %xmm0
	movq	8(%rdx), %rdx
	movq	8(%rsi), %rax
	mulsd	8(%rdx), %xmm0
	movsd	%xmm0, 8(%rax)
	addq	$56, %rsp
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
.L110:
	.cfi_restore_state
	movl	$2, %ebp
	jmp	.L101
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
	jle	.L119
	leal	-1(%rdx), %eax
	xorl	%r9d, %r9d
	leaq	8(,%rax,8), %rcx
	.p2align 4,,10
	.p2align 3
.L121:
	movq	(%rdi,%r9), %rdx
	movq	(%rsi,%r9), %r8
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L122:
	movsd	(%rdx,%rax), %xmm0
	subsd	(%r8,%rax), %xmm0
	movsd	%xmm0, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%rax, %rcx
	jne	.L122
	addq	$8, %r9
	cmpq	%rcx, %r9
	jne	.L121
.L119:
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
	jle	.L124
	leal	-1(%rsi), %eax
	salq	$3, %rax
	leaq	8(%rdi,%rax), %rsi
	leaq	8(%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L126:
	movq	(%rdi), %rax
	leaq	(%rcx,%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L127:
	movq	$0x000000000, (%rax)
	addq	$8, %rax
	cmpq	%rax, %rdx
	jne	.L127
	addq	$8, %rdi
	cmpq	%rsi, %rdi
	jne	.L126
.L124:
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
	jle	.L137
	leal	-1(%rdx), %eax
	movq	.LC7(%rip), %xmm2
	movsd	.LC11(%rip), %xmm1
	xorl	%r9d, %r9d
	leaq	8(,%rax,8), %r8
.L131:
	movq	(%rdi,%r9), %rcx
	movq	(%rsi,%r9), %rdx
	movsd	(%rcx), %xmm0
	subsd	(%rdx), %xmm0
	andpd	%xmm2, %xmm0
	ucomisd	%xmm1, %xmm0
	ja	.L136
	movl	$8, %eax
	jmp	.L133
	.p2align 4,,10
	.p2align 3
.L132:
	movsd	(%rcx,%rax), %xmm0
	subsd	(%rdx,%rax), %xmm0
	addq	$8, %rax
	andpd	%xmm2, %xmm0
	ucomisd	%xmm1, %xmm0
	ja	.L136
.L133:
	cmpq	%rax, %r8
	jne	.L132
	addq	$8, %r9
	cmpq	%r8, %r9
	jne	.L131
.L137:
	movl	$1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L136:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE58:
	.size	verify, .-verify
	.section	.rodata.str1.1
.LC13:
	.string	"\nResult OK!"
.LC14:
	.string	"\nResult not OK!"
.LC16:
	.string	"time = %lf s\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	$1, %edx
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$72, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movl	$9, %eax
	.p2align 4,,10
	.p2align 3
.L142:
	addl	%edx, %edx
	subl	$1, %eax
	jne	.L142
	pxor	%xmm0, %xmm0
	movl	$29793, %eax
	movl	$1680762733, 49(%rsp)
	movsd	.LC12(%rip), %xmm1
	movw	%ax, 53(%rsp)
	movb	$0, 55(%rsp)
	cvtsi2sd	%edx, %xmm0
	movapd	%xmm1, %xmm3
	divsd	%xmm0, %xmm3
	addsd	%xmm1, %xmm0
	cvttsd2si	%xmm0, %ebx
	movl	%ebx, %edi
	movsd	%xmm3, (%rsp)
	call	alloc_matrix
	movl	%ebx, %edi
	movq	%rax, %r13
	call	alloc_matrix
	movl	%ebx, %edi
	movq	%rax, %r12
	call	alloc_matrix
	leaq	49(%rsp), %rsi
	movl	%ebx, %edx
	movq	%r13, %rdi
	movq	%rax, %rbp
	call	read_data
	movsd	(%rsp), %xmm0
	movl	%ebx, %esi
	movq	%rbp, %rdi
	call	fill_f
	movl	%ebx, %esi
	movq	%rbp, %rdi
	call	L2_norm
	leaq	16(%rsp), %rdi
	xorl	%esi, %esi
	movsd	%xmm0, 8(%rsp)
	call	gettimeofday@PLT
	movsd	8(%rsp), %xmm1
	movq	%rbp, %rdx
	movsd	(%rsp), %xmm0
	movq	%r12, %rsi
	movl	$9, %edi
	call	multigrid_vcycle
	leaq	32(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday@PLT
	movl	%ebx, %edx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	verify
	testl	%eax, %eax
	jne	.L148
	leaq	.LC14(%rip), %rdi
	call	puts@PLT
.L144:
	pxor	%xmm0, %xmm0
	leaq	.LC16(%rip), %rsi
	movsd	.LC15(%rip), %xmm2
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
	movl	%ebx, %esi
	movq	%r13, %rdi
	call	dealloc_matrix
	movl	%ebx, %esi
	movq	%r12, %rdi
	call	dealloc_matrix
	movl	%ebx, %esi
	movq	%rbp, %rdi
	call	dealloc_matrix
	xorl	%eax, %eax
	movq	56(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L149
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L148:
	.cfi_restore_state
	leaq	.LC13(%rip), %rdi
	call	puts@PLT
	jmp	.L144
.L149:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.section	.rodata.str1.1
.LC17:
	.string	"%lf "
	.text
	.p2align 4,,15
	.globl	print_matrix
	.type	print_matrix, @function
print_matrix:
.LFB59:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L156
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
	leaq	.LC17(%rip), %r12
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
.L152:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L153:
	movq	0(%rbp), %rax
	movq	%r12, %rsi
	movl	$1, %edi
	movsd	(%rax,%rbx), %xmm0
	movl	$1, %eax
	addq	$8, %rbx
	call	__printf_chk@PLT
	cmpq	%rbx, %r13
	jne	.L153
	movl	$10, %edi
	addq	$8, %rbp
	call	putchar@PLT
	cmpq	%r14, %rbp
	jne	.L152
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
.L156:
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
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	1413754136
	.long	1074340347
	.align 8
.LC4:
	.long	3700601565
	.long	1075168253
	.align 8
.LC5:
	.long	450716388
	.long	1074906499
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC7:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC8:
	.long	0
	.long	1074790400
	.align 8
.LC9:
	.long	0
	.long	1070596096
	.align 8
.LC10:
	.long	0
	.long	1071644672
	.align 8
.LC11:
	.long	2296604913
	.long	1055193269
	.align 8
.LC12:
	.long	0
	.long	1072693248
	.align 8
.LC15:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
