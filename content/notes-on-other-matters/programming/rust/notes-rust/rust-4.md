# Understanding ownership

## What is ownership?

### Ownership rules
1. Each value in Rust has a variable that's its owner.
2. There can only be one owner at a time.
3. When the owner goes out of scope, the value will be dropped.

Example: Each value in Rust has a variable that's its owner.

```Rust
fn main(){
	let s1 = String::from("Rust");
	let len = calculate_length(&s1);
	println("Length of '{}' is {}.", s1, len);
}

fn calculate_length(s: &String) -> usize {
	s.len()
}
```

Example: There can be only one owner at a time.

```Rust
fn main(){
	let s1 = String::from("Rust");
	let s2 = s1;
	println!("{}", s2); // if we use s1 here we would get a compiler error because s1 does not hold ownership of the string anymore.
}
```

Example: When the owner goes out of scope, the value will be dropped.

```Rust
fn main(){
	let s1 = String::from("Rust");
	let len = calculate_length(&s1);
	println!("Length of '{}' is {}.", s1, len);
} // s1 goes out of scope and its value will be dropped

fn printLosts(s: &string){
	println!("{}", &s1);
} // This function will cause a compiler error because its using a variable that it is not in scope anymore.

fn calculate_length(s: &String) -> usize{
	s.len() 
}
```

### Safety is the absence of undefined behavior
A foundational goal of Rust is to ensure that your program never have undefined behaviour. Undefined behavior is especially dangerous for low-level programs with direct access to memory. 

### Ownership as a discipline for memory safety
Rust provides a particular way to think about memory. Ownership is a discipline for safely using memory within that way of thinking.

### Variables live in the stack
Variables live in frames. A frame is a mapping from variables to values within a single scope, such as a function. For example:

```Rust
fn main() {
	let n = 5; // L1
	let y = plus_one(n); //L3
	println!("The value of y is: {y}");
}

fn plus_one(x : i32) -> i32 {
	x + 1 // L2
}
```

![[rust4-1.png]]

- The frame for `main` at location L1 holds `n = 5`.
- The frame for `plus_one` at L2 holds `x = 5`.
- The frame for `main` at location L3 holds `n = 5; y = 6`

Frames are organized into a stack of currently-called-functions. After a function returns, Rust deallocates the function's frame. (Deallocation is also called freeing or dropping). This sequence of frames is called stack because the most recent frame added is always the next frame freed.

When an expression reads a variable, the variable's value is copied from it's slot in the stack frame.

```Rust
let a = 5; //L1
let mut b = a; // L2
b += 1; //L3
```

![[rust4-2.png]]

The value of `a` is copied into `b`, and `a` is left unchanged, even after changing `b`.

### Boxes live in the heap
But copying data can take up a lot of memory. So to transfer access to data without copying it, Rust uses pointers. The value that a pointer points-to is called its pointee. One common way to make a pointer is to allocate memory in the heap. Heap data is not tied to a specific stack frame. Rust provides a construct calles `Box` for putting data on the heap. For example:

```Rust
let a = Box::new([0; 1_000_000]); // L1
let b = a; // L2
```

![[rust4-3.png]]

Now there is only a single array at a time. At L1, the value of `a` is a pointer to the array inside the heap. The statement `let b = a` copies the pointer form `a` into `b`, but the pointed-to data is not copied.

>[!INFO] The stack holds data associated with a specific function, while the heap holds data that can outlive a function.

### Rust does not permit manual memory management
Memory management is the process of allocating memory and deallocating memory. In other words, it’s the process of finding unused memory and later returning that memory when it is no longer used. Stack frames are automatically managed by Rust. When a function is called, Rust allocates a stack frame for the called function. When the call ends, Rust deallocates the stack frame.

### A box's owner manages deallocation
Rust automatically frees a box's heap memory.

>[!INFO] Box deallocation principle (almost correct): If a variable is bound to a box, when Rust deallocates the variable´s frame, the Rust deallocates the box's heap memory.

for example:

```Rust
fn main(){
	let a_num = 4; // L1
	make_and_drop();
}

fn make_and_drop(){
	let a_box = Box::new(5);
}
```

![[rust4-4.png]]

At L1, before calling `make_and_drop`, the state of memory is just the stack frame for `main`. Then at L2, while calling `make_and_drop`, `a_box` points to `5` on the heap. Once `make_and_drop` is finished, Rust deallocates its stack frame, `make_and_drop` contains the variable `a_box`, so Rust deallocates the heap data in `a_box`. Therefore the heap is empty at L3.

But to avoid the situation in which the boxed array is bound to two variables as in the following example:

```Rust
let a = Box::new([0;1_000_000]);
let b = a;
```

Here, following the principle seen before, Rust would try to free the box's heap memory twice on behalf of both variables which would end up in a undefined behavior.

To avoid this situation, we arrive at the concept of ownership. When `a` is bound to `Box::new([0;1_000_00])`, we say that `a` owns the box. The statement `let b = a` moves ownership of the box from `a` to `b`. 

>[!Iinfo] Box deallocation principle (fully correct): If a variable owns a box, when Rust deallocates the variable's frame, then Rust deallocates the box's heap memory.

In the example above, `b` own the boxed array. Therefore when the scope ends, Rust deallocates the box only once on behalf of `b`, not `a`.

### Collection use boxes
Boxes are used by Rust data structures to hold a variable number of elements. For example:

```Rust
fn main() {
	let first = String::from("Ferris"); // L1
	let full = add_suffix(first); //L4
	println!("{full}");
}

fn add_suffix(mut name : String) -> String {
	//L2
	name.push_str(" Jr."); // L3
}
```

![[rust4-5.png]]

- At L1, the string "Ferris" has been allocated on the heap. It is owned by `first`.
- At L2, the function `add_suffix(first)` has been called. This moves ownership of the string from `first` to `name`. The string data is not copied. but the pointer to the data is copied.
- At L3, the function `name.push_str(" Jr.")` resizes the string's heap allocation. This does three things. First, it creates a new larger allocation. Second, it writes "Ferris Jr." into the new allocation. Third, it frees the original heap memory. `first` now points to deallocated memory.
- At L4, the frame for `add_suffix` is gone. This function returned `name`, transferring ownership of the string to `full`.

### Variables cannot be used after being moved
If you move a variable, Rust will stop you from using that variable later.

> [!info] moved data principle: If a variable `x` moves ownership of heap to another variable `y`, then `x` cannot be used after the move.

```Rust
fn main(){
	let first = String::from("Ferris");
	let full = add_suffix(first);
	println!("{full}, originally {first}");
}

fn add_suffix(mut name: String) -> String {
	name.push_str(" Jr.");
	name
}
```

Output:

```Bash
error[E0382]: borrow of moved value: `first`
 --> test.rs:4:35
  |
2 |     let first = String::from("Ferris");
  |         ----- move occurs because `first` has type `String`, which does not implement the `Copy` trait
3 |     let full = add_suffix(first);
  |                           ----- value moved here
4 |     println!("{full}, originally {first}"); // first is now used here
  |                                   ^^^^^ value borrowed here after move
```

This code is invalid because we try to use `first` after it became invalid. Rust says that `first` is moved when we called `add_suffix(first)` on line 3. The error clarifies that `first` is moved because it has type `String`, which does not implement copy. The it says that we use `first` after being moved(it's borrowed)

Moving ownership of heap data avoids undefined behavior from reading deallocated memory.

### Cloning avoid moves
One way to avoid data is to clone it using the `.clone()` method.

```Rust
fn main(){
	let first = String::from("Ferris");
	let first_clone = first.clone(); // L1
	let full = add_suffix(first_clone); // L2
	println!("{full}, orignally {first}");
}

fn add_suffix(mut name: String) -> String {
	name.push_str(" Jr.");
	name
}
```

![[rust4-6.png]]

### Summary
- All heap data must be owned by exactly one variable.
- Rust deallocates heap data once its owner goes out of scope.
- Ownership can be transferred by moves, which happen on assignments and function calls.
- Heap data can only be accessed through it current owner, not a previous owner.

## References and borrowing 
Ownership, boxes, and moves provide a foundation for safely programming with the heap. However, move-only APIs can be inconvenient to use. References allow you to borrow values without taking ownership and they are created by adding the ampersand symbol before the variable("&");

```Rust 
fn main(){
	let _x: i32 = 5;
	let _r: &i32 = &x;
	*_r += ;
	println!("Value of _x : {}", _x)
}
```
In the example above you will get a compiler error because `_r` is a `&` reference, so the data it refers to cannot be overwritten. This will change if we use the keyword `mut` when we create the reference.

```Rust
fn main(){
	let mut _x: i32 = 5;
	let _r: &mut i32 = &mut _x;
	*_r += 1;
	println!("Value of _x : {}", _x);
}
```

### One mutable reference or many immutable references
A little demonstration:

```Rust 
fn main(){
	let mut account : BankAccount = BankAccount{
		owner: "Alice".to_string(),
		balance:150.55,
	};
	//Immutable borrow to check the balance
	account.check_balance();

	//Mutable borrow to withdraw money
	account.withdraw(45.5);

	// Immutable borrow to check the balance again
	account.check_balance();
}

struct BankAccount{
	owner: String,
	balance: f64,
}

impl BankAccount {
	fn withdraw(&mut self, amount: f64){
		prinln!("Withdrawing {} from acount owned by {}", amount, self.owner);
		self.balance -= amount;
	}

	fn check_balance(&self){
		println!("Account owned by {} has a balance of {}", self.owner, self.balance);
	}
}
```

>[!NOTE] What is a struct?
> A struct is a data structure that allows you to group multiple fields together under one name.


```Rust
fn main(){
	let m1 = String::from("Hello");
	let m2 = String::from("World");
	greet(m1, m2); //L2
	let s = format!("{} {}, m1, m2"); //L3 -> Error: m1 and m2 are moved
}

fn greet (g1: String, g2: String){
	println!("{} {}!", g1, g2); // L1
}
```

![[rust4-7.png]]

In this example, calling `greet` moves the data from `m1` and `m2` into the parameters of `greet`. Both strings are dropped at the end of `greet`, and therefore cannot be used within `main`. 

```Bash
error[E0382]: borrow of moved value: `m1`
 --> test.rs:5:30
 (...rest of the error...)
```

This is inconvenient so as an alternative, `greet` could return ownership of the strings:

```Rust
fn main(){
	let m1 = String::from("Hello");
	let m2 = String::from("World"); // L1
	let (m1_again, m2_again) = greet(m1, m2);
	let s = format!("{}, {}", m1_again, m2_again); // L2
}

fn greet(g1: String, g2: String) -> (String, String){
	println!("{} {}", g1, g2);
	(g1, g2);
}
```

![[rust4-8.png]]

This clearly is not very optimal so Rust provides a concise style of reading and writing without move through references.

### References are non-owning pointers
A reference is a kind of pointer.

```Rust
fn main(){
	let m1 = String::new("Hello");
	let m2 = String::new("World"); // L1

	greet(&m1, &m2); // L3

	let s = format!("{} {}",m1, m2);
}

fn greet(g1: &String, g2: &String){
	//L2
	println!("{} {}", g1, g2);
}
```

![[rust4-9.png]]

The expression `&m1` uses the ampersand operator to create a reference to (or "borrow") `m1`. The type of the `greet` parameter `g1` is changed to `&String`, meaning "a reference to a `String`".
References are not-owning pointers, because they do not own the data they point to.

### Dereferencing a pointer accesses its data
This is a program that uses dereferences in multiple ways:

```Rust
let mut x: Box<i32> = Box::new(1);
let a: i32 = *x; // *x reads the heap value, so a = 1
*x += 1;	// *x on the left-side modifies the heap value,
			// so x points to the value 2.

let r1: &Box<i32> = &x;		// r1 points to x on the stack
let b: i32 = **r1;			// two dereferences get us to the heap value.

let r2: &i32 = &*x;		//r2 points to the heap value directly
let c: i32 = *r2; //(L1) so only one dereference i needed to read it
```

![[rust4-10.png]]

The dereference operator is not used very often because Rust implicitly insert dereferences and references in certain cases, such as calling a method with the dot operator.

```Rust
fn main()  {
	let x: Box<i32> = Box::new(-1);
	let x_abs1 = i32::abs(*x); // explicit dereference
	let x_abs2 = x.abs();      // implicit dereference
	assert_eq!(x_abs1, x_abs2);
	
	let r: &Box<i32> = &x;
	let r_abs1 = i32::abs(**r); // explicit dereference (twice)
	let r_abs2 = r.abs();       // implicit dereference (twice)
	assert_eq!(r_abs1, r_abs2);
	
	let s = String::from("Hello");
	let s_len1 = str::len(&s); // explicit reference
	let s_len2 = s.len();      // implicit reference
	assert_eq!(s_len1, s_len2);
}
```

This example shows implicit conversions in three ways:
1. The `i32::abs` function expects an input of type `i32`. To call `abs` with a `Box<i32>`, you can explicitly dereference the box like`i32::abs(*x)`. You can also implicitly dereference the box using method-call syntax like `x.abs()`. The do syntax is syntatic sugar for the function-call syntax.
2. This implicit conversion works for multiple layers of pointers. For example, calling `abs` on a reference to a box `r: &Box<i32>` will insert two dereferences.
3. By concurrently mutating the aliased data, causing a data race with nondeterministic behavior for the other variable.

### Rust avoids simultaneous aliasing and mutation
Pointers are powerful and dangerous because they enable aliasing. Aliasing is accessing the same data through different variables. Aliasing combined with mutation is a recipe for disaster. One variable can "pull the rug out" from another variable in many ways, for example:
- By deallocating the aliased data, leaving the other variable to point to deallocated memory. 
- By mutating the aliased data, invalidating runtime properties expected by the other variable. 
- By concurrently mutating the aliased data, causing a data race with nondeterministic behavior for another variable.

```Rust
fn main(){
	let mut v: Vec<i32> = vec![1, 2, 3];
	v.push(4);
}
```

Here we are using the vector data structure `Vec` which, unlike arrays, have a variable length by storing their elements in the heap.

![[rust4-11.png]]

The macro `vec!` creates a vector with the elements between the brackets. The vector `v` has type `Vec<i32>`. 
 
![[rust4-12.png]]

Notice that the vector has a length (`len`) of 3 and a capacity (`cap`) of 3. The vector is at capacity. So when we call the method push to add an element to the end of the vector, the vector has to create a new allocation with larger capacity, copy all the elements over, and deallocate the original heap array.

This causes a problem. For example, when create a references to a vector's heap data because then that reference can be invalidated by a push.

```Rust
fn main(){
	let mut v: Vec<i32> = vec![1, 2, 3];
	let num: &i32 = &v[2];
	v.push(4);
	println("The third element is {}", *num);
}
```

![[rust4-13.png]]

Initially, `v` points to an array with 3 elements on the heap. Then `num` is created as a reference to the third element. However, the operation `v.push(4` resizes `v`. The resize will deallocate the previous array and allocate a new, bigger array. In the process, `num` is left pointing to invalid memory. Therefore, dereferencing `*num` reads invalid memory, causing undefined behavior.
The issue is that the vector `v` is both aliased (by the reference `num`) and mutated (by the operation `v.push(4)`). So to avoid these kind of issues, Rust follows a basic principle:

>[!info] Pointer safety principle:
> Data should never be aliased an mutated at the same time.

Assigning a box from one variable to another will move ownership, invalidating the previous variable. Owned data can only be accessed through the owner —— no aliases.

### References change permissions on places
Borrow checkers is how Rust ensures the safety of references. The core idea behind it is that the variables have three kind of permissions on their data:

- Read (R): data can be copied to another location.
- Write (W): data can be mutated.
- Own (O): data can be moved or dropped.

These permissions do not exist at runtime, only within the compiler. They describe how the compiler "thinks" about your program before the program is executed.
By default, a variable has read/own permissions on its data. If a variable is annotated with `let mut`, then it also has the write permission. The key idea is that references can temporarily remove these permissions. 

```Rust 
fn main() {
	let mut v: Vec<i32> = vec![1, 2, 3];
	let num: &i32 = &v[2];
	println!("Third element is {}", *num);
	v.push(4);
}
```
 
![[rust4-14.png]]
