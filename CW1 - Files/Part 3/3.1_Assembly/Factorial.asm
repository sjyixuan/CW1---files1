
// ================================= Factorial ==================================
// This program calculates the Factorial F of a given number n 
// 	At run time:
//		- The user should enter the value of n into R0. i.e. RAM[0]
//		- The program then calculate the factorial of n    i.e. F(n)=n!
//			 F(n) = n*(n-1)*(n-2)*......*2*1
//		- The result F(n) should be saved in RAM[1]
//			-- You should also consider the F(0) case.
// ==============================================================================


// put your code here

@R1
M=1 // Store 1 into the memory of R1 

// If R0=0, then jump to END 
@R0
D=M
@END
D;JLE

// R1 = R0
@R0
D=M
@R1
M=D

(START)
    // R3 = R1
    @R1
    D=M
    @R3
    M=D

    // Store the value of R0 minus 1 into R2
    @R0
    D=M-1
    @R2
    M=D
    @END
    D;JEQ

(FACTOR)
    // If the value of R2 minus 1 = 0, then jump to OUT
    @R2
    D=M-1
    @MINUS
    D;JEQ

    // R3 = R3 + R1
    @R3
    D=M
    @R1
    M=M+D

    // R2 = R2 - 1
    @R2
    M=M-1

    // Jump back to FACTOR
    @FACTOR
    0;JMP

(MINUS)
    // If R0 minus 1 is more than or equal to 0, jump back to START 
    @R0
    M=M-1
    @START
    D;JGE

(END)
    // Infinite loop to halt the program
    @END
    0;JMP

