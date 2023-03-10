# Lambda Calculus with let and let-rec

Consider variants of lambda calculus λ-calculus ⊆ λ-let ⊆ λ-letrec
where the former adds the syntactic sugar of non-recursive `let` and
the latter adds `letrec`. It adds the construct `let x = e₁ in e₂ end`
and `letrec x = e₁ in e₂ end`. The difference in `let` and `letrec` is
that the former is a non-recursive let where are the later is
recursive let.

 - In nonrecursive let `let x = e₁ in e₂` any occurance of x in e₁ is those
   that are bound outside the let expression itself

   For example in the code below
   ```
   let x := 10 in               -- Line (1)
      let x := x + 1            -- Line (2)
	   in x end                 -- Line (3)
   end
   ```

   The x in Line (3) is the x that is bound in line (2) whereas the x in line 2 on the RHS of
   the binding x := x +1 is the x bound in Line (1). In particular, the program

   ```
   let x := x+1 in x end

   ```
   should give an error because the x in the RHS of the x := x+1 binding is not bound.


   - In recursive let (called letrec) `letrec x := e₁ in e₂ end` the x
     that occurs in e₁ is the one that is bound in the letrec itself.

1. Define abstract syntax for λ-let and λ-letrec as a SML datatype.

2. Write the conversion λ-let to λ-calculus.

## Recursion (bonus, ungraded).

As described in the class, recursion is done in λ-calculus using a
fixed point combinator like `Y`.

1. Give a conversion from λ-letrec to λ-let and then to λ-calculus
   making use of the fixed point combinator.

2. How does one handle mutual recursion ? Hint: use pairing
   construction.
