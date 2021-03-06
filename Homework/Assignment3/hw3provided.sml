(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)

(* #1 *)
fun only_capitals(sl) = List.filter(fn s => Char.isUpper(String.sub(s, 0))) sl

(* #2 *)
fun longest_string1(sl) = List.foldl(fn (a, b) => if String.size a > String.size b then a else b) "" sl

(* #3 *)
fun longest_string2(sl) = List.foldl(fn (a, b) => if String.size a >= String.size b then a else b) "" sl

(* #4 *)
fun longest_string_helper(fcn) = List.foldl(fcn) ""
val longest_string3 = longest_string_helper (fn (a, b) => if String.size a > String.size b then a else b)
val longest_string4 = longest_string_helper (fn (a, b) => if String.size a >= String.size b then a else b)

(* #5 *)
val longest_capitalized = longest_string1 o only_capitals

(* #6 *)
fun rev_string(s) = (String.implode o List.rev o String.explode) s