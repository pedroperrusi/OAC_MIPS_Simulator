####################################################################################################################################
#	Programa para testar todas as intrucoes do programa feito em C++ -- OAC							   #	
#	obs.: O nome da instrucao testada vem apos a palavra "teste". Ex.: testeADD - testa a instrucao ADD			   #	
####################################################################################################################################

.data
	valor1: .word 40
	valor2: .word 80
	end:	.word 0x00002020
	
	.macro done
	 li $v0,10
	 syscall
	.end_macro

.text
	
	lw $a1,valor1
	lw $a2,valor2
	addi $a3,$zero,-1
	
testeADD:
	
	add $t0,$zero,$a1

testeSUB:

	sub $t0,$a2,$a1

testeDIV:
	
	div $a1,$a2

testeMFHI1:

	mfhi $t1

testeMFLO1:
	
	mflo $t2

testeMULT:

	mult $a1,$a2

testeMFHI2:

	mfhi $t1

testeMFLO2:
	
	mflo $t2

testeAND:
	
	and $t1,$a1,$a2

testeOR:

	or $t1,$a1,$a2

testeNOR:

	nor $t1,$a1,$a2
	
testeSLT:

	slt $t2,$a1,$a2		# $t2 deve ir para 1
	slt $t3,$a1,$a2		# $t3 deve ficar em 0

testeSLL:

	sll $t1,$a1,10

testeSRL:
	
	srl $t2,$a1,10

testeSRA:

	sra $t2,$a2,20

testeXOR:
	
	xor $t1,$a1,$a2

testeADDI:
	
	addi $t4,$a1,10

testeANDI:

	andi $t5,$a1,0xFFFFFFFF

testeORI:

	ori $t6,$a1,0xFFFFFFFF

testeXORI:

	xori $t7,$a1,0xFFFFFFF

testeSLTI:
	
	slti $t1,$a2,-100

testeSLTIU:
	
	sltiu $t1,$a1,100

testeADDIU:
	
	addiu $t1,$a2,-100

testeJ:

	j testeJAL

testeJAL:

	jal testeJR

testeJR:
	
	la $t2,testeBEQ
	jr $t2

testeBEQ:
	
	beq $a1,40,testeBGTZaux

testeBGTZ:
	
	bgtz $a1,testeBLEZaux

testeBLEZ:
	
	blez $a3,testeBNEaux
	
testeBNE:
	
	bne $a1,$a2,testeSBaux

testeSB:
	lw $a2,end
	sb $a1,0($a2)

testeLB:
	
	lb $t0,0($a2)

testeLBU:
	
	lbu $t1,0($a2)
	
testeSH:
	
	sh $a1,0($a2)

testeLH:
	
	lh $t2,0($a2)

testeLHU:

	lhu $t3,0($a2)

testeSW:
	
	sw $a1,0($a2)
	
testeLW:
	
	lw $t5,0($a2) 

testeLUI:
	
	lui $t7,25
	done


# Labels auxiliares para verificar correto funcionamento das instrucoes beq, bne, bgtz e blez
testeBNEaux:
	j testeBNE

testeBGTZaux:
	j testeBGTZ

testeBLEZaux:
	j testeBLEZ

testeSBaux:
	j testeSB
	