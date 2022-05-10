(* Assignment 1 *)

(* #1 *)
fun is_older (date1: int*int*int, date2: int*int*int) =
    if (#1 date1) < (#1 date2)
    then true
    else if (#1 date1) = (#1 date2) andalso (#2 date1) < (#2 date2)
    then true
    else if (#1 date1) = (#1 date2) andalso (#2 date1) = (#2 date2) andalso (#3 date1) < (#3 date2)
    then true
    else false

(* #2 *)
fun number_in_month(dates: (int*int*int) list, month: int) =
    let
        fun is_in_month(date: int*int*int) = 
            if (#2 date) = month then 1 else 0
    in
        if (null dates)
        then 0
        else is_in_month(hd dates) + number_in_month(tl dates, month)
    end

(* #3 *)
fun number_in_months(dates: (int*int*int) list, months: int list) = 
    if null months
    then 0
    else number_in_month(dates, hd months) + number_in_months(dates, tl months)

(* 4 *)