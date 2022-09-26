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
val only_capitals = List.filter(fn s => Char.isUpper(String.sub(s, 0)))

(* #2 *)
val longest_string1 = List.foldl(fn (a, b) => if String.size a > String.size b then a else b) ""

(* #3 *)
val longest_string2 = List.foldl(fn (a, b) => if String.size a >= String.size b then a else b) ""

(* #4 *)
fun longest_string_helper(fcn) = List.foldl(fn (a, b) => if fcn (String.size a, String.size b) then a else b) ""
val longest_string3 = longest_string_helper (fn (a, b) => a > b)
val longest_string4 = longest_string_helper (fn (a, b) => a >= b)

(* #5 *)
val longest_capitalized = longest_string1 o only_capitals

(* #6 *)
val rev_string = String.implode o List.rev o String.explode

(* #7 *)
fun first_answer fcn xs = 
	case xs of [] => raise NoAnswer
			   | x :: xs' => case fcn(x) of
							SOME(y) => y
						  | NONE => first_answer fcn xs'

(* #8 *)
fun all_answers fcn xs = 
let
	fun accumulate(lst, acc) = case lst of [] => SOME(acc) 
										| x :: xs' => case fcn x of NONE => NONE
																| SOME(y) => accumulate(xs', acc @ y)
in
	case xs of [] => SOME([]) 
			| x :: xs' => accumulate(xs, [])
end			

(* #9 a *)
val count_wildcards = g (fn () => 1) (fn _ => 0)

(* #9 b *)
val count_wild_and_variable_lengths = g (fn () => 1) String.size

(* #9 c *)
fun count_some_var(s, p) = g (fn () => 0) ((fn s => fn x => if s = x then 1 else 0) s) p

(* #10 *)
fun check_pat p = 
let
  fun get_list p = case p of
	    Variable x        => [x]
	  | TupleP ps         => List.foldl(fn (a,b) => get_list(a) @ b) [] ps
	  | ConstructorP(_,p) => get_list(p)
	  | _                 => []
  fun no_repeats lst = case lst of
		[] => true
	  | x :: xs' => no_repeats xs' andalso not (List.exists (fn (a) => a = x) xs')
in
  no_repeats (get_list p)
end

(* #11 *)
fun match (v, p) = case (v, p) of
	  (Unit, UnitP) => SOME([])
	| (_, Wildcard) => SOME([])
	| (someV, Variable var) => SOME[(var, someV)]
	| (Const(n1), ConstP(n2)) => if n1 = n2 then SOME([]) else NONE
	| (Tuple(vs), TupleP(ps)) => if List.length vs = List.length ps then all_answers match (ListPair.zip(vs, ps)) else NONE
	| (Constructor(s1, v'), ConstructorP(s2, p')) => if s1 = s2 then match (v', p') else NONE
	| _ => NONE

(* #12 *)
fun first_match v lsp = 
	SOME (first_answer (fn p => match(v, p)) lsp) 
	handle NoAnswer => NONE

(* I gave up trying the challenge problem as it is overly complex *)