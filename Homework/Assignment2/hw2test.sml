(* Homework 2 Tests produced by me *)

use "hw2.sml";

(* #1 a *)
val aeo1 = all_except_option ("string", ["cool"]) = NONE
val aeo2 = all_except_option ("string", ["nice", "string", "bool"]) = SOME ["nice", "bool"]