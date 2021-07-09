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


//1. Infinite Loop
//2. Check if keyboard is pressed
//3. draw black pixels on screen.
//4. Keyboard release remove drawing.





(LOOP)

@SCREEN
D=A
@0
M=D

/////////////////////////
(CHECK)
@KBD
D=M

@BLACK
D;JGT
@WHITE
D;JEQ

@CHECK
0;JMP
////////////////////////
(BLACK)
@1
M=-1
@CHANGE
0;JMP

///////////////////////
(WHITE)
@1
M=0
@CHANGE
0;JMP



////////////////////
(CHANGE)
@1
D=M

@0
A=M //SETS ADDRESS of Reg0 to M or Memory
M=D //SET Reg0 Memory into a color

@0
D=M+1 //Inc to next pixel

@KBD
D=A-D //New RegD = Address - NEXT PIXEL

@0
M=M+1
A=M

@CHANGE
D;JGT


@LOOP
0;JMP





