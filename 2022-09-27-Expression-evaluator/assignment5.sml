(*datatype expr
  = Constant of real
  | Mul of expr * expr
  | Plus of expr * expr
  | Var of string*)
datatype expr = Constant of real
                    | Plus of expr *  expr
                    | Mul of  expr * expr
                    | Var of string;


(*datatype stmt = Assignment of expr * expr | Print of expr *)
datatype stmt = Print of expr
                | Assignment of expr * expr;

type Program = stmt list

(*val add = fn : real option -> real option -> real option*)
fun add (SOME(a:real)) (SOME(b:real)) = SOME(a+b)
    |add _ _ = NONE;
(*val mul = fn : real option -> real option -> real option*)
fun mul (SOME(a:real)) (SOME(b:real)) = SOME(a*b)
    | mul _ _ = NONE;

type Env = real AtomRedBlackMap.map;



(*val eval = fn : Env -> expr -> real option*)
fun eval (env:Env) (Constant(a))  = SOME(a)
  | eval (env:Env) (Var(x)) = AtomMap.find(env, (Atom.atom(x)))
  | eval (env:Env) (Plus(x,y)) = let
      val a = eval env x
      val b = eval env y
  in
      add a b
  end
  | eval (env:Env) (Mul(x,y)) = let
      val a = eval env x
      val b = eval env y
  in
      mul a b
  end;



(*helper function for print in execute
   val printer = fn : real option -> unit  *)
fun printer (SOME(x)) = print(Real.toString(x)^"\n")
    | printer (NONE) = print ("\n");

(* Add a variable to domain*)
fun Varcheck (env:Env) x (SOME(a)) = AtomMap.insert(env,x,a)
    | Varcheck (env:Env) x _ = env;

(*val execute = fn : Env -> stmt -> Env*)
fun execute (env:Env) (Print(x)) = let
        val toprint = eval env x
        val x = printer toprint
    in
        env
    end
    |execute (env:Env) (Assignment((Var(x)) ,y)) = let
        val a = eval env (Var(x))
    in
        Varcheck env (Atom.atom(x)) a 
    end
    |execute (env:Env) _ = env;

fun help f(stm,env) = f env stm;


(*val interpret = fn : Program -> unit*)
fun interpret (p:Program) = let
        val a = foldl (help(execute)) (AtomMap.empty) p
    in
        ()
    end;
