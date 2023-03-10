(* Q1. map : ('a -> 'b) -> 'a list -> 'b list
* map f [x1, x2,....,xn] = [f x1, f x2, ... f xn] *)

fun map f([]) = [] 
  | map f(x::xs) = (f(x)::map f(xs));

(* Q2.datatype 'a tree = emptytree | node of 'a tree * 'a * 'a tree*
* singleton : 'a -> 'a tree *)

datatype 'a tree = emptytree
                 |node of 'a tree * 'a * 'a tree;
fun singleton x = (node(emptytree, x, emptytree));


(*Q3. treemap : ('a -> 'b) -> 'a tree -> 'b tree *)

fun treemap f(emptytree) = emptytree
  | treemap f(node (left,root,right)) = node ( treemap f(left), f(root) , treemap f(right));
 
(*Q4. Traversal of tree
* inorder : 'a tree -> 'a list
* preorder : 'a tree -> 'a list
* postorder : 'a tree -> 'a list
*)

fun inorder emptytree = []
  | inorder (node(l,root,r)) = inorder l @ [root] @ inorder r;

fun preorder emptytree = []
  | preorder (node(l,root,r)) = (root:: preorder l @ preorder r);

fun postorder emptytree = []
  | postorder (node(l,root,r)) = (postorder l @ postorder r @ [root]);

(*Q5. rotate clockwise function for binary trees
* rotclock : 'a tree -> 'a tree *)

fun rotclock (node(node(llt,lroot,lrt),root,rt)) =
  (node(rt,root,node(llt,lroot,lrt)))
  |rotclock x = x;
