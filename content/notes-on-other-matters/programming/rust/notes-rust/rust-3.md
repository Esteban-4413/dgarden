# Common programming concepts 

## Variables and mutability
By default variables are immutable in Rust. However, you still have the option to make them mutable. 
When a variable is immutable, once a value is bound to a name, you can't change that value.
So, for example the following code will generate a error message regarding an immutability error.

```Rust
fn main(){
	let x = 5;
	println!("The value of x is: {x}");
	x = 6;
	println!("The value of x is: {x}");
}
```

Output:
```Bash
$ cargo run
   Compiling variables v0.1.0 (file:///projects/variables)
error[E0384]: cannot assign twice to immutable variable `x`
 --> src/main.rs:4:5
  |
2 |     let x = 5;
  |         - first assignment to `x`
3 |     println!("The value of x is: {x}");
4 |     x = 6;
  |     ^^^^^ cannot assign twice to immutable variable
  |
help: consider making this binding mutable
  |
2 |     let mut x = 5;
  |         +++

For more information about this error, try `rustc --explain E0384`.
error: could not compile `variables` (bin "variables") due to 1 previous error
```

Although variables are immutable by default, you can make them mutable by adding `mut` in front of the variable name.
```Rust
fn main() {
    let mut x = 5;
    println!("The value of x is: {x}");
    x = 6;
    println!("The value of x is: {x}");
}
```

## Declaring constants
Like immutable variables, constants are values that are bound to a name and are not allowed to change, but there are a few differences between constants and variables.

- You declare constants using the `const` keyword.
- You are not allowed to use `mut` with constants because the are always immutable
- Constants can be declared in any scope, including the global scope.
- Constants may be set only to a constant expression, not the result of a value that could only be computed at runtime. 

## Shadowing
This is when you declare a new variable with the same name as a previous variable. The first variable is shadowed by the second, which means that the second variable is what the compiler will see when you use the name of the variable. We can shadow a variable by using the same variable's name and repeating the use of the `let` keyword as follows:
```Rust
fn main(){
	let x = 5;
	let x = x + 1;
	{
		let x = x * 2;
		println!("The value of x in the inner scope is: {x}");
	}
	println!("The value of x is: {x}");
}
```

Output:
```Bash
$ cargo run
   Compiling variables v0.1.0 (file:///projects/variables)
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.31s
     Running `target/debug/variables`
The value of x in the inner scope is: 12
The value of x is: 6
```

Shadowing is different from marking a variable as `mut` because we'll get a compile-time error if try to reassign to this variable without using the `let` keyword. 

Note that because we are effectively creating a new variable when use the `let` keyword again, we can change the type of the value but reuse the same name.
```Rust
let spaces = "   ";
let spaces = spaces.len();
```

The first `spaces` variable is a string type, and the second `spaces` variable is a number type. However, if we try to use `mut` for this, as shown here, we'll get a compile-time error:
```Rust 
let mut spaces = "   ";
spaces = spaces.len();
```

Output:
```Bash
$ cargo run
   Compiling variables v0.1.0 (file:///projects/variables)
error[E0308]: mismatched types
 --> src/main.rs:3:14
  |
2 |     let mut spaces = "   ";
  |                      ----- expected due to this value
3 |     spaces = spaces.len();
  |              ^^^^^^^^^^^^ expected `&str`, found `usize`

For more information about this error, try `rustc --explain E0308`.
error: could not compile `variables` (bin "variables") due to 1 previous error
```

## Data types
Rust is a *statically typed language*, which means that it must know the types of all variables at compile time. The compiler can usually infer what type we want to use based on the value and how we use it. In cases when many types are possible we must add a type annotation like this:
```Rust
let guess: u32 = "42".parse().expect("Not a number!");
```

>[!INFO] The `parse()` method converts the string to a number and expect() helps us handling error situations in case the string can not be converted to a number.

If we don't add the `: u32` type annotation shown in the preceding code, Rust will display the following error, which means the compiler needs more information from us to know which type we want to use:
```bash
$ cargo build
   Compiling no_type_annotations v0.1.0 (file:///projects/no_type_annotations)
error[E0284]: type annotations needed
 --> src/main.rs:2:9
  |
2 |     let guess = "42".parse().expect("Not a number!");
  |         ^^^^^        ----- type must be known at this point
  |
  = note: cannot satisfy `<_ as FromStr>::Err == _`
help: consider giving `guess` an explicit type
  |
2 |     let guess: /* Type */ = "42".parse().expect("Not a number!");
  |              ++++++++++++

For more information about this error, try `rustc --explain E0284`.
error: could not compile `no_type_annotations` (bin "no_type_annotations") due to 1 previous error
```

### Scalar type
A *scalar type* represents a single value. Rust has four primary scalar types:
- Integers
- Floating-point numbers
- Booleans
- Character

#### Integer types
An *integer* is a number without a fractional component.

| Length                  | Signed  | Unsigned |
| ----------------------- | ------- | -------- |
| 8-bit                   | `i8`    | `u8`     |
| 16-bit                  | `i16`   | `u16`    |
| 32-bit                  | `i32`   | `u32`    |
| 64-bit                  | `i64`   | `u64`    |
| 128-bit                 | `i128`  | `u128`   |
| Architechture-dependent | `isize` | `usize`  |

Each variant can be either signed or unsigned and has an explicit size. *Signed* and *unsigned* refer to whether the number needs to have a sign with it (signed) or whether it will only ever be positive and can therefore be represented without a sign (unsigned). Signed numbers are used using *two's complement* representation.

> [!INFO] Each signed variant can store from $-(2^{n-1})$ to $2^{n - 1}-1$, where $n$ is the number of bits that variant uses. Unsigned variants can store numbers from $0$ to $2^n - 1$
> Additionally, the `isize` and `usize` types depend on the architecture of the computer the program is running on.


You can write integer literals in any of the forms that are shown in the following table:

| Number literals  | Example       |
| ---------------- | ------------- |
| Decimal          | `98_222`      |
| Hex              | `0xff`        |
| Octal            | `0o77`        |
| Binary           | `0b1111_0000` |
| Byte (`u8` only) | `b'A'`        |

Note that number literals that can be multiple numeric types allow a type suffix such as `57u8`, to designate the type. Number literals can also use `_` as a visual separator to make the number easier to read, such as `1_000`, which will have the same value as if had specified `1000`.

#### Floating-point types
Rust has two primitive types for *floating-point numbers*, which are numbers with decimal points. Rust’s floating-point types are `f32` and `f64`, which are 32 bits and 64 bits in size, respectively. 

##### Numeric operations
Rust supports the basic mathematical operations you’d expect for all the number types: addition, subtraction, multiplication, division, and remainder. Integer division truncates toward zero to the nearest integer.
```Rust 
fn main() {
    // addition
    let sum = 5 + 10;

    // subtraction
    let difference = 95.5 - 4.3;

    // multiplication
    let product = 4 * 30;

    // division
    let quotient = 56.7 / 32.2;
    let truncated = -5 / 3; // Results in -1

    // remainder
    let remainder = 43 % 5;
}
```

#### The boolean type 
A boolean type in Rust has two possible value: `true` and `false`. Booleans are one byte in size.
```Rust
fn main() {
    let t = true;

    let f: bool = false; // with explicit type annotation
}
```
The main way to use Boolean values is through conditionals, such as an `if` expression. 

#### The character type
Rust's `char` type is the language's most primitive alphabetic type.
```Rust
fn main() {
    let c = 'z';
    let z: char = 'ℤ'; // with explicit type annotation
    let heart_eyed_cat = '😻';
}
```

We specify `char` literals with single quotation marks, as opposed to string literals, which use double quotation marks. Rust's `char` type is 4 bytes in size and represents a Unicode scalar value, which means it can represent a lot more than just ASCII. It can represent:
- Accented letters
- Chinese, Japanese, and Korean characters
- Emojis
- Zero-width spaces

### Compound types
These can group multiple values into one type. Rust has two primitive compound types:
- Tuples
- Arrays

#### Tuples
A *tuple* is a general way of grouping together a number of values with a variety of types into one compound type. Tuples have a fixed length: once declared, they cannot grow or shrink in size. 

We crete a tuple by writing a comma-separated list of values inside parentheses. 
For example:
```Rust 
fn main() {
	let tup: (i32, f64, u8) = (500, 6.4, 1);
}
```

```Rust
fn main(){
	let tup = (500, 6.4, 1);
	let (x, y, z) = tup;
	println!("The value of y is: {y}");
}
```

Output:
```Bash
The value of y is: 6.4
```

This program creates a tuple and binds it to the variable `tup`. It then uses a pattern with `let` to take `tup` and turn it into three separate variables, `x`, `y`, `z`. This is called *destructuring* because it breaks the single tuple into three parts. Finally the program, prints the value of `y`, which is `6.4`.

We can also access a tuple directly by using a period (`.`) followed by the index of the value we want to access.
```Rust
fn main() {
	let x : (i32, f64, u8) = (500, 6.4, 1);
	let five_hundred = x.0;
	let six_point_four = x.1;
	let one = x.2;
}
```

The tuple without any values has a especial name, *unit*. This value and its corresponding type are both are both written `()` and represent an empty value or an empty return type.

Additionally, we can modify individual elements of a mutable tuple.
```Rust
fn main() {
	let mut x : (i32, i32) = (1, 2);
	x.0 = 0;
	x.1 +=5;
}
```

#### Arrays
Unlike the tuple, every element of an array must have the same type. Arrays have a fixed length. 

Arrays are written as a comma-separated list inside square brackets. Like this:
```Rust
fn main() {
    let a = [1, 2, 3, 4, 5];
}
```

>[!INFO] Arrays content are allocated on the stack so it's not as flexible as the vector type which is a similar collection type provided by the standard library that is allowed to grow or shrink in size because its contents live on the heap.

You write an array's type using square brackets with the type of each element, a semicolon, and then the number of elements in the array.
```Rust
let a : [132; 5] = [1, 2, 3, 4, 5]
```
You can also initialize an array to contain the same value for each element by specifying the initial vale, followed by a semicolon, and then the length of the array in square brackets.
```Rust
let a = [3; 5];
```

##### Array element access
You can access elements of an array using indexing. 
```Rust
fn main() {
	let a = [1, 2, 3, 4, 5];
	let first = a[0];
	let second = a[1];
}
```

## Functions
We define a function by using the `fn` keyword followed by a function name and a set of parentheses. The curly brackets tell the compiler where the function body begins and ends. Rust also doesn't care where you define your functions, only that they're defined somewhere in a scope that can be seen by the caller.

### Parameters (also called arguments)
We can define functions to have parameters, which are special variables that are part of a function's signature. In function signatures, you must declare the type of each parameter. 
```Rust
fn main() {
    another_function(5);
}

fn another_function(x: i32) {
    println!("The value of x is: {x}");
}
```

### Statements and expressions
A function body is made up of a series of statements optionally ending in an expression.

- Statements are instructions that perform some action and do not return a value.
- Expressions evaluate to a result value.

Expressions do not include ending semicolons. If you add a semicolon to the end of an expression, you turn it into a statement, and it will then not return a value.

### Functions with return values
Functions can return values to the code that calls them. We don’t name return values, but we must declare their type after an arrow (`->`). In Rust, the return value of the function is synonymous with the value of the final expression in the block of the body of a function. You can return early from a function by using the return keyword and specifying a value, but most functions `return` the last expression implicitly.
```Rust
fn five() -> i32 {
    5
}

fn main() {
    let x = five();

    println!("The value of x is: {x}");
}
```

## Comments 
In Rust, he idiomatic comment style starts a comment with two slashes, and the comment continues until the end of the line. For comments that extend beyond a single line, you’ll need to include `//` on each line, like this:
```Rust
// So we're doing something complicated here, long enough that we need
// multiple lines of comments to do it! Whew! Hopefully, this comment will
// explain what's going on.
```

Or you can use the multiline comment syntax with `/*` and `*/`:
```Rust
/* So we’re doing something complicated here, long enough that we need
   multiple lines of comments to do it! Whew! Hopefully, this comment will
   explain what’s going on. */
```

## Control flow 

### If expressions 
An `if` expression allows you to branch your code depending on conditions. You provide a condition and then state, “If this condition is met, run this block of code. If the condition is not met, do not run this block of code.”
```Rust
fn main() {
    let number = 3;

    if number < 5 {
        println!("condition was true");
    } else {
        println!("condition was false");
    }
}
```

#### Handling multiple conditions with `else if`
You can use multiple conditions by combining if and else in an else if expression.
```Rust
fn main() {
    let number = 6;

    if number % 4 == 0 {
        println!("number is divisible by 4");
    } else if number % 3 == 0 {
        println!("number is divisible by 3");
    } else if number % 2 == 0 {
        println!("number is divisible by 2");
    } else {
        println!("number is not divisible by 4, 3, or 2");
    }
}
```

#### Using `if` in a `let` statement 
`if` is an expression so we can use it on the right side of a `let` statement to assign the outcome to a variable like this:
```Rust
fn main() {
    let condition = true;
    let number = if condition { 5 } else { 6 };

    println!("The value of number is: {number}");
}
```

#### Repetition with loops
Rust has three kinds of loops: `lopp`, `while`, and `for`

##### Repeating code with loop 
The `loop` keyword tells Rust to execute a block of code over and over again forever or until you explicitly tell it to stop. 
You can place the `break` keyword within the loop to tell the program to stop executing the loop. And on the other side, you can use `constinue` which tells the program to skip over any remaining code in this iteration of the loop and go to the next iteration.  

##### Returning values from loops 
One of the uses of a `loop` is to retry an operation you know might fail, such as checking whether a thread has completed its job.  You might also need to pass the result of that operation out of the loop to the rest of your code. To do this, you can add the value you want returned after the `break` expression you use to stop the loop; that value will be returned out of the loop so that you can use it
```Rust
fn main() {
    let mut counter = 0;

    let result = loop {
        counter += 1;

        if counter == 10 {
            break counter * 2;
        }
    };

    println!("The result is {result}");
}
```

##### Disambiguating with loops labels
If you have loops within loops, `break` and `continue` apply to the innermost loop at that point. You can optionally specify a loop label on a loop that you can then use with `break` or `continue` to specify that those keywords apply to the labeled loop instead of the innermost loop. Loop labels must begin with a single quote.
```Rust
fn main() {
    let mut count = 0;
    'counting_up: loop {
        println!("count = {count}");
        let mut remaining = 10;

        loop {
            println!("remaining = {remaining}");
            if remaining == 9 {
                break;
            }
            if count == 2 {
                break 'counting_up;
            }
            remaining -= 1;
        }

        count += 1;
    }
    println!("End count = {count}");
}
```

##### Streamlining conditional loops with while
A program will often need to evaluate a condition within a loop. While the condition is `true`, the loops runs. When the condition ceases to be `true`, the program calls `break`, stopping the loop. For this situation we use the `while` loop. 
```Rust
fn main() {
    let mut number = 3;

    while number != 0 {
        println!("{number}!");

        number -= 1;
    }

    println!("LIFTOFF!!!");
}
```

##### Looping through a collection with `for`
You can use a `for` loop and execute some code for each item in a collection. Like this: 
```Rust
fn main() {
    let a = [10, 20, 30, 40, 50];

    for element in a {
        println!("the value is: {element}");
    }
}
```

>[!Info] Machine code generated from `for` loops can be more efficient as well because the index doesn’t need to be compared to the length of the array at every iteration.

>[!CHALLENGE]
> - Convert temperatures between Fahrenheit and Celsius.
> - Generate the nth Fibonacci number.
> - Print the lyrics to the Christmas carol “The Twelve Days of Christmas,” taking advantage of the repetition in the song.
