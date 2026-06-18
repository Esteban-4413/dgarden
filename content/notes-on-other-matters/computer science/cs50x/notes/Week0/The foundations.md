---
tags:
  - computer-science/programming/foundations
  - computer-science/cs50
  - scratch
  - computer-science
---

#  CS50x Lecture 0: Computer Science & Scratch

> "Computer Science is not just about programming; it's about problem-solving." — David J. Malan

---

##  AI and Programming
In 2026, AI is everywhere. While it removes "human bottlenecks," the goal of CS50 is to turn you into a **pilot**, not just a passenger. Knowing the fundamentals allows you to organize and create code that AI can't architect on its own.

### The `chat.py` Experiment
Programming a chatbot in just 10 lines of code:
```python
from openai import OpenAI
client = OpenAI()
user_prompt = input("Prompt: ")
system_prompt = "Limit your answer to one sentence. Pretend you're a cat."
response = client.responses.create(
    input=user_prompt,
    instructions=system_prompt,
    model="gpt-5"
)
print(response.output_text)
```
**Takeaway:** Rather than thinking about AI as a way to remove the need to learn the fundamentals, consider how knowing the basics empowers you to use AI to lead to new opportunities.

--- 
## Computer Science & Data Representation
At its core, computer programming is about taking some **input** and creating some **output**. What happens in between is the **Black Box**.
### Binary (Base-2)
Computers count using **Binary**. Since a computer is essentially a collection of billions of tiny switches (transistors), it only understands two states: **0** (Off) and **1** (On).
- **Bit:** A single binary digit (0 or 1).
- **Byte:** A group of 8 bits. It can represent numbers from 0 to 255 (28−1).
### Standards for Communication
- **ASCII:** A standard that maps specific letters to numbers (e.g., 65 is 'A').
- **Unicode:** An expanded standard that allows for thousands of characters, including **Emojis**, by using more bits per character.
- **RGB (Color):** Colors are represented using three bytes—one for Red, one for Green, and one for Blue. Every pixel on your screen is just a combination of these values.

--- 
## Algorithms & Pseudocode

An **Algorithm** is a step-by-step set of instructions to solve a problem. We measure them by their efficiency.

### Search Algorithms
Imagine finding a name in a phone book of n names
1. **Linear Search:** Searching page by page. Complexity: $O(n)$.
2. **Binary Search:** Going to the middle and dividing the problem in half repeatedly. Complexity: $O(\log n)$.   
![[Pasted image 20260222102357.png]]
Notice that the first algorithm, highlighted in red, has a big-O of `n` because if there are 100 names in the phone book, it could take up to 100 tries to find the correct name. The second algorithm, where two pages were searched at a time, has a big-O of `n/2` because we searched twice as fast through the pages. The final algorithm has a big-O of log2n, as doubling the problem would only result in one more step to solve the problem.
### Pseudocode Components
Pseudocode is human-readable instructions that describe the steps of an algorithm:
- **Functions:** Actions or verbs (_pick up, open, say_).
- **Conditionals:** Decisions (_if, else if, else_).
- **Boolean Expressions:** True/False statements (_is person on page?_).
- **Loops:** Repeating actions (_go back to line 3, repeat_).

For example, considering the third algorithm above, we could compose pseudocode as follows:

```
Pick up phone book
Open to middle of phone book
Look at page
If person is on page
    Call person
Else if person is earlier in book
    Open to middle of left half of book
    Go back to line 3
Else if person is later in book
    Open to middle of right half of book
    Go back to line 3
Else
	Quit
```

Pseudocoding is such an important skill for at least two reasons. First, when you pseudocode before you create formal code, it allows you to think through the logic of your problem in advance. Second, when you pseudocode, you can later provide this information to others that are seeking to understand your coding decisions and how your code works.

---
# Following up:
- [[notes on other things/computer science/cs50x/notes/Week1/C|C]]