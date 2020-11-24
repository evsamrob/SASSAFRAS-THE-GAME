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
	str	lr, [r3, #52]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #56]
	str	r2, [r3, #64]
	str	r2, [r3, #68]
	str	r2, [r3, #48]
	str	ip, [r3, #28]
	str	ip, [r3, #32]
	str	r0, [r3, #72]
	str	r0, [r3, #76]
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
	str	lr, [r3, #72]
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
	str	r2, [r3, #64]
	str	r2, [r3, #68]
	str	ip, [r3, #28]
	str	ip, [r3, #32]
	str	r0, [r3, #72]
	str	r0, [r3, #76]
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
	str	lr, [r3, #72]
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
	ldr	r4, .L147
	ldr	r3, [r4, #76]
	cmp	r3, #0
	sub	sp, sp, #20
	bne	.L46
	ldr	r9, .L147+4
	ldrh	r3, [r9]
.L47:
	tst	r3, #2
	beq	.L87
	ldr	r2, .L147+8
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L140
.L87:
	tst	r3, #4
	ldr	r2, [r4, #48]
	beq	.L88
	ldr	r3, .L147+8
	ldrh	r3, [r3]
	ands	r3, r3, #4
	bne	.L88
	cmp	r2, #0
	beq	.L89
	str	r3, [r4, #48]
	ldr	ip, [r4, #60]
	b	.L90
.L88:
	cmp	r2, #0
	bne	.L91
	ldr	ip, [r4, #60]
	b	.L90
.L89:
	mov	r3, #1
	str	r3, [r4, #48]
.L91:
	mov	r3, #6
	mov	ip, r3
	str	r3, [r4, #60]
.L90:
	ldr	r1, [r4, #64]
	add	r2, r1, #1
	cmp	r2, #0
	addlt	r1, r1, #8
	movge	r1, r2
	ldr	r3, [r4, #68]
	cmp	r2, #7
	add	r3, r3, r1, asr #3
	str	r2, [r4, #64]
	str	r3, [r4, #68]
	ble	.L92
	mov	r2, #0
	cmp	ip, #5
	cmpeq	r3, #4
	str	r2, [r4, #64]
	beq	.L141
.L92:
	ldr	r2, [r4]
	ldr	r0, [r4, #56]
	ldr	r5, [r4, #4]
	ldr	r6, [r4, #72]
	ldr	r1, .L147+12
	ldr	lr, .L147+16
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
.L46:
	ldr	r3, [r4, #48]
	cmp	r3, #0
	beq	.L48
	mov	r3, #0
	ldr	r2, .L147+20
	ldrh	r2, [r2, #48]
	tst	r2, #64
	str	r3, [r4, #20]
	str	r3, [r4, #16]
	mvneq	r3, #199
	streq	r3, [r4, #20]
	ldr	r3, .L147+20
	ldrh	r3, [r3, #48]
	tst	r3, #128
	ldreq	r3, [r4, #20]
	addeq	r3, r3, #200
	streq	r3, [r4, #20]
	ldr	r3, .L147+20
	ldrh	r3, [r3, #48]
	ands	r3, r3, #32
	mvneq	r2, #199
	streq	r3, [r4, #72]
	ldr	r3, .L147+20
	ldrh	r3, [r3, #48]
	streq	r2, [r4, #16]
	movne	r2, #0
	tst	r3, #16
	moveq	r3, #1
	addeq	r2, r2, #200
	streq	r2, [r4, #16]
	streq	r3, [r4, #72]
	ldr	r9, .L147+4
	ldr	r7, .L147+24
	ldr	r8, .L147+28
.L52:
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
	beq	.L74
	ldr	r0, [r4]
	ldr	r6, [r4, #16]
	add	r0, r0, r6
	str	r0, [r4]
.L75:
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
	beq	.L83
	ldr	r1, [r4, #4]
	ldr	r3, [r4, #20]
	add	r1, r1, r3
	str	r1, [r4, #4]
.L84:
	ldr	r3, [r7]
	ldr	r0, [r4]
	str	r3, [sp]
	add	r2, r4, #8
	ldm	r2, {r2, r3}
	ldr	r5, .L147+32
	asr	r1, r1, #8
	asr	r0, r0, #8
	mov	lr, pc
	bx	r5
	cmp	r0, #2
	bne	.L85
	ldr	r3, [r4, #48]
	cmp	r3, #0
	beq	.L142
.L85:
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
	beq	.L143
	mov	r1, #0
	ldr	r2, .L147+36
	ldrh	r3, [r9]
	str	r1, [r2, #16]
	b	.L47
.L140:
	ldr	r2, [r4, #36]
	cmp	r2, #1
	ble	.L87
	sub	r2, r2, #1
	str	r2, [r4, #36]
	bl	initPlayer
	bl	initRecordPlayer
	ldrh	r3, [r9]
	b	.L87
.L48:
	ldr	r9, .L147+4
	ldr	r2, [r4, #20]
	ldrh	r1, [r9]
	tst	r1, #64
	add	r1, r2, #70
	str	r3, [r4, #60]
	str	r1, [r4, #20]
	beq	.L53
	ldr	r3, .L147+8
	ldrh	r3, [r3]
	ands	r3, r3, #64
	bne	.L53
	ldr	r1, [r4, #24]
	cmp	r1, #0
	subne	r2, r2, #828
	subne	r2, r2, #2
	strne	r2, [r4, #20]
	strne	r3, [r4, #24]
.L53:
	ldr	r1, .L147+20
	ldrh	r3, [r1, #48]
	ands	r2, r3, #32
	ldr	r3, [r4, #16]
	beq	.L144
.L54:
	ldr	r2, .L147+20
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L58
	mov	r2, #1
	add	r3, r3, #150
	cmp	r3, #600
	str	r2, [r4, #72]
	str	r2, [r4, #60]
	strlt	r3, [r4, #16]
	blt	.L58
	ldr	r3, .L147+40
	str	r3, [r4, #16]
.L63:
	mvn	r6, #0
	mov	r5, #0
	ldr	r7, .L147+24
	ldr	r3, [r7]
	ldm	r4, {r0, r1}
	ldr	r2, [r4, #8]
	stm	sp, {r5, r6}
	str	r3, [sp, #8]
	ldr	r8, .L147+28
	ldr	r3, [r4, #12]
	add	r2, r2, r6
	asr	r1, r1, #8
	asr	r0, r0, #8
	mov	lr, pc
	bx	r8
	cmp	r0, r5
	bne	.L145
.L65:
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
	bne	.L71
.L138:
	ldr	r2, [r4, #16]
	b	.L52
.L83:
	mov	r3, #2
	mov	r2, #1
	str	r0, [r4, #20]
	str	r2, [r4, #24]
	str	r3, [r4, #28]
	str	r3, [r4, #32]
	ldr	r1, [r4, #4]
	b	.L84
.L74:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	movge	r6, r5
	blt	.L146
.L76:
	cmp	r3, #0
	ble	.L79
	mov	r10, #0
.L81:
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
	bge	.L81
.L79:
	cmp	r6, r3
	movne	r3, #0
	ldr	r0, [r4]
	add	r0, r6, r0
	strne	r0, [r4]
	strne	r3, [r4, #16]
	streq	r0, [r4]
	b	.L75
.L144:
	mov	r0, #1
	sub	r3, r3, #150
	cmn	r3, #600
	str	r2, [r4, #72]
	str	r0, [r4, #60]
	strgt	r3, [r4, #16]
	bgt	.L54
	ldrh	r2, [r1, #48]
	ldr	r3, .L147+44
	tst	r2, #16
	str	r3, [r4, #16]
	streq	r0, [r4, #72]
	addeq	r3, r3, #150
	beq	.L57
	ldr	r3, .L147+48
	str	r3, [r4, #16]
	b	.L63
.L146:
	mov	r10, r5
	mov	r6, r5
	mov	fp, r5
.L78:
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
	ble	.L78
	b	.L76
.L142:
	mov	ip, #5
	ldr	r2, [r4, #52]
	ldr	r1, .L147+52
	str	r3, [r4, #76]
	str	r3, [r4, #64]
	str	r3, [r4, #68]
	sub	r2, r2, #1
	ldr	r3, .L147+56
	ldr	r1, [r1]
	ldr	r0, .L147+60
	str	r2, [r4, #52]
	str	ip, [r4, #60]
	mov	lr, pc
	bx	r3
	ldrh	r3, [r9]
	b	.L47
.L143:
	mov	r1, #1
	ldrh	r3, [r9]
	ldr	r2, .L147+36
	tst	r3, #1
	str	r1, [r2, #16]
	beq	.L47
	ldr	r1, .L147+8
	ldrh	r1, [r1]
	ands	r1, r1, #1
	bne	.L47
	ldr	r3, [r4, #36]
	add	r3, r3, #1
	str	r3, [r4, #36]
	str	r1, [r2, #16]
	bl	initPlayer
	bl	initRecordPlayer
	ldrh	r3, [r9]
	b	.L47
.L58:
	cmp	r3, #0
	ble	.L61
	sub	r3, r3, #50
	cmp	r3, #0
	str	r3, [r4, #16]
	bge	.L63
.L62:
	mov	r3, #0
	str	r3, [r4, #16]
	b	.L63
.L71:
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
	beq	.L138
	ldr	r3, [r4, #20]
	cmp	r3, #0
	movgt	r3, #4
	ldr	r2, [r4, #16]
	strgt	r3, [r4, #60]
	bgt	.L52
	movne	r3, #3
	strne	r3, [r4, #60]
	b	.L52
.L145:
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
	bne	.L66
	mov	r3, #2
	ldr	r2, [r4, #28]
	cmp	r2, r10
	str	r10, [r4, #32]
	str	r0, [r4, #72]
	str	r3, [r4, #60]
	beq	.L65
	mov	r3, #20
	ldrh	r2, [r9]
	tst	r2, #64
	str	r10, [r4, #24]
	str	r3, [r4, #20]
	beq	.L70
	ldr	r3, .L147+8
	ldrh	r3, [r3]
	tst	r3, #64
	bne	.L70
	ldr	r3, [r4, #16]
	ldr	r2, .L147+64
	sub	r3, r3, #600
	str	r10, [r4, #28]
	str	r3, [r4, #16]
	str	r2, [r4, #20]
.L70:
	ldr	r3, .L147+20
	ldrh	r3, [r3, #48]
	tst	r3, #128
	ldreq	r3, [r4, #20]
	addeq	r3, r3, #200
	streq	r3, [r4, #20]
	b	.L65
.L61:
	beq	.L63
.L57:
	add	r3, r3, #50
	cmp	r3, #0
	str	r3, [r4, #16]
	bgt	.L62
	b	.L63
.L141:
	mov	r3, #1
	str	r3, [r4, #76]
	bl	respawnPlayer
	ldr	r3, [r4, #68]
	ldr	ip, [r4, #60]
	b	.L92
.L66:
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
	bne	.L65
	mov	r3, #2
	ldr	r2, [r4, #28]
	cmp	r2, #0
	str	r0, [r4, #32]
	str	r10, [r4, #72]
	str	r3, [r4, #60]
	beq	.L65
	mov	r3, #20
	ldrh	r2, [r9]
	tst	r2, #64
	str	r10, [r4, #24]
	str	r3, [r4, #20]
	beq	.L70
	ldr	r3, .L147+8
	ldrh	r3, [r3]
	ands	r3, r3, #64
	bne	.L70
	ldr	r2, [r4, #16]
	str	r3, [r4, #28]
	ldr	r3, .L147+64
	add	r2, r2, #600
	str	r2, [r4, #16]
	str	r3, [r4, #20]
	b	.L70
.L148:
	.align	2
.L147:
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
	ldr	r1, .L151
	ldr	r3, .L151+4
	ldr	r2, .L151+8
	str	r4, [r1, #36]
	str	r2, [r3]
	bl	initSprites
	bl	initPlayer
	bl	initRecordPlayer
	mov	ip, #224
	mov	r0, #8
	mov	r1, #16
	mov	r2, #3
	ldr	r3, .L151+12
	str	r4, [r3, #4]
	str	ip, [r3]
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	pop	{r4, lr}
	bx	lr
.L152:
	.align	2
.L151:
	.word	player
	.word	curColMap
	.word	insructionsMapBitmap
	.word	livesDisp
	.size	initGame, .-initGame
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
	ldr	r2, .L166
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
	ldr	lr, .L166+4
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
	beq	.L156
	ldr	r2, .L166+8
	ldr	r2, [r2, #36]
	cmp	r2, #0
	bne	.L157
.L156:
	mov	r3, #512
	lsl	r1, r1, #3
	strh	r3, [lr, r1]	@ movhi
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L157:
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
.L167:
	.align	2
.L166:
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
	ldr	r3, .L170
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	ldr	lr, [sp], #4
	bx	lr
.L171:
	.align	2
.L170:
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
	ldr	r2, .L179
	ldr	r1, [r2, #36]
	ldr	r0, .L179+4
	cmp	r1, #0
	ldr	r3, [r0, #16]
	beq	.L173
	push	{r4, lr}
	ldr	r2, [r2, #52]
	ldr	ip, [r0]
	ldr	lr, .L179+8
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
.L173:
	mov	r1, #512
	ldr	r2, .L179+8
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L180:
	.align	2
.L179:
	.word	player
	.word	livesDisp
	.word	shadowOAM
	.size	updateLivesDisplay, .-updateLivesDisplay
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
	ldr	r3, .L185
	ldr	r2, [r3, #52]
	cmp	r2, #0
	ble	.L184
.L181:
	pop	{r4, lr}
	bx	lr
.L184:
	ldr	r2, [r3, #36]
	cmp	r2, #1
	ble	.L181
	sub	r2, r2, #1
	str	r2, [r3, #36]
	bl	initPlayer
	pop	{r4, lr}
	b	initRecordPlayer
.L186:
	.align	2
.L185:
	.word	player
	.size	updateGame, .-updateGame
	.comm	curColMap,4,4
	.global	numSprites
	.comm	livesDisp,20,4
	.comm	recordPlayer,40,4
	.comm	player,80,4
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
