.data
Tabla: .word 4, 8, 9, 15, 78, 0
CantImpares: .word 0

.code
# Cargo el primer paso del vector
daddi $a0, $0, Tabla

# Llamo la subrutina
jal LeerVector

# Guardo el valor en memoria
sd $v0, CantImpares($zero)

halt

# Guardo en la pila
LeerVector: daddi $sp, $0, 0x400 
daddi $sp, $sp, -8
sd $ra, 0($sp)

daddi $v0, $0, 0

# Leo primer valor
Loop: ld $a1, 0($a0)
# Me fijo que no sea 0 
beqz $a1, fin
jal Es_Impar
beqz $v1, Sigo
# Realizo suma
daddi $v0, $v0, 1
Sigo: daddi $a0, $a0, 8
j Loop


# Popeo y retorno
fin: ld $ra, 0($sp)
daddi $sp, $sp, 8 
jr $ra


# Inicializo mi retorno
Es_Impar: daddi $v1, $0, 0
# Tomo el valor
ld $t0, 0($a0)
beqz $t0, EsPar
# Corro un lugar el bit
andi $t1, $t0, 1
bnez $t1, EsPar
daddi $v1, $v1, 1
EsPar: jr $ra