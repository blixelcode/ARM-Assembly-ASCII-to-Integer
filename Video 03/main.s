.global _start

.equ	SVC_CALL,	0
.equ	STDIN,		0
.equ	READ,		3
.equ	INPUT_SIZE, 20

.data
	success:	.asciz	"Success!\n"
	fail:		.asciz	"Fail\n"
	prompt:		.asciz	"Type a number: "
	input:		.ds.b	INPUT_SIZE, 0

_start:

	ldr		r1, =prompt
	bl		print

	mov		r0, #STDIN
	ldr		r1, =input
	mov		r2, #INPUT_SIZE
	mov		r7, #READ
	svc		SVC_CALL

	bl		atoi

	cmp		r1, #-456
	ldreq	r1, =success
	ldrne	r1, =fail
	bl		print

exit:
	mov		r0, #0
	mov		r7, #1
	svc		0

.end
