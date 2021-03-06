(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

(* #1 a *)
fun all_except_option (s,xs) =
  case xs of
      [] => NONE
      | x::xs' => if same_string(s,x)
                  then SOME xs'
                  else case all_except_option(s,xs') of
                        NONE => NONE
                        | SOME y => SOME(x::y)

(* #1 b *)
fun get_substitutions1 (substitutions,str) =
    case substitutions of
	      [] => []
         | x::xs => case all_except_option(str,x) of
		               NONE => get_substitutions1(xs,str)
		               | SOME y => y @ get_substitutions1(xs,str)

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

(* #2 a *)
fun card_color(c) = 
   case c of 
      (Clubs, _) => Black
      | (Spades, _) => Black
      | (Diamonds, _) => Red
      | (Hearts, _) => Red

(* #2 b *)
fun card_value(c) = 
   case c of
      (_, Num(i)) => i
      | (_, Ace) => 11
      | _ => 10

(* #2 c *)
fun remove_card(cs, c, e) =
   case cs of
      [] => raise e
      | x::xs => if c = x then xs else x::remove_card(xs, c, e)

(* #2 d *)
fun all_same_color(cs) = 
   case cs of 
      [] => true
      | x ::[] => true
      | head::(neck::rest) => (card_color(head) = card_color(neck) andalso all_same_color (neck::rest))

(* #2 e *)
fun sum_cards(cs) =
   let
     fun sum_num(cs, res) = 
         case cs of
            [] => res
            | x::xs => sum_num(xs, card_value(x)+res)
   in
     sum_num(cs, 0)
   end

(* #2 f *)
fun score(cs, goal) =
   let
     val sum_score = sum_cards(cs)
     val pre_score = if sum_score > goal 
                     then 3 * (sum_score - goal)
                     else (goal - sum_score)
   in
     if all_same_color(cs) then pre_score div 2 else pre_score
   end

(* #2 g *)
fun officiate(cs, mv, goal) = 
   let
     fun play(cards, moves, holds) = 
         case moves of
            [] => score(holds, goal)
            | m::ms => case m of
                  Discard p => play(cards, ms, remove_card(holds, p, IllegalMove))
                  | Draw => case cards of 
                              [] => score(holds, goal)
                              | c::cds => if sum_cards(c::holds) > goal
                                         then score(c::holds, goal)
                                         else play(cds, ms, c::holds)
   in
     play(cs, mv, [])
   end

(* #3 a *)
fun num_aces(cs) = 
   case cs of 
      [] => 0
      | c::cs' => case c of 
                  (_, Ace) => 1 + num_aces(cs')
                  | _ => num_aces(cs')

fun get_sums(num, sum_score) =
   if num = 0 then [sum_score] else (sum_score - num * 10) :: get_sums(num-1, sum_score)

fun score_challenge(holds, goal) =
   let
      fun sum_to_score(sum_score, holds, goal) =
         let
            val pre_score = if sum_score > goal 
                           then 3 * (sum_score - goal)
                           else (goal - sum_score)
         in
            if all_same_color(holds) then pre_score div 2 else pre_score
         end
      val regular_sum = sum_cards(holds)
      val all_possible_sums = get_sums(num_aces(holds), regular_sum)
      fun get_min_score(sums, minVal) =
         case sums of
            [] => minVal
            | s :: sc' => 
               let
                  val final_score = sum_to_score(s, holds, goal)
               in
                  if final_score < minVal then get_min_score(sc', final_score) else get_min_score(sc', minVal)
               end   
   in
      get_min_score(all_possible_sums, regular_sum + 50) (* a big value to start with *)
   end

fun officiate_challenge(cs, mv, goal) =
   let
     fun all_sums_exceed(holds, goal) =
      let
         fun loop(sums, goal) =
            case sums of
            [] => true
            | s :: sm' => s > goal andalso loop(sm', goal)
      in
         loop(get_sums(num_aces(holds), sum_cards(holds)), goal)
      end
     fun play(cards, moves, holds) = 
         case moves of
            [] => score_challenge(holds, goal)
            | m::ms => case m of
                  Discard p => play(cards, ms, remove_card(holds, p, IllegalMove))
                  | Draw => case cards of 
                              [] => score_challenge(holds, goal)
                              | c::cds => if all_sums_exceed(c::holds, goal)
                                         then score_challenge(c::holds, goal)
                                         else play(cds, ms, c::holds)
   in
     play(cs, mv, [])
   end

(* #3 b *)
fun careful_player(cs, goal) = 
   let
      fun may_get_zero(card, holds, goal) = 
         case holds of 
            [] => NONE
            | h :: hd  => if sum_cards(holds) + card_value(card) - card_value(h) - goal = 0
                          then SOME(h)
                          else may_get_zero(card, hd, goal - card_value(h))

      fun play(cs, holds) =
         if score(holds, goal) = 0
         then []
         else
            case cs of
               [] => []
               | c :: rest => if goal - sum_cards(holds) >= 10
                              then Draw :: play(rest, c::holds)
                              else case may_get_zero(c, holds, goal) of
                                       SOME(cd) => Discard(cd) :: Draw :: []
                                       (* if NONE, the strategy is to discard the first card in holds when holds is not empty *)
                                       | NONE => case holds of 
                                                   [] => []
                                                   | h :: _ => Discard(h) :: play(cs, remove_card(holds, h, IllegalMove))
   in
      play(cs, [])
   end