---
topic: JavaScript
date: 2026-01-27
course: JavaScript
tags:
  - Universidade
  - hackathon
excalidraw-plugin: parsed
excalidraw-open-md: true
---
# Variables 
---
## Key Concepts
### Create a variable: var 
There are a few general rules for naming variables: 
- Variable names cannot start with numbers. 
- Variable names are case sensitive, so `myName` and `myname` would be different variables. It is bad practice to create two variables that have the same name using different cases.
- Variable names cannot be the same as _keywords_. For a comprehensive list of keywords, check out [MDN’s keyword documentation](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#Keywords).

### Create a variable: let 
The `let` keyword signals that the variable can be reassigned a different value later on. Take a look at the example:

Another concept we should be aware of when using `let` (and even `var`) is that we can declare a variable without assigning it a value. In such a case, the variable will be automatically initialized with a value of `undefined`:

### Create a variable: const 
The `const` keyword is hort for the word constant. Just like with `var` and `let`, we can store any value in a `const` variable. The way we declare a `const` variable and assign a value to it follows the same structure as `let` and `var`. 
However, a `const` variable cannot be reassigned because it is _constant_. If we try to reassign a `const`variable, we’ll get a `TypeError`.

Constant [variables](https://www.codecademy.com/resources/docs/javascript/variables) _must_ be assigned a value when declared. If we try to declare a `const` variable without a value, we’ll get a `SyntaxError`. 

When trying to decide between which keyword to use, `let` or `const`, think about whether the variable will need to be reassigned later on. If we need to reassign the variable, use `let`; otherwise, use `const`.

### Mathematical assignment operators 
...

### The increment and Decrement Operator
The **increment operator** will increase the value of the variable by one. The **decrement operator** will decrease the value of the variable by one. 

### String Concatenation with Variables 
The `+` operator can be used to combine two string values, even if those values are being stored in variables:

### String Interpolation 
We can insert, or _interpolate_, variables into strings using _template literals_.
One of the biggest benefits of using template literals is the readability of the code. Using template literals, we can more easily tell what the new string will be. We also don’t have to worry about escaping double quotes or single quotes.

### typeof operator 
While writing code, it can be useful to keep track of the [data types](https://www.codecademy.com/resources/docs/javascript/data-types) of the [variables](https://www.codecademy.com/resources/docs/javascript/variables)
 in a program. If we need to check the data type of a variable’s value, we can use the `typeof` operator. 

The `typeof` operator checks the value to its right and _returns_, or passes back, a string of the data type.

---
## Exercises  
### Create a variable: var 
1. Declare a variable named `favoriteFood` using the `var` keyword and assign to it the string `'pizza'`.
```javaScript 
var favoriteFood = 'pizza'
```
2. Declare a variable named `numOfSlices` using the `var` keyword and assign to it the number `8`.
```js 
var numOfSlices = 8
```
3. Under the `numOfSlices` variable, use `console.log()` to print the value saved to `favoriteFood`. On the following line, use `console.log()` to print the value saved to `numOfSlices`.
```js
var favoriteFood = 'pizza'

var numOfSlices = 8

console.log(favoriteFood)

console.log(numOfSlices)
```

### Create a variable: let 
1. Create a `let` variable called `changeMe` and set it equal to the boolean `true`.
```js 
let changeMe = true
```
2. On the line after `changeMe` is declared, set the value of `changeMe` to be the boolean `false`. To check if `changeMe` was reassigned, log the value saved to `changeMe` to the console.
```js
let changeMe = true ;

console.log(changeMe) ;

changeMe = false ;

console.log(changeMe)
```

### Create a variable: const 
1. Create a constant variable named `entree` and set it to equal to the string `'Enchiladas'`.
```js
const entree = 'Enchiladas'
```
2. Just to check that you’ve saved the value of `'Enchiladas'` to `entree`, log the value of `entree` to the console.
```js
console.log(entree)
```

### Mathematical assignment operators 
1. Use the `+=` mathematical assignment operator to increase the value stored in `levelUp` by `5`.
```js
let levelUp = 10;
let powerLevel = 9001;
let multiplyMe = 32;
let quarterMe = 1152;

// Use the mathematical assignments in the space below:
levelUp += 5; 

// These console.log() statements below will help you check the values of the variables.
// You do not need to edit these statements. 
console.log('The value of levelUp:', levelUp); 
console.log('The value of powerLevel:', powerLevel); 
console.log('The value of multiplyMe:', multiplyMe); 
console.log('The value of quarterMe:', quarterMe);
```
2. Use the `-=` mathematical assignment operator to decrease the value stored in `powerLevel` by `100`.
```js
let levelUp = 10;
let powerLevel = 9001;
let multiplyMe = 32;
let quarterMe = 1152;

// Use the mathematical assignments in the space below:
levelUp += 5; 

powerLevel -= 100;

// These console.log() statements below will help you check the values of the variables.
// You do not need to edit these statements. 
console.log('The value of levelUp:', levelUp); 
console.log('The value of powerLevel:', powerLevel); 
console.log('The value of multiplyMe:', multiplyMe); 
console.log('The value of quarterMe:', quarterMe);
```
3. Use the `*=` mathematical assignment operator to multiply the value stored in `multiplyMe` by `11`.
```js
let levelUp = 10;
let powerLevel = 9001;
let multiplyMe = 32;
let quarterMe = 1152;

// Use the mathematical assignments in the space below:
levelUp += 5; 

powerLevel -= 100;

multiplyMe *= 11; 

// These console.log() statements below will help you check the values of the variables.
// You do not need to edit these statements. 
console.log('The value of levelUp:', levelUp); 
console.log('The value of powerLevel:', powerLevel); 
console.log('The value of multiplyMe:', multiplyMe); 
console.log('The value of quarterMe:', quarterMe);
```

4. Use the `/=` mathematical assignment operator to divide the value stored in `quarterMe` by `4`.
```js
let levelUp = 10;
let powerLevel = 9001;
let multiplyMe = 32;
let quarterMe = 1152;

// Use the mathematical assignments in the space below:
levelUp += 5; 

powerLevel -= 100;

multiplyMe *= 11; 

quarterMe /= 4 

// These console.log() statements below will help you check the values of the variables.
// You do not need to edit these statements. 
console.log('The value of levelUp:', levelUp); 
console.log('The value of powerLevel:', powerLevel); 
console.log('The value of multiplyMe:', multiplyMe); 
console.log('The value of quarterMe:', quarterMe);
```
### The Increment and Decrement Operator 
1. Using the increment operator, increase the value of `gainedDollar`.
```js
let gainedDollar = 3;
let lostDollar = 50;

gainedDollar++; 
```
2. Using the decrement operator, decrease the value of `lostDollar`.
```js 
let gainedDollar = 3;
let lostDollar = 50;

gainedDollar++; 

lostDollar--; 
```

### String Concatenation with Variables 

1. Create a variable named `favoriteAnimal` and set it equal to your favorite animal.
```js
let favoriteAnimal = 'Lion'
```

2. Use `console.log()` to print `'My favorite animal: ANIMAL'` to the console. Use string concatenation so that `ANIMAL` is replaced with the value in the `favoriteAnimal` variable.
```js
let favoriteAnimal = 'Lion';

console.log('My favorite animal: '+ favoriteAnimal);
```

### String Interpolation 
1. Create a variable called `myName` and assign it your name.
```js
let myName = 'Esteban'
```
2. Create a variable called `myCity` and assign it your favorite city’s name.
```js
let myName = 'Esteban'

myCity = 'Bogota'
```
3. Use a single template literal to interpolate your variables into the sentence below. Use `console.log()` to print your sentence to the console in the following format:
```js
let myName = 'Esteban';

myCity = 'Bogota';

console.log(`My name is ${myName}. My favorite city is ${myCity}.`);
```

### typeof operator
1. Use `console.log()` to print the `typeof newVariable`.
```js
let newVariable = 'Playing around with typeof.';

console.log(typeof newVariable);
```
2. Great, now let’s check what happens if we reassign the variable. Below the console.log() statement, reassign `newVariable` to `1` 
```js
let newVariable = 'Playing around with typeof.';

console.log(typeof newVariable);

newVariable = 1;
```
3. Since you assigned this new value to `newVariable`, it has a new type! On the line below the reassignment, use `console.log()` to print `typeof newVariable` again.
```js
let newVariable = 'Playing around with typeof.';

console.log(typeof newVariable);

newVariable = 1;

console.log(typeof newVariable);
```

---
## Examples
### Create a variable: var 
```js 
var myName = 'Arya';
console.log(myName);
// Output: Arya
```

1. ```var``` short for variable, is a JavaScript _keyword_ that creates, or _declares_, a new variable.
2. `myName` is the variable’s name. Capitalizing in this way is a standard convention in JavaScript called **camel casing**. In camel casing we group words into one; The first word is lowercase, and then every word that follows will have its first letter uppercased (e.g., camelCaseEverything).
3. `=` is the _assignment operator_. It assigns the value (`'Arya'`) to the variable (`myName`). 
4. `'Arya'` is the _value_ assigned (`=`) to the variable `myName`. We can also say that the `myName` variable is _initialized_ with a value of `'Arya'`. 
5. After the variable is declared, the string value `'Arya'` is printed to the console by referencing the variable name: `console.log(myName)`.
### Create a variable: let 
```js
let meal = 'Enchiladas';
console.log(meal); // Output: Enchiladas
meal = 'Burrito';
console.log(meal); // Output: Burrito

```

```js
let price;  
console.log(price); // Output: undefined  
price = 350;  
console.log(price); // Output: 350
```

In the example above: 
- If we don’t assign a value to a variable declared using the `let` keyword, it automatically has a value of `undefined`. 
- We can reassign the value of the variable.

### Create a variable: const 
```js 
const myName = 'Gilberto';  
console.log(myName); // Output: Gilberto
```

### Mathematical assignment operators 
```js
let w = 4;  
w = w + 1;  
  
console.log(w); // Output: 5
```

In the example above, we created the variable `w` with the number `4` assigned to it. The following line, `w = w + 1`, increases the value of `w` from `4` to `5`.

Another way we could have reassigned `w` after performing some mathematical operation on it is to use built-in mathematical **assignment operators**. We could rewrite the code above to be:

```js
let w = 4;
w += 1;

console.log(w); // Output: 5
```

In the second example, we used the `+=` assignment operator to reassign `w`. We’re performing the mathematical operation of the first operator `+` using the number to the right, then reassigning `w` to the computed value. 

We also have access to other mathematical assignment operators — `-=`, `*=`, and `/=` which work in a similar fashion.

```js
let x = 20;
x -= 5; // Can be written as x = x - 5
console.log(x); // Output: 15

let y = 50;
y *= 2; // Can be written as y = y * 2
console.log(y); // Output: 100

let z = 8;
z /= 2; // Can be written as z = z / 2
console.log(z); // Output: 4
```

### The Increment and Decrement Operator 
```js
let a = 10;
a++;
console.log(a); // Output: 11
```

```js
let b = 20;
b--;
console.log(b); // Output: 19
```

### String Concatenation with Variables 
```js
let myPet = 'armadillo';
console.log('I own a pet ' + myPet + '.'); 
// Output: 'I own a pet armadillo.'
```

In the example above, we assigned the value `'armadillo'` to the `myPet` variable. On the second line, the `+` operator is used to combine three strings: `'I own a pet'`, the value saved to `myPet`, and `'.'`. We log the result of this concatenation to the console as:

```
I own a pet armadillo.
```

### String Interpolation 
```js
const myPet = 'armadillo';
console.log(`I own a pet ${myPet}.`);
// Output: I own a pet armadillo.
```
Notice that:

- A template literal is wrapped by backticks `` ` `` (this key is usually located on the top of the keyboard, left of the 1 key).
- Inside the template literal, we’ll see a placeholder, `${myPet}`. The value of `myPet` is inserted into the template literal.
- When we interpolate `` `I own a pet ${myPet}.` ``, the output we print is the string: `'I own a pet armadillo.'`

### typeof operator 
```js
const unknown1 = 'foo';
console.log(typeof unknown1); // Output: string

const unknown2 = 10;
console.log(typeof unknown2); // Output: number

const unknown3 = true; 
console.log(typeof unknown3); // Output: boolean
```
Since the value `unknown1` is `'foo'`, a string, `typeof unknown1` will return `'string'`.

---
## Questions
- 
---
## Summary

Nice work! This lesson introduced you to variables, a powerful concept you will use in all your future programming endeavors.

Let’s review what we learned:

- Variables hold reusable data in a program and associate it with a name.
- Variables are stored in memory.
- The `var` keyword is used in pre-ES6 versions of JS.
- `let` is the preferred way to declare a variable when it can be reassigned, and `const` is the preferred way to declare a variable with a constant value.
- Variables that have not been initialized store the primitive data type `undefined`.
- Mathematical assignment operators make it easy to calculate a new value and assign it to the same variable.
- The `+` operator is used to concatenate strings, including string values held in variables.
- In ES6, template literals use backticks `` ` `` and `${}` to interpolate values into a string.
- The `typeof` keyword returns the data type of a value (e.g., string).
---
## Related Topics
- [[]]