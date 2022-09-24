(* Homework 3 tests produced by me *)

use "hw3provided.sml";

(* #1 *)
val oc1 = only_capitals ["Susan", "was", "wonderful", "Julia", "loves", "her"] = ["Susan", "Julia"]
val oc2 = only_capitals ["She", "has", "two", "sisters", "Isabela", "and", "Luisa"] = ["She", "Isabela", "Luisa"]

(* #2 *)
val ls11 = longest_string1 ["Mirabel", "Camilo", "Antonio", "Dolores", "Julieta"] = "Mirabel"
val ls12 = longest_string1 ["Pepa", "Bruno", "Felix", "Isabela", "Luisa", "Agustin"] = "Isabela"

(* #3 *)
val ls21 = longest_string2 ["Mirabel", "Camilo", "Antonio", "Dolores", "Julieta"] = "Julieta"
val ls22 = longest_string2 ["Pepa", "Bruno", "Felix", "Isabela", "Luisa", "Agustin"] = "Agustin"

(* #4 *)
val ls31 = longest_string3 ["Mirabel", "Camilo", "Antonio", "Dolores", "Julieta"] = "Mirabel"
val ls32 = longest_string3 ["Pepa", "Bruno", "Felix", "Isabela", "Luisa", "Agustin"] = "Isabela"

val ls41 = longest_string4 ["Mirabel", "Camilo", "Antonio", "Dolores", "Julieta"] = "Julieta"
val ls42 = longest_string4 ["Pepa", "Bruno", "Felix", "Isabela", "Luisa", "Agustin"] = "Agustin"

(* #5 *)
val lc1 = longest_capitalized ["I", "am", "totally", "French", "But", "you", "are", "NOT"] = "French"
val lc2 = longest_capitalized ["You", "are", "Seriously", "only", "half", "Korean", "But", "I", "am", "not"] = "Seriously"

(* #6 *)
val rs1 = rev_string "dog" = "god"
val rs2 = rev_string "Susan" = "nasuS"

(* #7 *)
val fa1 = first_answer (fn x => if x mod 2 = 0 then SOME x else NONE) [1,2,3,4,5] = 2
val fa2 = first_answer (fn x => if String.size x > 4 then SOME x else NONE) ["Fei", "Jo", "Meg", "Amy", "Liz", "Maria", "Rose"] = "Maria"

(* #8 *)
val aa1 = all_answers (fn x => if x mod 2 = 0 then SOME [x, x+3] else NONE) [2,3,4,5,6,7] = NONE
val aa2 = all_answers (fn x => if x mod 2 = 0 then SOME [x, x+3] else NONE) [2,4,6] = SOME([2,5,4,7,6,9])

(* #9 a *)
val cw1 = count_wildcards (Variable("x")) = 0
val cw2 = count_wildcards (TupleP [Wildcard, Wildcard, Wildcard]) = 3

(* #9 b *)
val cwavl1 = count_wild_and_variable_lengths (Wildcard) = 1
val cwavl2 = count_wild_and_variable_lengths (ConstructorP ("lol", Variable("lol"))) = 3

(* #9 c *)
val csv1 = count_some_var ("123", ConstP(123)) = 0
val csv2 = count_some_var ("456", TupleP [Variable("xw"), Variable("456"), Variable("234"), Variable("456")]) = 2

(* #10 *)
val cp1 = check_pat (TupleP [Variable("H"), Variable("R"), Wildcard]) = true
val cp2 = check_pat (ConstructorP("na", TupleP [Variable("lol"), ConstP(14), Variable("lol")])) = false

(* #11 *)
val m1 = match (Tuple [Const(91), Const(18), Unit], TupleP [Variable("o"), ConstP(18), UnitP]) = SOME([("o", Const(91))])
val m2 = match (Constructor("q", Const(19)), ConstructorP("q", ConstP(87))) = NONE

(* #12 *)