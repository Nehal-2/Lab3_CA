.data
byte_array:    .byte 10, 20, 30, 40, 50

.text
    .globl main

main:

# addi t0, zero, 10  
# addi t1, zero, 20  
# addi t2, zero, 30  
# addi t3, zero, 40  
# addi t4, zero, 10 
la t0, byte_array
addi sp, sp, -20 

lb t1, 0(sp)
sw t1, 0(sp)

lb t2, 1(sp)
sw t2, 4(sp)

lb t3, 2(sp)
sw t3, 8(sp) 

lb t4, 3(sp)
sw t4, 12(sp) 

lb t5, 4(sp)
sw t5, 16(sp)

li a0, 1
ecall
li a0, 10
ecall
