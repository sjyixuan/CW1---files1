// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R1 and R2 and stores the result in R3.
// (R1, R2, R3 refer to RAM[1], RAM[2], and RAM[3], respectively.)
// The algorithm is based on repetitive addition.

// put your code here 


// Initialize R3 to 0
@R3
M=0

// Loop to perform repetitive addition
(LOOP)
   // Check if R2 (counter) is 0
   @R2
   D=M
   @END
   D;JEQ

   // Add R1 to R3
   @R1
   D=M
   @R3
   M=D+M

   // Decrement R2 (counter)
   @R2
   M=M-1

   // Jump back to the beginning of the loop
   @LOOP
   0;JMP

// End of the program
(END)
