# Common programming concepts 
## Variables and mutability
By default variables are immutable in Rust. This is because Rust prioritizes safety, so once a value is bound to a name, you can't change that value unless you explicitly ask for permission However, you still have the option to make them mutable. 
So, for example the following code will generate a error message regarding an immutability error:

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

Although immutability is the default, you don't have to jump through functional programming hoops if you just need a standard counter or changing a state. You can opt-in to C-style mutability simply by adding `mut` in front of the variable name:

```Rust
fn main() {
    let mut x = 5;
    println!("The value of x is: {x}");
    x = 6;
    println!("The value of x is: {x}");
}
```

## Declaring constants
Like immutable variables, constants are values that are bound to a name and are not allowed to change. However, there are strict differences between them (you can think of them as the `#define` macro or `conts` variables in C):
- You declare constants using the `const` keyword instead of `let`.
- You are not allowed to use `mut` with constants. They are permanently immutable 
- Constants can be declared in any scope, including the global scope.
- Constants may be set only to a constant expression, not the result of a value that could only be computed at runtime (the compiler needs to know their exact size and value beforehand). 

## Shadowing
In C, if you try to declare a variable with the same name twice in the same scope, the compiler will yell at you. In Rust, you are allowed to declare a new variable with the same name as a previous one. The first variable is shadowed by the second, which means that the second variable is what the compiler will see when you use the name of the variable. We can shadow a variable by using the same variable's name and repeating the use of the `let` keyword as follows:

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

Shadowing is vastly different from marking a variable as `mut`. Since we are effectively creating a brand-new variable when we use `let`, we can change the type of the value but reuse the same name. This save us from having to invent dummy names like `spaces_str` and `spaces_num`. 

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
Like Haskell, Rust is a *statically typed language* with highly capable type inference. This means it must know the types of all variables at compile time, but it can usually deduce them on its own based on how you use them.

However, in cases where many types are possible (like converting a string to a number), we must give the compiler a hint using a type annotation:

```Rust
let guess: u32 = "42".parse().expect("Not a number!");
```

>[!INFO] The `parse()` method converts the string to a number and `expect()` helps us handle error situations in case the string can not be converted. 

If we don't add the `: u32` type annotation, Rust throws an error because it doesn't know if we want an integer, a float, or something else: 

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
> Additionally, the `isize` and `usize` types depend on the architecture of the computer the program is running on (like `size_t` in C).

You can write integer literals in any of the forms that are shown in the following table:

| Number literals  | Example       |
| ---------------- | ------------- |
| Decimal          | `98_222`      |
| Hex              | `0xff`        |
| Octal            | `0o77`        |
| Binary           | `0b1111_0000` |
| Byte (`u8` only) | `b'A'`        |

Note that number literals can use `_` as a visual separator to make the number easier to read (e.g., `1_000` is the same as `1000`). You can also add a type suffix, like `57u8`, to explicitly designate the type.

#### Floating-point types
 Rust’s floating-point types are `f32` and `f64`, which are 32 bits and 64 bits in size, respectively. 

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

Here is a huge difference from C: In C, a `char` is just 1 byte (ASCII). In Rust, a `char` is 4 bytes in size and represents a Unicode Scalar Value. This means it can represent a lot more than just ASCII, including:
- Accented letters
- Chinese, Japanese, and Korean characters
- Emojis
- Zero-width spaces

(Note: We specify `char` literals with single quotations marks `' '`, while strings literals use double quotation marks `" "`).

### Compound types
These can group multiple values into one type. Rust has two primitive compound types:
- Tuples
- Arrays

#### Tuples
A tuple groups together a number of values with a variety of different types. They have a fixes length: once declared, they cannot grow or shrink

We crete a tuple by writing a comma-separated list of values inside parentheses: 

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

A tuple without any values has a especial name, *unit*. This value and its corresponding type are both are both written `()` and represent an empty value or an empty return type.

Additionally, we can modify individual elements of a mutable tuple.

```Rust
fn main() {
	let mut x : (i32, i32) = (1, 2);
	x.0 = 0;
	x.1 +=5;
}
```

#### Arrays
Unlike tuples, every element of an array must have the same type. Arrays have a fixed length. 

Arrays are written as a comma-separated list inside square brackets. Like this:

```Rust
fn main() {
    let a = [1, 2, 3, 4, 5];
}
```

>[!INFO] Arrays vs Vectors
> Arrays contents are allocated on the stack. If you need an array that can grow or shrink in size, you will want to use a Vector, a standard library collection whose contents live on the heap

You write an array's type using square brackets with the type of each element, a semicolon, and then the number of elements in the array.

```Rust
let a : [132; 5] = [1, 2, 3, 4, 5]
```

You can also initialize an array to contain the same value for each element by specifying the initial vale, followed by a semicolon, and then the length of the array in square brackets.

```Rust
let a = [3; 5]; // [3, 3, 3, 3, 3]
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
We define a function using the `fn` keyword. Rust doesn't care where you define your functions (above or below main), as long as they are defined somewhere in a scope that can be seen by the caller (no need for C-style header declarations).

### Parameters (also called arguments)
Just like in C, you must explicitly declare the type of each parameter in the function signature.

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

- Statements perform some action and do not return a value. (C for instance, is a statement-heavy language).
- Expressions evaluate to a result value. 

Expressions do not include ending semicolons. If you add a semicolon to the end of an expression, you turn it into a statement, and it will then not return a value.

### Functions with return values
We must declare the return type after an arrow (`->`). Because Rust is highly expression-based, the return value of the function is siply the value of the final expression in the block.

You can use the `return` keyword to return early (like in C), but most idiomatic Rust functions just leave the las expression without semicolon.

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
You provide a condition and branch your code.

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
(Notice we do not need parentheses `()` around the condition like we do in C)

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
The `loop` keyword executes a block of code forever. You use `break` to stop the loop, and `continue` to skip to the next iteration.

##### Returning values from loops 
One really cool feature is returning values from loops. You can add the value you want to return right after the `break` expression:

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
If you have nested loops, you can specify a loop label (which must begin with a single quote `'`) sp that your `break` or `continue` applies to that specific outer loop instead of the innermost one.

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
Just like in C, the loop runs while the condition evaluates to `true`.

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

>[!Info] Machine code generated from `for` loops can be more efficient than `while` loops because the compiler doesn't need to add runtime checks to ensure the index isn't going past the end of the array on every single iteration.

# Challenges

>[!CHALLENGE]
> - Convert temperatures between Fahrenheit and Celsius.
> - Generate the nth Fibonacci number.
> - Print the lyrics to the Christmas carol “The Twelve Days of Christmas,” taking advantage of the repetition in the song.

## 1.
Convert temperature between Fahrenheit and Celsius

```Rust
fn f_to_c(){
    println!("Please enter the temperature in Fahrenheit");

    let mut temp = String::new();
    stdin().read_line(&mut temp).expect("Failed to read input ups");
    
    let temp : f64 = temp.trim().parse().expect("Please type a valid number");

    println!("{}ºC", (temp - 32.0) * 5.0 / 9.0);
    
}


fn c_to_f(){
    println!("Please enter the temperature in Celsius");

    let mut temp = String::new();
    stdin().read_line(&mut temp).expect("Failed to read input ups");
    
    let temp : f64 = temp.trim().parse().expect("Please type a valid number");

    println!("{}ºF", (temp * 9.0 / 5.0) + 32.0);
    
}

fn converter(){
    println!("For ºC => ºF type [F] and for ºF => ºC type [C]");

    let mut choice = String::new();
    stdin().read_line(&mut choice).expect("Failed to read input upsss");

    let choice = choice.trim().to_uppercase();

    match choice.as_str() {
        "C" => f_to_c(),
        "F" => c_to_f(),
        _ => println!("Invalid input"),
    }
}
```

## 2.
Generate the $n^{th}$ fibonacci number

```Rust
fn nth_fibonacci(n : u32) -> u32 {
    if n == 0{
       return 0; 
    } else if n == 1 {
       return 1; 
    } else {
        let mut first = 0;
        let mut second = 1;
        let mut fib = 0;
        for _i in 2..=n {
            fib = first + second;
            first = second;
            second = fib;
        }
        second
    }
}
```

## 3.
Print the lyrics to the Christmas carol "The Twelve Days of Christmas", taking advantage of the repetition in the song. 

```text
[Verse 1]
On the first day of Christmas, my true love sent to me
A partridge in a pear tree

[Verse 2]
On the second day of Christmas, my true love sent to me
Two turtle doves and
A partridge in a pear tree

[Verse 3]
On the third day of Christmas, my true love sent to me
Three french hens
Two turtle doves and
A partridge in a pear tree

[Verse 4]
On the fourth day of Christmas, my true love sent to me
Four calling birds
Three french hens
Two turtle doves and
A partridge in a pear tree

[Verse 5]
On the fifth day of Christmas, my true love sent to me
Five golden rings
Four calling birds
Three french hens
Two turtle doves and
A partridge in a pear tree

[Verse 6]
On the sixth day of Christmas, my true love sent to me
Six geese a-laying
Five golden rings
Four calling birds
Three french hens
Two turtle doves and
A partridge in a pear tree

[Verse 7]
On the seventh day of Christmas, my true love sent to me
Seven swans a-swimming
Six geese a-laying
Five golden rings
Four calling birds
Three french hens
Two turtle doves and
A partridge in a pear tree

[Verse 8]
On the eighth day of Christmas, my true love sent to me
Eight maids a-milking
Seven swans a-swimming
Six geese a-laying
Five golden rings
Four calling birds
Three french hens
Two turtle doves and
A partridge in a pear tree

[Verse 9]
On the ninth day of Christmas, my true love sent to me
Nine ladies dancing
Eight maids a-milking
Seven swans a-swimming
Six geese a-laying
Five golden rings
Four calling birds
Three french hens
Two turtle doves and
A partridge in a pear tree

[Verse 10]
On the tenth day of Christmas, my true love sent to me
Ten lords a-leaping
Nine ladies dancing
Eight maids a-milking
Seven swans a-swimming
Six geese a-laying
Five golden rings
Four calling birds
Three french hens
Two turtle doves and
A partridge in a pear tree

[Verse 11]
On the eleventh day of Christmas, my true love sent to me
Eleven pipers piping
Ten lords a-leaping
Nine ladies dancing
Eight maids a-milking
Seven swans a-swimming
Six geese a-laying
Five golden rings
Four calling birds
Three french hens
Two turtle doves and
A partridge in a pear tree
```

```Rust 
fn song() {
    for i in 1..=12 {

        println!("\n[Verse {}]\n", i);

        let day = match i {
            1 => "first",
            2 => "second",
            3 => "third",
            4 => "fourth", 
            5 => "fifth",
            6 => "sixth",
            7 => "seventh",
            8 => "eighth",
            9 => "ninth",
            10 => "tenth",
            11 => "eleventh",
            12 => "twelfth",
            _ => ""
        };
        println!("On the {} day of Christmas, my true love sent to me\n", day);

        for j in (1..=i).rev(){
            let gift = match j {
                1 if i == 1 => "A partridge in a pear tree",
                1 => "And a partridge in a pear tree",
                2 => "Two turtle doves and",
                3 => "Three french hens",
                4 => "Four calling birds",
                5 => "Five golden rings",
                6 => "Six geese a-laying",
                7 => "Seven swans a-swimming",
                8 => "Eight maids a-milking",
                9 => "Nine ladies dancing",
                10 => "Ten lords a-leaping",
                11 => "Eleven pipers piping",
                12 => "Twelve drummers drumming",
                _ => "",
            };
            println!("{}\n", gift);
        }
    }
}

```

## The main program:

```Rust
fn main() {
    loop {
        println!("What do you wanna do?");
        println!("To convert temperature between Farhenheit and Celsius please type [convert]");
        println!("To get the nth fibonacci number please type [fibonacci]");
        println!("To get the lyrics of \"The twelve Days of Christmas\" please type [christmas]");
        println!("To exit type [exit] or press [q]");

        let mut choice = String::new();
        stdin().read_line(&mut choice).expect("Failed to read input! ups");
        let choice = choice.trim();

        if choice == "convert"{
            converter();
        } else if choice == "fibonacci" {
            println!("Type the position in the fibonacci sequence that you want\n");
            let mut n = String::new();
            stdin().read_line(&mut n).expect("Failed to read the number, sorry!");
            let n : u32  = n.trim().parse().expect("Please enter a positive number dumbass!");
            let f = nth_fibonacci(n);
            println!("The {}th fibonacci number is {}", n, f);
        } else if choice == "christmas" {
            song();
        } else if choice == "exit" || choice == "q"{
            break;
        }
    }
}
```
