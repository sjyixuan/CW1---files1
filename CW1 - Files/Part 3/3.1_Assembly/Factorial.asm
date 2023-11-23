
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

// Initialize R1 (RAM[1]) to 1, which will be used to store the factorial result.
@R1
M=1

// Check if the input (n) is less than or equal to 0, if true, jump to END.
@R0
D=M
@END
D;JLE

// Copy the value of R0 (n) to R1 (factorial result) as a starting point.
@R0
D=M
@R1
M=D

// Label START: Begin the factorial calculation loop.
(START)
    // Copy the current factorial result (R1) to R3 for temporary storage.
    @R1
    D=M
    @R3
    M=D
    
    // Decrement the value of R0 (n) by 1.
    @R0
    D=M-1
    @R2
    M=D
    
    // If R0 (n) equals 0, jump to END to terminate the loop.
    @END
    D;JEQ

// Label FACTOR: Perform the multiplication and continue the factorial calculation.
(FACTOR)
    // If R2 (n-1) equals 0, jump to MINUS to handle the case where n is 1.
    @R2
    D=M-1
    @MINUS
    D;JEQ

    // Add the current factorial result (R3) to R1.
    @R3
    D=M
    @R1
    M=M+D

    // Decrement the value of R2 (n-1).
    @R2
    M=M-1

    // Jump back to FACTOR to continue the loop.
    @FACTOR
    0;JMP

// Label MINUS: Handle the case where n is 1.
(MINUS)
    // Decrement the value of R0 (n) by 1.
    @R0
    M=M-1

    // Jump back to START if R0 (n) is greater than or equal to 0.
    @START
    D;JGE

// Label END: Terminate the program.
(END)
    @END
    0;JMP
