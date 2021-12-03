.data
tabla: .word 4, 8, 6, 9, 5, 7, 1, 2, 3, 15
long: .word 10
cant: .word 0
res: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
X: .word 7

.code
ld r1, long(r0)
ld r2, X(r0)
ld r6, cant(r0)
dadd r5, r0, r0
dadd r3, r0, r0
daddi r10, r10, 1
loop: ld r4, tabla(r3)
slt r5, r2, r4
beq r5, r10, EsMayor
j sigo

EsMayor: daddi r6, r6, 1
sd r10, res(r3)


sigo: daddi r3, r3, 8
daddi r1, r1, -1
bnez r1, loop

j fin

fin: sd r6, cant(r0)
halt