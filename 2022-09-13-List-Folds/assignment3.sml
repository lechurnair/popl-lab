(*Q1.  
*foldr : ('elem * 'summary -> 'summary) -> 'summary -> 'elem list -> 'summary
*foldl : ('elem * 'summary -> 'summary) -> 'summary -> 'elem list -> 'summary
*)
fun foldl f a [] = a
  | foldl f a (x::xs) = foldl f (f (x, a)) xs;

fun foldr f b [] = b
 |  foldr f b (x::xs) = f(x, foldr f b xs);

(*Q2. sum : int list -> int *)
fun add (x,y) = x+y;
fun sum xs = foldl add 0 xs

(*Q3 *)
(* b. val map_help = fn : ('a -> 'b) -> 'a * 'b list -> 'b list
      val map = fn : ('a -> 'b) -> 'a list -> 'b list *)
fun map_help f (x,y) = ((f x) :: y)
fun map f xs = foldr (map_help f) [] xs

(* c. val rev_help = fn : 'a * 'a list -> 'a list
      val rev_help = fn : 'a * 'a list -> 'a list *)
fun rev_help (x,y) = (x :: y)
fun reverse xs = foldl rev_help [] xs

(* a. val partch = fn
   : ('a -> bool) -> 'a * ('a list * 'a list) -> 'a list * 'a list
      val partition = fn : ('a -> bool) -> 'a list -> 'a list * 'a list*)
fun partch f (x,(y,z)) = if(f x) then (x::y, z) 
                        else (y,x::z)
fun partition f xs = foldl (partch f) ([],[]) xs


(* d. datatype 'a Find = Found of 'a | LookingFor of int
      val nth_help = fn : 'a * 'a Find -> 'a Find
      val nth_aux = fn : 'a list -> int -> 'a Find
      val nth = fn : 'a list -> int -> 'a option
*)

datatype 'a Find = LookingFor of int
                 | Found of 'a

fun nth_help ((x,LookingFor(n))) = if(n>1) then (LookingFor(n-1))
                    else Found(x)
    | nth_help (x,Found(n)) = Found(n) 

fun nth_aux ax n= foldl nth_help (LookingFor(n)) ax

fun nth ax n = case (nth_aux ax n) of
                  LookingFor(x) => NONE
                  | Found(x) => SOME x

(*nth [1,2,3,7,34,2] 5*)
