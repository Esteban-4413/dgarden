---
topic: Representation of numbers
date: 2026-02-26
course: Sistemas de Computação
tags:
  - Universidade
---
# sc lecture 8

## Key Concepts
### One's-complement 
- Complement numeral systems were created to make additions faster and easier. 
- One decimal number can be subtracted from another by adding the difference of the subtrahend from all nines and adding back a carry. This is called taking the nine's-complement of the subtrahend, or more precisely, finding the diminished radix complement of the subtrahend. 
- The one's-complements of binary numbers are computed the same way as for natural numbers, except that the weight of the MSB is $-2^{n-1}+1$ instead of $+2^{n-1}$.
- For a binary number, its one's-complement is obtained by subtracting from all ones. For example, the one's-complement of $0101_{2}$ is $1111-0101 = 1010_{2}$.
- Complement notation provides a method to represent negative numbers. The idea is that a negative number needs to be converted to its complement, which should have a '1' in the MSB. Positive numbers, which have a '0' in the MSB are used as is, i.e., they are not converted to their complements. 
	- ![[Pasted image 20260226091847.png]]
	- ![[Pasted image 20260226091858.png]]
		- To subtract $10$ from $24$, one needs first to express the subtrahend $(10)$ in one’s-complement and then add it to the minuend $(24)$. This effectively adds $-10$ to $24$. The MSB will have a '$0$' or a '$1$' carry, which needs to be added to the LSB of the sum. This operation is designated end carry-around and results from the use of the diminished radix complement, in this case the one’s-complement. 

### Two's-complement 
- Given a numeric value $V$ in base $r$ having $n$ digits, the radix complement of $V$ is defined to be $r^n-V$ for $V\neq 0$. With three decimal digits, the ten's-complement of 43 is 957 $(10^3-43)$.
- The decimal value for a two's-complement number is computed the same way as for a natural number, except that the weight of the MSB is $-2^{n-1}$ instead of $+2^{n-1}$.
- Two's-complement number are added and subtracted by the same methods as unsigned numbers with the same number of bits, so the same hardware can handle numbers in both
- Its biggest drawback is the assymmetry in the range of values that can be represented. 

### Excess representations 
- In a excess-b representation, an n-bit pattern, whose unsigned integer value is $V$ $(0\leq V\leq{2}^n)$ represents the signed integer $V-b$, where b is the bias (or offset) of the natural system.
- The representable numeric values range from from $-b$ to $2^n-1-b$. 
- The main advantage lies in the fact that the all-zero pattern corresponds to the minimal negative value and the all-one pattern to the maximal positive value.
- It also permits to represent unbalanced sets of consecutuve negative and positive numbers (e.g., from -10 to +245)
- From a mathematical point of view, the representation of natural numbers is an excess-0 representation.
- ![[Pasted image 20260226094020.png]]
### Before yo go #5 
Quais são as melhores afirmações erradas que consegues verbalizar para as matérias abordadas hoje?

## Links 
- [[]]