(*Q1. Define abstract syntax for λ-let and λ-letrec as a SML datatype.*)

(*datatype expr
  = Var of Atom.atom | apply of expr * expr | lambda of Atom.atom * expr*)

datatype expr = Var of Atom.atom
            | apply of expr * expr
            | lambda of Atom.atom * expr;
type Lambda = expr;
(*datatype let_exp
  = Let of Atom.atom * let_exp * let_exp
  | Let_apply of let_exp * let_exp
  | Let_lambda of Atom.atom * let_exp
  | Let_var of Atom.atom*)
datatype let_exp = Let_var of Atom.atom
              |Let_apply of let_exp*let_exp
              |Let_lambda of Atom.atom * let_exp
              |Let of Atom.atom * let_exp * let_exp;

type lambda_let = let_exp;


(*ddatatype let_rec
  = let_rec_apply of let_rec * let_rec
  | let_rec_lambda of Atom.atom * let_rec
  | let_rec_var of Atom.atom
  | let_recur of Atom.atom * let_rec * let_rec*)
datatype let_rec = let_rec_var of Atom.atom
                  |let_rec_apply of let_rec*let_rec
                  |let_rec_lambda of Atom.atom*let_rec
                  |let_recur of Atom.atom*let_rec*let_rec;

type lambda_let_rec = let_rec;

(*Q2. Write the conversion λ-let to λ-calculus.*)

(* val let_to_lambda = fn : lambda_let -> Lambda *)
fun let_to_lambda ((Let_var(x)):lambda_let) = (Var(x):Lambda)
    |let_to_lambda ((Let_apply(x,y)):lambda_let) = (apply(let_to_lambda(x),let_to_lambda(y)):Lambda)
    |let_to_lambda ((Let_lambda(x,e)):lambda_let) = (lambda(x, let_to_lambda(e)):Lambda)
    |let_to_lambda ((Let(x,e1,e2)):lambda_let) = (apply(lambda(x,let_to_lambda(e2)),let_to_lambda(e1)):Lambda);