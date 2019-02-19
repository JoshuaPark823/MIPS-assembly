# This program illustrates an exercise of capitalizing a string.

	.data

inputstring: 	.asciiz "this Is a a stRess Test to test for strings containing more charaCters than given"
newLine:	.asciiz "\n"
	
	.text
	.globl main

main:

	# JOSHUA PARK

   	la $a0, inputstring		# Load $a0 with the inputstring 
   	li $v0 4			# Here we're just printing the original string before we alter it
   	syscall
    
   	la $a0 newLine			# Ae're just printing a new line here to separate pre cap. and post cap.
   	li $v0 4
	syscall
	
   	li $t0, 0			# And our while loop adventures begin! initialize incr. variable to 0

whileLoopFun:

	lb $t1, inputstring($t0)	# First we load the first character of the input string into $t1
	beq $t1, 0, escape		# If the character is null zero, if it is, we enter our escape case
    	blt $t1, 'a', check		# First check, if the character is less than 'a', move on and start over
    	bgt $t1, 'z', check		# Second check, if the character is greater than 'z', move on and start over
    	addi $t1, $t1, -32		# Now that both conditions are met, change to upper case
    	sb $t1, inputstring($t0)	# Storing the offsetted capitalized char back into the string	

check: 

	addi $t0, $t0, 1		# This is our exit case for our condition check branches.
	j whileLoopFun			# If they don't meet the conditions, we increment the loop var. and jump to the top.

escape:

	li $v0, 4			# Yay! We've now successfuly converted the string to upper-case and print it out.
	la $a0, inputstring
	syscall

	li $v0, 10			# 10 is the system call code for the exitting of a program. ;) 
	syscall				# And we are done! 
	
	
	
	
	
	
	
	
	
	
	
