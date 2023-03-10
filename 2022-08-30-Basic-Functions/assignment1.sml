
(*Q1. Three function curry and uncurry
 * curry   : ('a * 'b * 'c -> 'd) -> ('a -> 'b -> 'c -> 'd)
 * uncurry : ('a -> 'b -> 'c -> d) -> ('a * 'b * 'c -> 'd)
 *)

fun curry f a b c = f(a,b,c);
fun uncurry f(a,b,c) = f a b c;





(*Q2 Project couple into its components
 * fst : 'a * 'b -> 'a
 * snd : 'a * 'b -> 'b
 *)

fun fst(a,b) = a;
fun snd(a,b) = b;





(*Q3 length function for lists
 * length : 'a list -> int
 *)

fun length [] = 0
    | length(x::xs) = 1 + length xs;





(*Q4 reverse a list
 * reverse : 'a list -> 'a list
 *)
 
fun callf (x::xs) []= callf xs (x::[])
    | callf (x::xs) ys =callf xs (x::ys)
    | callf [] ys = ys;
fun reverse xs = callf xs [];





(*Q5 nth element in the Fibonacci sequence
 * fib : int -> int
 *)

fun fibhelp a b 0 = b
    | fibhelp a b n =fibhelp (a+b) a (n-1);
fun fib a =fibhelp 1 0 a;








