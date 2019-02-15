	.file	"Multigrid0.c"
	.text
	.globl	alloc_matrix
	.type	alloc_matrix, @function
alloc_matrix:
.LFB25:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movslq	%edi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	leaq	0(,%r13,8), %rdi
	movq	%r13, %r12
	xorl	%ebx, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	call	malloc@PLT
	movq	%rax, %rbp
.L2:
	cmpl	%ebx, %r12d
	jle	.L6
	movl	$8, %esi
	movq	%r13, %rdi
	call	calloc@PLT
	movq	%rax, 0(%rbp,%rbx,8)
	incq	%rbx
	jmp	.L2
.L6:
	popq	%rdx
	.cfi_def_cfa_offset 40
	movq	%rbp, %rax
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
.LFE25:
	.size	alloc_matrix, .-alloc_matrix
	.globl	dealloc_matrix
	.type	dealloc_matrix, @function
dealloc_matrix:
.LFB26:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%esi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	xorl	%ebx, %ebx
.L8:
	cmpl	%ebx, %r12d
	jle	.L11
	movq	0(%rbp,%rbx,8), %rdi
	incq	%rbx
	call	free@PLT
	jmp	.L8
.L11:
	popq	%rbx
	.cfi_def_cfa_offset 24
	movq	%rbp, %rdi
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	free@PLT
	.cfi_endproc
.LFE26:
	.size	dealloc_matrix, .-dealloc_matrix
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"r"
.LC1:
	.string	"%lf\n"
	.text
	.globl	read_data
	.type	read_data, @function
read_data:
.LFB27:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	leaq	.LC0(%rip), %rsi
	movl	%edx, %r12d
	xorl	%ebp, %ebp
	leaq	.LC1(%rip), %r15
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	call	fopen@PLT
	testq	%rax, %rax
	movq	%rax, %r13
	je	.L21
.L14:
	cmpl	%ebp, %r12d
	jle	.L17
	movslq	%r12d, %rax
	xorl	%ebx, %ebx
	movq	%rax, 8(%rsp)
.L15:
	movq	(%r14,%rbp,8), %rax
	movq	%r15, %rsi
	movq	%r13, %rdi
	leaq	(%rax,%rbx,8), %rdx
	xorl	%eax, %eax
	incq	%rbx
	call	__isoc99_fscanf@PLT
	cmpq	8(%rsp), %rbx
	jne	.L15
	incq	%rbp
	jmp	.L14
.L17:
	movl	$1, %eax
	jmp	.L12
.L21:
	orl	$-1, %eax
.L12:
	addq	$24, %rsp
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
	.cfi_endproc
.LFE27:
	.size	read_data, .-read_data
	.globl	get_m
	.type	get_m, @function
get_m:
.LFB28:
	.cfi_startproc
	movl	$1, %eax
	movl	$1, %edx
.L23:
	cmpl	%edi, %edx
	jg	.L25
	addl	%eax, %eax
	incl	%edx
	jmp	.L23
.L25:
	ret
	.cfi_endproc
.LFE28:
	.size	get_m, .-get_m
	.section	.rodata.str1.1
.LC2:
	.string	"\n"
	.text
	.globl	fill_f
	.type	fill_f, @function
fill_f:
.LFB29:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%esi, %r15d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r14
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	leaq	.LC2(%rip), %rdi
	movq	%r15, %r12
	xorl	%ebp, %ebp
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movsd	%xmm0, 8(%rsp)
	call	puts@PLT
.L27:
	cmpl	%r12d, %ebp
	movl	%ebp, %r13d
	jge	.L26
	xorl	%ebx, %ebx
.L30:
	cmpq	%r15, %rbx
	je	.L32
	cvtsi2sd	%ebx, %xmm1
	movsd	.LC3(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm1, 24(%rsp)
	mulsd	8(%rsp), %xmm0
	call	sin@PLT
	movsd	24(%rsp), %xmm1
	movsd	%xmm0, 16(%rsp)
	movsd	.LC4(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	mulsd	8(%rsp), %xmm0
	call	sin@PLT
	cvtsi2sd	%r13d, %xmm1
	movsd	%xmm0, 24(%rsp)
	movsd	.LC3(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm1, 40(%rsp)
	mulsd	8(%rsp), %xmm0
	call	sin@PLT
	movsd	40(%rsp), %xmm1
	movsd	%xmm0, 32(%rsp)
	movsd	.LC5(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	mulsd	8(%rsp), %xmm0
	call	sin@PLT
	movsd	8(%rsp), %xmm1
	movq	(%r14,%rbp,8), %rax
	mulsd	%xmm1, %xmm1
	mulsd	16(%rsp), %xmm1
	mulsd	24(%rsp), %xmm1
	mulsd	32(%rsp), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax,%rbx,8)
	incq	%rbx
	jmp	.L30
.L32:
	incq	%rbp
	jmp	.L27
.L26:
	addq	$56, %rsp
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
	.cfi_endproc
.LFE29:
	.size	fill_f, .-fill_f
	.globl	L1_norm
	.type	L1_norm, @function
L1_norm:
.LFB30:
	.cfi_startproc
	xorps	%xmm0, %xmm0
	xorl	%eax, %eax
	movq	.LC7(%rip), %xmm2
.L34:
	cmpl	%eax, %esi
	jle	.L38
	xorl	%edx, %edx
.L36:
	cmpl	%edx, %esi
	jle	.L39
	movq	(%rdi,%rax,8), %rcx
	movsd	(%rcx,%rdx,8), %xmm1
	incq	%rdx
	andps	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	jmp	.L36
.L39:
	incq	%rax
	jmp	.L34
.L38:
	ret
	.cfi_endproc
.LFE30:
	.size	L1_norm, .-L1_norm
	.globl	L2_norm
	.type	L2_norm, @function
L2_norm:
.LFB31:
	.cfi_startproc
	xorps	%xmm0, %xmm0
	xorl	%eax, %eax
.L41:
	cmpl	%eax, %esi
	jle	.L45
	xorl	%edx, %edx
.L43:
	cmpl	%edx, %esi
	jle	.L46
	movq	(%rdi,%rax,8), %rcx
	movsd	(%rcx,%rdx,8), %xmm1
	incq	%rdx
	mulsd	%xmm1, %xmm1
	addsd	%xmm1, %xmm0
	jmp	.L43
.L46:
	incq	%rax
	jmp	.L41
.L45:
	jmp	sqrt@PLT
	.cfi_endproc
.LFE31:
	.size	L2_norm, .-L2_norm
	.globl	Max_norm
	.type	Max_norm, @function
Max_norm:
.LFB32:
	.cfi_startproc
	movq	(%rdi), %rax
	movq	.LC7(%rip), %xmm2
	movsd	(%rax), %xmm0
	xorl	%eax, %eax
.L48:
	cmpl	%eax, %esi
	jle	.L55
	xorl	%edx, %edx
.L52:
	cmpl	%edx, %esi
	jle	.L56
	movq	(%rdi,%rax,8), %rcx
	movsd	(%rcx,%rdx,8), %xmm1
	incq	%rdx
	andps	%xmm2, %xmm1
	maxsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	jmp	.L52
.L56:
	incq	%rax
	jmp	.L48
.L55:
	ret
	.cfi_endproc
.LFE32:
	.size	Max_norm, .-Max_norm
	.globl	L_def
	.type	L_def, @function
L_def:
.LFB33:
	.cfi_startproc
	movl	$1, %r8d
	decl	%ecx
	cmpl	%r8d, %ecx
	movsd	.LC8(%rip), %xmm1
	jg	.L64
	ret
.L64:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
.L60:
	movq	(%rdi,%r8,8), %r9
	movq	-8(%rdi,%r8,8), %rbp
	movl	$1, %eax
	movq	8(%rdi,%r8,8), %rbx
	movq	(%rdx,%r8,8), %r11
	movq	(%rsi,%r8,8), %r10
.L59:
	movsd	(%r9,%rax,8), %xmm0
	mulsd	%xmm1, %xmm0
	subsd	0(%rbp,%rax,8), %xmm0
	subsd	(%rbx,%rax,8), %xmm0
	subsd	-8(%r9,%rax,8), %xmm0
	subsd	8(%r9,%rax,8), %xmm0
	subsd	(%r11,%rax,8), %xmm0
	movsd	%xmm0, (%r10,%rax,8)
	incq	%rax
	cmpl	%eax, %ecx
	jg	.L59
	incq	%r8
	cmpl	%r8d, %ecx
	jg	.L60
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE33:
	.size	L_def, .-L_def
	.globl	GS_update
	.type	GS_update, @function
GS_update:
.LFB34:
	.cfi_startproc
	movsd	.LC9(%rip), %xmm1
	movl	$1, %ecx
	decl	%edx
.L66:
	cmpl	%ecx, %edx
	jle	.L70
	movq	-8(%rdi,%rcx,8), %r11
	movq	8(%rdi,%rcx,8), %r10
	movl	$1, %eax
	movq	(%rdi,%rcx,8), %r8
	movq	(%rsi,%rcx,8), %r9
.L67:
	movsd	(%r11,%rax,8), %xmm0
	addsd	(%r10,%rax,8), %xmm0
	addsd	-8(%r8,%rax,8), %xmm0
	addsd	8(%r8,%rax,8), %xmm0
	addsd	(%r9,%rax,8), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%r8,%rax,8)
	incq	%rax
	cmpl	%eax, %edx
	jg	.L67
	incq	%rcx
	jmp	.L66
.L70:
	ret
	.cfi_endproc
.LFE34:
	.size	GS_update, .-GS_update
	.globl	set_BC
	.type	set_BC, @function
set_BC:
.LFB35:
	.cfi_startproc
	movslq	%esi, %rax
	leaq	-8(,%rax,8), %rdx
	xorl	%eax, %eax
	leaq	(%rdi,%rdx), %r8
.L72:
	cmpl	%eax, %esi
	jle	.L74
	movq	(%rdi), %rcx
	movq	$0x000000000, (%rcx,%rax,8)
	movq	(%r8), %rcx
	movq	$0x000000000, (%rcx,%rax,8)
	movq	(%rdi,%rax,8), %rcx
	incq	%rax
	movq	$0x000000000, (%rcx)
	movq	$0x000000000, (%rcx,%rdx)
	jmp	.L72
.L74:
	ret
	.cfi_endproc
.LFE35:
	.size	set_BC, .-set_BC
	.globl	res_R
	.type	res_R, @function
res_R:
.LFB36:
	.cfi_startproc
	movl	%edx, %r8d
	movsd	.LC8(%rip), %xmm0
	salq	$3, %r8
	xorl	%ecx, %ecx
.L76:
	cmpl	%ecx, %edx
	jle	.L75
	leal	(%rcx,%rcx), %eax
	cltq
	leaq	(%rdi,%rax,8), %r9
	xorl	%eax, %eax
.L79:
	cmpq	%r8, %rax
	je	.L80
	movq	(%r9), %r11
	movq	(%rsi,%rcx,8), %r10
	movsd	(%r11,%rax,2), %xmm1
	mulsd	%xmm0, %xmm1
	movsd	%xmm1, (%r10,%rax)
	addq	$8, %rax
	jmp	.L79
.L80:
	incq	%rcx
	jmp	.L76
.L75:
	ret
	.cfi_endproc
.LFE36:
	.size	res_R, .-res_R
	.globl	prol_P
	.type	prol_P, @function
prol_P:
.LFB37:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%eax, %eax
.L82:
	cmpl	%eax, %edx
	jle	.L91
	xorl	%r8d, %r8d
.L84:
	cmpl	%r8d, %edx
	jle	.L92
	movq	(%rdi,%rax,8), %r9
	movq	$0x000000000, (%r9,%r8,8)
	incq	%r8
	jmp	.L84
.L92:
	incq	%rax
	jmp	.L82
.L91:
	leal	-2(%rcx), %eax
	movsd	.LC10(%rip), %xmm1
	movsd	.LC9(%rip), %xmm2
	xorl	%r8d, %r8d
	leaq	8(,%rax,8), %rbx
	decl	%ecx
.L85:
	cmpl	%r8d, %ecx
	jle	.L93
	movq	(%rsi,%r8,8), %rdx
	movq	(%rdi), %r11
	xorl	%eax, %eax
	movq	8(%rsi,%r8,8), %r9
	movq	8(%rdi), %r10
.L86:
	movsd	(%rdx,%rax), %xmm0
	movsd	%xmm0, (%r11,%rax,2)
	movsd	(%rdx,%rax), %xmm0
	addsd	(%r9,%rax), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%r10,%rax,2)
	movsd	(%rdx,%rax), %xmm0
	addsd	8(%rdx,%rax), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%r11,%rax,2)
	movsd	(%rdx,%rax), %xmm0
	addsd	8(%rdx,%rax), %xmm0
	addsd	(%r9,%rax), %xmm0
	addsd	8(%r9,%rax), %xmm0
	mulsd	%xmm2, %xmm0
	movsd	%xmm0, 8(%r10,%rax,2)
	addq	$8, %rax
	cmpq	%rax, %rbx
	jne	.L86
	incq	%r8
	addq	$16, %rdi
	jmp	.L85
.L93:
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE37:
	.size	prol_P, .-prol_P
	.globl	u_update
	.type	u_update, @function
u_update:
.LFB38:
	.cfi_startproc
	xorl	%eax, %eax
.L95:
	cmpl	%eax, %edx
	jle	.L99
	xorl	%ecx, %ecx
.L97:
	cmpl	%ecx, %edx
	jle	.L100
	movq	(%rdi,%rax,8), %r8
	movq	(%rsi,%rax,8), %r9
	leaq	(%r8,%rcx,8), %r8
	movsd	(%r8), %xmm0
	subsd	(%r9,%rcx,8), %xmm0
	incq	%rcx
	movsd	%xmm0, (%r8)
	jmp	.L97
.L100:
	incq	%rax
	jmp	.L95
.L99:
	ret
	.cfi_endproc
.LFE38:
	.size	u_update, .-u_update
	.globl	multigrid_vcycle
	.type	multigrid_vcycle, @function
multigrid_vcycle:
.LFB24:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%edi, %ecx
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r14
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %r12
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movsd	%xmm0, 24(%rsp)
	movsd	%xmm1, 32(%rsp)
	call	get_m
	movl	%eax, %ebx
	leal	-1(%rdi), %eax
	movl	%eax, %edi
	movl	%eax, 44(%rsp)
	call	get_m
	decl	%ecx
	jne	.L102
	movsd	24(%rsp), %xmm0
	movq	8(%r14), %rdx
	movq	8(%rsi), %rax
	mulsd	%xmm0, %xmm0
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
.L102:
	.cfi_restore_state
	leal	1(%rax), %ebp
	incl	%ebx
	movl	%ebx, %edi
	call	alloc_matrix
	movl	%ebp, %edi
	movq	%rax, %r13
	call	alloc_matrix
	movl	%ebx, %edi
	movq	%rax, %r15
	call	alloc_matrix
	movl	%ebp, %edi
	movq	%rax, 8(%rsp)
	call	alloc_matrix
	movsd	32(%rsp), %xmm0
	movq	%rax, 16(%rsp)
.L104:
	divsd	32(%rsp), %xmm0
	ucomisd	.LC11(%rip), %xmm0
	jbe	.L108
	movq	%r12, %rdi
	movl	%ebx, %edx
	movq	%r14, %rsi
	call	GS_update
	movl	%ebx, %ecx
	movq	%r14, %rdx
	movq	%r13, %rsi
	call	L_def
	movl	%ebp, %edx
	movq	%r15, %rsi
	movq	%r13, %rdi
	call	res_R
	movq	16(%rsp), %rsi
	movl	44(%rsp), %edi
	movq	%r15, %rdx
	movsd	32(%rsp), %xmm1
	movsd	24(%rsp), %xmm0
	call	multigrid_vcycle
	movq	16(%rsp), %rsi
	movq	8(%rsp), %rdi
	movl	%ebp, %ecx
	movl	%ebx, %edx
	call	prol_P
	movq	8(%rsp), %rsi
	movq	%r12, %rdi
	movl	%ebx, %edx
	call	u_update
	movq	%r14, %rsi
	call	GS_update
	movl	%ebx, %esi
	movq	%r13, %rdi
	call	L2_norm
	jmp	.L104
.L108:
	movl	%ebx, %esi
	movq	%r13, %rdi
	call	dealloc_matrix
	movl	%ebp, %esi
	movq	%r15, %rdi
	call	dealloc_matrix
	movq	8(%rsp), %rdi
	movl	%ebx, %esi
	call	dealloc_matrix
	movq	16(%rsp), %rdi
	addq	$56, %rsp
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
	.cfi_endproc
.LFE24:
	.size	multigrid_vcycle, .-multigrid_vcycle
	.globl	set_zeros
	.type	set_zeros, @function
set_zeros:
.LFB39:
	.cfi_startproc
	xorl	%eax, %eax
.L110:
	cmpl	%eax, %esi
	jle	.L114
	xorl	%edx, %edx
.L112:
	cmpl	%edx, %esi
	jle	.L115
	movq	(%rdi,%rax,8), %rcx
	movq	$0x000000000, (%rcx,%rdx,8)
	incq	%rdx
	jmp	.L112
.L115:
	incq	%rax
	jmp	.L110
.L114:
	ret
	.cfi_endproc
.LFE39:
	.size	set_zeros, .-set_zeros
	.globl	verify
	.type	verify, @function
verify:
.LFB40:
	.cfi_startproc
	movq	.LC7(%rip), %xmm1
	xorl	%eax, %eax
	movsd	.LC11(%rip), %xmm2
.L117:
	cmpl	%eax, %edx
	jle	.L123
	xorl	%ecx, %ecx
.L120:
	cmpl	%ecx, %edx
	jle	.L124
	movq	(%rdi,%rax,8), %r10
	leaq	0(,%rcx,8), %r8
	movq	(%rsi,%rax,8), %r9
	incq	%rcx
	movsd	(%r10,%r8), %xmm0
	subsd	(%r9,%r8), %xmm0
	andps	%xmm1, %xmm0
	ucomisd	%xmm2, %xmm0
	jbe	.L120
	xorl	%eax, %eax
	ret
.L124:
	incq	%rax
	jmp	.L117
.L123:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE40:
	.size	verify, .-verify
	.section	.rodata.str1.1
.LC14:
	.string	"\nResult OK!"
.LC15:
	.string	"\nResult not OK!"
.LC17:
	.string	"time = %lf s\n"
.LC13:
	.string	"mg.dat"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	$9, %edi
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
	call	get_m
	cvtsi2sd	%eax, %xmm0
	leaq	49(%rsp), %rdi
	movsd	.LC12(%rip), %xmm1
	leaq	.LC13(%rip), %rsi
	movl	$7, %ecx
	movapd	%xmm1, %xmm3
	rep movsb
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
	movq	%r12, %rdi
	movl	%ebx, %edx
	movq	%r13, %rsi
	call	verify
	testl	%eax, %eax
	leaq	.LC14(%rip), %rdi
	jne	.L130
	leaq	.LC15(%rip), %rdi
.L130:
	call	puts@PLT
	cvtsi2sdq	40(%rsp), %xmm0
	cvtsi2sdq	32(%rsp), %xmm1
	movsd	.LC16(%rip), %xmm2
	leaq	.LC17(%rip), %rsi
	movl	$1, %edi
	movb	$1, %al
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	cvtsi2sdq	24(%rsp), %xmm1
	divsd	%xmm2, %xmm1
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
	je	.L128
	call	__stack_chk_fail@PLT
.L128:
	addq	$72, %rsp
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
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.section	.rodata.str1.1
.LC18:
	.string	"%lf "
	.text
	.globl	print_matrix
	.type	print_matrix, @function
print_matrix:
.LFB41:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	.LC18(%rip), %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r14
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%esi, %r12d
	xorl	%ebp, %ebp
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
.L132:
	cmpl	%ebp, %r12d
	jle	.L131
	movslq	%r12d, %r13
	xorl	%ebx, %ebx
.L133:
	movq	(%r14,%rbp,8), %rax
	movq	%r15, %rsi
	movl	$1, %edi
	movsd	(%rax,%rbx,8), %xmm0
	movb	$1, %al
	incq	%rbx
	call	__printf_chk@PLT
	cmpq	%r13, %rbx
	jne	.L133
	movl	$10, %edi
	incq	%rbp
	call	putchar@PLT
	jmp	.L132
.L131:
	popq	%rax
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
	.cfi_endproc
.LFE41:
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
.LC16:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
