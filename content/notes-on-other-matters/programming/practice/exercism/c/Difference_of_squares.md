# Instructions:
Find the difference between the square of the sum and the sum of the squares of the first N natural numbers.

The square of the sum of the first ten natural numbers is $(1 + 2 + ... + 10)² = 55² = 3025.$

The sum of the squares of the first ten natural numbers is $1² + 2² + ... + 10² = 385.$

Hence the difference between the square of the sum of the first ten natural numbers and the sum of the squares of the first ten natural numbers is $3025 - 385 = 2640.$

You are not expected to discover an efficient solution to this yourself from first principles; research is allowed, indeed, encouraged. Finding the best algorithm for the problem is a key skill in software engineering.

# First try
```c title:"Using loops to sum"
#include "difference_of_squares.h"

unsigned int sum_of_squares(unsigned int number){
    unsigned int i = 1; 
    unsigned int sum = 0;
    while (i <= number){
        sum += i * i;
        i++;
    }
    return sum;
}

unsigned int square_of_sum(unsigned int number){
    unsigned int i = 1;
    unsigned int sum = 0;
    while(i <= number){
        sum += i;
        i++;
    }
    unsigned int r = sum * sum;
    return r;
}

unsigned int difference_of_squares(unsigned int number){
    return (square_of_sum(number) - sum_of_squares(number));
}
```

# A more efficient way:
1. The sum of the first $n$ natural numbers is $$\frac{n(n+1)}{2}$$
so the square of the sum of the first $n$ numbers is $$\left(\frac{n(n+1)}{2} \right)^2$$ 
2. The sum of the squares of the first $n$ numbers is $$\frac{n(n+1)(2n+1)}{6}$$
```c title:"A more efficient way using math"
#include "difference_of_squares.h"

unsigned int sum_of_squares(unsigned int number) {
    return (number * (number + 1) * ((2 * number) + 1)) / 6;
}

unsigned int square_of_sum(unsigned int number) {
    unsigned int sum = (number * (number + 1)) / 2;
    return sum * sum;
}

unsigned int difference_of_squares(unsigned int number) {
    return square_of_sum(number) - sum_of_squares(number);
}




#ifndef DIFFERENCE_OF_SQUARES_H
#define DIFFERENCE_OF_SQUARES_H

unsigned int sum_of_squares(unsigned int number);
unsigned int square_of_sum(unsigned int number);
unsigned int difference_of_squares(unsigned int number);

#endif
```
