def is_armstrong_number(number): 
    text_number = str(number)
    total = 0 
    exp = len(text_number)
    for digit in text_number: 
        total += int(digit) ** (exp) 
    return total == number 
