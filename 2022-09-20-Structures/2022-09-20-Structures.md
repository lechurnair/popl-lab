# Structures and functors.

Deadline: 27 September 2022

One of the most powerful abstraction feature in standard ML is the
module subsystem. This assignment consists of two parts. In the class
work (to be done during the lab) you will try out the [modules
tutorial][mod-tutorial] and solve the following assignment for the next
lab

## Quick sort

1. Write the quick sort algorithm as a functor that takes the ordering
   through its input structure O (see below).

   <https://www.classes.cs.uchicago.edu/archive/2015/spring/22620-1/smlnj-lib.html>

   ```
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


	functor QSort ( O : ORD_KEY ) : SORT = struct
		type t = ...
		fun sort ....

	end

	```

	The [ORD_KEY][ord-key] signature is a standard signature that is used
	in defining various data structures like [ordered map][ord-map] and
	[set][ord-set].

2. Define a structure `IntOrd` by making use of the `Int.compare`
   function. Use this to instantiate the QSort functor and get an
   algorithm to sort list of integers.

[mod-tutorial]:<../examples/sml/modules-tutorial.sml>
[ord-key]: <https://www.classes.cs.uchicago.edu/archive/2015/spring/22620-1/ord-key-sig.html>
[ord-map]: <https://www.classes.cs.uchicago.edu/archive/2015/spring/22620-1/ord-map-sig.html>
[ord-set]: <https://www.classes.cs.uchicago.edu/archive/2015/spring/22620-1/ord-set-sig.html>
