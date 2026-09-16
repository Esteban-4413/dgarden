```haskell
data Expr = Val Int | Div Expr Expr

eval :: Expr -> Int
eval (Val n) = n
eval (Div x y) = eval x / eval y
```

This might crash if the y expression is zero

So in order to fix that we first are going to define a save implementation of the division 
```haskell
saveDiv :: Int -> Int -> Maybe Int
saveDiv n 0 = Nothing 
saveDiv n m = Just (n / m)
```

Now we can use it in our function `eval`
```haskell
eval :: Expr -> Maybe Int
eval (Val n) = Just n
eval (Expr x y) = case eval x of 
                    Nothing -> Nothing
                    Just n -> case eval y of 
                                Nothing -> Nothing
                                Just m -> safeDiv n m
```
This function works really well but is has a problem, it is to verbose. So what we can do now is extract the patterns that are repetitive into a definition.
```text
case _1_ of 
  Nothing -> Nothing
  Just x -> _2_ x
```
- 1 = m
- 2 = f because it is a function

```text
m >>= f = case m of 
            Nothing -> Nothing
            Just x -> f x
```

```haskell
eval :: Expr -> Maybe Int
eval (Val n) = return n
eval (Div x y) = eval x >>= (\n -> eval y >>= (\m -> safeDiv n m))
```

in `do` notation:

```haskell
eval :: Expr -> Maybe Int
eval (Val n) = return n
eval (Div x y) = do n <- eval x
                    m <- eval y
                    safediv n m
```

## The Maybe Monad

```haskell
return :: a -> Maybe a
>>= :: Maybe a -> (a -> Maybe b) -> Maybe b
```

## What is the point? 
1. Same idea works for other effects 
2. Supports pure programming with effects
3. Use of effects explicit in types
4. Functions that work for any effect
