.globl dev_timer
.globl dev_gpio

.data

dev_timer:
.align 2
.word 0x20003000

dev_gpio:
.align 2
.word 0x20200000
