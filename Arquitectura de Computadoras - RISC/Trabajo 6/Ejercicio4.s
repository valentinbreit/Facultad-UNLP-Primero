.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
CLAVEORDENADOR: .asciiz "Hola"
CLAVEINGRE: .asciiz "****"
BIENVENIDO: .asciiz "Bienvenido"
ERROR: .asciiz "Error"
Aste: .asciiz "*"

.code
# Cargo el control y el data
lwu $a0, CONTROL($zero)
lwu $a1, DATA($zero)


Loop: dadd $v1, $0, $0
# Llamo a la primer subrutina
jal Char

# Llamo a la segunda subrutina 
jal Respuesta

# Comparo para saber si tengo que volver a pedir contraseña
bnez $v1, Loop
halt

# Cargo a una variable temporal la cantida de veces que tengo que iterar
Char: daddi $t0, $0, 4
daddi $t7, $0, 1
# Dejo el valor del asterisco
daddi $t6, $0, Aste
# Cargo el lugar en el que está el mensaje que debo ingresar
daddi $t1, $0, CLAVEINGRE
# Le cargo el valor que quiero que tenga el Control
Loopeo4Veces: daddi $t2, $0, 9
sd $t2, 0($a0)

# Paso el valor de DATA a mi var
lbu $t7, 0($a1)
# Guardo el valor en memoria 
sb $t7, 0($t1)


# Le resto a la cantidad de veces que debo iterar
daddi $t0, $t0, -1

# Avanzo de lugar en mi contraseña
daddi $t1, $t1, 1

# Escribo el asterisco en pantalla (Como si se ingresara una contraseña cifrada)
# Le paso a DATA el valor del asterisco
sb $t6, 0($a1)
# Imprimo
daddi $t2, $0, 4
sd $t2, 0($a0)

# Comparo para saber si termine
bnez $t0, Loopeo4Veces

jr $ra


# Inicializo $t2 y t5
Respuesta: daddi $t5, $0, 4
dadd $t2, $0, $0
# Cargo el valor de CONTROL que necesito
daddi $t6, $0, 4
# Me paro al principio de cada oracion
daddi $t0, $0, CLAVEORDENADOR
daddi $t1, $0, CLAVEINGRE
# Cargo los valores a los que apunto en cada registro
LoopRTA: lbu $t3, 0($t0)
lbu $t4, 0($t1)
# Los resto dejando el resultado en t2
dsub $t2, $t3, $t4
# Si es distinto de 0 significa que no son los mismos
bnez $t2, NoSonLaMisma

# Me muevo 1 lugar en la fila
daddi $t0, $t0, 1
daddi $t1, $t1, 1


# Resto a la Cantidad de veces que debo Loopear
daddi $t5, $t5, -1
bnez $t5, LoopRTA

# En caso de que se llegue hasta acá significa que es la contraseña correcta
# Cargo el slot de mi mensaje de bienvenida
daddi $t0, $0, BIENVENIDO



j fin


# Si llego acá no es el mismo mensaje
NoSonLaMisma: daddi $v1, $0, 1
daddi $t0, $0, ERROR


# Mando a imprimir
fin: sd $t0, 0($a1)
sd $t6, 0($a0)
jr $ra