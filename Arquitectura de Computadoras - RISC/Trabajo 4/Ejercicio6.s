.data
A:      .word 5
B:      .word 9
C:      .word 12
D:      .word 0 ;inicializo en 0, es decir, en que todos los números son distintos

.code
ld r1, A(r0)
ld r2, B(r0)
ld r3, C(r0)
ld r4, D(r0)
beq r1, r2, dos ;Si A = B saltar a dos
beq r1, r3, dos ;si A es distinto de B, pregunto por A = C
j ult
dos: daddi r4, r4, 1
ult: bne r2, r3, fin
daddi r4, r4, 1
fin: beqz r4, guardar
daddi r4, r4, 1
guardar: sd r4, D(r0)
halt