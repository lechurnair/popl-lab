# Lambda Calculus: The inception

In the class we discussed lambda calculus. This exercise builds
towards a lambda calculus interpreter in standard ML.

1. Define an ML datatype `expr` that capture lambda calculus
   expressions. Use the [`Atom` module][atom] to represent variables.

2. Write functions `free : expr -> atom set` and `bound : expr -> atom
   set` that computes free and bound variables in a given lambda
   calculus expression respectively. You can use `AtomSet` structure
   given by the signature [ORD_SET][sets]

3. Write a function `subst : expr -> atom -> expr -> expr`, where
   `subst e₁ x e₂` substitutes in `e₁` all free occurance of `x` by
   `e₂`.

4. Write a function `fresh : atom set -> atom` which computes a fresh
   variable name given a set of variables.

   One elegant way to write the fresh function is to use [Cantor's
   diagonalisation][diagonalisation]. Here is a rough sketch

   * First write a function write a function
     `diag : string -> string -> string` which has the following property:
	 `z = diagonalise x y`, we have

      - `x` _is_ a prefix of `z` and
	  - `z` _is not_ a prefix of `y`

   * Write the atom version where the second argument is atom
     of the function: write `diagA : string -> atom -> string`.

   * Finally make use of either `AtomSet.foldl` or `AtomSet.foldr` to
	 get to the `fresh` function by diagonalising over all elements of
	 the set.

# Bonus question (ungraded)

Implement an interpreter for the lambda calculus. You will first need
to implement beta reduction and then decide on one of the
strategies. You might want to then implement multiple interpreters
based on various [reduction strategies][strategy].

[diagonalisation]: <https://en.wikipedia.org/wiki/Cantor%27s_diagonal_argument>
[atom]: <https://www.classes.cs.uchicago.edu/archive/2015/spring/22620-1/atom-sig.html>
[sets]: <https://www.classes.cs.uchicago.edu/archive/2015/spring/22620-1/ord-set-sig.html>

[strategy]: <https://en.wikipedia.org/wiki/Lambda_calculus#Reduction_strategies>[
