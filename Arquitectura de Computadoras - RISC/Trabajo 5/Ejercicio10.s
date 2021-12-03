.data
letra: .ascii 'O'
vocales: .asciiz 'AEIOUaeiOouOO'
result: .word 0

.code
lbu $a0, letra($0)
jal es_vocal
sd $v0, result($zero)
halt



es_vocal: dadd $v0, $0, $0
daddi $t0, $0, 0
loop: lbu $t1, vocales($t0)
beqz $t1, fin_vocal #$t1 = 0 salta
beq $a0, $t1, si_es_voc #$a0=$t1 salta
daddi $t0, $t0, 1
j loop

si_es_voc: daddi $v0, $v0, 1
daddi $t0, $t0, 1
j loop

fin_vocal: jr $ra