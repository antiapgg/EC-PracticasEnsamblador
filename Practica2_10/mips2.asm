# EJERCICIO 2: Realiza un programa que pida un número n por teclado y calcule la suma 1+2+3+...+n y la muestre por pantalla.

.data           	# comienzo del segmento de datos

cad:      .asciiz "Introduce una número: "
cadresult: .asciiz "El resultado de la suma es: "
        .globl main   	# declaración de la etiqueta main como global

        .text         	# comienzo del segmento de texto

main:
    #código de llamada para imprimir una cadena
        li $v0, 4   
        la $a0, cad
        syscall
        
    #código de llamada para leer un entero
       	li $v0, 5	#Leo un entero
	syscall
	
	move $t0, $v0	#Almaceno en t0 el valor leido en el syscall anterior
	
	li $t1, 0	#Inicializo el contador a 1 en t1
	li $t2, 0	#Inicializo el resultado a 0
	
	#Inicio bucle
	bucle:
		addi $t1, $t1, 1	#Sumo 1 al contador
		bgt $t1, $t0, fin	#Si el contador es mayor que el último número dado, salto a la etiqueta fin
		add $t2, $t2, $t1	#Sumo el resultado con el número actual del contador
		j bucle			#Reinicio el bucle
	
	fin:
	#Fin bucle

    #código de llamada para imprimir una cadena  
        li $v0, 4
        la $a0, cadresult     # Imprimo la cadena cadresult
        syscall

    #código de llamada para imprimir una cadena
        li $v0, 1
        move $a0, $t2         # Imprimo el resultado (el contador, es decir $t0)
        syscall

    # código de llamada exit
        li $v0, 10            # Fin del main
        syscall

