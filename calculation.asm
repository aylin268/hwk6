# calculation.asm program
# For CMPSC 64
#
# Don't forget to:
#   make all arguments to any function go in $a0, $a1, $a2
#   make all returned values from functions go in $v0

.text
conv:
    li $v0, 0 #int z = 0
    #for loop, set bound 

    li $t1, 0  
loop: 
    slt $t0, $t1, $a2
   # for (int i = 0; i < n; i++) 
    beq $t0, $zero, finish #0 =0 finsh , loop gets to the last
    move $t4, $a1 
    sll $t4, $t4 2 #4*y;
    sub $v0, $v0, $a0
    add $v0, $v0, $t4

    #if (x >= 2)
    li $t4, 2
    blt $a0, $t4, exit_if #a0<= 2 exit 
    sub $a1, $a1, $a0

    exit_if:
        addi $a0, $a0, 1 

    addi $t1, $t1, 1
    j loop

finish:
    jr $ra






    # CODE MISSING: Student to complete this part
    
main:  # DO NOT MODIFY THE MAIN SECTION
    li $a0, 5
    li $a1, 7
    li $a2, 7

    jal conv

    move $a0, $v0
    li $v0, 1
    syscall

    li $v0, 10
    syscall