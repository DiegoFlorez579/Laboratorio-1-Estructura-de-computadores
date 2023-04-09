.data

#Aca se guardan los números que el usuario desee comparar:
prompt1: .asciiz "Ingrese el primer número: "
prompt2: .asciiz "Ingrese el segundo número: "
prompt3: .asciiz "Ingrese el tercer número: "
result: .asciiz "El número mayor es: "

.text
.globl main

main:
# Imprimir el primer mensaje
li $v0, 4 #Carga el dato en el registro
la $a0, prompt1 #Carga el registro en la direccion "prompt1"
syscall

# Leer el primer número
li $v0, 5 #Carga el dato en el registro
syscall
move $t0, $v0 #Intercambia el contenido de $t0 a $v0

# Imprimir el segundo mensaje
li $v0, 4 #Carga el dato en el registro
la $a0, prompt2 #Carga el registro en la direccion "prompt2"
syscall

# Leer el segundo número
li $v0, 5 #Carga el dato en el registro
syscall
move $t1, $v0 #Intercambia el contenido de $t1 a $v0

# Imprimir el tercer mensaje
li $v0, 4 #Carga el dato en el registro
la $a0, prompt3 #Carga el registro en la direccion "prompt3"
syscall

# Leer el tercer número
li $v0, 5 #Carga el dato en el registro
syscall
move $t2, $v0 #Intercambia el contenido de $t2 a $v0

# Encontrar el numero mayor
move $t3, $t0 # Inicialmente asume que el primer numero es el mayor
ble $t1, $t3, check_t1 #ble o "branch if less or equal" es un condicional si se cumple pasa a la siguiente instrucción
move $t3, $t1 # Si el segundo numero es mayor, actualiza el numero mayor
check_t1:
ble $t2, $t3, check_t2 #ble o "branch if less or equal" es un condicional si se cumple pasa a la siguiente instrucción
move $t3, $t2 # Si el tercer numero es mayor, actualiza el numero mayor
check_t2:

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
