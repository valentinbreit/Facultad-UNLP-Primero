.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
Texto: .asciiz ""

.code
# Inicializo mi Control Como Argumento
lwu $a0, CONTROL($zero)

# Inicializo mi Data Como Argumento
lwu $a1, DATA($zero)

# Inicializo mi Cadena de Texto Como Argumento
lbu $a2, Texto($zero)


jal CargoMensaje

jal MuestroMensaje

halt


# Comienzo a Cargar Mi Mensaje
# Paso el valor de inicio de Texto a un temporal
CargoMensaje: dadd $t0, $0, $0
# Pido Caracter (Paso 9 al Control)
daddi $t1, $t1, 9
Loop: sd $t1, 0($a0)

# Mando el Caracter ingresado a un registro temporal
lbu $t2, 0($a1)
dadd $t3, $0, $t2
daddi $t3, $t3, -0x30
# Lo comparo con 0
beqz $t3, TerminoDePedirCaracteres

# En caso contrario, cargo el valor a texto y me muevo un slot
# Cargo Valor en Texto
sb $t2, 0($a2)
# Asi se cuantos pasos hacia adelante di para luego restarlos
daddi $t0, $t0, 1
# Me muevo 1 casillero para la proxima letra
daddi $a2, $a2, 1

dadd $t3, $0, $0
# Vuelvo a pedir
j Loop

TerminoDePedirCaracteres: dsub $a2, $a2, $t0
jr $ra

# Mando el primer lugar de la cadena de texto a Data
MuestroMensaje: sd $a2, 0($a1)
# Mando el valor de Control para mostrar una cadena 
daddi $t0, $0, 0
daddi $t0, $t0, 4

sd $t0, 0($a0)

# Vuelvo al programa principal
jr $ra