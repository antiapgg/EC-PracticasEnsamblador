.data  		# comienzo del segmento de datos
datos: .word 3, 7
cad: .asciiz "Introduzca un entero: "

cad2: .asciiz "\nEl resultado es: "


.globl main
.text    	# comienzo del segmento de texto
main:
    
    #código de llamada para imprimir una cadena
    li $v0, 4    	
    la $a0, cad
    syscall

    # código de la llamada read_int	
    li $v0, 5    	
    syscall      	# ahora se introduce un número en la consola
    move $t0,$v0 	# se guarda el contenido de $v0 en $t0

    #código de llamada para imprimir una cadena
    li $v0, 4   	
    la $a0, cad
    syscall

    # código de la llamada read_int                
    li $v0, 5   
    syscall      	# ahora se introduce un número en la consola
    move $t1,$v0 	# se guarda el contenido de $v0 en $t1

    #código de llamada para imprimir una cadena
    li $v0, 4    
    la $a0, cad
    syscall

    # código de la llamada read_int
    li $v0, 5   
    syscall     	# ahora se introduce un número en la consola
    move $t2,$v0 	# se guarda el contenido de $v0 en $t2
               
    #código de llamada para imprimir una cadena
    li $v0, 4   
    la $a0, cad
    syscall

     # código de la llamada read_int 
    li $v0, 5    
    syscall      	# ahora se introduce un número en la consola
    move $t3,$v0 	# se guarda el contenido de $v0 en $t3
                

    # Para mostrar A + B en pantalla, guardamos A+B en $t4
    add $t4,$t0,$t1

    #código de llamada para imprimir una cadena
    li $v0, 4    
    la $a0, cad2  
    syscall

    # código de la llamada print_int
   li $v0, 1    
    move $a0,$t4 	# $a0 = número que se quiere imprimir
    syscall      	# se realiza la llamada

    # Para mostrar C - D en pantalla, guardamos A+B en $t4
    sub $t4,$t2,$t3

    #código de llamada para imprimir una cadena
    li $v0, 4    
    la $a0, cad2 
    syscall

    # código de llamada a print_int
    li $v0, 1    
    move $a0,$t4 	# $a0 = número que se quiere imprimir
    syscall      	# se realiza la llamada

    # Para mostrar A + B + C + D en pantalla, guardamos A+B en $t4
    # luego sumamos C a $t4 y sumamos de nuevo D a $t4
    add $t4,$t0,$t1
    add $t4,$t4,$t2
    add $t4,$t4,$t3

    #código de llamada para imprimir una cadena
    li $v0, 4   
    la $a0, cad2    
    syscall

    # código de llamada a print_int
    li $v0, 1    
    move $a0,$t4 	# $a0 = número que se quiere imprimir
    syscall      	# se realiza la llamada

    # Para calcular si A es positivo o 0 realizamos la operación siguiente

    mult $t0,$t0    	# se eleva al cuadrado
    mflo $t1

    #código de llamada para imprimir una cadena
    li $v0, 4    
    la $a0, cad2  
    syscall

    # código de llamada a print_int
    li $v0,1       
    move $a0, $t1   	# $a0 = número que se quiere imprimir
    syscall         	# se realiza la llamada

    # Desplazamos A 3 posiciones a la izquierda
    sll $t1, $t0, 3 	
  	
    #código de llamada para imprimir una cadena 
    li $v0, 4   
    la $a0, cad2   
    syscall

    # código de llamada a print_int
    li $v0,1     
    move $a0, $t1   	# $a0 = número que se quiere imprimir
    syscall         	# se realiza la llamada

    # creo un puntero al primer word
    la $t0, datos   
    lw $t1, ($t0)   	# leo el 3
    lw $t2, 4($t0)  	# leo el 7    
    div $t2, $t1    	# divido
    mfhi $t0        	# cojo el resto

    #código de llamada para imprimir una cadena
    li $v0, 4    
    la $a0, cad2
    syscall

    # llamada al sistema para imprimir un entero
    move $a0, $t0
    li $v0, 1       
    syscall

    # código de llamada exit
    li $v0, 10    
    syscall       # llamada al sistema