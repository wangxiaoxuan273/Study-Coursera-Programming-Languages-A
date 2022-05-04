(* Lecture: Lists *)

val a = [3,4,5]

(* to construct a list of the same type *)
val b = 2::a

(* Accessing functions using three operations *)
(*null, hd, tl *)

(* list types: int list, bool list ... *)

fun sum_list(xs: int list) =
    if null xs
    then 0
    else hd xs + sum_list(tl xs)

fun countdown(x: int) = 
    if x=0
    then []
    else x::countdown(x-1)

fun append(xs: int list, ys: int list) =
    if null xs
    then ys
    else (hd xs) :: append((tl xs), ys)

(* factorial, naive implementation *)
fun fact_n(n: int) = 
    if n=0
    then 1
    else n * fact_n(n-1)

(* factorial, cool implementation *)
fun prod_list(xs: int list) = 
    if null xs
    then 1 (* IDK if this is okay *)
    else hd xs * prod_list(tl xs)

fun fact_c(n: int) = 
    prod_list(countdown(n))
