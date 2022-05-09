(* List Review :p *)

(* #1, sum_list, returns an integer *)
fun sum_list(xs: int list) = 
    if null xs
    then 0
    else hd xs + sum_list(tl xs)

val xs1 = [1, 3, 5, 7]
val s1 = sum_list(xs1)

(* #2, count_down, returns a list of int *)
fun count_down(x: int) = 
    if x = 1 (* alternatively: x = 0, [] *)
    then [1]
    else x :: count_down(x-1)

val cd1 = count_down(5)

(* #2.5, double_list, returns a list of int *)
fun double_list(xs: int list) = 
    if null xs
    then []
    else (hd xs * 2) :: double_list(tl xs)

val d1 = double_list(xs1)
val xs2 = [1, 1, 1, 2]
val d2 = double_list(xs2)

(* #2.7, in_the_list, returns a bool *)
fun in_the_list(x: int, xs: int list) =
    if null xs
    then false
    else (hd xs = x) orelse in_the_list(x, tl xs) 

val in1 = in_the_list(5, xs1) (* this one is wonderful and 
makes me really happy :) *)

(* #2.9, not_in_the_list, returns a bool *)
fun not_in_the_list(x: int, xs: int list) =
    if null xs
    then true
    else (hd xs <> x) andalso not_in_the_list(x, tl xs) 

val nin1 = not_in_the_list(9, xs1)
val nin2 = not_in_the_list(5, xs1)

(* #3, append, returns one list of int *)
fun append(xs: int list, ys: int list) = 
    if null xs
    then ys
    else hd xs :: append(tl xs, ys)

val xs3 = append(xs1, xs2)
