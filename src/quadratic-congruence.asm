.data
	promptA: .asciiz "Enter integer value of A: "
	promptB: .asciiz "Enter integer value of B: "
	promptC: .asciiz "Enter integer value of C: "
	separator: .asciiz ", "

.text

	# JOSHUA PARK

	main:
		# Get the user inputs for A, B, and C
		
		li $v0 4		# Show the first prompt for A
		la $a0 promptA
		syscall
		li $v0 5		# Take user input for A
		syscall
		move $t0 $v0		# Psuedo instruction to store user input into $t0
		li $v0 4		# Show the first prompt for B
		la $a0 promptB
		syscall
		li $v0 5		# Take user input for B
		syscall
		move $t1 $v0		# Psuedo instruction to store user input into $t1
		li $v0 4		# Show the first prompt for C
		la $a0 promptC
		syscall
		li $v0 5		# Take user input for C
		syscall
		move $t2 $v0		# Psuedo instruction to store user input into $t2
	
		# x^2 cong a mod b, iff rem x^2 b = rem a b

		li $t3 0		# initializing our x variable
		
	loop: 				
	
		# And our while-loop fun times begin!!!!
	
		bgt $t3 $t2 end		# the moment our x variable is bigger than C, branch to end
		
		mul $t4 $t3 $t3 	# t4 = x^2
		rem $t5 $t4 $t1 	# t5 = rem(x^2, b)
		rem $t6 $t0 $t1		# t6 = rem(a, b)
		bne $t5 $t6 continue	# if they do not equal, the congruence does not hold
		
		li $v0 1		# prep the syscall to print an integer
		la $a0 ($t3)		# print the current X (because its congruent)
		syscall
		
		li $v0 4		# print the separator (comma and space) for aesthetics ;) 
		la $a0 separator	# Gotta keep those answers cleaaaan
		syscall

		addi $t3 $t3 1		# now we repeat until X !<= C
		j loop
		
	continue:
		
		addi $t3 $t3 1		# we increment our x variable by 1
		j loop			# jump back to the beginning of the loop with the incremented x
	
	end:
		
		li $v0 10		# So now that X > C, we exit the program
		syscall			# We are done! Fun fun fun
		
		
		
		

