

.data 
    array: .byte 0x78, 0x56, 0x34, 0x12, 0x21, 0x43, 0x65, 0x87


.text
main:

la t0 array
li t3 0x10000000 #Load starting address
mv  t1 x10 
li t2 8 # array size
li t4 0 #offset counter


#store in the memory
loop:
lb t5 0(t0)
sb t5 0(t3)
addi t0 t0 1
addi t3 t3 1
addi t4 t4 1
blt t4 t2 loop


#shift

li t0, 0x10000000 
add t3, t0, t1
li t4, 0 


shift_array:
    lb t5, 0(t0)
    sb t5, 0(t3)         
    addi t0, t0, 1       
    addi t3, t3, 1      
    addi t4, t4, 1
    blt t4, t2, shift_array



la a0, t3    
li a0, 4 
ecall

li a0, 10 # System call for exit
ecall


