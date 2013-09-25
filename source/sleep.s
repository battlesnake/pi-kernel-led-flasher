.globl Sleep
Sleep:

# Sleep(msecs)

# http://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/

push {r4}

mov r1,#1000
mul r0, r1, r0

usecs .req r0
timer .req r4

ldr timer,=dev_timer
ldr timer,[timer]

endlo .req r2
endhi .req r3

ldrd endlo,endhi,[timer,#4]
adds endlo,endlo,usecs
adc endhi,endhi,#0

.unreq usecs

curlo .req r0
curhi .req r1

Spin$:
ldrd curlo,curhi,[timer,#4]
cmp endhi,curhi
cmpeq endlo,curlo
bhs Spin$

pop {r4}

mov pc,lr
