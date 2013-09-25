.globl SetPin
SetPin:

# SetPin(pin, state)

# http://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/

pin .req r0
state .req r1
bit .req r2
gpio .req r3

ldr gpio,=dev_gpio
ldr gpio,[gpio]

mov bit,#1
lsl bit,pin

tst state,state

strne bit,[gpio,#40]
streq bit,[gpio,#28]

mov pc,lr
