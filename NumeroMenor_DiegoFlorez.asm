.data

#Aca se guardan los n�meros que el usuario desee comparar:
prompt1: .asciiz "Ingrese el primer n�mero: "
prompt2: .asciiz "Ingrese el segundo n�mero: "
prompt3: .asciiz "Ingrese el tercer n�mero: "
result: .asciiz "El n�mero menor es: "

.text
.globl main

main:
# Imprimir el primer mensaje
li $v0, 4 #Carga el dato en el registro
la $a0, prompt1 #Carga el registro en la direccion "prompt1"
syscall

# Leer el primer n�mero
li $v0, 5 #Carga el dato en el registro
syscall
move $t0, $v0 #Intercambia el contenido de $t0 a $v0

# Imprimir el segundo mensaje
li $v0, 4 #Carga el dato en el registro
la $a0, prompt2 #Carga el registro en la direccion "prompt2"
syscall

# Leer el segundo n�mero
li $v0, 5 #Carga el dato en el registro
syscall
move $t1, $v0 #Intercambia el contenido de $t1 a $v0

# Imprimir el tercer mensaje
li $v0, 4 #Carga el dato en el registro
la $a0, prompt3 #Carga el registro en la direccion "prompt3"
syscall

# Leer el tercer n�mero
li $v0, 5 #Carga el dato en el registro
syscall
move $t2, $v0 #Intercambia el contenido de $t2 a $v0

# Encontrar el n�mero menor
no_change:
move $t3, $t0     # Inicialmente asume que el primer numero es el menor
bgt $t1, $t3, no_change_t1 #bgt o "Branch if greater than" es un condicional si se cumple no pasa a la siguiente instrucci�n
move $t3, $t1     # Si el segundo n�mero es menor, actualiza el n�mero menor
no_change_t1:
bgt $t2, $t3, no_change_t2 #bgt o "Branch if greater than" es un condicional si se cumple no pasa a la siguiente instrucci�n
move $t3, $t2     # Si el tercer n�mero es menor, actualiza el n�mero menor
no_change_t2:

# Imprimir el resultado
li $v0, 4 #Carga el dato en el registro
la $a0, result #Carga el registro en la direccion "result"
syscall

li $v0, 1 #Carga el dato en el registro
move $a0, $t3 #Intercambia el contenido de $a0 a $t3
syscall

# Salida del programa
li $v0, 10 #Carga el dato en el registro
syscall
