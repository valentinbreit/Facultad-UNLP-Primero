.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
RESULTADO: .double 0.0
SiPotEs0: .double 1.0

.code
# Inicializo mi Control y mi Data
lwu $a0, CONTROL($zero)
lwu $a1, DATA($zero)

# Cargo los 2 numeros
jal PidoNumeros

# Lo potencio
jal a_la_potencia

# Lo guardo en resultado
s.d f2, RESULTADO($zero)

# Lo imprimo 
s.d f2, 0($a1)
daddi $t0, $0, 3
sd $t0, 0($a0)

halt


# Pido un numero en punto flotante
# Primero pido un numero en punto flotante
PidoNumeros: daddi $t0, $0, 8
sd $t0, 0($a0)
# Lo muevo del data a mi registro en punto flotante
l.d f1, 0($a1)

# Pido el numero de la potencia
sd $t0, 0($a0)
ld $v1, 0($a1)


jr $ra



# Elevo a la potencia mi punto flotante
# Corroboro que mi potencia sea distinta de 0
a_la_potencia: beqz $v1, EsCero
# En caso de que llegue acá es porque no es 0
# Muevo el registro f1 a otro registro
mov.d  f2, f1
# Comienzo la iteracion
Loop: daddi $v1, $v1, -1
beqz $v1, fin
# Multiplico f2 por f1 dejando el resultado en f2
mul.d f2, f2, f1
j Loop

# Pongo mi flotante en 1 y termino
EsCero: l.d f2, SiPotEs0($zero)

fin: jr $ra