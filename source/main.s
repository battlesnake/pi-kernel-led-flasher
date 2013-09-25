.section .init
.globl _start
_start:

mov r0,#16
bl EnableGPIO

pin .req r0
state .req r1
delay .req r0
pattern .req r4

ldr pattern, =bitpattern
ldr pattern, [pattern]

loop$:

ror pattern, #1

tst pattern, #1
mov pin,#16
movne state,#1
moveq state,#0
bl SetPin

mov delay,#50
bl Sleep

mov pin,#16
mov state,#0
bl SetPin

mov delay,#100
bl Sleep

b loop$

.data
bitpattern:
.align 2
# 1=on, 0=off, timeslice=150ms, duty=1/3
.word 0b10101000101010001010100010101000
