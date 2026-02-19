# print_array.asm program
# For CMPSC 64
#
# Don't forget to:
#   make all arguments to any function go in $a0, $a1
#   make all returned values from functions go in $v0

# Example array and alen - your code should work for any integer array of any length > 1.
.data
    array:  .word 6, 4, 0, 1, 2, 9, 3, 5, 8, 7
    alen:   .word 10
    newline: .asciiz "\n"
    space:  .asciiz " "


.text
bubble:

    lw $t1, 0($a1)  #save the actual value 
    addi $t1, $t1,-1 #size-1
    li $t0, 0 #int temp 


loop1:
    li $t3, 1 #j
    slt $t2, $zero, $t1# t2<t1 = 0
    beq $t2, $zero, done_bubble # 0 = 0 youre done 
    
loop2: 



    slt $t4, $t1, $t3  #t4 = t3 <t1
    bne $t4, $zero, exit_loop # done with j 
    #if (array[j-1] > array[j]) , get values then compare 


    sll $t6, $t3, 2 #creates offset 
    add $t6, $a0, $t6 #moving up addreses 
    lw $t5, 0($t6) # gets the actual value arra7 [j] 


    addi $t7, $t3, -1 #j-1
    sll $t7, $t7, 2 #creates offset 
    add $t7, $a0, $t7 #addreses 
    lw $t8, 0($t7) # gets the actual value array[j-1] 


    #t8 hold j-1, $t5 holds j 

    blt $t8, $t5, done_swapping 
    move $t9, $t8 # temporatrau 
    move $t8, $t5
    move $t5, $t9

    #actualy save teh values to teh array 
    sw $t5, 0($t6)
    sw $t8, 0($t7)

done_swapping: #ends if 
    addi $t3, $t3, 1
    j loop2

exit_loop:
    addi $t1, $t1, -1
    j loop1

done_bubble:
    jr $ra



    

printArray:
	# CODE MISSING: Student to complete this part
    li $t0, 0 #int 1=0 starting point 

    lw $t2, 0($a1) #hold array length 
    move $t5, $a0

loop:
    slt $t1, $t0, $t2  #t2<t0 length<i 
    beq $t1, $zero, done_printing # done with j 
    #lets print 

    sll $t3, $t0, 2   # t3 = 4*ad 
    add $t3, $t5, $t3
    lw $t4, 0($t3)

    move $a0, $t4 
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, space
    syscall

    addi $t0, $t0, 1

    j loop 

done_printing:
    li $v0, 4
    la $a0, newline
    syscall

    jr $ra







main:
    la $a0, array
    la $a1, alen
    jal printArray

    la $a0, array
    la $a1, alen
    jal bubble

    la $a0, array
    la $a1, alen
    jal printArray

    li $v0, 10
    syscall	
    

