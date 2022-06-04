(* Homework 2 Tests produced by me *)

use "hw2provided.sml";

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

(* #2 a *)
val cc1 = card_color (Spades, Num 8) = Black
val cc2 = card_color (Hearts, Num 3) = Red

(* #2 b *)
val cv1 = card_value (Clubs, Num 9) = 9
val cv2 = card_value (Clubs, Ace) = 11

(* #2 c *)
val rc1 = remove_card ([(Hearts, Ace), (Hearts, Num 4)], (Hearts, Num 4), IllegalMove) = [(Hearts, Ace)]
val rc2 = remove_card ([(Spades, Ace), (Hearts, Num 8)], (Spades, Ace), IllegalMove) = [(Hearts, Num 8)]

(* #2 d *)
val asc1 = all_same_color [(Diamonds, Num 4), (Hearts, Ace), (Diamonds, Num 7)] = true
val asc2 = all_same_color [(Spades, Num 4), (Hearts, Ace), (Diamonds, Num 7)] = false

(* #2 e *)
val sc1 = sum_cards [(Clubs, Num 2),(Clubs, Num 9), (Spades, Ace)] = 22
val sc2 = sum_cards [(Clubs, Num 4)] = 4

(* #2 f *)
val s1 = score ([(Hearts, Num 2),(Clubs, Num 6)],11) = 3
val s2 = score ([(Spades, Num 2),(Diamonds, Num 7)], 8) = 3

(* #2 g *)
val o1 = officiate ([(Diamonds, King),(Clubs, Num 9),(Spades, Num 8)],[Draw, Discard((Diamonds, King)), Draw], 21) = 6
val o2 = officiate ([(Clubs, Num 2)],[Draw], 24) = 11

(* #3 a *)
val osc1 = officiate_challenge([(Diamonds, Ace),(Hearts, Ace), (Diamonds, Num 4)], [Draw, Draw, Draw], 20) = 7
val osc2 = officiate_challenge([(Spades, Num 5), (Diamonds, Num 4), (Hearts, Ace)], [Draw, Discard((Spades, Num 5)), Draw, Draw], 11) = 3

(* #3 b *)
val cp1 = careful_player([(Diamonds, Num 6), (Spades, Num 3), (Hearts, Num 4), (Spades, Ace)], 20)
val cp2 = careful_player([(Clubs, Queen), (Clubs, Num 5), (Hearts, Num 2)], 16)