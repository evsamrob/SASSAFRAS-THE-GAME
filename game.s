	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.global	drawGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L4
	push	{r4, lr}
	ldr	r3, [r3]
	add	r3, r3, r3, lsr #31
	ldr	r4, .L4+4
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+8
	asr	r3, r3, #1
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	.LANCHOR0
	.word	DMANow
	.word	shadowOAM
	.size	drawGame, .-drawGame
	.align	2
	.global	initSprites
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSprites, %function
initSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L8
	mov	r0, #3
	ldr	r2, .L8+4
	ldr	r1, .L8+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L8+12
	ldr	r1, .L8+16
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+20
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L8+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	DMANow
	.word	83886592
	.word	spriteSheetPal
	.word	100728832
	.word	spriteSheetTiles
	.word	hideSprites
	.word	shadowOAM
	.size	initSprites, .-initSprites
	.align	2
	.global	drawSprites
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSprites, %function
drawSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	drawGame
	.size	drawSprites, .-drawSprites
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #16
	push	{r4, lr}
	mov	r2, #0
	mov	ip, #2
	mov	r0, #1
	mov	r4, #8
	mov	lr, #10
	ldr	r3, .L20
	str	r1, [r3, #12]
	ldr	r1, [r3, #36]
	str	r4, [r3, #8]
	str	lr, [r3, #56]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #60]
	str	r2, [r3, #68]
	str	r2, [r3, #72]
	str	r2, [r3, #48]
	str	r2, [r3, #52]
	str	ip, [r3, #28]
	str	ip, [r3, #32]
	str	r0, [r3, #76]
	str	r0, [r3, #80]
	cmp	r1, #3
	ldrls	pc, [pc, r1, asl #2]
	b	.L11
.L14:
	.word	.L17
	.word	.L16
	.word	.L15
	.word	.L13
.L13:
	mov	r1, #4096
	mov	r2, #32768
	ldr	r0, .L20+4
	ldr	ip, .L20+8
.L19:
	str	r1, [r3]
	str	r1, [r3, #40]
	str	r2, [r3, #4]
	str	r2, [r3, #44]
	str	ip, [r0]
.L11:
	pop	{r4, lr}
	bx	lr
.L17:
	mov	ip, #30720
	mov	r0, #24576
	ldr	r2, .L20+4
	ldr	r1, .L20+12
	str	ip, [r3]
	str	r0, [r3, #4]
	str	r1, [r2]
	pop	{r4, lr}
	bx	lr
.L16:
	mov	r1, #3072
	mov	r2, #6144
	ldr	r0, .L20+4
	ldr	ip, .L20+16
	b	.L19
.L15:
	mov	r1, #20480
	mov	r2, #8192
	mov	lr, #0
	ldr	r0, .L20+4
	ldr	ip, .L20+20
	str	lr, [r3, #76]
	str	r1, [r3]
	str	r1, [r3, #40]
	str	r2, [r3, #4]
	str	r2, [r3, #44]
	str	ip, [r0]
	pop	{r4, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	player
	.word	curColMap
	.word	level3MapBitmap
	.word	insructionsMapBitmap
	.word	level1MapBitmap
	.word	level2MapBitmap
	.size	initPlayer, .-initPlayer
	.align	2
	.global	respawnPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	respawnPlayer, %function
respawnPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	mov	ip, #2
	mov	r0, #1
	ldr	r3, .L33
	ldr	r1, [r3, #36]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #68]
	str	r2, [r3, #72]
	str	ip, [r3, #28]
	str	ip, [r3, #32]
	str	r0, [r3, #76]
	str	r0, [r3, #80]
	cmp	r1, #3
	ldrls	pc, [pc, r1, asl #2]
	b	.L30
.L25:
	.word	.L28
	.word	.L27
	.word	.L26
	.word	.L24
.L30:
	bx	lr
.L24:
	mov	r1, #4096
	mov	r2, #32768
	ldr	r0, .L33+4
	ldr	ip, .L33+8
.L32:
	str	r1, [r3]
	str	r1, [r3, #40]
	str	r2, [r3, #4]
	str	r2, [r3, #44]
	str	ip, [r0]
	bx	lr
.L28:
	mov	ip, #30720
	mov	r0, #24576
	ldr	r2, .L33+4
	ldr	r1, .L33+12
	str	ip, [r3]
	str	r0, [r3, #4]
	str	r1, [r2]
	bx	lr
.L27:
	mov	r1, #3072
	mov	r2, #6144
	ldr	r0, .L33+4
	ldr	ip, .L33+16
	b	.L32
.L26:
	str	lr, [sp, #-4]!
	mov	r1, #20480
	mov	r2, #8192
	mov	lr, #0
	ldr	r0, .L33+4
	ldr	ip, .L33+20
	str	lr, [r3, #76]
	str	r1, [r3]
	str	r1, [r3, #40]
	str	r2, [r3, #4]
	str	r2, [r3, #44]
	str	ip, [r0]
	ldr	lr, [sp], #4
	bx	lr
.L34:
	.align	2
.L33:
	.word	player
	.word	curColMap
	.word	level3MapBitmap
	.word	insructionsMapBitmap
	.word	level1MapBitmap
	.word	level2MapBitmap
	.size	respawnPlayer, .-respawnPlayer
	.align	2
	.global	initRecordPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initRecordPlayer, %function
initRecordPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	r0, #32
	mov	lr, #1
	mov	ip, #30
	ldr	r1, .L43
	ldr	r3, .L43+4
	ldr	r1, [r1, #36]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	lr, [r3, #24]
	str	ip, [r3, #28]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	cmp	r1, #3
	ldrls	pc, [pc, r1, asl #2]
	b	.L35
.L38:
	.word	.L41
	.word	.L40
	.word	.L39
	.word	.L37
.L37:
	mov	r0, #208
	mov	r1, #48
	mov	r2, #1
	stm	r3, {r0, r1}
	str	r2, [r3, #20]
.L35:
	ldr	lr, [sp], #4
	bx	lr
.L41:
	mov	r1, #72
	mov	r2, #96
	ldr	lr, [sp], #4
	stm	r3, {r1, r2}
	bx	lr
.L40:
	mov	r1, #128
	mov	r2, #120
	ldr	lr, [sp], #4
	stm	r3, {r1, r2}
	bx	lr
.L39:
	mov	r1, #178
	mov	r2, #136
	ldr	lr, [sp], #4
	stm	r3, {r1, r2}
	bx	lr
.L44:
	.align	2
.L43:
	.word	player
	.word	recordPlayer
	.size	initRecordPlayer, .-initRecordPlayer
	.align	2
	.global	updateRecordPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateRecordPlayer, %function
updateRecordPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L58
	ldr	r3, [r2, #32]
	add	r1, r3, #1
	cmp	r1, #0
	addlt	r3, r3, #8
	movge	r3, r1
	cmp	r1, #7
	push	{r4, r5, r6, r7, lr}
	str	r1, [r2, #32]
	movgt	r1, #0
	ldr	r0, [r2, #36]
	ldr	r4, [r2]
	strgt	r1, [r2, #32]
	ldr	r7, [r2, #20]
	ldr	r1, [r2, #24]
	add	r3, r0, r3, asr #3
	ldr	lr, .L58+4
	orr	r0, r4, #16384
	ldrh	r5, [r2, #4]
	lsl	r0, r0, #16
	lsr	r0, r0, #16
	add	r6, lr, r1, lsl #3
	lsl	ip, r1, #3
	cmp	r7, #0
	str	r3, [r2, #36]
	strh	r5, [lr, ip]	@ movhi
	strh	r0, [r6, #2]	@ movhi
	orrne	r0, r0, #4096
	strhne	r0, [r6, #2]	@ movhi
	rsbs	r0, r3, #0
	and	r0, r0, #3
	and	r3, r3, #3
	rsbpl	r3, r0, #0
	lsl	r3, r3, #16
	ldrh	r0, [r2, #28]
	ldr	r6, [r2, #16]
	lsr	r3, r3, #16
	add	r2, r0, r3, lsl #6
	add	ip, lr, ip
	orr	r2, r2, #4096
	cmp	r6, #0
	strh	r2, [ip, #4]	@ movhi
	add	r1, r1, #1
	beq	.L48
	ldr	r2, .L58+8
	ldr	r2, [r2, #36]
	cmp	r2, #0
	bne	.L49
.L48:
	mov	r3, #512
	lsl	r1, r1, #3
	strh	r3, [lr, r1]	@ movhi
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L49:
	sub	r0, r0, #4
	add	r3, r0, r3, lsl #5
	sub	r5, r5, #8
	orr	r5, r5, #16384
	lsl	r2, r1, #3
	orr	r3, r3, #8192
	add	r1, lr, r1, lsl #3
	strh	r5, [lr, r2]	@ movhi
	strh	r4, [r1, #2]	@ movhi
	strh	r3, [r1, #4]	@ movhi
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L59:
	.align	2
.L58:
	.word	recordPlayer
	.word	shadowOAM
	.word	player
	.size	updateRecordPlayer, .-updateRecordPlayer
	.align	2
	.global	initLivesDisplay
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLivesDisplay, %function
initLivesDisplay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	ip, #0
	mov	lr, #224
	mov	r0, #8
	mov	r1, #16
	mov	r2, #3
	ldr	r3, .L62
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	ldr	lr, [sp], #4
	bx	lr
.L63:
	.align	2
.L62:
	.word	livesDisp
	.size	initLivesDisplay, .-initLivesDisplay
	.align	2
	.global	updateLivesDisplay
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLivesDisplay, %function
updateLivesDisplay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L71
	ldr	r1, [r2, #36]
	ldr	r0, .L71+4
	cmp	r1, #0
	ldr	r3, [r0, #16]
	beq	.L65
	push	{r4, lr}
	ldr	r2, [r2, #56]
	ldr	ip, [r0]
	ldr	lr, .L71+8
	lsl	r2, r2, #6
	ldr	r4, [r0, #4]
	add	r1, r1, #2
	sub	r2, r2, #40
	orr	r2, r2, r1, lsl #12
	lsl	r0, r3, #3
	orr	r1, ip, #16384
	add	r3, lr, r3, lsl #3
	strh	r4, [lr, r0]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L65:
	mov	r1, #512
	ldr	r2, .L71+8
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L72:
	.align	2
.L71:
	.word	player
	.word	livesDisp
	.word	shadowOAM
	.size	updateLivesDisplay, .-updateLivesDisplay
	.align	2
	.global	initCheat
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCheat, %function
initCheat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L79
	ldr	r3, [r3, #36]
	cmp	r3, #2
	push	{r4, r5, r6, r7, r8, lr}
	beq	.L74
	cmp	r3, #3
	beq	.L75
	cmp	r3, #1
	beq	.L78
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L74:
	mov	r2, #1
	mov	r6, #48
	mov	r5, #112
	mov	r4, #104
	mov	lr, #72
	mov	ip, #88
	mov	r0, #128
	mov	r1, #0
	ldr	r3, .L79+4
	str	r6, [r3]
	str	r5, [r3, #20]
	str	r4, [r3, #36]
	str	lr, [r3, #52]
	str	ip, [r3, #4]
	str	ip, [r3, #32]
	str	r2, [r3, #8]
	str	r2, [r3, #24]
	str	r2, [r3, #40]
	str	r2, [r3, #56]
	str	r0, [r3, #16]
	str	r0, [r3, #48]
	str	r1, [r3, #72]
	str	r1, [r3, #88]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L78:
	mov	r1, #104
	mov	r8, #0
	mov	r7, #120
	mov	r6, #80
	mov	r5, #64
	mov	r4, #40
	mov	lr, #224
	mov	r0, #56
	mov	ip, #96
	ldr	r2, .L79+4
	str	r8, [r2]
	str	r7, [r2, #4]
	str	r6, [r2, #36]
	str	r5, [r2, #52]
	str	r4, [r2, #68]
	str	lr, [r2, #80]
	str	r3, [r2, #8]
	str	r3, [r2, #24]
	str	r3, [r2, #40]
	str	r3, [r2, #56]
	str	r3, [r2, #72]
	str	r3, [r2, #88]
	str	ip, [r2, #84]
	str	r1, [r2, #16]
	str	r1, [r2, #20]
	str	r1, [r2, #48]
	str	r0, [r2, #32]
	str	r0, [r2, #64]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L75:
	mov	r2, #1
	mov	r7, #64
	mov	r6, #104
	mov	r5, #72
	mov	r4, #120
	mov	lr, #128
	mov	ip, #112
	mov	r0, #32
	mov	r1, #0
	ldr	r3, .L79+4
	str	r7, [r3]
	str	r6, [r3, #20]
	str	r5, [r3, #36]
	str	r4, [r3, #64]
	str	lr, [r3, #68]
	str	ip, [r3, #4]
	str	ip, [r3, #32]
	str	r2, [r3, #8]
	str	r2, [r3, #24]
	str	r2, [r3, #40]
	str	r2, [r3, #56]
	str	r2, [r3, #72]
	str	r0, [r3, #16]
	str	r0, [r3, #52]
	str	r1, [r3, #48]
	str	r1, [r3, #88]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L80:
	.align	2
.L79:
	.word	player
	.word	cheat
	.size	initCheat, .-initCheat
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	r1, .L83
	ldr	r3, .L83+4
	ldr	r2, .L83+8
	str	r4, [r1, #36]
	str	r2, [r3]
	bl	initSprites
	bl	initPlayer
	bl	initRecordPlayer
	mov	ip, #224
	mov	r0, #8
	mov	r1, #16
	mov	r2, #3
	ldr	r3, .L83+12
	str	r4, [r3, #4]
	pop	{r4, lr}
	str	ip, [r3]
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	b	initCheat
.L84:
	.align	2
.L83:
	.word	player
	.word	curColMap
	.word	insructionsMapBitmap
	.word	livesDisp
	.size	initGame, .-initGame
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L189
	ldr	r3, [r4, #80]
	cmp	r3, #0
	sub	sp, sp, #20
	ldr	r3, [r4, #48]
	bne	.L86
	ldr	r2, .L189+4
	ldrh	r2, [r2]
.L87:
	tst	r2, #256
	beq	.L129
	ldr	r1, .L189+8
	ldrh	r1, [r1]
	ands	r1, r1, #256
	beq	.L182
.L129:
	tst	r2, #4
	beq	.L131
	ldr	r2, .L189+8
	ldrh	r2, [r2]
	ands	r2, r2, #4
	bne	.L131
	cmp	r3, #0
	beq	.L132
	str	r2, [r4, #48]
	ldr	ip, [r4, #64]
	b	.L133
.L131:
	cmp	r3, #0
	bne	.L134
	ldr	ip, [r4, #64]
	b	.L133
.L132:
	mov	r3, #1
	str	r3, [r4, #48]
.L134:
	mov	r3, #6
	mov	ip, r3
	str	r3, [r4, #64]
.L133:
	ldr	r1, [r4, #68]
	add	r2, r1, #1
	cmp	r2, #0
	addlt	r1, r1, #8
	movge	r1, r2
	ldr	r3, [r4, #72]
	cmp	r2, #7
	add	r3, r3, r1, asr #3
	str	r2, [r4, #68]
	str	r3, [r4, #72]
	ble	.L135
	mov	r2, #0
	cmp	ip, #5
	cmpeq	r3, #4
	str	r2, [r4, #68]
	beq	.L183
.L135:
	ldr	r2, [r4]
	ldr	r0, [r4, #60]
	ldr	r5, [r4, #4]
	ldr	r6, [r4, #76]
	ldr	r1, .L189+12
	ldr	lr, .L189+16
	asr	r2, r2, #8
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	lsl	r4, r0, #3
	cmp	r6, #0
	add	r0, r1, r0, lsl #3
	orr	lr, lr, r5, asr #8
	strh	lr, [r1, r4]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	orreq	r2, r2, #4096
	strheq	r2, [r0, #2]	@ movhi
	rsbs	r2, r3, #0
	and	r2, r2, #3
	and	r3, r3, #3
	rsbpl	r3, r2, #0
	add	r1, r1, r4
	add	r3, ip, r3, lsl #6
	strh	r3, [r1, #4]	@ movhi
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L86:
	cmp	r3, #0
	beq	.L88
	mov	r3, #0
	ldr	r2, .L189+20
	ldrh	r2, [r2, #48]
	tst	r2, #64
	str	r3, [r4, #20]
	str	r3, [r4, #16]
	mvneq	r3, #199
	streq	r3, [r4, #20]
	ldr	r3, .L189+20
	ldrh	r3, [r3, #48]
	tst	r3, #128
	ldreq	r3, [r4, #20]
	addeq	r3, r3, #200
	streq	r3, [r4, #20]
	ldr	r3, .L189+20
	ldrh	r3, [r3, #48]
	ands	r3, r3, #32
	mvneq	r2, #199
	streq	r3, [r4, #76]
	ldr	r3, .L189+20
	ldrh	r3, [r3, #48]
	streq	r2, [r4, #16]
	movne	r2, #0
	tst	r3, #16
	moveq	r3, #1
	addeq	r2, r2, #200
	streq	r2, [r4, #16]
	streq	r3, [r4, #76]
	ldr	r9, .L189+4
	ldr	r7, .L189+24
	ldr	r8, .L189+28
.L92:
	mov	ip, #0
	asr	r2, r2, #8
	ldm	r4, {r0, r1}
	ldr	r3, [r4, #12]
	str	r2, [sp]
	ldr	r2, [r7]
	str	ip, [sp, #4]
	str	r2, [sp, #8]
	sub	r3, r3, #1
	ldr	r2, [r4, #8]
	asr	r1, r1, #8
	asr	r0, r0, #8
	mov	lr, pc
	bx	r8
	subs	r5, r0, #0
	beq	.L114
	ldr	r0, [r4]
	ldr	r6, [r4, #16]
	add	r0, r0, r6
	str	r0, [r4]
.L115:
	mov	ip, #0
	ldr	r3, [r4, #20]
	asr	r3, r3, #8
	ldmib	r4, {r1, r2}
	str	r3, [sp, #4]
	ldr	r3, [r7]
	str	ip, [sp]
	str	r3, [sp, #8]
	asr	r0, r0, #8
	ldr	r3, [r4, #12]
	sub	r2, r2, #1
	asr	r1, r1, #8
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L123
	ldr	r1, [r4, #4]
	ldr	r3, [r4, #20]
	add	r1, r1, r3
	str	r1, [r4, #4]
.L124:
	ldr	r3, [r7]
	ldr	r0, [r4]
	str	r3, [sp]
	add	r2, r4, #8
	ldm	r2, {r2, r3}
	ldr	r5, .L189+32
	asr	r1, r1, #8
	asr	r0, r0, #8
	mov	lr, pc
	bx	r5
	cmp	r0, #2
	bne	.L125
	ldr	r3, [r4, #48]
	cmp	r3, #0
	beq	.L184
.L125:
	ldr	r3, [r7]
	ldm	r4, {r0, r1}
	str	r3, [sp]
	add	r2, r4, #8
	ldm	r2, {r2, r3}
	asr	r1, r1, #8
	asr	r0, r0, #8
	mov	lr, pc
	bx	r5
	cmp	r0, #3
	beq	.L185
	mov	r1, #0
	ldr	r3, .L189+36
	ldrh	r2, [r9]
	str	r1, [r3, #16]
.L179:
	ldr	r3, [r4, #48]
	b	.L87
.L182:
	ldr	r0, [r4, #52]
	cmp	r0, #0
	moveq	r1, #1
	str	r1, [r4, #52]
	b	.L129
.L88:
	ldr	r9, .L189+4
	ldr	r2, [r4, #20]
	ldrh	r1, [r9]
	tst	r1, #64
	add	r1, r2, #70
	str	r3, [r4, #64]
	str	r1, [r4, #20]
	beq	.L93
	ldr	r3, .L189+8
	ldrh	r3, [r3]
	ands	r3, r3, #64
	bne	.L93
	ldr	r1, [r4, #24]
	cmp	r1, #0
	subne	r2, r2, #828
	subne	r2, r2, #2
	strne	r2, [r4, #20]
	strne	r3, [r4, #24]
.L93:
	ldr	r1, .L189+20
	ldrh	r3, [r1, #48]
	ands	r2, r3, #32
	ldr	r3, [r4, #16]
	beq	.L186
.L94:
	ldr	r2, .L189+20
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L98
	mov	r2, #1
	add	r3, r3, #150
	cmp	r3, #600
	str	r2, [r4, #76]
	str	r2, [r4, #64]
	strlt	r3, [r4, #16]
	blt	.L98
	ldr	r3, .L189+40
	str	r3, [r4, #16]
.L103:
	mvn	r6, #0
	mov	r5, #0
	ldr	r7, .L189+24
	ldr	r3, [r7]
	ldm	r4, {r0, r1}
	ldr	r2, [r4, #8]
	stm	sp, {r5, r6}
	str	r3, [sp, #8]
	ldr	r8, .L189+28
	ldr	r3, [r4, #12]
	add	r2, r2, r6
	asr	r1, r1, #8
	asr	r0, r0, #8
	mov	lr, pc
	bx	r8
	cmp	r0, r5
	bne	.L187
.L105:
	mov	r3, #1
	ldr	r2, [r7]
	ldm	r4, {r0, r1}
	str	r2, [sp, #8]
	str	r3, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #8
	ldm	r2, {r2, r3}
	asr	r1, r1, #8
	asr	r0, r0, #8
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L111
.L178:
	ldr	r2, [r4, #16]
	b	.L92
.L123:
	mov	r3, #2
	mov	r2, #1
	str	r0, [r4, #20]
	str	r2, [r4, #24]
	str	r3, [r4, #28]
	str	r3, [r4, #32]
	ldr	r1, [r4, #4]
	b	.L124
.L114:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	movge	r6, r5
	blt	.L188
.L116:
	cmp	r3, #0
	ble	.L119
	mov	r10, #0
.L121:
	ldr	ip, [r7]
	asr	r2, r5, #8
	ldm	r4, {r0, r1}
	ldr	r3, [r4, #12]
	str	r10, [sp, #4]
	str	ip, [sp, #8]
	str	r2, [sp]
	sub	r3, r3, #1
	ldr	r2, [r4, #8]
	asr	r1, r1, #8
	asr	r0, r0, #8
	mov	lr, pc
	bx	r8
	ldr	r3, [r4, #16]
	cmp	r0, #0
	movne	r6, r5
	add	r5, r5, #1
	cmp	r3, r5
	bge	.L121
.L119:
	cmp	r6, r3
	movne	r3, #0
	ldr	r0, [r4]
	add	r0, r6, r0
	strne	r0, [r4]
	strne	r3, [r4, #16]
	streq	r0, [r4]
	b	.L115
.L186:
	mov	r0, #1
	sub	r3, r3, #150
	cmn	r3, #600
	str	r2, [r4, #76]
	str	r0, [r4, #64]
	strgt	r3, [r4, #16]
	bgt	.L94
	ldrh	r2, [r1, #48]
	ldr	r3, .L189+44
	tst	r2, #16
	str	r3, [r4, #16]
	streq	r0, [r4, #76]
	addeq	r3, r3, #150
	beq	.L97
	ldr	r3, .L189+48
	str	r3, [r4, #16]
	b	.L103
.L188:
	mov	r10, r5
	mov	r6, r5
	mov	fp, r5
.L118:
	ldr	ip, [r7]
	asr	r2, r10, #8
	ldm	r4, {r0, r1}
	ldr	r3, [r4, #12]
	str	fp, [sp, #4]
	str	ip, [sp, #8]
	str	r2, [sp]
	sub	r3, r3, #1
	ldr	r2, [r4, #8]
	asr	r1, r1, #8
	asr	r0, r0, #8
	mov	lr, pc
	bx	r8
	ldr	r3, [r4, #16]
	cmp	r0, #0
	movne	r6, r10
	sub	r10, r10, #1
	cmp	r3, r10
	ble	.L118
	b	.L116
.L184:
	mov	ip, #5
	ldr	r2, [r4, #56]
	ldr	r1, .L189+52
	sub	r2, r2, #1
	str	r3, [r4, #80]
	str	r3, [r4, #68]
	str	r3, [r4, #72]
	ldr	r1, [r1]
	ldr	r3, .L189+56
	ldr	r0, .L189+60
	str	r2, [r4, #56]
	str	ip, [r4, #64]
	mov	lr, pc
	bx	r3
	ldrh	r2, [r9]
	ldr	r3, [r4, #48]
	b	.L87
.L185:
	mov	r1, #1
	ldrh	r2, [r9]
	ldr	r3, .L189+36
	tst	r2, #1
	str	r1, [r3, #16]
	beq	.L179
	ldr	r1, .L189+8
	ldrh	r1, [r1]
	ands	r1, r1, #1
	bne	.L179
	ldr	r2, [r4, #36]
	add	r2, r2, #1
	str	r1, [r3, #16]
	str	r2, [r4, #36]
	bl	initPlayer
	bl	initRecordPlayer
	bl	initCheat
	ldrh	r2, [r9]
	ldr	r3, [r4, #48]
	b	.L87
.L98:
	cmp	r3, #0
	ble	.L101
	sub	r3, r3, #50
	cmp	r3, #0
	str	r3, [r4, #16]
	bge	.L103
.L102:
	mov	r3, #0
	str	r3, [r4, #16]
	b	.L103
.L111:
	mvn	r3, #0
	ldr	r2, [r7]
	ldm	r4, {r0, r1}
	str	r2, [sp, #8]
	str	r3, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #8
	ldm	r2, {r2, r3}
	asr	r1, r1, #8
	asr	r0, r0, #8
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L178
	ldr	r3, [r4, #20]
	cmp	r3, #0
	movgt	r3, #4
	ldr	r2, [r4, #16]
	strgt	r3, [r4, #64]
	bgt	.L92
	movne	r3, #3
	strne	r3, [r4, #64]
	b	.L92
.L187:
	mov	r10, #1
	ldr	r2, [r7]
	ldm	r4, {r0, r1}
	ldr	r3, [r4, #12]
	str	r5, [sp, #4]
	str	r10, [sp]
	str	r2, [sp, #8]
	add	r3, r3, r6
	ldr	r2, [r4, #8]
	asr	r1, r1, #8
	asr	r0, r0, #8
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L106
	mov	r3, #2
	ldr	r2, [r4, #28]
	cmp	r2, r10
	str	r10, [r4, #32]
	str	r0, [r4, #76]
	str	r3, [r4, #64]
	beq	.L105
	mov	r3, #20
	ldrh	r2, [r9]
	tst	r2, #64
	str	r10, [r4, #24]
	str	r3, [r4, #20]
	beq	.L110
	ldr	r3, .L189+8
	ldrh	r3, [r3]
	tst	r3, #64
	bne	.L110
	ldr	r3, [r4, #16]
	ldr	r2, .L189+64
	sub	r3, r3, #600
	str	r10, [r4, #28]
	str	r3, [r4, #16]
	str	r2, [r4, #20]
.L110:
	ldr	r3, .L189+20
	ldrh	r3, [r3, #48]
	tst	r3, #128
	ldreq	r3, [r4, #20]
	addeq	r3, r3, #200
	streq	r3, [r4, #20]
	b	.L105
.L101:
	beq	.L103
.L97:
	add	r3, r3, #50
	cmp	r3, #0
	str	r3, [r4, #16]
	bgt	.L102
	b	.L103
.L183:
	mov	r3, #1
	str	r3, [r4, #80]
	bl	respawnPlayer
	ldr	r3, [r4, #72]
	ldr	ip, [r4, #64]
	b	.L135
.L106:
	ldr	r2, [r7]
	ldm	r4, {r0, r1}
	ldr	r3, [r4, #12]
	str	r5, [sp, #4]
	str	r6, [sp]
	str	r2, [sp, #8]
	sub	r3, r3, #1
	ldr	r2, [r4, #8]
	asr	r1, r1, #8
	asr	r0, r0, #8
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	strne	r5, [r4, #24]
	bne	.L105
	mov	r3, #2
	ldr	r2, [r4, #28]
	cmp	r2, #0
	str	r0, [r4, #32]
	str	r10, [r4, #76]
	str	r3, [r4, #64]
	beq	.L105
	mov	r3, #20
	ldrh	r2, [r9]
	tst	r2, #64
	str	r10, [r4, #24]
	str	r3, [r4, #20]
	beq	.L110
	ldr	r3, .L189+8
	ldrh	r3, [r3]
	ands	r3, r3, #64
	bne	.L110
	ldr	r2, [r4, #16]
	str	r3, [r4, #28]
	ldr	r3, .L189+64
	add	r2, r2, #600
	str	r2, [r4, #16]
	str	r3, [r4, #20]
	b	.L110
.L190:
	.align	2
.L189:
	.word	player
	.word	oldButtons
	.word	buttons
	.word	shadowOAM
	.word	-32768
	.word	67109120
	.word	curColMap
	.word	freeToMove
	.word	checkWinDie
	.word	recordPlayer
	.word	550
	.word	-600
	.word	-550
	.word	deathEffect_length
	.word	playEffect
	.word	deathEffect_data
	.word	-880
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateCheat
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCheat, %function
updateCheat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L205
	ldr	r3, .L205+4
	ldr	r0, [r2, #36]
	push	{r4, r5, r6, r7, lr}
	sub	r4, r0, r3, lsl #2
	lsl	r4, r4, #16
	add	r0, r0, #2
	lsr	r4, r4, #16
	lsl	r0, r0, #28
	ldr	r6, [r2, #52]
	mov	r5, #512
	ldr	r2, .L205+8
	ldr	r7, .L205+12
	add	r4, r4, #20
	asr	r0, r0, #16
	add	ip, r3, #160
	b	.L194
.L204:
	add	r1, r4, r3, lsl #2
	cmp	r6, #0
	orr	r1, r0, r1
	beq	.L192
	ldr	lr, [r3, #4]
	strh	r1, [r2, #36]	@ movhi
	add	r3, r3, #16
	ldr	r1, [r3, #-16]
	orr	lr, lr, r7
	cmp	r3, ip
	strh	lr, [r2, #32]	@ movhi
	strh	r1, [r2, #34]	@ movhi
	add	r2, r2, #8
	beq	.L203
.L194:
	ldr	r1, [r3, #8]
	cmp	r1, #0
	bne	.L204
.L192:
	add	r3, r3, #16
	cmp	r3, ip
	strh	r5, [r2, #32]	@ movhi
	add	r2, r2, #8
	bne	.L194
.L203:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L206:
	.align	2
.L205:
	.word	player
	.word	cheat
	.word	shadowOAM
	.word	-32768
	.size	updateCheat, .-updateCheat
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updatePlayer
	bl	updateRecordPlayer
	bl	updateLivesDisplay
	bl	updateCheat
	ldr	r3, .L211
	ldr	r2, [r3, #56]
	cmp	r2, #0
	ble	.L210
.L207:
	pop	{r4, lr}
	bx	lr
.L210:
	ldr	r2, [r3, #36]
	cmp	r2, #1
	ble	.L207
	sub	r2, r2, #1
	str	r2, [r3, #36]
	bl	initPlayer
	bl	initRecordPlayer
	pop	{r4, lr}
	b	initCheat
.L212:
	.align	2
.L211:
	.word	player
	.size	updateGame, .-updateGame
	.comm	curColMap,4,4
	.global	numSprites
	.comm	cheat,160,4
	.comm	livesDisp,20,4
	.comm	recordPlayer,40,4
	.comm	player,84,4
	.comm	soundEffect,32,4
	.comm	soundSong,32,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	numSprites, %object
	.size	numSprites, 4
numSprites:
	.word	256
	.ident	"GCC: (devkitARM release 53) 9.1.0"
