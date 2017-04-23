.data
primos:	.word 1,3,5,7,11,13,17,19
size:	.word 8
msg:	.asciiz "Os oito primeiros numeros primos sao: "
space:	.asciiz " "

.text
	la $t0,primos
	la $t1,size
	lw $t1,0($t1)
	li $v0,4
	la $a0,msg
	syscall

loop:
	beq $t1,$zero,exit
	li $v0,1
	lw $a0,0($t0)
	syscall
	li $v0,4
	la $a0,space
	syscall
	addi $t0,$t0,4
	addi $t1,$t1,-1
	j loop

exit:
	li $v0,10
	syscall