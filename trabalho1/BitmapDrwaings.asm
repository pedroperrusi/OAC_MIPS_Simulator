#----------------------------------------------------------------------------------------------------------------------------------
#		Organização e Arquitetura de Computadores - Turma C
#				Trabalho 1
#
# Nome: Alon Mota													Matrícula: 130005002
# Nome: André Luis Souto Ferreira	 				Matrícula: 140016261
# Nome: Pedro Henrique Suruagy Perruci		Matrícula: 140158596
#----------------------------------------------------------------------------------------------------------------------------------


.data

	# Parâmetros gerais para este programa ------------------------------------

	image_name:   	.asciiz "lenaeye.raw"   # nome da imagem a ser carregada
	heapaddress:		.word 	0x10040000			# endereco do bitmap display na memoria
	buffer:					.word   0								# configuracao default do MARS
	size:						.word		4096						# numero de pixels da imagem

	# Interface com o Usuário ------------------------------------

	# -> Strings definidas para cada parte do menu
	string1: 	.asciiz "\n\nDefina o número da opção desejada:\n"
	string2: 	.asciiz "1. Obtém ponto\n"
	string3: 	.asciiz "Essa função recebe uma posição, dada por x e y, e retorna o valor da cor RGB desse ponto\n\n"
	string4: 	.asciiz "2. Desenha ponto\n"
	string5: 	.asciiz "Essa função desenha um ponto no bitmap a partir de uma posição dada por x e y, e um valor val em RGB. Os valores das componentes R, G e B (devem estar entre 0 e 255).\n\n"
	string6: 	.asciiz "3. Desenha retângulo sem preenchimento\n"
	string7: 	.asciiz "Essa função tem como parâmetros duas posições, sendo uma dada por xi e yi\ne outra dada por xf e yf; além de um valor em cores RGB. Os valores das componentes R, G e B (devem estar entre 0 e 255).\n\n"
	string8: 	.asciiz "4. Converte para negativo da imagem\n"
	string9: 	.asciiz "Essa função inverte a coloração de cada pixel no bitmap display. Ela não possui parâmetros.\n\n"
	string10: .asciiz "5. Carrega imagem\n"
	string11: .asciiz "Essa função tem como parâmetros o nome de uma imagem image_name a\nser carregada no display, o endereço base de memória do display address, o\nendereçoo de uma palavra na memoria para utilizar como buffer e o tamanho\nsize da imagem em pixels. Estes parâmetros devem ser configurados na subseção .config do código fonte.\n\n"
	string12: .asciiz "6. Encerra\n\n"
	# -> Mensagem de erro padrão
	erroMSG: 	.asciiz "Valor inserido invalido! Tente novamente com um valor dentro do esperado!\n"

	# -> Strings para obter x0 e y0
	insirax: 	.asciiz 	"Insira valor de x0\n"
	insiray: 	.asciiz 	"Insira valor de y0\n"
	valorR: 	.asciiz 	"Valor R: "
	valorG: 	.asciiz 	" Valor G: "
	valorB: 	.asciiz 	" Valor B: "

	# -> Strings para obter parâmetro que corresponde a cor dos pontos
	insiraR: .asciiz "Insira valor de R\n"
	insiraG: .asciiz "Insira valor de G\n"
	insiraB: .asciiz "Insira valor de B\n"

	# -> Strings para obter xf e yf
	insiraxf: .asciiz "Insira valor de xf\n"
	insirayf: .asciiz "Insira valor de yf\n"

	# -> Strings para carregar imagem
	insirapath: 		.asciiz "Digite o path para a imagem\n"
	insiraadress: 	.asciiz "Digite o display adress (em hexadecimal)\n"
	insirabuffer: 	.asciiz "Digite o buffer\n"
	insiratamanho: 	.asciiz "Digite o tamanho da imagem, em pixels\n"

	# Macros definidas para este programa ------------------------------------
	# Macro para terminar programa
	.macro done
		li $v0,10
		syscall
	.end_macro

	# Macro para printar uma string
	.macro print_string(%mensagem)
		li $v0,4
		la $a0,%mensagem
		syscall
	.end_macro

	# Macro para printar o menu todo
	.macro print_menu
		print_string(string1)
		print_string(string2)
		print_string(string3)
		print_string(string4)
		print_string(string5)
		print_string(string6)
		print_string(string7)
		print_string(string8)
		print_string(string9)
		print_string(string10)
		print_string(string11)
		print_string(string12)
	.end_macro

				# Empilha
	.macro push(%register)
		addi $sp,$sp,-4  # Decrementa ponteiro da pilha em 4
    sw   %register,0($sp)   # Salva na pilha
  .end_macro

    # Desempilha
  .macro pop
  	lw   $v1, 0($sp)   # Desempilha e coloca em $v1
    addi $sp, $sp, 4   # Incerementa ponteiro da pilha em 4
  .end_macro

  .macro validapos(%register)  #Verifica se o valor da entrada esta entre 0 e 63, caso esteja retorna 1 em v1. 0 caso contrario
		sleu $t8, %register, 63
		sgeu $t9, %register, 0
		seq $v1, $t8, $t9
  .end_macro

  .macro validacor(%register)  #Verifica se o valor esta entre 0 e 255, caso esteja retorna 1 em v1. 0 caso contrario
		sleu $t8, %register, 255
		sgeu $t9, %register, 0
		seq $v1, $t8, $t9
  .end_macro

.text

#***************************************************************************************************************************#
menu:	# Essa função mostra o menu, através de print_menu, Esta será a principal interfaçe do programa com o usuário.
	# Os textos foram divididos em strings que são mostradas pelo comando print_string, que é chamado diversas vezes no macro
	# print_menu. Aqui também, o usuário escolhe a opção que deseja, ou seja, escolhe a próxima função que deseja utilizar
	# no Bitmap Display.

	# Salvando Regs s que serao utilizados no programa #
	push($s0)
	push($s1)
	push($s4)
	push($s5)

	print_menu
	li $v0,5
	syscall
	move $t4,$v0	# A escolha do usuário é armazenada em $t4

	# Verifica qual função deve ser chamada
	li $t5,1
	beq $t4,$t5,recebe_parametro	#if opcao == 1
	li $t5,2
	beq $t4,$t5,recebe_parametro	#if opcao == 2
	li $t5,3
	beq $t4,$t5,recebe_parametro	#if opcao == 3
	li $t5,4
	beq $t4,$t5,converte_negativo	#if opcao == 4
	li $t5,5
	beq $t4,$t5,carrega_imagem		#if opcao == 5

	# Retomando valores de dos registradores $s usados
	pop
	move $s5,$v1
	pop
	move $s4,$v1
	pop
	move $s1,$v1
	pop
	move $s0,$v1

	done	# Encerra o programa


recebe_parametro: # É usada para receber os parâmetros de cor, e de x0, y0, xf e yf. O parâmetro de cor é recebido separadamente,
		  # ou seja, o usuário insere um valor para R, um para G e um para B e tais valores são colocados no mesmo registrador
		  # com auxílio de shifts

	ler_X:
	# Recebendo x do usuário
	print_string(insirax)
	li $v0,5
	syscall
	move $a2,$v0	# Colocando valor inserido em $a2
	validapos($a2)
	beq $v1, 1, ler_Y
	print_string(erroMSG)
	beq $v1, 0, ler_X

	ler_Y:
	# Recebendo y do usuário
	print_string(insiray)
	li $v0,5
	syscall
	move $a1,$v0	# Colocando valor inserido em $a1
	validapos($a1)
	beq $v1, 1, valida_escoha
	print_string(erroMSG)
	beq $v1, 0, ler_Y


	valida_escoha:
	li $t1,1
	beq $t4,$t1,obtem_ponto	# caso a escolha do usuário ($t4) seja 1 (obtém ponto), goto obtém ponto.
	li $t1,2
	beq $t4,$t1,ler_cores	# caso a escolha do usuário ($t4) seja 2 (desenha ponto), goto ler_cores.
	add $t5,$zero,$zero	# Zerando valor do registrador $t5

	# Único caso não testado foi $t1 == 3 (desenha retângulo)
	ler_Xf:
	# Recebendo xf do usuário
	print_string(insiraxf)
	li $v0,5
	validapos($v0)
	beq $v1, 1, valid5
	print_string(erroMSG)
	beq $v1, 0, ler_Xf

	valid5:
	syscall
	push($v0)	# Colocando valor inserido na pilha


	ler_Yf:
	# Recebendo yf do usuário
	print_string(insirayf)
	li $v0,5
	syscall
	validapos($v0)
	beq $v1, 1, valid6
	print_string(erroMSG)
	beq $v1, 0, ler_Yf

	valid6:
	push($v0)	# Colocando Yf inserido na pilha

	ler_cores:
	ler_R:
	# Recebendo parte R de RGB
	print_string(insiraR)
	li $v0,5
	syscall
	validacor($v0)
	beq $v1, 1, valida_R
	print_string(erroMSG)
	beq $v1, 0, ler_R

	valida_R:
	sll $t2,$v0,16
	or $t5,$t5,$t2


	ler_G:
	# Recebendo parte G de RGB
	print_string(insiraG)
	li $v0,5
	syscall
	validacor($v0)
	beq $v1, 1, valida_G
	print_string(erroMSG)
	beq $v1, 0, ler_G

	valida_G:
	sll $t2,$v0,8
	or $t5,$t5,$t2


	ler_B:
	# Recebendo parte B de RGB
	print_string(insiraB)
	li $v0,5
	syscall
	validacor($v0)
	beq $v1, 1, valida_B
	print_string(erroMSG)
	beq $v1, 0, ler_B

	valida_B:
	move $t2,$v0
	or $t5,$t5,$t2

	# Passando para o registrador $a3 pois ele será usado como passagem de parâmetro para função
	move $a3,$t5
	# Caso a função escolhida seja desenhar ponto,
	li $t1,2
	beq $t4,$t1,chama_desenha_ponto

	# Único caso não testado foi $t1 == 3 (desenha retângulo)
	chama_desenha_retangulo:
	j desenha_retangulo

	chama_desenha_ponto: # Chama a função desenha_ponto
	jal desenha_ponto
	j menu


#***************************************************************************************************************************#
obtem_ponto:	# Representa função get_point(int x, int y), os parâmetros do ponto (x,y) são passados para essa função como
		# argumentos nos registradores $a2 e $a1, respectivamente. Tal função também mostra na tela, separadamente,
		# os valores R, G e B do ponto escolhido pelo usuário.

	lw $t0, heapaddress	 			#Coloca o endereço da heap no registrador t0

	add $t2, $a2, $zero				#Coloca o valor lido em t2
	mul $t2, $t2, 4					#Parametriza o ponto conforme o display

	addi $t3, $zero, 63				#Parametriza o ponto para ele come�ar de baixo
	sub  $t3, $t3, $a1				#Coloca o valor em t3
	mul $t3, $t3, 4					#Paramtriza o valor conforme o display

	mul $t3, $t3, 64				#Multiplica o valor de Y pelo tamanho das linhas pra avan�ar no vetor
	add $t2, $t3, $t2				#Soma o valor das colunas

	add $t0, $t0, $t2				#Soma tudo isso no endereço do heap para saber a posi�ao exata da memoria

	print_string(valorR)				#Printa string valorR
	lw $t5,0($t0)
	srl $t4,$t5,16					#Shift right para isolar os valores de R em RGB
	li $v0,1
	add $a0,$zero,$t4 				#Mostra o valor da componente R
	syscall

	print_string(valorG)				#Printa string valorG
	lw $t5,0($t0)
	addi $t6,$zero,0x0000ff
	srl $t4,$t5,8
	and $t4,$t4,$t6					#And visando isolar os valores de G em RGB
	li $v0,1
	add $a0,$zero,$t4  				#Mostra o valor da componente G
	syscall

	print_string(valorB)				#Printa string valorB
	lw $t5,0($t0)
	and $t4,$t5,$t6					#And visando isolar os valor de B em RGB
	li $v0,1
	add $a0,$zero,$t4  				#Mostra o valor da componente B
	syscall

	li $v0,12					#Recebe um caracter qualquer, serve apenas para mostrar os
	syscall						#valores obtidos pela função obtém ponto para o usuário

	j menu


#***************************************************************************************************************************#
desenha_ponto:	# Representa função draw_point(int x, int y, int val). Os valores de x e y são passados nos registradores
		# $a2 e $a1, respectivamente. O valor val, é passado também, mas pelo registrador $a3. Tal função basicamente
		# salva na posição de meméria correspondente ao ponto (x,y) o valor RGB inserido.

	lw $t0, heapaddress		#Coloca o endereço da heap no registrador t0
	add $t1, $zero, $a3		#Coloca a cor a se pintar o ponto lido em t1

	add $t2, $a2, $zero		#Coloca o valor lido em t2, precisa fazer para liverar v0 para prox leitura
	mul $t2, $t2, 4				#Parametriza o ponto conforme o display

	addi $t3, $zero, 63		#Parametriza o ponto para ele começar de baixo
	sub  $t3, $t3, $a1		#Coloca o valor em t3
	mul $t3, $t3, 4				#Paramtriza o valor conforme o display

	mul $t3, $t3, 64			#Multiplica pela o valor de Y pelo tamanho das linhas pra avançar no vetor
	add $t2, $t3, $t2			#Soma o valor das colunas

	add $t0, $t0, $t2			#Soma tudo isso no endereço do heap para saber a posiçao exata da memoria a escrever

	sw $t1,  0($t0)				#Salva a cor lida no inicio na posiçao indicada

	jr $ra								#Retorna para quem chamou


#***************************************************************************************************************************#
desenha_retangulo:  # Representa função draw_empty_rectangle(int x0, int y0, int val, int xf, int yf). Valores de x0 e y0 são
		    # passados por $a2 e $a1, respectivamente, enquanto o valor de cor, val, é passado por $a3. Já os valores
		    # xf e yf são colocados na pilha por recebe_parametros, e aqui são retirados da pilha para serem usados.
		    # A função desenha um retângulo vazio e quando são inseridos valores tais que x0 > xf e/ou y0 > yf, um
		    # controle é executado para garantir o desenho do retângulo da mesma forma. Outro ponto importante,
		    # a função desenha o retângulo nessa ordem de eixos: eixo x debaixo, eixo x de cima, eixo y mais pr�ximo
		    # da origem e por fim, eixo y mais longe da origem

	# Recuperando valores de yf e xf salvos na pilha
	pop
	move $s0,$v1	# Yf
	pop
	move $s1,$v1	# Xf

	# Controle caso x0 > xf
	slt $t7,$s1,$a2
	beq $t7,1,trocaX
	paradaX:

	# Controle caso y0 > yf
	slt $t7,$s0,$a1
	beq $t7,1,trocaY
	paradaY:

	move $s4,$a2	# Salvando valor de $a2 (x0)
	move $s5,$a1	# Salvando valor de $a1 (y0)

	# Desenho do eixo x com y = y0
	constroiX1:
	ble $a2,$s1,chamada1
	retorno_chamada1:
	addi $a2,$a2,1
	ble $a2,$s1,constroiX1

	push($a1)
	add $a2,$zero,$s4	# Recuperando valor de $a2 para próximas iterações
	add $a1,$zero,$s0	# Recuperando valor de $a1 para próximas iterações

	# Desenho do eixo x com y = yf
	constroiX2:
	ble $a2,$s1,chamada2
	retorno_chamada2:
	addi $a2,$a2,1
	ble $a2,$s1,constroiX2

	pop
	move $a1,$v1		# Recuperando valor de $a1 para próximas iterações
	add $a2,$zero,$s1	# Recuperando valor de $a2 para próximas iterações

	# Desenho do eixo y com x = x0
	constroiY1:
	ble $a1,$s0,chamada3
	retorno_chamada3:
	addi $a1,$a1,1
	ble $a1,$s0,constroiY1

	add $a2,$zero,$s4	# Recuperando valor de $a2 para próximas iterações
	add $a1,$zero,$s5	# Recuperando valor de $a1 para próximas iterações

	# Desenho do eixo y com x = xf
	constroiY2:
	ble $a1,$s0,chamada4
	retorno_chamada4:
	addi $a1,$a1,1
	ble $a1,$s0,constroiY2

	j menu

trocaX:	# Rotina de desenha_ponto caso x0 > xf, um passa a ter o valor do outro
	move $t7,$a2
	move $a2,$s1
	move $s1,$t7
	j paradaX

trocaY:	# Rotina de desenha_ponto caso y0 > yf, um passa a ter o valor do outro
	move $t7,$a1
	move $a1,$s0
	move $s0,$t7
	j paradaY

chamada1: # Chamada de desenha_ponto para desenho do eixo x com y = y0
	jal desenha_ponto
	j retorno_chamada1

chamada2: # Chamada de desenha_ponto para desenho do eixo x com y = yf
	jal desenha_ponto
	j retorno_chamada2

chamada3: # Chamada de desenha_ponto para desenho do eixo y com x = x0
	jal desenha_ponto
	j retorno_chamada3

chamada4: # Chamada de desenha_ponto para desenho do eixo y com x = x0
	jal desenha_ponto
	j retorno_chamada4


#***************************************************************************************************************************#
converte_negativo:  # Representa função que converte para negativo a imagem - convert_negative()
										# Esta função não recebe parâmetros. Realiza a inversão das cores a partir da subtração
										# de 255 do valor atual do pixel.

	lw $a3,size
	lw $t8,heapaddress

	volta:
	beq $a3,$zero,final	# Funciona como um for, caso $a3 seja 0, vai para o label final
	lw $t0,0($t8)

	addi $t0,$t0,0xff000000 # O vetor de cores e da forma 0x00.... para que fique assim apos inversao basta somar 0xff..
	not $t1,$t0		# NEGANDO O PIXEL AQUI

	sw $t1,0($t8)		# Salvando valor novo do pixel nele mesmo
	addi $t8,$t8,4		# Próximo pixel
	addi $a3,$a3,-1		# Decrementa contador $a3
	j volta

	final:
	j menu


#***************************************************************************************************************************#
carrega_imagem:  # Representa função que Carrega imagem – load_image(string image_name, int address, int buffer, int size)
	 	 # Essa função tem como parâmetros:
		 #			* (a0) nome de uma imagem image_name a ser carregada no display
		 #			* (a1) endereço base de memória do display address
		 #			* (a2) endereço de uma palavra na memoria para utilizar como buffer
		 #		  * (a3) tamanho size da imagem em pixels
		 # A função retorna a exibição da imagem no bitmap display.

  # Reconhece-se que esta função foi baseada inteiramente na função exemplo fornecida para este trabalho
	la $a0, image_name
	lw $a1, heapaddress
	la $a2, buffer
	lw $a3, size

	jal load_image

	load_image:
  	# salvar parametros da funcao nos termporarios
  	move $t7, $a0	   # nome do arquivo
 		move $t8, $a1    # endereco de carga
  	move $t9, $a2	   # buffer para leitura de um pixel do arquivo

  	li   $v0, 13       # system call para abertura de arquivo
  	li   $a1, 0        # Abre arquivo para leitura (parâmtros são 0: leitura, 1: escrita)
  	li   $a2, 0        # modo é ignorado
  	syscall            # abre um arquivo (descritor do arquivo é retornado em $v0)
  	move $t6, $v0      # salva o descritor do arquivo

  	move $a0, $t6      # descritor do arquivo
  	move $a1, $t9      # endereço do buffer
  	li   $a2, 3        # largura do buffer

	loop:

  	beq  $a3, $zero, close

  	li   $v0, 14       # system call para leitura de arquivo
  	syscall            # l� o arquivo
  	lw   $t0, 0($a1)   # l� pixel do buffer
  	sw   $t0, 0($t8)   # escreve pixel no display
  	addi $t8, $t8, 4   # Próximo pixel
  	addi $a3, $a3, -1  # decrementa countador

  	j loop

 	# fecha o arquivo
	close:
  	li   $v0, 16       # system call para fechamento do arquivo
  	move $a0, $t6      # descritor do arquivo a ser fechado
  	syscall            # fecha arquivo

  	j menu


#***************************************************************************************************************************#
