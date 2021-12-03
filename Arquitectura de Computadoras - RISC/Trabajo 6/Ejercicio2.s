.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
CEROO: .asciiz "Cero.."
UNOO: .asciiz "Uno..."
DOSS: .asciiz "Dos..."
TRESS: .asciiz "Tres.."
CUATROO: .asciiz "Cuatro"
CINCOO: .asciiz "Cinco."
SEISS: .asciiz "Seis.."
SIETEE: .asciiz "Siete."
OCHOO: .asciiz "Ocho.."
NUEVEE: .asciiz "Nueve."


.code
# Inicializo Control
lwu $a0, CONTROL($zero)

# Inicializo Data
lwu $a1, DATA($zero)

daddi $a2, $0, 4

# Llamo a la primer subrutina
LoopContinuo: jal Ingreso

# Llamo a la segunda subrutina
jal Muestro

# Salto continuamente
j LoopContinuo
halt


# Pongo en un registro temporal el valor que quiero pasar al Control
Ingreso: dadd $t0, $0, $0
daddi $t0, $t0, 9

# Paso el registro a Control para pedir un numero
HastaIngresarUnNumero: sd $t0, 0($a0)

# Una vez ingrese el dato, lo paso a un registro temporal
lbu $v0, 0($a1)
# Le saco la carga hexadecimal del ascii
daddi $v0, $v0, -0x30
dadd $t1, $v0, $0


# Comparo al registro lo comparo con 0
slti  $t2, $t1, 0
bnez $t2, HastaIngresarUnNumero

# Le resto 10
daddi $t1, $t1, -10
slti $t2, $t1, 0
beqz $t2, HastaIngresarUnNumero


# Vuelvo
jr $ra




# Muestro el Mensaje
# Comparo el valor con 0
Muestro: dadd $t0, $0, $0 
beq $v0, $0, EsCero

daddi $v0, $v0, -1
beqz $v0, EsUno

daddi $v0, $v0, -1
beqz $v0, EsDos

daddi $v0, $v0, -1
beqz $v0, EsTres

daddi $v0, $v0, -1
beqz $v0, EsCuatro

daddi $v0, $v0, -1
beqz $v0, EsCinco

daddi $v0, $v0, -1
beqz $v0, EsSeis

daddi $v0, $v0, -1
beqz $v0, EsSiete

daddi $v0, $v0, -1
beqz $v0, EsOcho

j EsNueve

EsCero: daddi $t0, $t0, CEROO
sd $t0, 0($a1)
sd $a2, 0($a0)
j fin

EsUno: daddi $t0, $t0, UNOO
sd $t0, 0($a1)
sd $a2, 0($a0)
j fin

EsDos: daddi $t0, $t0, DOSS
sd $t0, 0($a1)
sd $a2, 0($a0)
j fin

EsTres: daddi $t0, $t0, TRESS
sd $t0, 0($a1)
sd $a2, 0($a0)
j fin

EsCuatro: daddi $t0, $t0, CUATROO
sd $t0, 0($a1)
sd $a2, 0($a0)
j fin

EsCinco: daddi $t0, $t0, CINCOO
sd $t0, 0($a1)
sd $a2, 0($a0)
j fin

EsSeis: daddi $t0, $t0, SEISS
sd $t0, 0($a1)
sd $a2, 0($a0)
j fin

EsSiete: daddi $t0, $t0, SIETEE
sd $t0, 0($a1)
sd $a2, 0($a0)
j fin

EsOcho: daddi $t0, $t0, OCHOO
sd $t0, 0($a1)
sd $a2, 0($a0)
j fin

EsNueve: daddi $t0, $t0, NUEVEE
sd $t0, 0($a1)
sd $a2, 0($a0)

fin: jr $ra