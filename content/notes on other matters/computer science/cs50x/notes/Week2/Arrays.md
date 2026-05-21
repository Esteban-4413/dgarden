---
fecha: 2026-02-24
tags:
  - programming
  - C
  - cs50
  - computer-science
---
# Arrays
---
## Debugging
- **Debugging** is the process of locating and removing bugs from your code.
- There existe multiple debugging techniques and of them is called **rubber duck debugging** which, practically consists on talking to an inanimate object (or yourself) to help think through the code and why it is not working as intended.
---
## Arrays
Each data type requires a certain amount of system resources:
- `bool` 1 byte
- `int` 4 bytes
- `long` 8 bytes
- `float` 4 bytes
- `double` 8 bytes
- `char` 1 byte
- `string` ? bytes

### Memory
- Inside of your computer, you have a **finite** amount of memory available.
	- ![[Pasted image 20260225170908.png]]
- Physically, on the memory of your computer, you can imagine how specific types of data are stored on you computer. You might imagine that a `char`, which only requires 1 byte of memory, may look as follows:
	- ![[Pasted image 20260225170923.png]]
	- Similarly, an `int`, which only requires 4 bytes, might look as follows:
		- ![[Pasted image 20260225171016.png]]
---
- The following program, in fact explores this concepts.
```c
// Averages three (hardcoded) numbers

#include <stdio.h>

int main(void)
{
    // Scores
    int score1 = 72;
    int score2 = 73;
    int score3 = 33;
    // Print average
    printf("Average: %f\n", (score1 + score2 + score3) / 3.0);
}
```
Notice that the number on the right is a floating point value of `3.0`, so that the calculation is rendered as a floating point value in the end.

You can imagine how these variables are stored in memory:
	![[Pasted image 20260225172029.png]]

Arrays are a sequence of values that are stored back-to-back in memory
	`int scores[3]` is a way of telling the compiler to provide you three back-to-back places in memory of size `int` to store three `scores`.

Considering the previous program, we can revise the code like this:
```c
// Averages three (hardcoded) numbers using an array

#include <cs50.h>
#include <stdio.h>

int main(void)
{
    // Scores
    int scores[3];
    scores[0] = 72;
    scores[1] = 73;
    scores[2] = 33;

    // Print average
    printf("Average: %f\n", (scores[0] + scores[1] + scores[2]) / 3.0);
}
```
Notice that `scores[0]` examines the value at this location of memory by `indexing into` the array called `scores` at location `0` to see what value is stored there.

While the code above works, there is still an opportunity for improving our code, Revise your code as follows:
```c
// Averages three numbers using an array and a loop

#include <cs50.h>
#include <stdio.h>

int main(void)
{
    // Get scores
    int scores[3];
    for (int i = 0; i < 3; i++)
    {
        scores[i] = get_int("Score: ");
    }

    // Print average
    printf("Average: %f\n", (scores[0] + scores[1] + scores[2]) / 3.0);
}
```
Notice how we index into `scores` by using `scores[i]` where `i` is supplied by the `for` loop.

We can simplify or _abstract away_ the calculation of the average. Modify your code as follows:

```c
// Averages three numbers using an array, a constant, and a helper function

#include <cs50.h>
#include <stdio.h>

// Constant
const int N = 3;

// Prototype
float average(int length, int array[]);

int main(void)
{
    // Get scores
    int scores[N];
    for (int i = 0; i < N; i++)
    {
        scores[i] = get_int("Score: ");
    }

    // Print average
    printf("Average: %f\n", average(N, scores));
}

float average(int length, int array[])
{
    // Calculate average
    int sum = 0;
    for (int i = 0; i < length; i++)
    {
        sum += array[i];
    }
    return sum / (float) length;
}
```

Notice that a new function called `average` is declared. Further, notice that a `const` or constant value of `N` is declared. Most importantly, notice how the `average` function takes `int array[]`, which means that the function can receive an array as a parameter.

Not only can arrays be containers: They can be passed between functions.

---
## Strings
- A `string` is simply an array of values of type `char`: an array of characters.
- To explore `char` and `string`, type `code hi.c` in the terminal window and write code as follows:
```c
// Prints chars

#include <stdio.h>

int main(void)
{
    char c1 = 'H';
    char c2 = 'I';
    char c3 = '!';

    printf("%c%c%c\n", c1, c2, c3);
}
```
Notice that this will output a string of characters.

- Similarly, make the following modification to your code:
```c
// Prints chars' ASCII codes

#include <stdio.h>

int main(void)
{
    char c1 = 'H';
    char c2 = 'I';
    char c3 = '!';

    printf("%i %i %i\n", c1, c2, c3);
}
```
Notice that ASCII codes are printed by replacing `%c` with `%i`.

- Considering the following image, you can see how a string is an array of characters that begins with the first character and ends with a special character called a `NUL character` (note: NUL with one L is the ‘\0’ character, different from NULL with two L’s):
	- ![[Pasted image 20260225173744.png]]
	- Imagining this in decimal, your array would look like the following:
		- ![[Pasted image 20260225173804.png]]
- We can imagine the above as follows:
```c
// Prints string

#include <cs50.h>
#include <stdio.h>

int main(void)
{
    string s = "HI!";
    printf("%s\n", s);
}
```
Notice that all characters are represented within a `string`.

- To further understand how a `string` works, revise your code as follows:
```c
// Treats string as array

#include <cs50.h>
#include <stdio.h>

int main(void)
{
    string s = "HI!";
    printf("%c%c%c\n", s[0], s[1], s[2]);
}
```
Notice how the `printf` statement presents three values from our array called `s`.

- As before, we can replace `%c` with `%i` as follows:
```c
// Prints string's ASCII codes, including NUL

#include <cs50.h>
#include <stdio.h>

int main(void)
{
    string s = "HI!";
    printf("%i %i %i %i\n", s[0], s[1], s[2], s[3]);
}
```
Notice that this prints the string’s ASCII codes, including NUL.

- Let’s imagine we want to say both `HI!` and `BYE!`. Modify your code as follows:
```c
// Multiple strings

#include <cs50.h>
#include <stdio.h>

int main(void)
{
    string s = "HI!";
    string t = "BYE!";

    printf("%s\n", s);
    printf("%s\n", t);
}
```
Notice that two strings are declared and used in this example.
- You can visualize this as follows:
	- ![[Pasted image 20260225174027.png]]
---
## String length
- We can explore the length of a string by writing `code length.c` and using the following code:
```c
// Calculates a string's length

#include <cs50.h>
#include <stdio.h>

int main(void)
{
    // Prompt for user's name
    string name = get_string("Name: ");

    // Count characters until NUL
    int n = 0;
    while (name[n] != '\0')
    {
        n++;
    }
    printf("%i\n", n);
}
```
Notice how the `while` loop continues to increment `n` until it encounters the `NUL` character (`\0`).
- This process of finding the length is so common that a library called `string.h` exists with a function called `strlen`. We can simplify our code:
```c
// Calculates a string's length using strlen

#include <cs50.h>
#include <stdio.h>
#include <string.h>

int main(void)
{
    string name = get_string("Name: ");
    int n = strlen(name);
    printf("%i\n", n);
}
```
Notice that we must `#include <string.h>` to access this function.

---

## Command-Line Arguments

- Up until now, we have been getting input inside our programs using `get_string` or `get_int`. However, we can also pass arguments to our program at the moment we run it in the terminal.

- To do this, we modify `int main(void)` to `int main(int argc, string argv[])`.
    - `argc` is the **argument count** (number of words typed).
    - `argv` is the **argument vector** (an array of the words themselves).
- Create `code greet.c` and try this:
```c
// Prints a command-line argument

#include <cs50.h>
#include <stdio.h>

int main(int argc, string argv[])
{
    if (argc == 2)
    {
        printf("hello, %s\n", argv[1]);
    }
    else
    {
        printf("hello, world\n");
    }
}
```
Notice that `argv[0]` is always the name of the program (e.g., `./greet`), so our first real argument is at `argv[1]`.
- We can also iterate through all arguments:
```c
// Printing command-line arguments

#include <stdio.h>

int main(int argc, string argv[])
{
    for (int i = 0; i < argc; i++)
    {
        printf("argv[%i] is %s\n", i, argv[i]);
    }
}
```

---

## Exit Status
- Every time a program finishes, it returns an **exit status**. Usually, this is `0`, which means "everything went fine."
- If something goes wrong, we can return a different integer to indicate an error.
```c
// Illustrating exit status

#include <cs50.h>
#include <stdio.h>

int main(int argc, string argv[])
{
    if (argc != 2)
    {
        printf("Missing command-line argument\n");
        return 1;
    }
    printf("hello, %s\n", argv[1]);
    return 0;
}
```
Notice that `return 1` signals to the computer that there was an error.

---

## Extra

###  Arrays & Strings: Deep Dive (Standard C)
Beyond simple lists, arrays in C are the gateway to understanding how computers organize contiguous data. In C, an array is not an "object"—it is a raw segment of memory.

####  Array Size & The `sizeof` Mechanic
In Standard C, the computer doesn't "remember" how big an array is once it's created. To find the length of an array, we use the `sizeof` operator, which returns the size in **bytes**.

```c
int myNumbers[] = {10, 20, 30, 40};
int byteSize = sizeof(myNumbers); // Returns 16 (4 integers * 4 bytes each)

// The Formula to find length:
int length = sizeof(myNumbers) / sizeof(myNumbers[0]);
printf("The array has %d elements.\n", length);
```

#### Multi-Dimensional Arrays (Matrices)
A multi-dimensional array is essentially an **array of arrays**. This is how we represent grids, coordinates, or mathematical matrices.
```c
// A 2x3 matrix (2 rows, 3 columns)
int matrix[2][3] = { {1, 4, 2}, {3, 6, 8} };

// Accessing the element in the second row, third column (8):
printf("%d", matrix[1][2]);

// Looping through a 2D array:
for (int i = 0; i < 2; i++) {
  for (int j = 0; j < 3; j++) {
    printf("%d\n", matrix[i][j]);
  }
}
```

#### Strings & Escape Sequences
In C, a string is a `char` array. The most important part is the hidden **Null Terminator** (`\0`), which tells functions like `printf` where to stop reading memory.
```c
char greetings[] = "Hello World!";
// Internally: ['H','e','l','l','o',' ','W','o','r','l','d','!','\0']

// Modifying a string:
greetings[0] = 'J'; // Changes "Hello" to "Jello"
```

> [!check]
> ### Essential Escape Characters
These allow us to insert non-printable or "forbidden" characters into strings:
>- `\n` : New Line
>- `\t` : Tab (indents text)
>- `\0` : Null Terminator (End of string)
>- `\"` : Inserts a double quote
>- `\\` : Inserts a backslash

#### The "Symbol Context" (The Polysemy of C)
C symbols change their meaning entirely based on **where** they are placed. This is often the most confusing part for beginners.

##### The Ampersand (`&`)
1. **In `scanf` or Expressions:** It means **"Address of"**.
    - `scanf("%d", &x);` -> "Find the memory address where `x` lives and put the input there."
2. **In Logic:** `&&` means **Logical AND**.

##### The Asterisk (`*`)
This is the most "context-heavy" symbol in the language:
1. **In Declarations:** It defines a **Pointer** type.
    - `int* ptr;` -> "I am creating a variable that stores a memory address of an integer."
2. **In Expressions (Dereferencing):** It means **"Go to the value at"**.
    - `printf("%d", *ptr);` -> "Go to the address stored in `ptr` and give me the value inside."
3. **In Math:** `x * y` means **Multiplication**.

##### The Brackets (`[]`)
1. **In Declarations:** Defines the **Size**.
    - `int scores[5];` -> "Reserve space for 5 integers."
2. **In Expressions:** **Indexing**.
    - `scores[2];` -> "Go to the 3rd spot in this block of memory.

#### Real-Life Application: Finding the Lowest Score
Arrays allow us to process large datasets efficiently.
```c
#include <stdio.h>

int main() {
  int ages[] = {20, 22, 18, 35, 48, 26, 87, 70};
  int length = sizeof(ages) / sizeof(ages[0]);

  // Initialize with the first element
  int lowestAge = ages[0];

  for (int i = 0; i < length; i++) {
    if (lowestAge > ages[i]) {
      lowestAge = ages[i];
    }
  }

  printf("The youngest person is %d years old.\n", lowestAge);
  return 0;
}
```

> [!important] There is no boundary checking. If you have an array of size 3 and you try to access `scores[10]`, the computer will simply go to that memory address and show you whatever "garbage" data is there (or crash). This is why C is both dangerous and incredibly fast.