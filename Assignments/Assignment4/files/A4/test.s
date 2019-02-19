	.file	"test.c"
	.text
	.section	.rodata
.LC4:
	.string	"%lu\n"
.LC5:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movsd	.LC0(%rip), %xmm0
	movsd	%xmm0, -32(%rbp)
	movsd	.LC1(%rip), %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	.LC2(%rip), %xmm0
	movsd	%xmm0, -16(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -8(%rbp)
	movl	$8, %esi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	pxor	%xmm0, %xmm0
	ucomisd	-32(%rbp), %xmm0
	setnp	%al
	movl	$0, %edx
	pxor	%xmm0, %xmm0
	ucomisd	-32(%rbp), %xmm0
	cmovne	%edx, %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	pxor	%xmm0, %xmm0
	ucomisd	-24(%rbp), %xmm0
	setnp	%al
	movl	$0, %edx
	pxor	%xmm0, %xmm0
	ucomisd	-24(%rbp), %xmm0
	cmovne	%edx, %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	pxor	%xmm0, %xmm0
	ucomisd	-16(%rbp), %xmm0
	setnp	%al
	movl	$0, %edx
	pxor	%xmm0, %xmm0
	ucomisd	-16(%rbp), %xmm0
	cmovne	%edx, %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	pxor	%xmm0, %xmm0
	ucomisd	-8(%rbp), %xmm0
	setnp	%al
	movl	$0, %edx
	pxor	%xmm0, %xmm0
	ucomisd	-8(%rbp), %xmm0
	cmovne	%edx, %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1071644672
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.align 8
.LC2:
	.long	858993459
	.long	1072902963
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
