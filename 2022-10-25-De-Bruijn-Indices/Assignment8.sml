datatype expr = Var of Atom.atom
            | apply of expr * expr
            | lambda of Atom.atom * expr;
type Lambda = expr;

datatype db = DBVar of int
             |DBapply of db*db
             |DBlambda of db;

open Int;


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

(*val DBtoL = fn : db -> Atom.atom list -> expr*)
fun DBtoL (DBVar(x)) xs = Var(List.nth(xs, (x-1)))
   |DBtoL (DBapply(x,y)) xs = apply(DBtoL(x) xs, DBtoL(y) xs)
   |DBtoL (DBlambda(e)) xs = lambda((fresh (AtomSet.fromList(xs))), (DBtoL e (fresh(AtomSet.fromList(xs))::xs)))

fun LambdaPrint (Var(x)) = print(Atom.toString(x))
    |LambdaPrint (apply(x,y)) = (print("apply of ");LambdaPrint (x);print(" ");LambdaPrint(y))
    |LambdaPrint (lambda(x,e)) = (print("Lambda");LambdaPrint(Var(x));print(".");LambdaPrint(e))

LambdaPrint(DBtoL (DBlambda(DBlambda(DBapply(DBlambda(DBVar(1)),DBVar(1))))) [Atom.atom("x")])