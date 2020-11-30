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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	ldr	r2, .L4
	push	{r4, lr}
	ldr	r3, .L4+4
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	lr, #100663296
	ldr	r2, .L4+8
	ldr	ip, .L4+12
	strh	r2, [r3]	@ movhi
	ldr	r1, .L4+16
	mov	r2, #83886080
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L4+20
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	ldr	r0, .L4+24
	ldr	r3, .L4+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+36
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L4+40
	ldr	r3, .L4+44
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	state
	.word	waitForVBlank
	.word	1028
	.word	videoBuffer
	.word	splashScreenPal
	.word	DMANow
	.word	splashScreenBitmap
	.word	drawFullscreenImage4
	.word	stopSound
	.word	splashSong_length
	.word	splashSong_data
	.word	playSong
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #67108864
	mov	r3, #0
	ldr	r0, .L8
	push	{r4, lr}
	ldr	r2, .L8+4
	strh	r0, [r1]	@ movhi
	ldr	ip, .L8+8
	ldrh	lr, [r2, #48]
	ldr	r0, .L8+12
	ldr	r1, .L8+16
	ldr	r2, .L8+20
	strh	lr, [ip]	@ movhi
	strh	r3, [r0]	@ movhi
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	ldr	r3, .L8+24
	mov	lr, pc
	bx	r3
	bl	goToStart
	ldr	r3, .L8+28
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	1028
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	curLevel
	.word	setupSounds
	.word	setupInterrupts
	.word	waitForVBlank
	.size	initialize, .-initialize
	.align	2
	.global	drawCurLevel
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCurLevel, %function
drawCurLevel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #4352
	push	{r4, lr}
	ldr	r1, .L18
	strh	r2, [r3]	@ movhi
	ldr	r2, .L18+4
	strh	r1, [r3, #8]	@ movhi
	ldr	r3, [r2]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L10
.L13:
	.word	.L16
	.word	.L15
	.word	.L14
	.word	.L12
.L12:
	ldr	r4, .L18+8
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L18+12
	mov	lr, pc
	bx	r4
	mov	r3, #1760
	mov	r0, #3
	ldr	r2, .L18+16
	ldr	r1, .L18+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L18+24
	ldr	r1, .L18+28
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	ldrh	r3, [r2]
	ldr	r1, .L18+32
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	mov	r0, #3
	strh	r1, [r2, #10]	@ movhi
	mov	r3, #6848
	mov	r2, #100663296
	ldr	r1, .L18+36
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L18+40
	ldr	r1, .L18+44
	mov	lr, pc
	bx	r4
.L10:
	pop	{r4, lr}
	bx	lr
.L16:
	ldr	r4, .L18+8
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L18+48
	mov	lr, pc
	bx	r4
	mov	r3, #2464
	mov	r0, #3
	ldr	r2, .L18+16
	ldr	r1, .L18+52
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L18+24
	ldr	r1, .L18+56
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L15:
	ldr	r4, .L18+8
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L18+60
	mov	lr, pc
	bx	r4
	mov	r3, #1152
	mov	r0, #3
	ldr	r2, .L18+16
	ldr	r1, .L18+64
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L18+24
	ldr	r1, .L18+68
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L14:
	ldr	r4, .L18+8
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L18+72
	mov	lr, pc
	bx	r4
	mov	r3, #992
	mov	r0, #3
	ldr	r2, .L18+16
	ldr	r1, .L18+76
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L18+24
	ldr	r1, .L18+80
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r1, #53248
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	mov	r0, #3
	strh	r1, [r2, #10]	@ movhi
	mov	r3, #2512
	mov	r2, #100663296
	ldr	r1, .L18+84
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L18+40
	ldr	r1, .L18+88
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	7300
	.word	curLevel
	.word	DMANow
	.word	level3Pal
	.word	100679680
	.word	level3Tiles
	.word	100720640
	.word	level3Map
	.word	20608
	.word	level3BackTiles
	.word	100696064
	.word	level3BackMap
	.word	instructionsScreenPal
	.word	instructionsScreenTiles
	.word	instructionsScreenMap
	.word	level1Pal
	.word	level1Tiles
	.word	level1Map
	.word	level2Pal
	.word	level2Tiles
	.word	level2Map
	.word	level2BackTiles
	.word	level2BackMap
	.size	drawCurLevel, .-drawCurLevel
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #2
	ldr	r3, .L21
	str	r2, [r3]
	b	drawCurLevel
.L22:
	.align	2
.L21:
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	playCurSong
	.syntax unified
	.arm
	.fpu softvfp
	.type	playCurSong, %function
playCurSong:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L29
	push	{r4, lr}
	ldr	r4, [r3]
	cmp	r4, #2
	beq	.L24
	cmp	r4, #3
	beq	.L25
	cmp	r4, #1
	beq	.L28
	pop	{r4, lr}
	bx	lr
.L24:
	ldr	r3, .L29+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L29+8
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L29+12
	ldr	r3, .L29+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L28:
	ldr	r3, .L29+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L29+20
	mov	r2, r4
	ldr	r1, [r3]
	ldr	r0, .L29+24
	ldr	r3, .L29+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L25:
	ldr	r3, .L29+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L29+28
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L29+32
	ldr	r3, .L29+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	curLevel
	.word	stopSound
	.word	level2Song_length
	.word	level2Song_data
	.word	playSong
	.word	level1Song_length
	.word	level1Song_data
	.word	level3Song_length
	.word	level3Song_data
	.size	playCurSong, .-playCurSong
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #3
	ldr	r2, .L33
	ldr	r3, .L33+4
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	lr, #100663296
	ldr	r2, .L33+8
	ldr	ip, .L33+12
	strh	r2, [r3]	@ movhi
	mov	r0, r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L33+16
	ldr	r4, .L33+20
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	ldr	r0, .L33+24
	ldr	r3, .L33+28
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	state
	.word	waitForVBlank
	.word	1028
	.word	videoBuffer
	.word	pauseScreenPal
	.word	DMANow
	.word	pauseScreenBitmap
	.word	drawFullscreenImage4
	.size	goToPause, .-goToPause
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L47
	ldr	r3, .L47+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L36
	ldr	r2, .L47+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L45
.L36:
	tst	r3, #1
	beq	.L35
	ldr	r3, .L47+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L46
.L35:
	pop	{r4, lr}
	bx	lr
.L46:
	pop	{r4, lr}
	b	goToPause
.L45:
	ldr	r3, .L47+12
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L47+16
	str	r2, [r3]
	bl	drawCurLevel
	ldrh	r3, [r4]
	b	.L36
.L48:
	.align	2
.L47:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	initGame
	.word	state
	.size	start, .-start
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L61
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L61+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L50
	ldr	r2, .L61+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L59
.L50:
	tst	r3, #4
	beq	.L49
	ldr	r3, .L61+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L60
.L49:
	pop	{r4, lr}
	bx	lr
.L59:
	mov	r2, #2
	ldr	r3, .L61+12
	pop	{r4, lr}
	str	r2, [r3]
	b	drawCurLevel
.L60:
	pop	{r4, lr}
	b	goToStart
.L62:
	.align	2
.L61:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #4
	mov	r1, #0
	ldr	r0, .L65
	ldr	r2, .L65+4
	push	{r4, lr}
	ldr	r3, .L65+8
	str	ip, [r0]
	str	r1, [r2, #36]
	mov	lr, pc
	bx	r3
	ldr	r3, .L65+12
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L65+16
	ldr	r3, .L65+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L65+24
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	lr, #100663296
	ldr	r2, .L65+28
	ldr	ip, .L65+32
	strh	r2, [r3]	@ movhi
	mov	r0, #3
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L65+36
	ldr	r4, .L65+40
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	ldr	r0, .L65+44
	ldr	r3, .L65+48
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L66:
	.align	2
.L65:
	.word	state
	.word	player
	.word	stopSound
	.word	winSong_length
	.word	winSong_data
	.word	playSong
	.word	waitForVBlank
	.word	1028
	.word	videoBuffer
	.word	winScreenPal
	.word	DMANow
	.word	winScreenBitmap
	.word	drawFullscreenImage4
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L74
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L74+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L67
	ldr	r3, .L74+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L73
.L67:
	pop	{r4, lr}
	bx	lr
.L73:
	pop	{r4, lr}
	b	goToStart
.L75:
	.align	2
.L74:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #5
	ldr	r2, .L78
	push	{r4, lr}
	ldr	r3, .L78+4
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L78+8
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L78+12
	ldr	r3, .L78+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L78+20
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	lr, #100663296
	ldr	r2, .L78+24
	ldr	ip, .L78+28
	strh	r2, [r3]	@ movhi
	mov	r0, #3
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L78+32
	ldr	r4, .L78+36
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	ldr	r0, .L78+40
	ldr	r3, .L78+44
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L79:
	.align	2
.L78:
	.word	state
	.word	stopSound
	.word	loseSong_length
	.word	loseSong_data
	.word	playSong
	.word	waitForVBlank
	.word	1028
	.word	videoBuffer
	.word	loseScreenPal
	.word	DMANow
	.word	loseScreenBitmap
	.word	drawFullscreenImage4
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L100
	mov	lr, pc
	bx	r3
	ldr	r3, .L100+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L100+8
	ldr	r3, .L100+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L100+16
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #8
	bne	.L81
	ldr	r4, .L100+20
	ldr	r3, [r4, #36]
.L82:
	cmp	r3, #1
	beq	.L95
.L85:
	cmp	r3, #3
	bgt	.L96
.L86:
	ldr	r2, .L100+24
	ldr	r1, [r2]
	cmp	r1, r3
	bne	.L97
.L87:
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	ldr	r0, [r4, #36]
	asr	r3, r3, #8
	ldr	lr, .L100+28
	ldr	ip, .L100+32
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	asr	r2, r2, #8
	cmp	r0, #2
	strh	r1, [lr]	@ movhi
	strh	r2, [ip]	@ movhi
	beq	.L98
	cmp	r0, #3
	moveq	r2, #67108864
	lsreq	r3, r3, #17
	strheq	r3, [r2, #20]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L96:
	bl	goToWin
	b	.L87
.L97:
	str	r3, [r2]
	bl	drawCurLevel
	bl	playCurSong
	ldr	r0, [r4, #36]
	ldr	r3, .L100+36
	mov	lr, pc
	bx	r3
	b	.L87
.L81:
	ldr	r6, .L100+40
	ldrh	r3, [r6]
	ldr	r4, .L100+20
	tst	r3, #8
	ldr	r3, [r4, #36]
	bne	.L82
	cmp	r3, #0
	bne	.L99
.L83:
	mov	r2, #1
	ldr	r3, .L100+36
	str	r2, [r4, #36]
	mov	lr, pc
	bx	r3
	ldr	r3, .L100+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L100+48
	mov	lr, pc
	bx	r3
.L94:
	ldr	r3, [r4, #36]
	b	.L82
.L98:
	mov	r2, #67108864
	lsl	r1, r1, #17
	lsr	r1, r1, #16
	strh	r1, [r2, #20]	@ movhi
	ldrh	r3, [ip]
	lsl	r3, r3, #17
	lsr	r3, r3, #16
	strh	r3, [r2, #22]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L95:
	ldr	r2, [r4, #56]
	cmp	r2, #0
	bne	.L86
	bl	goToLose
	ldr	r3, [r4, #36]
	b	.L85
.L99:
	bl	goToPause
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L94
	ldrh	r3, [r6]
	tst	r3, #8
	ldr	r3, [r4, #36]
	bne	.L82
	cmp	r3, #0
	bne	.L82
	b	.L83
.L101:
	.align	2
.L100:
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	waitForVBlank
	.word	flipPage
	.word	player
	.word	curLevel
	.word	hOff
	.word	vOff
	.word	initPlayer
	.word	buttons
	.word	initRecordPlayer
	.word	initCheat
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L113
	mov	lr, pc
	bx	r3
	ldr	r6, .L113+4
	ldr	fp, .L113+8
	ldr	r5, .L113+12
	ldr	r10, .L113+16
	ldr	r9, .L113+20
	ldr	r8, .L113+24
	ldr	r7, .L113+28
	ldr	r4, .L113+32
.L103:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L104:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L104
.L106:
	.word	.L109
	.word	.L104
	.word	.L108
	.word	.L107
	.word	.L105
	.word	.L105
.L105:
	mov	lr, pc
	bx	r7
	b	.L103
.L107:
	mov	lr, pc
	bx	r8
	b	.L103
.L108:
	mov	lr, pc
	bx	r9
	b	.L103
.L109:
	mov	lr, pc
	bx	r10
	b	.L103
.L114:
	.align	2
.L113:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win
	.word	67109120
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	vOff,2,2
	.comm	hOff,2,2
	.comm	curLevel,4,4
	.comm	player,84,4
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	soundEffect,32,4
	.comm	soundSong,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
