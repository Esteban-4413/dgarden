def steps(number):
    even = number % 2 == 0  
    step = 0 
    if number <= 0:
        raise ValueError("Only positive integers are allowed")
    else:
        while number != 1: 
            if number % 2 == 0: 
                number = number // 2
            else: 
                number = number * 3 + 1 
            step += 1 
    return step 

        
 