
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

; Function to calculate the factorial of a given number n
(factorial)
 ; If n == 0, return 1
 @R0
 D=M
 @END
 D;JEQ      ; if D == 0, jump to END

 ; Calculate n! = n * (n-1)!
 @R0
 D=M
 @ARG
 M=D
 @ARG
 M=M-1
 @n_minus_1_factorial
 D=A
 @ARG
 D=D-M
 @STACK
 D=D+A
 @temp
 M=D
 @temp
 D=M
 @STACK
 D=D+A
 @RETURN
 M=D
 @STACK
 D=M
 @SP
 M=D
 @R14
 M=D
 @STACK
 AM=M-1
 D=M
 @temp
 M=D
 @SP
 D=M
 @SP
 M=D+1
 @n_minus_1_factorial
  0;JMP

(n_minus_1_factorial)
 ; If n-1 == 0, return 1
 @ARG
 D=M
 @END
 D;JEQ      ; if D == 0, jump to END

 ; Calculate (n-1)! = (n-1) * (n-2)!
 @ARG
 D=M
 @ARG
 M=D-1
 @factorial
 D=A
 @ARG
 D=D-M
 @STACK
 D=D+A
 @temp
 M=D
 @temp
 D=M
 @STACK
 D=D+A
 @RETURN
 M=D
 @STACK
 D=M
 @SP
 M=D
 @R14
 M=D
 @STACK
 AM=M-1
 D=M
 @temp
 M=D
 @SP
 D=M
 @SP
 M=D+1
 @factorial
  0;JMP

(END)
 ; Save the result to RAM[1]
 @temp
 D=M
 @R1
 M=D

(RETURN)
 ; Return to the caller
 @SP
 A=M
 M=D
 @SP
 M=M+1
 @R14
 A=M
  0;JMP
