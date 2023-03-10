# Unification algorithm.

This assignment is about unification algorithm. Being an algorithm
that is applicable in many symbolic programming tasks we would like it
to be as generic as possible (i.e the algorithm should be "parametric" over the
signature).

Note: Unfortunately the SML concept of `signature` conflict with our
      terminology of a signature being a set of functional symbols
      together with arity. We will there for use the terminology
      module and module types for referring to `structure` and
      `signature` in Standard ML.


1. The unification algorithm should work for any arbitrary
   signature. Parameterisation of signatures is done by making use
   of modules of type SIGNATURE.

         signature SIGNATURE = sig

           type symbol   (* This type captures the symbols of the signature *)
           val arity   : symbol -> int
           val compare : symbol * symbol -> order  (* So that you can use it during unification *)

         end (* module type SIGNATURE *)

2. What would be the `module` of type `SIGNATURE` that one would use
   for type checking where the base types are booleans and integers.


         struct TypeSig : SIGNATURE = struct

		  ....

		 end

3. The unification algorithm should then be defined as a `functor
   Unify` taking the input signature S, i.e a module of module type
   SIGNATURE, and capturing the unification algorithm for it.

         functor Unify (S : SIGNATURE) = struct

            datatype term = VAR of Atom.atom
                          | ...


         end (* The module Unify S should give the unificaiton algorithm for the sig
