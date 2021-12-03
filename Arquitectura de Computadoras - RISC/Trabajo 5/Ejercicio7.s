.data
M: .word 8
Tabla: .word 7, 8, 12, 8, 45, 0
FinTabla: .byte 6
VecesQueSonMayoes: .word 0

.code
# Cargo el valor M
ld $a0, M($zero)
# Paso el valor del comienzo de la tabla
daddi $a1, $0, Tabla
# Cargo la cant de veces que debo iterar
ld $a2, FinTabla($zero)

jal RecorroTabla
# Guardo el valor en la celda
sd $v0, VecesQueSonMayoes($zero)
halt


# Inicializo el registro donde cuento la cant de numeros que cumplen X > M
RecorroTabla: daddi $v0, $r0, 0
# Cargo el valor de la tabla
Loop: ld $t0, 0($a1)
# Comparo si el valor que tomé es igual a M
beq $t0, $a0, Sigo
# Comparo dejando en 0 si el valor es mayor a M
slt $t1, $a0, $t0
bnez $t1, Sigo
# Sumo a la cantidad total, 1
daddi $v0, $v0, 1
# Me muevo en la tabla una posicion (8 bytes = 64 bits)
Sigo: daddi $a1, $a1, 8
# Decremento la cant de iteraciones
daddi $a2, $a2, -1
# Si $a2 = 0, entonces dejo de iterar, sino, sigo
bnez $a2, Loop
jr $ra


