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