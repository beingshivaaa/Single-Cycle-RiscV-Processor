.text
.globl _start

_start:
    addi x1,x0,15
    addi x2,x0,8
    add x3,x1,x2
    sub x4,x1,x2
    and x5,x1,x2
    or x6,x1,x2
    slt x7,x1,x2

loop: 
    j loop
