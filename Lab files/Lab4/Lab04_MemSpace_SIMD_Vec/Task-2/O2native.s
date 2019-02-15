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
.LFE43:
	.size	alloc_matrix, .-alloc_matrix
	.p2align 4,,15
	.globl	dealloc_matrix
	.type	dealloc_matrix, @function
dealloc_matrix:
.LFB44:
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
.LFE45:
	.size	read_data, .-read_data
	.p2align 4,,15
	.globl	get_m
	.type	get_m, @function
get_m:
.LFB46:
	.cfi_startproc
	testl	%edi, %edi
	jle	.L26
	addl	$1, %edi
	movl	$1, %eax
	movl	$1, %edx
	.p2align 4,,10
	.p2align 3
.L25:
	addl	$1, %edx
	addl	%eax, %eax
	cmpl	%edx, %edi
	jne	.L25
	ret
	.p2align 4,,10
	.p2align 3
.L26:
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
	movq	%rdi, %r13
	leaq	.LC2(%rip), %rdi
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
	vmovsd	%xmm0, (%rsp)
	call	puts@PLT
	testl	%ebx, %ebx
	jle	.L34
	vmovsd	(%rsp), %xmm2
	subl	$1, %ebx
	xorl	%r12d, %r12d
	addq	$1, %rbx
	vmulsd	%xmm2, %xmm2, %xmm7
	vmovsd	%xmm7, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L31:
	vxorpd	%xmm1, %xmm1, %xmm1
	xorl	%r14d, %r14d
	vcvtsi2sd	%r12d, %xmm1, %xmm1
	vmulsd	.LC3(%rip), %xmm1, %xmm0
	vmulsd	(%rsp), %xmm0, %xmm0
	vmovsd	%xmm1, 8(%rsp)
	call	sin@PLT
	vmovsd	8(%rsp), %xmm1
	vmovsd	%xmm0, 24(%rsp)
	vmulsd	.LC5(%rip), %xmm1, %xmm0
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	movq	0(%r13,%r12,8), %rbp
	vmovsd	%xmm0, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L32:
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sd	%r14d, %xmm1, %xmm1
	vmulsd	.LC3(%rip), %xmm1, %xmm0
	vmulsd	(%rsp), %xmm0, %xmm0
	vmovsd	%xmm1, 16(%rsp)
	call	sin@PLT
	vmovsd	16(%rsp), %xmm1
	vmovsd	%xmm0, 8(%rsp)
	vmulsd	.LC4(%rip), %xmm1, %xmm0
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	vmovsd	40(%rsp), %xmm3
	vmulsd	8(%rsp), %xmm3, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm0
	vmulsd	24(%rsp), %xmm0, %xmm0
	vmulsd	32(%rsp), %xmm0, %xmm0
	vmovsd	%xmm0, 0(%rbp,%r14,8)
	addq	$1, %r14
	cmpq	%r14, %rbx
	jne	.L32
	addq	$1, %r12
	cmpq	%rbx, %r12
	jne	.L31
.L34:
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
	jle	.L40
	leal	-1(%rsi), %eax
	vmovq	.LC7(%rip), %xmm2
	vxorpd	%xmm0, %xmm0, %xmm0
	salq	$3, %rax
	leaq	8(%rdi,%rax), %rsi
	leaq	8(%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L38:
	movq	(%rdi), %rax
	leaq	(%rcx,%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L39:
	vmovsd	(%rax), %xmm1
	addq	$8, %rax
	vandpd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpq	%rax, %rdx
	jne	.L39
	addq	$8, %rdi
	cmpq	%rsi, %rdi
	jne	.L38
	ret
.L40:
	vxorpd	%xmm0, %xmm0, %xmm0
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
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm0, %xmm0, %xmm0
	salq	$3, %rax
	leaq	8(%rdi,%rax), %rsi
	leaq	8(%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L45:
	movq	(%rdi), %rax
	leaq	(%rcx,%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L46:
	vmovsd	(%rax), %xmm1
	addq	$8, %rax
	vfmadd231sd	%xmm1, %xmm1, %xmm0
	cmpq	%rax, %rdx
	jne	.L46
	addq	$8, %rdi
	cmpq	%rsi, %rdi
	jne	.L45
	vucomisd	%xmm0, %xmm2
	vsqrtsd	%xmm0, %xmm1, %xmm1
	ja	.L55
	vmovapd	%xmm1, %xmm0
	ret
.L48:
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovapd	%xmm1, %xmm0
	ret
.L55:
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	vmovsd	%xmm1, 8(%rsp)
	call	sqrt@PLT
	vmovsd	8(%rsp), %xmm1
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	vmovapd	%xmm1, %xmm0
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
	vmovsd	(%rdx), %xmm0
	testl	%esi, %esi
	jle	.L63
	leal	-1(%rsi), %eax
	addq	$8, %rdi
	vmovq	.LC7(%rip), %xmm2
	vmovapd	%xmm0, %xmm1
	salq	$3, %rax
	leaq	(%rdi,%rax), %rsi
	leaq	8(%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L58:
	leaq	8(%rdx), %rax
	addq	%rcx, %rdx
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L60:
	vmovsd	(%rax), %xmm1
	addq	$8, %rax
.L61:
	vandpd	%xmm2, %xmm1, %xmm1
	vmaxsd	%xmm0, %xmm1, %xmm0
	cmpq	%rdx, %rax
	jne	.L60
	cmpq	%rsi, %rdi
	je	.L63
	movq	(%rdi), %rdx
	addq	$8, %rdi
	vmovsd	(%rdx), %xmm1
	jmp	.L58
	.p2align 4,,10
	.p2align 3
.L63:
	ret
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
	jle	.L72
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leal	-3(%rcx), %eax
	vmovsd	.LC8(%rip), %xmm1
	movl	$8, %r8d
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	16(,%rax,8), %r9
	.p2align 4,,10
	.p2align 3
.L67:
	movq	(%rdi,%r8), %rcx
	movq	-8(%rdi,%r8), %rbp
	movl	$8, %eax
	movq	8(%rdi,%r8), %rbx
	movq	(%rdx,%r8), %r11
	movq	(%rsi,%r8), %r10
	.p2align 4,,10
	.p2align 3
.L66:
	vmovsd	(%rcx,%rax), %xmm0
	vfmsub213sd	0(%rbp,%rax), %xmm1, %xmm0
	vsubsd	(%rbx,%rax), %xmm0, %xmm0
	vsubsd	-8(%rcx,%rax), %xmm0, %xmm0
	vsubsd	8(%rcx,%rax), %xmm0, %xmm0
	vsubsd	(%r11,%rax), %xmm0, %xmm0
	vmovsd	%xmm0, (%r10,%rax)
	addq	$8, %rax
	cmpq	%rax, %r9
	jne	.L66
	addq	$8, %r8
	cmpq	%r9, %r8
	jne	.L67
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L72:
	.cfi_restore 3
	.cfi_restore 6
	ret
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
	jle	.L83
	leal	-3(%rdx), %eax
	vmovsd	.LC9(%rip), %xmm1
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%ecx, %ecx
	leaq	8(,%rax,8), %rbx
	leaq	16(,%rax,8), %r11
	.p2align 4,,10
	.p2align 3
.L78:
	movq	(%rdi,%rcx), %r10
	movq	16(%rdi,%rcx), %r9
	movl	$8, %eax
	movq	8(%rdi,%rcx), %rdx
	movq	8(%rsi,%rcx), %r8
	.p2align 4,,10
	.p2align 3
.L77:
	vmovsd	(%r10,%rax), %xmm0
	vaddsd	(%r9,%rax), %xmm0, %xmm0
	vaddsd	-8(%rdx,%rax), %xmm0, %xmm0
	vaddsd	8(%rdx,%rax), %xmm0, %xmm0
	vaddsd	(%r8,%rax), %xmm0, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%rax, %r11
	jne	.L77
	addq	$8, %rcx
	cmpq	%rcx, %rbx
	jne	.L78
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L83:
	.cfi_restore 3
	ret
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
	jle	.L89
	movslq	%esi, %rax
	movq	(%rdi), %rcx
	salq	$3, %rax
	leaq	-8(%rax), %r9
	movq	-8(%rdi,%rax), %r8
	leal	-1(%rsi), %eax
	movq	%rcx, %rdx
	leaq	8(,%rax,8), %rsi
	xorl	%eax, %eax
	jmp	.L88
	.p2align 4,,10
	.p2align 3
.L90:
	movq	(%rdi,%rax), %rdx
.L88:
	movq	$0x000000000, (%rcx,%rax)
	movq	$0x000000000, (%r8,%rax)
	addq	$8, %rax
	movq	$0x000000000, (%rdx)
	movq	$0x000000000, (%rdx,%r9)
	cmpq	%rsi, %rax
	jne	.L90
.L89:
	ret
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
	jle	.L96
	leal	-1(%rdx), %eax
	vmovsd	.LC8(%rip), %xmm1
	salq	$4, %rax
	leaq	16(%rdi,%rax), %r9
	leaq	16(%rax), %r8
	.p2align 4,,10
	.p2align 3
.L93:
	movq	(%rdi), %rax
	movq	(%rsi), %rdx
	leaq	(%r8,%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L94:
	vmulsd	(%rax), %xmm1, %xmm0
	addq	$16, %rax
	addq	$8, %rdx
	vmovsd	%xmm0, -8(%rdx)
	cmpq	%rax, %rcx
	jne	.L94
	addq	$16, %rdi
	addq	$8, %rsi
	cmpq	%r9, %rdi
	jne	.L93
.L96:
	ret
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
	jle	.L98
	leal	-1(%rdx), %eax
	movq	%rdi, %r8
	salq	$3, %rax
	leaq	8(%rdi,%rax), %r10
	leaq	8(%rax), %r9
	.p2align 4,,10
	.p2align 3
.L99:
	movq	(%r8), %rax
	leaq	(%r9,%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L100:
	movq	$0x000000000, (%rax)
	addq	$8, %rax
	cmpq	%rax, %rdx
	jne	.L100
	addq	$8, %r8
	cmpq	%r10, %r8
	jne	.L99
.L98:
	cmpl	$1, %ecx
	jle	.L107
	leal	-2(%rcx), %eax
	vmovsd	.LC10(%rip), %xmm1
	vmovsd	.LC9(%rip), %xmm2
	xorl	%r10d, %r10d
	leaq	8(,%rax,8), %r11
	.p2align 4,,10
	.p2align 3
.L103:
	movq	(%rdi,%r10,2), %r9
	movq	8(%rsi,%r10), %rcx
	xorl	%eax, %eax
	movq	8(%rdi,%r10,2), %r8
	movq	(%rsi,%r10), %rdx
	.p2align 4,,10
	.p2align 3
.L102:
	vmovsd	(%rdx), %xmm0
	addq	$8, %rdx
	vmovsd	%xmm0, (%r9,%rax,2)
	vmovsd	-8(%rdx), %xmm0
	vaddsd	(%rcx,%rax), %xmm0, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%r8,%rax,2)
	vmovsd	-8(%rdx), %xmm0
	vaddsd	(%rdx), %xmm0, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 8(%r9,%rax,2)
	vmovsd	-8(%rdx), %xmm0
	vaddsd	(%rdx), %xmm0, %xmm0
	vaddsd	(%rcx,%rax), %xmm0, %xmm0
	vaddsd	8(%rcx,%rax), %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, 8(%r8,%rax,2)
	addq	$8, %rax
	cmpq	%rax, %r11
	jne	.L102
	addq	$8, %r10
	cmpq	%r11, %r10
	jne	.L103
.L107:
	ret
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
	jle	.L121
	leal	1(%rdi), %ecx
	movl	$1, %eax
	movl	$1, %ebx
	.p2align 4,,10
	.p2align 3
.L110:
	addl	$1, %eax
	addl	%ebx, %ebx
	cmpl	%eax, %ecx
	jne	.L110
	addl	$1, %ebx
	cmpl	$1, %edi
	jle	.L109
	movl	$1, %eax
	movl	$1, %ebp
	.p2align 4,,10
	.p2align 3
.L111:
	addl	$1, %eax
	addl	%ebp, %ebp
	cmpl	%eax, %edi
	jne	.L111
	addl	$1, %ebp
.L113:
	movl	%edi, %r15d
	movl	%ebx, %edi
	vmovsd	%xmm0, 32(%rsp)
	movq	%rsi, %r13
	vmovsd	%xmm1, 8(%rsp)
	movq	%rdx, (%rsp)
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
	vmovsd	8(%rsp), %xmm2
	movq	%rax, 16(%rsp)
	vdivsd	%xmm2, %xmm2, %xmm0
	vucomisd	.LC11(%rip), %xmm0
	jbe	.L115
	leal	-1(%r15), %eax
	movl	%eax, 44(%rsp)
	leal	-1(%rbx), %eax
	leaq	8(,%rax,8), %r15
.L120:
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
	vmovsd	8(%rsp), %xmm1
	vmovsd	32(%rsp), %xmm0
	movq	16(%rsp), %rsi
	movl	44(%rsp), %edi
	movq	%r10, %rdx
	call	multigrid_vcycle
	movq	16(%rsp), %rsi
	movq	%r12, %rdi
	movl	%ebp, %ecx
	movl	%ebx, %edx
	call	prol_P
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L117:
	movq	0(%r13,%rdi), %rdx
	movq	(%r12,%rdi), %rcx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L118:
	vmovsd	(%rdx,%rax), %xmm0
	vsubsd	(%rcx,%rax), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%rax, %r15
	jne	.L118
	addq	$8, %rdi
	cmpq	%r15, %rdi
	jne	.L117
	movq	(%rsp), %rsi
	movl	%ebx, %edx
	movq	%r13, %rdi
	call	GS_update
	movl	%ebx, %esi
	movq	%r14, %rdi
	call	L2_norm
	vdivsd	8(%rsp), %xmm0, %xmm0
	vucomisd	.LC11(%rip), %xmm0
	ja	.L120
.L115:
	movl	%ebx, %esi
	movq	%r14, %rdi
	call	dealloc_matrix
	movq	24(%rsp), %rdi
	movl	%ebp, %esi
	call	dealloc_matrix
	movl	%ebx, %esi
	movq	%r12, %rdi
	call	dealloc_matrix
	movq	16(%rsp), %rdi
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
.L121:
	.cfi_restore_state
	movl	$2, %ebx
.L109:
	cmpl	$1, %edi
	jne	.L122
	movq	8(%rdx), %rdx
	vmulsd	%xmm0, %xmm0, %xmm0
	movq	8(%rsi), %rax
	vmulsd	8(%rdx), %xmm0, %xmm0
	vmovsd	%xmm0, 8(%rax)
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
.L122:
	.cfi_restore_state
	movl	$2, %ebp
	jmp	.L113
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
	jle	.L137
	leal	-1(%rdx), %eax
	xorl	%r9d, %r9d
	leaq	8(,%rax,8), %rcx
	.p2align 4,,10
	.p2align 3
.L134:
	movq	(%rdi,%r9), %rdx
	movq	(%rsi,%r9), %r8
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L135:
	vmovsd	(%rdx,%rax), %xmm0
	vsubsd	(%r8,%rax), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%rax, %rcx
	jne	.L135
	addq	$8, %r9
	cmpq	%rcx, %r9
	jne	.L134
.L137:
	ret
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
	jle	.L143
	leal	-1(%rsi), %eax
	salq	$3, %rax
	leaq	8(%rdi,%rax), %rsi
	leaq	8(%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L140:
	movq	(%rdi), %rax
	leaq	(%rcx,%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L141:
	movq	$0x000000000, (%rax)
	addq	$8, %rax
	cmpq	%rax, %rdx
	jne	.L141
	addq	$8, %rdi
	cmpq	%rsi, %rdi
	jne	.L140
.L143:
	ret
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
	jle	.L152
	leal	-1(%rdx), %eax
	vmovq	.LC7(%rip), %xmm2
	vmovsd	.LC11(%rip), %xmm1
	xorl	%r9d, %r9d
	leaq	8(,%rax,8), %r8
.L146:
	movq	(%rdi,%r9), %rcx
	movq	(%rsi,%r9), %rdx
	vmovsd	(%rcx), %xmm0
	vsubsd	(%rdx), %xmm0, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vucomisd	%xmm1, %xmm0
	ja	.L151
	movl	$8, %eax
	jmp	.L148
	.p2align 4,,10
	.p2align 3
.L147:
	vmovsd	(%rcx,%rax), %xmm0
	vsubsd	(%rdx,%rax), %xmm0, %xmm0
	addq	$8, %rax
	vandpd	%xmm2, %xmm0, %xmm0
	vucomisd	%xmm1, %xmm0
	ja	.L151
.L148:
	cmpq	%rax, %r8
	jne	.L147
	addq	$8, %r9
	cmpq	%r8, %r9
	jne	.L146
.L152:
	movl	$1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L151:
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
	movl	$1, %edx
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
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
.L158:
	addl	%edx, %edx
	subl	$1, %eax
	jne	.L158
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	.LC12(%rip), %xmm1
	movl	$29793, %eax
	movl	$1680762733, 49(%rsp)
	vcvtsi2sd	%edx, %xmm0, %xmm0
	movw	%ax, 53(%rsp)
	movb	$0, 55(%rsp)
	vdivsd	%xmm0, %xmm1, %xmm3
	vaddsd	%xmm1, %xmm0, %xmm0
	vcvttsd2si	%xmm0, %ebx
	movl	%ebx, %edi
	vmovsd	%xmm3, (%rsp)
	call	alloc_matrix
	movl	%ebx, %edi
	movq	%rax, %r13
	call	alloc_matrix
	movl	%ebx, %edi
	movq	%rax, %r12
	call	alloc_matrix
	movl	%ebx, %edx
	leaq	49(%rsp), %rsi
	movq	%r13, %rdi
	movq	%rax, %rbp
	call	read_data
	vmovsd	(%rsp), %xmm0
	movl	%ebx, %esi
	movq	%rbp, %rdi
	call	fill_f
	movl	%ebx, %esi
	movq	%rbp, %rdi
	call	L2_norm
	xorl	%esi, %esi
	leaq	16(%rsp), %rdi
	vmovsd	%xmm0, 8(%rsp)
	call	gettimeofday@PLT
	vmovsd	(%rsp), %xmm0
	movq	%rbp, %rdx
	movq	%r12, %rsi
	vmovsd	8(%rsp), %xmm1
	movl	$9, %edi
	call	multigrid_vcycle
	xorl	%esi, %esi
	leaq	32(%rsp), %rdi
	call	gettimeofday@PLT
	movl	%ebx, %edx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	verify
	testl	%eax, %eax
	jne	.L165
	leaq	.LC14(%rip), %rdi
	call	puts@PLT
.L160:
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovsd	.LC15(%rip), %xmm2
	leaq	.LC16(%rip), %rsi
	vcvtsi2sdq	40(%rsp), %xmm0, %xmm0
	movl	$1, %edi
	movl	$1, %eax
	vcvtsi2sdq	32(%rsp), %xmm1, %xmm1
	vdivsd	%xmm2, %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	24(%rsp), %xmm1, %xmm1
	vdivsd	%xmm2, %xmm1, %xmm1
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	16(%rsp), %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vsubsd	%xmm1, %xmm0, %xmm0
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
	jne	.L166
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
.L165:
	.cfi_restore_state
	leaq	.LC13(%rip), %rdi
	call	puts@PLT
	jmp	.L160
.L166:
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
	jle	.L174
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
	leaq	.LC17(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	.p2align 4,,10
	.p2align 3
.L169:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L170:
	movq	(%r14), %rax
	movq	%rbp, %rsi
	movl	$1, %edi
	vmovsd	(%rax,%rbx), %xmm0
	movl	$1, %eax
	addq	$8, %rbx
	call	__printf_chk@PLT
	cmpq	%rbx, %r12
	jne	.L170
	movl	$10, %edi
	addq	$8, %r14
	call	putchar@PLT
	cmpq	%r13, %r14
	jne	.L169
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
.L174:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	ret
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
