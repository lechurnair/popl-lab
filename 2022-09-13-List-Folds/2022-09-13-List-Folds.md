# Folds and Recursion.

Deadline: 20th Sep 2022, 23:59 hrs

In the last lab we talked about the `map` function. Another important
function is the `fold` function (also known as `reduce`) which takes a
list an computes a "summary" of it. There are two variants of it

```
foldr : ('elem * 'summary -> 'summary) -> 'summary -> 'elem list -> 'summary
foldl : ('elem * 'summary -> 'summary) -> 'summary -> 'elem list -> 'summary

```

The semantics of these functions are the following.

```
foldr f s₀ [x₀, x₁, ... , xₙ] = f (x₀ , f (x₁, ... f (xₙ, s0))
foldl f s₀ [x₁, x₁, ... , xₙ] = f (xₙ , f (x₁, f ( x0, s0)))
```

We use the summarising function `f` to compute the summary of the
list starting with an initial summary `s₀`. The two variants differ
from which "side" the summary computation is started.  It is easier to
if for a moment one think of the summarising function
`f` as an operator `⛒`.

(Note that I have tweaked the type of foldl to make it more readable
in this context) `


```
foldr : ('elem * 'summary -> 'summary) -> 'elem list  -> 'summary -> 'summary`
foldr ⛒ [x₀, x₁, ... xₙ] s₀ =  x₀ ⛒ (x₁ ⛒ (... xₙ₋₁ ⊗ (xₙ ⛒ s₀)))


foldl : ('summary  * 'elem -> 'summary) -> 'summary -> 'elem list -> 'summary`
foldl ⛒ s₀ [x₀, x₁, ... xₙ] = (((s₀ ⊗ x₀) ⊗ x₁) ...⊗ xₙ₋₁) ⊗ xₙ
```


1. Define the functions `foldr` and `foldl` using the pattern matching
   for list.

2. Without using pattern matching, define the function `sum : int list
   -> int` that computes the sum of a list of integers.

3. Instead of using explicit recursion, define the following library
   function in terms of either `foldr` or `foldl` which ever is
   convenient. For the documentation of these library function, read the
   documentation of the [`List`
   structure](http://sml-family.org/Basis/list.html)

   - `partition : ('a -> bool) -> 'a list -> 'a list * 'a list`

   - `map : ('a -> 'b) -> 'a list -> 'b list`.

   - `reverse : 'a list -> 'a list`

   - `nth : 'a list * int -> 'a option`.

## Hints.

1. All functions will be obtained by doing `foldl sfun s0 lst` for some
   appropriate summarising function. To find out what `sfun` is first
   determine what the type `'summary` should be.

2. Be careful with `reverse` as the obvious version of reverse will
   have running time O(n²). Instead get an O(n) version (Hint: For
   this case `foldl` might be more convenient).

3. For the `nth` function, first define an auxiliary datatype as follows

   ```
   datatype 'a Find = LookingFor of int
                    | Found      of 'a


   ```
   which will act as the summary. The value `LookingFor n` means that
   we are yet to find the value and it is 'n' positions away from where
   we are whereas `Found` means that we have already found it.

   Try writing `nthAux : 'a list * int -> 'a Find`


# Bonus question (ungraded)

Write `foldl` in terms of `foldr` and `map`. To solve this problem
consider the summarising function `sfun` that assigns to each element
`x : 'a` a transformation `trₓ : 'summary -> summary` defined as `trₓ
s = sfun (x, s)`. Notice that `foldr sfun s0 [x0,...,xn] = (trₓ₀ o
trₓ₁ .... o trₓₙ) s0`. Now it is sufficient to compute the composition
of this function which can be done using a `foldl`
