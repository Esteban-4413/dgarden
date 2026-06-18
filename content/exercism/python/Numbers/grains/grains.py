def square(number):
    if number <= 0 or number >= 65 : 
        raise ValueError("square must be between 1 and 64")
    grains = 2 ** (number - 1)
    return grains 


def total():
    i = 0
    for number in range(1, 65): 
        i += square(number) 
    return i 