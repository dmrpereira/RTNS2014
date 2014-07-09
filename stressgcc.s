	.syntax unified
	.cpu cortex-m3
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.thumb
	.file	"stress.c"
	.text
	.align	2
	.global	stress
	.thumb
	.thumb_func
	.type	stress, %function
stress:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7}
	movs	r3, #0
	add	r1, r3, #4096
	sub	r2, r3, #256
	ldrb	r7, [r1]	@ zero_extendqisi2
	ldrb	r4, [r2]	@ zero_extendqisi2
	ldrb	r5, [r3, #4095]	@ zero_extendqisi2
	ldrb	r6, [r3, #-255]	@ zero_extendqisi2
@ 19 "stress.c" 1
	dsb
isb

@ 0 "" 2
	.thumb
	ldrb	r1, [r3, r0, lsl #3]	@ zero_extendqisi2
	ldrb	r2, [r3, r0]	@ zero_extendqisi2
	add	r5, r5, r7
	add	r5, r5, r6
	add	r5, r5, r4
	add	r5, r5, r2
	ldrb	r4, [r3]	@ zero_extendqisi2
	lsls	r2, r0, #4
	add	r5, r5, r1
	ldrb	r2, [r3, r2]	@ zero_extendqisi2
	asrs	r1, r0, #1
	ldrb	r3, [r3, r1]	@ zero_extendqisi2
	adds	r0, r5, r4
	add	r0, r0, r2
	add	r0, r0, r3
	uxtb	r0, r0
	pop	{r4, r5, r6, r7}
	bx	lr
	.size	stress, .-stress
	.comm	p,1,1
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.8.3 20140228 (release) 
	[ARM/embedded-4_8-branch revision 208322]"