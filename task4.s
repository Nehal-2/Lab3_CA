.data
value: .string "nehal " 

.text
main:
    la t0, value # Load the address of 'value' into t0
    lw x6, 0(t0) # Load the data from memory into x6
    
    # Print the result using a system call
    mv a1, t0
    li a0, 4 # System call for printing an integer
    ecall
    
    li t2, 0x20202020 # Load the address of 'value' into t0
    sub x6, x6, t2
    sw x6, 0(t0)
    
    lw x7, 4(t0) # Load the data from memory into x7
    
    li t4, 0x00000020 
    sub x7, x7, t4
    sw x7, 4(t0)
    
    # Print the result using a system call
    mv a1, t0
    li a0, 4 # System call for printing an integer
    ecall

    li a0, 10 # System call for exit
    ecall