# Basic functions in SML

Deadline: 6th Sep 2022, 11:59 hrs

In this exercise you do some basic functions

1. In the tutorial, we have given two functions `curry` and `uncurry`
   that converts between these two froms for bi-variate
   functions. Write the tri-variate (i.e. 3 variable) versions of
   `curry` and `uncurry` functions.  First step is to write down the
   type (in the comments).

   ```
   curry   : ('a * 'b * 'c -> 'd) -> ('a -> 'b -> 'c -> 'd)
   uncurry : ('a -> 'b -> 'c -> d) -> ('a * 'b * 'c -> 'd)
   ```

2. Write the functions `fst : 'a * 'b -> 'a` and `snd : 'a * 'b -> 'b`
   that project a tuple into its components.

3. Write the length function for lists `length : 'a list -> int`.

4. Write the `reverse : 'a list -> 'a list` function. Be careful to
   not make it O(n^2)

5. Write a function to compute the nth element in the Fibonacci
   sequence `fib : int -> int`. Be careful for the obvious version is
   exponential.
