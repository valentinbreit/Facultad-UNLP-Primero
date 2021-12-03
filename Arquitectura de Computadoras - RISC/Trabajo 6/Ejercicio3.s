.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008   

.code
# Cargo el control y el data en argumentos
lwu $a0, CONTROL($zero)
lwu $a1, DATA($zero)
# Cargo en un argumento el valor que le quiero ingresar a Control
daddi $a2, $0, 9

# Llamo a mi primer subrutina
jal Ingreso

# Llamo a la segunda subrutina
jal Resultado

halt

# Primer pedido
Ingreso: sd $a2, 0($a0)

# Una vez ingrese el dato, lo paso a un registro temporal
lbu $v0, 0($a1)
# Le saco la carga hexadecimal del ascii
daddi $v0, $v0, -0x30
dadd $t1, $v0, $0


# Comparo al registro lo comparo con 0
slti  $t2, $t1, 0
bnez $t2, Ingreso

# Le resto 10
daddi $t1, $t1, -10
slti $t2, $t1, 0
beqz $t2, Ingreso


# Segundo pedido
Ingreso2: sd $a2, 0($a0)

# Una vez ingrese el dato, lo paso a un registro temporal
lbu $v1, 0($a1)
# Le saco la carga hexadecimal del ascii
daddi $v1, $v1, -0x30
dadd $t1, $v1, $0


# Comparo al registro lo comparo con 0
slti  $t2, $t1, 0
bnez $t2, Ingreso2

# Le resto 10
daddi $t1, $t1, -10
slti $t2, $t1, 0
beqz $t2, Ingreso2


# Vuelvo
jr $ra


# Sumo las variables en un registro temporal
Resultado: dadd $t0, $v1, $v0
# Lo mando a data
sd $t0, 0($a1)

# Le ordeno a control imprimir en pantalla
daddi $t1, $0, 1
# Lo cargo a control
sd $t1, 0($a0)

jr $ra