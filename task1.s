.data
    value1: .word 0x12345678 # Memory location storing the number 0x12345678
    value2: .word 0x87654321 # Memory location storing the number 0x87654321
.text
main:
    la t0, value1 # Load the address of 'value1' into t0
    lw x5, 0(t0) # Load the data from memory into x5
    
    li t1, 0x10000100 # Load the address 0x10000100 into t1
    lw x6, 0(t1) # Load the data from memory into x6
    
    li t2, 0x10000008 # Load the address 0x10000008 into t2
    add x8, x5, x6 # x8 = x5 + x6
    sw x8, 0(t2) # Store the addition result from x8 into memory

    li a0, 10 # System call for exit
    ecall