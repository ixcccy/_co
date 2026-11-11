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
(LOOP)
    @KBD
    D=M
    @SET_BLACK
    D;JNE
    D=0
    @SET_COLOR
    0;JMP
(SET_BLACK)
    D=-1
(SET_COLOR)
    @color
    M=D
    @SCREEN
    D=A
    @address
    M=D
(FILL_LOOP)
    @address
    D=M
    @KBD
    D=D-A
    @LOOP
    D;JEQ
    @color
    D=M
    @address
    A=M
    M=D
    @address
    M=M+1
    @FILL_LOOP
    0;JMP
