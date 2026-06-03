## What is a translator?
Translators are the programs that convert a user's program written in some language to another language. The language in which the original program is written is called the source language and the language to which it is converted is called the target language. 

Some key ideas are:
- Translation is used when a processor (either hardware or an interpreter) is available for the target language but no for the source language. 
- The difference between translation and interpretation: 
	- In translation, the original program in the source language is not directly executed. Instead, it is converted to an equivalent program called an object program or executable binary program whose execution is carried out only after the translation has been completed. The are two steps to this:
		- Generation of an equivalent program in the target language.
		- Execution of the newly generated program.
	- In interpretation, there is only one step: executing the original source program. No equivalent program need be generated first.

## So what is assembly?
When the source language is essentially a symbolic representation for a numerical machine language, the translator is called an assembler and the source language is called an assembly language. When the source language is a high-level language such as Java or C and the target language is either a numerical machine language or a symbolic representation for one, the translator is called compiler.

A pure assembly language is a language in which each statement produces exactly one machine instruction.


```s
.global _start
.intel_syntax noprefix

_start:
        ; sys_write
        mov rax, 1
        mov rdi, 1 
        lea rsi, [hello_catalina]
        mov rdx, 13 
        syscall
        
        ; sys_exit
        mov rax, 60
	    mov rdi, 0
        syscall
        
hello_catalina:
		.asciz "Hello world!\n"
        
```
