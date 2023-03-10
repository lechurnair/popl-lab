(* Q1.
The unification algorithm should work for any arbitrary
signature. Parameterisation of signatures is done by making use
of modules of type SIGNATURE.

  signature SIGNATURE =
  sig
    type symbol
    val compare : symbol * symbol -> order
    val arity : symbol -> int
  end
*)
signature SIGNATURE =
sig
  type symbol
  val compare: symbol*symbol->order
  val arity: symbol->int
end

(*Q2.

structure TypeSign : SIGNATURE

Individually compiling:
val compare = fn : symbol * symbol -> order
val toInt = fn : symbol -> int
val arity = fn : symbol -> int
datatype symbol = ARROW | BOOL | INT
*)

structure TypeSign: SIGNATURE = 
struct
    datatype symbol = INT | BOOL | ARROW
    fun arity INT = 0
        |arity BOOL = 0
        |arity ARROW = 2
    fun toInt INT = 0
        |toInt BOOL = 1
        |toInt ARROW = 2
    fun compare ((s1 : symbol),(s2 : symbol)) = (Int.compare((toInt s1),(toInt s2)))
end

(*signature Var =
  sig
    type var
    val fresh : unit -> var
    val toString : var -> string
    val compare : var * var -> order
  end
*)
signature VAR = sig
    type var
    val fresh : unit->var
    val toString: var->string
    val compare: var*var -> order
end

structure UniVar : Var = S
struct
  decls
end


functor Unify (S:SIGNATURE, V:VAR) = struct
    datatype term = Var of V.var
                    |apply of S.symbol * term list
    type telescope = term AtomMap.map
end