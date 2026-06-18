---
topic: Representations of numbers
date: 2026-02-25
course: Sistemas de Computação
tags:
  - Universidade
  - computer-science
  - computer-science
  - computer-science/sistemasDeComputação/representationOfNumbers
---
# sc lecture 7

## Key Concepts
### Conversion between different bases
#### Algorithm 1
Calculation of the decimal value of a number in a given base

![[Pasted image 20260225114642.png]]

### Negative numbers 
- Representing signed numbers, together with positive ones, requires additional issues to be addressed, namely the inclusion of **sign bits**. 
- There are many ways to represent negative numbers and we are going to discuss the next four: 
	- sign-magnitude
	- one's-complement, two's-complement
	- excess representations

### Sign-magnitude
- The most intuitive method which uses: 
	- the MSB for the sign bit
	- the remaining bits for the magnitude of the number (its absolute value aka modulus)
- By conventions, a '1' in the sign bit indicates a negative number, whereas a '0' indicates a positive number (or zero)
- In an 8-bit representation, two symmetrical values just differ in the sign bit.
	- $+120_{10}=01111000_{2}$
	- $-120_{10}=11111000_{2}$
- It is mandatory to know how many bits are used to represent the numbers because, for example, $1100_{2}$ is negative if four bits are used, but positive if instead the numbers are represented with six bits. In this case, extra 0s can be added to the left part of the number ($001100_{2}$).
- A disadvantage of this method rests on the existence of ambiguity. The existence of two possible representations of zero ("$+0$" and "$-0$"). 
- The sign-magnitude contains the same number of positive and negative numbers.
- A sign-magnitude integer represention with $n$ bits ranges from $-(2^{n-1}-1)$ to $+(2^{n-1}-1)$.  With eight bits, this range goes from $-127$ to $+127$. 
- Calculations are performed basically with the same method as humans use with pencil and paper.
	1. If the sign are the same, add the magnitudes and use that same sign for the result;
	2. If the signs differs, determine which operand has the larger magnitude. The sign of the result is the same as the sign of the operand with the larger magnitude, and the magnitude by subtracting the smaller one from the larger one.

## Links
- [[chapter3.pdf]]
- [[Essentials-of-computing-systems.pdf]]
- [[sc lecture 6]]
- [[sc lecture 5]]
- [[sc lecture 4]]
