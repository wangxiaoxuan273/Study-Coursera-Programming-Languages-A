(* Homework 2 Tests produced by me *)

use "hw2.sml";

(* #1 a *)
val aeo1 = all_except_option ("string", ["cool"]) = NONE
val aeo2 = all_except_option ("string", ["nice", "string", "bool"]) = SOME ["nice", "bool"]

(* #1 b *)
val gs11 = get_substitutions1([["Susan", "Stella", "Coco"], ["Luisa", "Becky", "Barbie"], 
["Barbie", "Anna", "Elsa"]], "Barbie") = ["Luisa", "Becky", "Anna", "Elsa"]

val gs12 = get_substitutions1([["Camilo", "Dolores"], ["Camilo", "Antonio"], ["Mirabel", "Camilo"], 
["Pepa", "Felix"], ["Camilo", "Julieta"]], "Camilo") = ["Dolores", "Antonio", "Mirabel", "Julieta"]

(* #1 c *)
val gs21 = get_substitutions2([["Susan", "Stella", "Coco"], ["Luisa", "Becky", "Barbie"], 
["Barbie", "Anna", "Elsa"]], "Barbie") = ["Luisa", "Becky", "Anna", "Elsa"]

val gs22 = get_substitutions2([["Camilo", "Dolores"], ["Camilo", "Antonio"], ["Mirabel", "Camilo"], 
["Pepa", "Felix"], ["Camilo", "Julieta"]], "Camilo") = ["Dolores", "Antonio", "Mirabel", "Julieta"]

(* #1 d *)
val sn1 = similar_names ([["Mirabel","Mira"],["Mirabel","Bella"],["Mira","Mimi","M"]], {first="Mirabel", middle="U", last="Madrigal"}) =
[{first="Mirabel", middle="U", last="Madrigal"}, {first="Mira", middle="U", last="Madrigal"}, {first="Bella", middle="U", last="Madrigal"}]

val sn2 = similar_names ([["Lisa","Elizabeth"],["Elizabeth","Lizzy"],["Katherine","Kat","K"]], {first="Elizabeth", middle="J", last="Arden"}) =
	    [{first="Elizabeth", last="Arden", middle="J"}, {first="Lisa", last="Arden", middle="J"}, {first="Lizzy", last="Arden", middle="J"}]

