---
topic: Representations of numbers
date: 2026-02-18
course: Sistemas de Computação
tags:
  - Universidade
  - sistemasDeComputação
  - representationOfNumbers
  - computation
---
# Chapter 3: Representation of numbers

## Key Concepts
### Positional numeral systems
-  A *numeral system* is a writing system for expressing numbers, that is, a notation for expressing numbers of a given set, using digits or other symbols.
- Computers use the binary numeral system.
- Humans use the decimal (Hindu-Arabic) numeral system.
- They both are *positional numeral systems*, which represent any number by a sequence of juxtaposed digits. This means that the value of each digit depends on it's position in the number.
	- Juxtaposed digits refer to placing digits side-by-side without an explicit operator, commonly representing multi-digit numbers (e.g., 2 and 5 becoming 25). In the Arabic numeral system, digits are placed together to represent tens, hundreds, etc. (e.g., the number "254" is a juxtaposition of 2, 5, and 4.
	- $4682 = 4 * 1000  + 6 * 100 + 8 * 10 + 2 * 1$
- Positional numeral systems can use any integer $r \geq 2$ for the base, and the digit in position $i$ has weight $r^i$
	-  $256_{6} = 5 * 6^0 + 3 *6^1+2*6^2$
- Digital devices adopt the binary base ($r = 2$), which uses two possible digits (0 and 1).
	- The general forma of a number B in such cases is
		- $B=b_{n-1}b_{n-2}\dots b_{1}b_{0}$
	- The value of this natural number is:
		- $B=\sum_{i=0}^{n-1}b_{i}*2^i$
- The *range* of these numbers is defined as the difference between the largest and the smallest representable number in a given numeral system.
	- A representation with $n$ bits ranges from 0 to $2^n-1$. With eight bits, this range goes from 0 to +255.
- The integer part of a number is separated from its fractional part  by a *radix point*
	- In the decimal system, the radix is called *decimal point*.
		- $468.51=4*1000+6*100+8*10+2*1+5*0.1+1*0.01$
	- Binary fractions have the *binary point*. But if the computer just sees 1's and 0's how does it know if the number has a binary point? That information has to be in the program that its been written that maybe is the reason for which in the programming language C you have to declared that a variable is a float.

## Before you go # 5
What is the most appropriate numeral system to represent money --plata--(Euros) in a computer?

For some reason I did not catch the answer is integer lol

## Related topics
- [[Essentials-of-computing-systems.pdf#page=36|Essentials-of-computing-systems, page 36]]
- [[SC-slidesEN-chap3-RepresentationNumbers.pdf#page=1|SC-slidesEN-chap3-RepresentationNumbers, page 1]]