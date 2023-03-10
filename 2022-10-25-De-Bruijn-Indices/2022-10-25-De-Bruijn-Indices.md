# De Bruijn indices for lambda calculus.

The representation of λ-calculus we saw before is called the "first
order representation". Another approach to representing lambda
calculus is the De Bruijn representation.

In this exercise, we look at a "name-less" representation of
λ-calculus terms called the De Bruijn representation. In the De Bruijn
representation, bound variables are represented by what are know as De
Bruijn indices which counts the number of λ's you need to "jump over"1
to reach the variable site.

1. λ x . x  is represented as λ 1

2. λ x . λ y . x is represented as λ λ 2

3. λ x . x (λ y. x) is represented as λ . 1 (λ . 2)

The third example in instructive. At the first site where x occurs, it
is numbered 1 because the "distance" to the binding λ is 1, where as at the
inner site it is numbered 2 (It has to go up the lambda chain two times for it
to reaching its binding quantifier).


Assume that you are interested in only capturing closed λ calculus
expressions, i.e λ calculus expressions with no free variables.


1. Capture the De Bruijn representation of lambda calculus as a SML
   data type.

2. Write a program to convert from De Bruijn index to the first order
   representation of lambda calculus expression.


# Bonus question (Un graded).

1. How will you capture general lambda calculus expressions using De Bruijn
   indices.

2. Give a program to convert from first order representation to De
   Bruijn representation and vice-versa for this representation.
