---
topic: Representations of information
date: 2026-02-12
course: Sistemas de Computação
tags:
  - Universidade
  - sistemasDeComputação
  - representationOfInformation
  - computation
excalidraw-plugin: parsed
excalidraw-open-md: true
---
# Chapter 2: Representation of information 

## Key Concepts
### Machine-level instructions 
#### Format of instructions
- A computer program is a sequence of instructions
- At the machine-level, each instruction is represented by a bit pattern 
- The number of instructions in a program is finite 
- It consists of an opcode and some additional information, such as where operands come form and whre to store the results 
	- ![[Pasted image 20260212091003.png]]
		- IA32 example of machine-level instructions
- On some machines, all instructions have the same length; on others there may be many different lengths. 
- The opcode for each instructions type must be associated with a unique bit pattern, to identify univocally. 
- The instructions of MIPS processors all have 32 bits 
	- They are classified according to five different types (R, I, J, FR, FI). 
	- The R instructions have all the data values in registers
		- The syntax is: `OP rd, rs, rt`. Where OP is the mnemonic for the particulas instructions, rs and rt are the source registers, and rd is the destination register
		- The machine code for an R instruction has the following format 
			- ![[Pasted image 20260212092714.png]]
			- An example of an R instruction is: `add $t1, $t2, $t3`. Where $t1, $t2, $t3 are registers. The instruction adds the values of registers $t2 and $t3 and stores the result in register $t1. 
			- ![[Pasted image 20260212092916.png]]
				- The instructions represented by bit pattern
### Images 
#### Raster images 
- A digital image can be represented by a grid os small points. 
- A *raster image (bitmap image)* it is seen as an array of points. 
	- Each point is represented by a pixel (picture element) and is represented by a binary pattern.
	- ![[Pasted image 20260212093318.png]]
	- ![[Pasted image 20260212093331.png]]
	- To draw the picture, a grid must be defined and the squares coloured accordingly. 
#### Image resolution
- The image resolution is related to how close the pixels are. 
- It is usually measured in dots per inch (dpi), that is, the number of dots/pixels that can be placed in a line within the span of 1 inch (2.54 cm).

### Audio
- To process sound, computers need to convert it into a digital format. 
- Sound is recorded using a microphone that translates sound waves into an electrical signal. 
	- Firstly, sound is recorded using a device, like a microphone, that translates sound waves into an electrical signal
		- ![[Pasted image 20260212094039.png]]
	-  Then, periodic measurements of the level of that signal are registered. 
		- ![[Pasted image 20260212094126.png]]
		- *Sampling* is the process that reduces a continuous-time signal to a discrete-time signal. 
			- ![[Pasted image 20260212094611.png]]
			- *Sample* is the value (or set of values) at a point in time. 
			- The *sample resolution* is the number of bits used to represent the value of each sample. 
			- The *sampling rate* is the number of samples taken per second, measured in Hertz (Hz). The higher the sampling rate, the better the quality of the audio digital signal, because, if there are more samples, the original sound can be represented more accurately. 
	- The samples are then simply converted into binary, using a unique binary code. 
	- Afterwards, the digital sound can be processed by a computer as a sequence of bits.

## Before you go #4

Um caracol está no fundo de um poço com 10 metros de profundidade, Durante o dia, ele sobe 3 metros, mas à noite, enquanto dorme, escorrega 2 metros. 
Quantos dias levará o caracol a sair do poço? 

7 dias e um bocado...?

## Links 
- [[chapter2.pdf]]
- [[Essentials-of-computing-systems.pdf#page=25|Essentials-of-computing-systems, page 25]]
