# Expression evaluator

Deadline: 4th October 2022, 11:59

1. Design a small programming language which consists of two things

    - An assignement of variables x := e
    - Printing an expresions value print e

    ```sml

    datatype Expr = Const of real
                   ....

    (* Expressions can either be

         1. Constant
         2. Variable
         3. Plus applied on two expressions
         4. Mul applied on two expressions

    *)
    datatype Stmt = ...

    (*
       1. Assignment
       2. Print statement
    *)


    type Program = Stmt list

    ```


2. Design an interpreter for the language by defining two functions.

	```sml

	val eval      : Env -> Expr -> real option
	    (* Evaluates an expression. The result is real option to take care of
		   cases when there are undefined variables *)
    val execute   : Env -> Stmt -> Env
	    (* Executes a single statement and returns the modified environment *)
	val interpret : Program -> unit
	    (* Run the program starting with an empty environment
		This is essentially a fold from the left.
		*)

	```

   Here the environment type `Env` is a key value pair with keys being
   [`Atom.atom`][atom] (we use atom instead of string for more
   efficient lookup) and values being `real`. The current environment
   gives the current bindings to different variables.  Use a the
   [`AtomMap`][atommap] data structure from the standard library
   for designing your environment.

   ```
   type Env = real AtomMap.map (* key is atom value is real *)
   ```


For documentation of the relevant data structure see:

# Bonus question.

Expressions now can have local bindings. Actual programming languages
have constructs like 'let' which introduce local bindings. An example
code in your hypothetical language would look some what like

```
x := 42
print (let x := 10 in x * x)
```


<https://www.classes.cs.uchicago.edu/archive/2015/spring/22620-1/smlnj-lib.html>

[atommap]: <https://www.classes.cs.uchicago.edu/archive/2015/spring/22620-1/ord-map-sig.html>
[atom]: <https://www.classes.cs.uchicago.edu/archive/2015/spring/22620-1/atom-sig.html>
