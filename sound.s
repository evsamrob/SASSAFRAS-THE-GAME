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
	.file	"sound.c"
	.text
	.align	2
	.global	setupSounds
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #128
	mov	r1, #0
	ldr	r2, .L3
	strh	r0, [r3, #132]	@ movhi
	strh	r1, [r3, #128]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	-1266
	.size	setupSounds, .-setupSounds
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSong
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSong, %function
playSong:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r7, #0
	ldr	r3, .L7+8
	ldr	r3, [r3]
	mov	r5, r1
	mov	r6, r0
	mov	r8, r2
	mov	r1, r0
	str	r7, [r3, #20]
	mov	r0, #1
	mov	r3, #910163968
	ldr	r2, .L7+12
	ldr	r4, .L7+16
	mov	lr, pc
	bx	r4
	mvn	ip, #1520
	mov	r2, #1
	mov	r0, #128
	ldr	r4, .L7+20
	ldr	r3, .L7+24
	ldr	r1, .L7+28
	strh	r7, [r3, #2]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	str	r5, [r4, #4]
	str	r2, [r4, #12]
	mov	r0, r5
	str	r6, [r4]
	ldr	r3, .L7+32
	str	r8, [r4, #16]
	str	r1, [r4, #8]
	mov	lr, pc
	bx	r3
	ldr	r5, .L7+36
	adr	r3, .L7
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r5, .L7+40
	ldr	r3, .L7+44
	mov	lr, pc
	bx	r5
	ldr	r3, .L7+48
	mov	lr, pc
	bx	r3
	str	r7, [r4, #28]
	str	r0, [r4, #20]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L8:
	.align	3
.L7:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109024
	.word	DMANow
	.word	soundSong
	.word	67109120
	.word	11025
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	1086687360
	.word	__aeabi_d2iz
	.size	playSong, .-playSong
	.align	2
	.global	interruptHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L26
	ldrh	r1, [r3, #2]
	tst	r1, #1
	strh	r2, [r3, #8]	@ movhi
	beq	.L22
	ldr	r3, .L26+4
	ldr	r2, [r3, #12]
	cmp	r2, #0
	push	{r4, lr}
	beq	.L12
	ldr	r2, [r3, #28]
	ldr	r1, [r3, #20]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #28]
	ble	.L12
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L25
	ldr	r0, .L26+8
	ldr	r1, .L26+12
	ldr	r0, [r0]
	str	r2, [r3, #12]
	str	r2, [r0, #20]
	strh	r2, [r1, #2]	@ movhi
.L12:
	ldr	r3, .L26+16
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L16
	ldr	r2, [r3, #28]
	ldr	r1, [r3, #20]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #28]
	ble	.L16
	mov	r2, #0
	ldr	r0, .L26+8
	ldr	r1, .L26+12
	ldr	r0, [r0]
	str	r2, [r3, #12]
	str	r2, [r0, #32]
	strh	r2, [r1, #6]	@ movhi
.L16:
	mov	r2, #1
	ldr	r3, .L26
	strh	r2, [r3, #2]	@ movhi
	mov	r2, #1
	ldr	r3, .L26
	pop	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L22:
	mov	r2, #1
	ldr	r3, .L26
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L25:
	mov	r2, #1
	ldm	r3, {r0, r1}
	bl	playSong
	b	.L12
.L27:
	.align	2
.L26:
	.word	67109376
	.word	soundSong
	.word	dma
	.word	67109120
	.word	soundEffect
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	playEffect
	.syntax unified
	.arm
	.fpu softvfp
	.type	playEffect, %function
playEffect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, #0
	ldr	r3, .L30+8
	ldr	r3, [r3]
	mov	r6, r1
	mov	r7, r0
	mov	r1, r0
	str	r5, [r3, #32]
	mov	r0, #2
	mov	r3, #910163968
	ldr	r2, .L30+12
	ldr	r4, .L30+16
	mov	lr, pc
	bx	r4
	mvn	ip, #1520
	mov	r2, #1
	mov	r0, #128
	ldr	r4, .L30+20
	ldr	r3, .L30+24
	ldr	r1, .L30+28
	strh	r5, [r3, #6]	@ movhi
	strh	ip, [r3, #4]	@ movhi
	strh	r0, [r3, #6]	@ movhi
	str	r6, [r4, #4]
	str	r2, [r4, #12]
	mov	r0, r6
	str	r7, [r4]
	ldr	r3, .L30+32
	str	r5, [r4, #16]
	str	r1, [r4, #8]
	mov	lr, pc
	bx	r3
	ldr	r6, .L30+36
	adr	r3, .L30
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r6
	mov	r2, #0
	ldr	r6, .L30+40
	ldr	r3, .L30+44
	mov	lr, pc
	bx	r6
	ldr	r3, .L30+48
	mov	lr, pc
	bx	r3
	str	r5, [r4, #28]
	str	r0, [r4, #20]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L31:
	.align	3
.L30:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109028
	.word	DMANow
	.word	soundEffect
	.word	67109120
	.word	11025
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	1086687360
	.word	__aeabi_d2iz
	.size	playEffect, .-playEffect
	.align	2
	.global	setupInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #67108864
	str	lr, [sp, #-4]!
	mov	lr, #1
	ldrh	r1, [r0, #4]
	ldr	r3, .L34
	orr	r1, r1, #8
	ldrh	r2, [r3]
	ldr	ip, .L34+4
	strh	r1, [r0, #4]	@ movhi
	ldr	r1, .L34+8
	orr	r2, r2, lr
	strh	lr, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [ip, #4092]
	bx	lr
.L35:
	.align	2
.L34:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.align	2
	.global	pauseSound
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseSound, %function
pauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L37
	ldr	r0, .L37+4
	ldr	r1, .L37+8
	str	r3, [r0, #12]
	str	r3, [r1, #12]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L38:
	.align	2
.L37:
	.word	67109120
	.word	soundSong
	.word	soundEffect
	.size	pauseSound, .-pauseSound
	.align	2
	.global	unpauseSound
	.syntax unified
	.arm
	.fpu softvfp
	.type	unpauseSound, %function
unpauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #128
	mov	r3, #1
	ldr	r2, .L40
	ldr	ip, .L40+4
	ldr	r0, .L40+8
	strh	r1, [r2, #2]	@ movhi
	str	r3, [ip, #12]
	strh	r1, [r2, #6]	@ movhi
	str	r3, [r0, #12]
	bx	lr
.L41:
	.align	2
.L40:
	.word	67109120
	.word	soundSong
	.word	soundEffect
	.size	unpauseSound, .-unpauseSound
	.align	2
	.global	stopSound
	.syntax unified
	.arm
	.fpu softvfp
	.type	stopSound, %function
stopSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r1, .L43
	ldr	r2, .L43+4
	ldr	r1, [r1]
	ldr	ip, .L43+8
	ldr	r0, .L43+12
	str	r3, [r1, #20]
	str	r3, [ip, #12]
	strh	r3, [r2, #2]	@ movhi
	str	r3, [r0, #12]
	str	r3, [r1, #32]
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L44:
	.align	2
.L43:
	.word	dma
	.word	67109120
	.word	soundSong
	.word	soundEffect
	.size	stopSound, .-stopSound
	.comm	soundEffect,32,4
	.comm	soundSong,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
