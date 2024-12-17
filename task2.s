# First method (WIP): Load & store once (complete processing within the registers)
    
# Second method: Accessing memory multiple times
.data
    value: .word 0x12345678 # Memory location storing the number 0x12345678
.text
main:
    la t1, value # Load the address of 'value' into t0
    lw x5, 0(t1) # Load the data from memory into x5
    
    # Make two copies of the value in x5
    lw t2, 0(t1) # Load a copy of the data into t2
    lw t4, 0(t1) # Load the data from memory into t4
    
    addi t1, t1, 4 # t1 = 0x10000004 (chosen address for the reversed result)
    sb t2, 0(t1) # Store the LSB from t2 into memory
    
    addi t3, x0, 8 # Load 8 (bits) into t3
    srl t2, t2, t3 # Logical shift to the right by 2 bytes
    
    lw t4, 0(t1) # Load the data from memory into t4   
    sll t4, t4, t3 # Shift the temp result by 2 bytes
    sw t4, 0(t1) # Store the temp result back into memory
    sb t2, 0(t1) # Store the next 2 bytes from t2 into memory
    
    # Repeat the previous steps twice to store the remaining 4 bytes
    srl t2, t2, t3 # Logical shift to the right by 2 bytes
    lw t4, 0(t1) # Load the data from memory into t4   
    sll t4, t4, t3 # Shift the temp result by 2 bytes
    sw t4, 0(t1) # Store the temp result back into memory
    sb t2, 0(t1) # Store the next 2 bytes from t2 into memory
    
    srl t2, t2, t3 # Logical shift to the right by 2 bytes
    lw t4, 0(t1) # Load the data from memory into t4   
    sll t4, t4, t3 # Shift the temp result by 2 bytes
    sw t4, 0(t1) # Store the temp result back into memory
    sb t2, 0(t1) # Store the next 2 bytes from t2 into memory

    li a0, 10 # System call for exit
    ecall