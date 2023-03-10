(*Q1. Define an ML datatype expr that capture lambda calculus
expressions. Use the Atom module to represent variables.

datatype expr
  = Var of Atom.atom | apply of expr * expr | lambda of Atom.atom * expr
  *)
datatype expr = Var of Atom.atom
            | apply of expr * expr
            | lambda of Atom.atom * expr;

(*Write functions free : expr -> atom set and bound : expr -> atom set that computes free and bound variables in a given lambda
calculus expression respectively. You can use AtomSet structure
given by the signature ORD_SET
 a. val free = fn : expr -> AtomRedBlackSet.set *)
fun free (Var x) = AtomSet.singleton(x)
    | free (apply(e1,e2)) = let
    val s1 = free(e1)
    val s2 = free(e2)
in
       AtomSet.union(s1,s2)
end
    | free (lambda(a,e)) = let
    val s1 = (free(e))
    val s2 = AtomSet.subtract(s1,a)
in
    s2
end;

(*
val bound = fn : expr -> AtomRedBlackSet.set*)

fun bound (Var(x)) = AtomSet.empty
    | bound (apply(e1,e2)) = let
    val s1 = bound(e1)
    val s2 = bound(e2)
in
    AtomSet.union(s1,s2)
end
    | bound (lambda(a,e)) = let
    val s1 = bound(e)
    val s2 = AtomSet.intersection(s1,AtomSet.singleton(a))
in
    s2
end;

(*Q3. Write a function subst : expr -> atom -> expr -> expr, where
subst e₁ x e₂ substitutes in e₁ all free occurance of x by
e₂.
val subst = fn : expr -> Atom.atom -> expr -> expr
*)
fun subst (Var(a)) (x : Atom.atom) e1 = if (Atom.compare(x,a)=EQUAL) 
                                            then e1 else (Var(a))
    | subst (apply(e1,e2)) x e = let
    val s1 = subst e1 x e
    val s2 = subst e2 x e
in
    (apply(s1,s2))
end
    | subst (lambda(a,e1)) x e = if (Atom.compare(x,a)=EQUAL)
    then
    (lambda(a,e1))
    else (lambda(a,subst  e1 x e));

(*Q4. Write a function fresh : atom set -> atom which computes a fresh
variable name given a set of variables.

*)

(*val MakeLess = fn : char list -> string*)
fun MakeLess (x::xs) = String.implode(xs)
    |MakeLess [] = "";

(*val diagonalize = fn : string -> string -> string*)
fun diagonalize "" "" = "a"
    |diagonalize "" str = let 
        val s1 = String.explode(str)
        val s2 = String.explode("a")
    in
        if (List.nth(s1,0) = List.nth(s2,0)) then "b"
        else "a"
    end
    |diagonalize str "" = str
    |diagonalize s1 s2 = let
        val x1 = String.explode(s1)
        val x2 = String.explode(s2)
    in 
        if (List.nth(x1,0) = List.nth(x2,0)) then String.implode(List.nth(x2,0)::String.explode(diagonalize (MakeLess x1) (MakeLess x2)))
        else s1
    end;


(*val diagA = fn : string -> atom -> string*)
fun diagA s a = diagonalize s (Atom.toString(a));

(*val uncurry = fn : ('a -> 'b -> 'c) -> 'b * 'a -> 'c*)
fun uncurry f(x,y) = f y x;

(*
val fresh = fn : AtomRedBlackSet.set -> atom
*)
fun fresh (x) = Atom.atom(AtomSet.foldl (uncurry diagA) "" x);

val x = AtomSet.fromList([Atom.atom("a"),Atom.atom("b"),Atom.atom("aa"), Atom.atom("hhs"),Atom.atom("sjjn")]);
val y = fresh x;
 Atom.toString(y)