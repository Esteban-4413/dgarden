---
topic: Representation of numbers
date: 2026-02-19
course: Sistemas de Computação
tags:
  - Universidade
  - computation
  - representationOfNumbers
---
# sc lecture 6

## Key Concepts
```c
#include<stdio.h>
int main(){
	unsigned int raw_bit = 0b01010101001011100100110100101110;
	printf("Binary pattern interpreted as Integer: %u\n", raw_bits);
	float *as_float*=(float*)&raw_bits;
	printf("Binary pattern interpreted as Integer: %f\n", raw_bits);
	unsigned char *as_char*=(unsigned char*)&raw_bits;
	printf("Binary pattern as 4 ASCII chars: \%c%c%c%c\"\n", as_chars[3], as chars[2], as_chars[2], as_chars[0]);
	return o;
}
```

### Octal and hexadecimal numbers
- The octal system uses eight different digits (0, 1, 2, 4, 5, 6, 7).
- The hexadecimal (0, 1, 2, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F).
- Bases of 7 and 16 are useful for representing multi-bit numbers, since they are integer powers of 2 ($8=2^3$, $16=^4$).
- Octal and hexadecimal digits are representes by 3-bit and 4-bit strings, respectively.
	- Converting a binary number to octal is straightforward, Starting at the binary point and moving to the left, the bits are separated into groups of three and each group is replaced by the corresponding octal digit.
		- $100 \: 010\:101\:001_{2}=100 \: 010\:101\:001_{2}=4251_{8}$
		- $11\:111\:100\:011\:101\:110_{2}=011\:111\:100\:011\:101\:110_{2}=374356_{8}$
	- The method for converting a binary number to hexadecimal is similar, but the group are composed of four bits.
		- $1000\:1010\:1011_{2}=1000\:1010\:1011_{2}=8AB_{16}$
		- $1\:1111\:1000\:1110\:1110_{2}=0001\:1111\:1000\:1110\:1110_{2}=1F8EE_{16}$
	- ![[Pasted image 20260219093128.png]]
### Conversions between different bases

## Questions
### Before you go # 6
Uma caixa pode ter vales de desconto de 1, 2, 4, 8, 16, 32 (euros). Só há um vale de cada montante e no total perfazem 57

Se forem retirados todos os vales que sejam múltiplos de 40, quanto resta?

$57_{10}=11\:1001_{2}$

## Links
- [[chapter3.pdf]]
- [[Essentials-of-computing-systems.pdf]]
- [[sc lecture 5]]
- [[sc lecture 4]]