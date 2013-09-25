.globl EnableGPIO
EnableGPIO:

# EnableGPIO(pin)

# http://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/

pin .req r0
nbyt .req r3
nbit .req r2

# nbyt' = r3 = floor(pin / 10)
ldr r2,=Div10Hack
ldr r2,[r2]
umull r2,nbyt,pin,r2

# nbit = r2 = pin % 10 * 3 = (pin - nbyt' * 10) * 3
mov nbit,nbyt,lsl #1
add nbit,nbit,lsl #2
rsb nbit,nbit,pin
add nbit,nbit,nbit,lsl #1

# nbyt = nbyt' * 4
lsl nbyt,#2

.unreq pin

gpio .req r0

ldr gpio,=dev_gpio
ldr gpio,[gpio]

mov r1,#1
lsl r1,nbit
str r1,[gpio,nbyt]

mov pc,lr

.data
Div10Hack:
# Taken from output of Microsoft's C++ compiler
.word 0x1999999A
.align 2
