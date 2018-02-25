// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// sum = 0
   @R2
   M=0
// i = 0
   @i
   M=0
(CHECK_LOOP_CONDITION)
// if i == a, then jump to end
   @R0
   D=M
   @i
   D=D-M
   @END
   D;JEQ
// loop body (sum = sum + b)
   @R1
   D=M
   @R2
   M=D+M
// ++i
   @i
   M=M+1
   @CHECK_LOOP_CONDITION
   0;JMP
(END)
   @END
   0;JMP
