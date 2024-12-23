

.data 
value: .string “Mashael”
dest: .space 5

.text
main:

la t0 value
la t1 dest


#reveresing

lb t2, 6(t0)
sb t2 0(t1)

lb t2, 5(t0)
sb t2 1(t1)

lb t2, 4(t0)
sb t2 2(t1)

lb t2, 3(t0)
sb t2 3(t1)

lb t2, 2(t0)
sb t2 4(t1)

lb t2, 1(t0)
sb t2 5(t1)

lb t2, 0(t0)
sb t2 6(t1)

#null terminator
sb zero 7(t1)



la a0, dest    
li a0, 4 
ecall

li a0, 10 # System call for exit
ecall
