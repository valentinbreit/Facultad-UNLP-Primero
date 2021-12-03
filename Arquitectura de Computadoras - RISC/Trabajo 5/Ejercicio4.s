.data
Peso: .double 45.8
Altura: .double 1.74
IMC: .double 0
Valor: .word 0
Infrapeso: .double 18.5
Normal: .double 25
Sobrepeso: .double 30

.code
; Cargo los valores
l.d f1, Peso(r0)
l.d f2, Altura(r0)
l.d f3, IMC(r0)
ld r1, Valor(r0)
l.d f4, Infrapeso(r0)
l.d f5, Normal(r0)
l.d f6, Sobrepeso(r0)

; Realizo las operaciones
; Multiplico
mul.d f2, f2, f2

; Divido
div.d f3, f1, f2


; Realizo Comparaciones
c.lt.d f3, f4
bc1t TieneInfrapeso
c.lt.d f3, f5
bc1t TieneNormal
c.lt.d f3, f6
bc1t TieneSobrePeso
daddi r1, r1, 4
j CargoDatos


TieneInfrapeso: daddi r1, r1, 1
j CargoDatos

TieneNormal: daddi r1, r1, 2
j CargoDatos

TieneSobrePeso: daddi r1, r1, 3

CargoDatos: s.d f3, IMC(r0)
sd r1, Valor(r0)
halt