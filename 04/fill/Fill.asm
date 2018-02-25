// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(START)
// offset = 0
   @offset
   M=0
   
// ptr = SCREEN
   @SCREEN
   D=A
   
   @ptr
   M=D
   
// if kbd == 0, jmp to clear
   @KBD
   D=M
   
   @CLEAR
   D;JEQ
   
// set color to -1
   @color
   M=-1
   
   @CHECK_LOOP_CONDITION
   0;JMP

(CLEAR)
// set color to 0
   @color
   M=0

(CHECK_LOOP_CONDITION)
// if offset == screen_len, jmp to start
   @offset
   D=M
   
   @8192
   D=D-A
   
   @START
   D;JEQ

// *ptr = color
   @color
   D=M

   @ptr
   A=M
   M=D

// increment ptr and offset
   @offset
   M=M+1

   @ptr
   M=M+1

// go back to check loop condition
   @CHECK_LOOP_CONDITION
   0;JMP

