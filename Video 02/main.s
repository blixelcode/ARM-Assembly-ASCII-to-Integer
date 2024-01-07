.global _start

.equ	SVC_CALL,	0
.equ	STDIN,		0
.equ	READ,		3
.equ	INPUT_SIZE, 20

.data
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

exit:
	mov		r0, #0
	mov		r7, #1
	svc		0

.end
