---
tags:
  - programming/c
  - cs50
  - fundamentals
  - computation
  - C
  - programming
  - computer-science
---

# CS50x Lecture 1: C - The Mother Tongue

> "What is ultimately important is the gains you experience over these coming weeks and months through your hard work." — David J. Malan

---

## From Scratch to Source Code
In Scratch, we used blocks. In **C**, we use **Source Code** (human-readable text). However, computers only understand **Machine Code** (binary).

### The Translation Process
To bridge this gap, we use a **Compiler**: a special software that converts our source code into executable binary.

![[Pasted image 20260222103609.png]]

- **Source Code:** `hello.c`
- **Compiler:** `make`
- **Machine Code:** `hello` (the executable file)

---

## The CLI (Command Line Interface)
Working in C means leaving the GUI (buttons and menus) and mastering the **Terminal**.

**Essential Linux Commands**

| Command       | Action                                       |
| :------------ | :------------------------------------------- |
| `ls`          | **List** files in the current folder.        |
| `cd`          | **Change Directory** (move between folders). |
| `mkdir`       | **Make Directory** (create a folder).        |
| `cp`          | **Copy** files.                              |
| `mv`          | **Move** or Rename files.                    |
| `rm`          | **Remove** (Delete) files.                   |
| `make [file]` | **Compile** your code into a program.        |

---
## Hello World & Syntax Basics
Every character in C has a purpose. A simple "Hello World" looks like this:

```c
#include <stdio.h>

int main(void)
{
    printf("hello, world\n");
}
```
Note that every single character above serves a purpose. If you type it incorrectly, the program will not run. `printf` is a function that can output a line of text. Notice the placement of the quotes and the semicolon. Further, notice that the `\n` creates a new line after the words `hello, world`.

**Key Syntax Rules:**
- `#include <stdio.h>`: Imports the **Standard Input/Output** library (needed for `printf`).
- `int main(void)`: The entry point of every C program.
- `\n`: An **escape character** for a new line.
- `;`: The "period" at the end of a statement. Missing this is the most common error!

--- 
## Types & Format Codes

C is a **strongly typed** language. You must tell the computer exactly what kind of data you are storing.

### Data Types:
- `int`: Integers (whole numbers).
- `long`: Larger integers.
- `float`: Floating-point numbers (decimals).
- `char`: A single character (uses single quotes: `'a'`).
- `string`: A sequence of characters (uses double quotes: `"abc"`).
- `bool`: True or False.

### Format Codes (Placeholders):
To print variables, we use placeholders in `printf`:
- `%i`: Integer
- `%li`: Long
- `%f`: Float
- `%s`: String
- `%c`: Character

There are other **escape characters** you can use:
```
\n  create a new line
\r  return to the start of a line
\"  print a double quote
\'  print a single quote
\\  print a backslash
```

---
## Conditionals & Variables

Conditionals allow the program to make decisions based on logic.

**Variables & Operations**
```c
int counter = 0;  // Initialization
counter = counter + 1; // Basic math
counter++; // Syntactic sugar for adding 1
```

**Logic in Action:**
```c
if (x < y)
{
    printf("x is less than y\n");
}
else if (x > y)
{
    printf("x is greater than y\n");
}
else
{
    printf("x is equal to y\n");
}
```
Note: Use `==` for comparison and `=` for assignment.

---
## Loops (Repetition)

Loops prevent us from repeating code manually.
- **While Loop:** Runs as long as a condition is true.
- **For Loop:** Best for running a fixed number of times.
- **Do-While Loop:** Guaranteed to run **at least once** before checking the condition.

```c
// A classic for loop (counting from 0 to 2)
for (int i = 0; i < 3; i++)
{
    printf("meow\n");
}
```

---
## Abstraction & Functions

We can create our own functions to make our code cleaner. This is called **Abstraction**.

### The Anatomy of a Function:

1. **Prototype:** Declared at the top so `main` knows it exists.
2. **Call:** Used inside `main`.
3. **Definition:** The actual logic at the bottom of the file.

```c
#include <stdio.h>

void meow(int n); // Prototype

int main(void)
{
    meow(3); // Call
}

void meow(int n) // Definition
{
    for (int i = 0; i < n; i++)
    {
        printf("meow\n");
    }
}
```

When working with variables and functions, it’s important to understand the _scope_ of a variable. Consider the following code:
```c
// Demonstrates scope

#include <stdio.h>

void meow(int n);

int main(void)
{
    int n = 3;
    meow(n);
}

// Meow some number of times
void meow(int n)
{
    for (int i = 0; i < n; i++)
    {
        printf("meow\n");
    }
}
```

### Correctness, Design, Style
- Code can be evaluated upon three axes.
- First, _correctness_ refers to "Does the code run as intended?" 
- Second, _design_ refers to "How well is the code designed?" 
- Finally, _style_ refers to "How aesthetically pleasing and consistent is the code?" 

---
## Operators
- _Operators_ refer to the mathematical operations that are supported by your compiler. In C, these mathematical operators include:
    - `+` for addition
    - `-` for subtraction
    - `*` for multiplication
    - `/` for division
    - `%` for remainder

--- 
## Precision & Overflow
One of C’s challenges is that while it provides you immense control over how memory is utilized, programmers have to be very aware of the potential pitfalls of memory management.

Computers have finite memory, which leads to two major issues:

### 1. Integer Overflow
Integer overflow is when a calculation produces a value that exceeds the maximum storage capacity of the data type, causing the value to wrap around unpredictably.

An `int` typically uses 32 bits. The maximum value is 231−1 (approx. 2 billion). If you add 1 to this, it wraps around to a negative number. _Solution: Use a `long` (64 bits)._

### 2. Floating-Point Imprecision
Computers can't represent every decimal perfectly in binary. Dividing `1.0 / 10.0` might result in `0.10000000149...` _Takeaway: Be careful with financial calculations using floats!_

Types refer to the possible data that can be stored in a variable. For example, a `char` is designed to accommodate a single character like `a` or `2`.

Types are very important because each type has specific limits. For example, because of the limits in memory, the highest value of a signed `int` is typically `2147483647`, while an unsigned `int` can reach `4294967295`. If you attempt to count an `int` higher than its maximum, an _integer overflow_ will result where an incorrect value will be stored in this variable. **The number of bits determines the range of values we can represent.**