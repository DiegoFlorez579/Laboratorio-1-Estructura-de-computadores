.data

msg1: .asciiz "Ingrese la cantidad de terminos de la serie de Fibonacci que desea imprimir: "
msg2: .asciiz "La serie de Fibonacci es: "

.text
.globl main

main:
    # Imprimir mensaje para ingresar la cantidad de términos
    la $a0, msg1 #Carga el registro en la direccion "msg1"
    li $v0, 4 #Carga el dato en el registro
    syscall

    # Leer la cantidad de términos ingresados por el usuario
    li $v0, 5 #Carga el dato en el registro
    syscall
    move $s1, $v0 #Intercambia el contenido de $s1 a $v0 "Guardar la cantidad de términos en $s1"

    # Inicializar variables
    li $t0, 0 #Primer termino
    li $t1, 1 #Segundo termino
    li $s0, 0 #Contador de terminos impresos

    # Imprimir mensaje de la serie de Fibonacci
    la $a0, msg2 #Carga el registro en la direccion "msg2"
    li $v0, 4 #Carga el dato en el registro
    syscall

    # Imprimir los términos de la serie de Fibonacci
    loop: #Incicio del ciclo
        add $t2, $t0, $t1 #Suma los 2 primeros terminos
        move $t0, $t1 #Cambia el segundo termino
        move $t1, $t2 #Guarda el resultado de la suma
        li $v0, 1 #Carga el dato en el registro
        move $a0, $t0 #Mueve el primer termino para imprimirlo
        syscall
        addi $s0, $s0, 1 #Incrementa el contador
        blt $s0, $s1, comma # Si no se han impreso todos los términos, imprimir una coma
        j exit # Si se han impreso todos los términos, salir del programa
    comma:
        li $v0, 11 #Carga el dato en el registro
        li $a0, 44 #Carga el dato en el registro
        syscall
        j loop #Regresa al ciclo
    exit: #Termina el programa
        li $v0, 10 #Carga el dato en el registro
        syscall
