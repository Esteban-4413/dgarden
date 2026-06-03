# Article notes

Maybe some key ideas
- The birthday paradox

## What is a hash function/algorithm?
    


## The birthday paradox 
States that in a random group of just 23 people, there is a 50% chance that at least two people share the exact same birthday.
The math is more or less the following:
- The number of pairs: In a group of 23 people, ther are 253 unique pairs to compare $(253 = \frac{22*23}{2})$
- Calculating the odds To calculate the probability of no one sharing a birthday we have that the first person's birthday is unique (365/365). The second person then has a 364/365 chance of not sharing, the third has 363/365, and so on.
- The result: When you multiply these probabilities together for 23 people, the chance that absolutly everyone has a unique birthday is about 49.3%. Substracting that from 100% leaves a 50.7% of at least one matching 
- The probability escalates rapidly aas more people enter the room:
    - 23 people: 50% chance 
    - 50 people: 97% chance
    - 75 people: 99% chance 
    - 366 people: 100% chance (assuming a 365-day year and following the pigeonhole principle)

This math is highly relevant in computer science because is the foundation of "birthday attacks" which are a cryptographic method hackers use to find collisions in security hashing algoritms or passwords much faster that brute force.