(* Assignment 1 *)

(* #1 *)
(* create some bindings to test the function *)
val d1 = (2022, 5, 28)
val d2 = (2023, 3, 21)
val d3 = (1981, 12, 7)

fun is_older (date1: int*int*int, date2: int*int*int) =
    if (#1 date1) > (#1 date2)
    then true
    else if (#2 date1) > (#2 date2)
    then true
    else if (#3 date1) > (#3 date2)
    then true
    else false

(* #2 *)
val dl1 = [d1, d2, d3]

fun is_in_month(date: int*int*int, month: int) = 
    if (#2 date) = month
    then true
    else false

fun number_in_month(dates: (int*int*int) list, month: int) = 
    if is_in_month(hd dates, month)
    then 1+number_in_month(tl dates, month)
    else number_in_month(tl dates, month)

