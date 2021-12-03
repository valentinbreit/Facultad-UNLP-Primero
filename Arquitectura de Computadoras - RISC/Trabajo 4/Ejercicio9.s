.data
A: .word 4
X: .word 3
Y: .word 2


.code
ld r1, A(r0)
ld r2, X(r0)
ld r3, Y(r0)

loop: daddi r1, r1, -1
bnez r1, loop
dadd r2, r2, r3
halt