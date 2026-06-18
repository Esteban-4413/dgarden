---
topic: Computer Systems
date: 2026-02-11
course: Sistemas de Computação
tags:
  - Universidade
  - computer-science/sistemasDeComputação
  - computer-science
excalidraw-plugin: parsed
excalidraw-open-md: true
---
# 1. Computer systems 

## 1.1 Levels of a computer 

### Key ideas 

- A computer is a programmable device that can automatically execute a sequence of instructions on data once programmed for the task. It can store, retrieve, and process data according to the instructions.
- The sequence of instructions that describes the task performed is the program. 
- A devices is considered as a computer if it has both of the following characteristics, and it is a calculator if it lacks either or both: 
	- *Data-dependent instruction sequence*. A computer must include conditional branch constructors (IF-THEN-ELSE, switch, while), whose execution depends on values that can only be calculated during the program execution 
	- *Data-dependent data selection*. A computer must be able to use data to determine the actual data to be used in calculations. 
- In general, a computer can be seen as a set of layers or levels
	- ![[Pasted image 20260211195632.png]]

## 1.2 Organization of a computer 

### Key ideas 

- Almost all uniprocessor (or scalar) computers follow the so-called *von Neumann architecture*
- This architecture includes a CPU, the main memory, and some input/output devices. 
- The existence of two separate components, one for processing the data and a different one to store them, is a distinguished characteristic of this architecture 
	- ![[Pasted image 20260211200302.png]]
	- ![[Pasted image 20260211200318.png]]
		- The system bus has three main elements: data bus, address bus, and control bus. 
		- The data bus moves data from main memory to the CPU registers (and vice versa).
		- The address bus holds the address of the data that the data bus is currently accessing. 
		- The control bus carries the necessary control signals that specify how the information transfer is to take place.
### 1.2.1 Central processing unit 

#### Key ideas 

- The CPU, also called processor, is the "brain" of the computer. It is responsible for the execution of the program, stored as a sequence of machine language instructions in the main memory. [[Putting the "You" in CPU]] 
- Each instruction direct the CPU to perform some basic task, like subtracting two numbers, or moving data from one register to another one.
- The CPU does all mechanically, without understanding what is the purpose for executing the instruction, which means that the program must be complete and have no errors, since the CPU can only execute it.
- The CPU is composed of three major components: 
	- Control unit
	- ALU
	- Registers
- The components are connected by a bus, which is a collection of electric wires for conducting address, data, and control signals. 
- Buses allow the parallel movement of bits. 
- A register is used to store temporary results and status information. 
	- All the register have usually the same size, that is, an equal number of bits
	- A relevant register is the *instruction pointer (IP)*, also known as, *program counter (CP)* and indicates the address of the next instruction to be executed
	- Another important register is the *instruction register (IR)*, which stores the instruction, codified according to the machine convention, currently being executed.
- The *arithmetic logic unit (ALU)* performs basic operations such as additions, subtractions, and comparisons, which are necessary to execute the instructions. Usually has two data inputs and one data output. 
- The *control unit* is responsible for orchestrating the components of the computer to ensure that the instruction that is being executed in each moment produces its exact and expected effects. 
- The execution of an instruction by the CPU can be divided into the following steps (the fetch-decode-execute cycle): 
	- Fetch the instruction from memory and store it into the IR (instruction register).
	- Determine the type of instruction. 
	- If a word in memory is used by the instruction, determine its location.
	- If needed, transfer the word from memory into a CPU register. 
	- Produce the effects of the instruction, i.e, perform some simple operation dictated by the instruction.
	- Change the IP to refer to the next instruction. 
- The CPU receives an instruction from the memory, decodes it, and executes it using data obtained from the memory or already available in the registers. Once the processor finishes the execution of an instruction, it starts the cycle again for the next instruction in the memory, except when a branch instruction was just executed. 
- Most computers have a clock signal that acts like a heartbeat
	- he clock signals the passage of time within the computer. A clock emits periodically a pulse, i.e., it transmits a precise pulse with regular intervals of high and low values. 
	- The time between two consecutive ticks is called a clock cycle (or clock period), which represents one discrete time unit.
### 1.2.2 Main memory 

- The main memory is a component of the computers, where programs and dat are both stored. A memory consists of a number of cells or locations, each of which can store a piece of information. 
- Each cell has a number, called its address, by which programs can refer to it. A memory with n cells uses addresses from 0 to n-1. All memory cells have the same number of bits.
- The main memory is a *random access memory (RAM)*, which stores a piece of data at a unique address and can recall the data upon presentation of the complete unique address. 
- The addresses of these instructions and data need not be somehow related in a discernible way. In fact, RAM is able to handle random, or more precisely arbitrary, access, that is, any datum can be retrieved as quickly as any other, without favoring any particular location. 
- RAM memories are volatile, which means that the information disappears if the supply voltage is turned off.
- Physically, the main memory consists of a collection of *dynamic random access memory (DRAM)* chips.
- The *cell* is the smallest addressable unit. Almost all modern computers use 8-bit (1 byte) cells. Bytes are grouped into words. 
- 
  > A computer with a 32-bit word has four bytes/word, while a computer with a 64-bit word has eight bytes/word. 
  
- If the low order byte of a multibyte value is put first in memory (i.e., has the lowest address), *little endian* is the adopted alternative. Otherwise, if the high order bytes come first, *big endian* is the selected order. 