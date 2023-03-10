 signature SORT = sig
 	type t
 	val sort : t list -> t list
 end

 signature ORD_KEY =
 sig
 	type ord_key
     (* abstract type of keys that have a total order *)

 	val compare : ord_key * ord_key -> order
     (* comparison function for the ordering on keys *)

 end (* ORD_KEY *)

(* a. val partch = fn
   : ('a -> bool) -> 'a * ('a list * 'a list) -> 'a list * 'a list
      val partition = fn : ('a -> bool) -> 'a list -> 'a list * 'a list*)
fun partch f (x,(y,z)) = if(f x) then (x::y, z) 
                        else (y,x::z)
fun partition f xs = foldl (partch f) ([],[]) xs

(*
functor QSort(O: sig
                   type ord_key
                   val compare : ord_key * ord_key -> order
                 end) :
             sig
               type t
               val sort : t list -> t list
             end
*)
functor QSort ( O : ORD_KEY ) : SORT = struct
 	type t = O.ord_key
    fun appender f (x,y) z = ((f x) @ z @ (f y))
    fun compbool x y  = O.compare(x,y) = GREATER
 	fun sort [] = []
        | sort (x::xs) = appender sort (partition (compbool x) xs) [x]
 end


structure IntOrd : ORD_KEY = struct
    type ord_key= int
    val compare = Int.compare
end

structure Insort = QSort(IntOrd)

Insort.sort [8,7,6,5,4,3,2,1]