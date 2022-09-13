# EJERCICIO 3
# Escriba un programa que, utilizando los modos de direccionamiento realice las siguientes operaciones
#  sin modificar el segmento de datos:
#
#     -	Calcular la suma del primer word colocado a partir de la etiqueta datos1 y del half que
#          tiene valor 3 y colocar este resultado en el espacio de 2 bytes resaltado en negrita.
#          Imprimir y comprobar el valor.
#     -	Utilizando la etiqueta datos2, almacenar el caracter ASCII 'e' en el byte resaltado en
#          negrita e inicializado a 4. Imprimir y comprobar el valor.


.data           	# comienzo del segmento de datos

#Datos
datos1: .half 4,7,2
        .align 2
        .word 1, -5
        .byte 4
        .align 1
        .half 3
        .align 2
        .word -3
        .space 2
        .byte 'c'
        
datos2: .byte 2,3,5,7

res1: .asciiz "\n La suma del primer word y del half con valor 3 es: "
res2: .asciiz "\n El byte inicializado a 4 en la etiqueta datos1 contiene el número en ascii: "
aux: .asciiz "\n\n"

        .globl main   	# declaración de la etiqueta main como global

        .text         	# comienzo del segmento de texto

main:

  	la $t0, datos1		# Cargo la etiqueta de datos1 en t0
  	lw $t1, 8($t0) 		# Cargo el word que vale 1 en $t1.
  	lh $t2, 18($t0) 	# Cargo el half que vale 3 en $t2
  	add $t3, $t1, $t2  	# Sumo ambos valores y los almaceno en t3
  	sh $t3, 24($t0)  	# Guardo en el espacio de 2 reservado el half resultado de la suma

 #código de llamada para imprimir una cadena
  	li $v0, 4
	la $a0, res1
	syscall

 #código de llamada para imprimir un valor	
	li $v0, 1		# Llamada al sistema para imprimir el contenido de $a0
	lh $a0, 24($t0)		# Leo el contenido del space para comprobar si es correcto
	syscall

  	la $t0, datos2 		# Cargo la etiqueta de datos2 en t0
  	lb $t4, -1($t0)		# Cargo en t4 el byte c de la etiqueta de datos
  	addi $t5, $t4, 2 	# Almaceno en t5 c + 2, que en ascii es la letra e
  	sb $t5, -11($t0) 	# Almaceno en el byte 4 de la etiqueta datos1 la letra e

 #código de llamada para imprimir una cadena
        li $v0, 4
	la $a0, res2
	syscall
	
 #código de llamada para imprimir un valor
 	li $v0, 1
	lb $a0, -11($t0)
	syscall
  
 #código de llamada para imprimir una cadena
        li $v0, 4
	la $a0, aux
	syscall
	
  # código de llamada exit
       	li $v0, 10 #Fin del main
   	syscall