.data
cadena: .asciiz "abcaskfdlfiwldpspglkwdd"
car: .asciiz "d"
cant: .word 0
long: .word 23

.code
ld r1, cant(r0)
ld r2, long(r0)
lbu r3, car(r0)
dadd r4, r0, r0

loop: lbu r5, cadena(r4)
beq r5, r3, EsElCaracter
j NoEsElCaracter
EsElCaracter: daddi r1, r1, 1

NoEsElCaracter: daddi r4, r4, 1
daddi r2, r2, -1
beqz r2, fin
j loop

fin: sd r1, cant(r0)
halt