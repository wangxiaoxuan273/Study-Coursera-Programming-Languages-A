(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

(* #1 a *)
fun all_except_option(s, sl) = 
   let
      fun all_except(s, sl, lst) = 
         case sl of 
            [] => NONE
            | x :: xs' =>  if same_string(x, s)
                           then SOME (lst @ xs')
                           else all_except(s, xs', lst @ [x])
   in
      all_except(s, sl, [])
   end


(* #1 b *)
fun get_substitutions1(sll, s) = 
   let
      fun gs1(sls, st, res) = 
         case sls of 
            [] => res
            | x::xs => case all_except_option(st, x) of
                        NONE => gs1(xs, st, res)
                        | SOME(xt) => xt @ gs1(xs, st, res)
   in
      gs1(sll, s, [])
   end

(* #1 c *)
fun get_substitutions2(sll, s) = 
   let
      fun gs2(sls, st, res) = 
         case sls of
            [] => res
            | x::xs => case all_except_option(st, x) of
                     NONE => gs2(xs, st, res)
                     | SOME(xt) => gs2(xs, st, res @ xt)
   in
      gs2(sll, s, [])
   end

(* #1 d *)
fun similar_names(sll, fullname) =
   let
      val {first=f,middle=m,last=l} = fullname
      fun sn(slt, res) =
         case slt of 
            [] => res
            | x::xs => {first=x, middle=m, last=l}::sn(xs, res)
   in
      fullname::sn(get_substitutions2(sll, f), [])
   end















(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)