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

(* #4 *)
fun dates_in_month(dates: (int*int*int) list, month: int) =
    let
        fun is_in_month(date: int*int*int) = 
            if (#2 date) = month then true else false
        fun get_list(dates: (int*int*int) list) =
                if null dates
                then []
                else
                    if is_in_month(hd dates)
                    then hd dates :: get_list(tl dates)
                    else get_list(tl dates)
    in
        get_list(dates)
    end

(* #5 *)
fun dates_in_months(dates: (int*int*int) list, months: int list) = 
    if null months
    then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)

(* #6 *)
fun get_nth(xs: string list, n: int) = 
    if n = 1
    then hd xs
    else get_nth(tl xs, n-1)

(* #7 *)
fun date_to_string(date: int*int*int) =
    let
        val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    in
        get_nth(months, #2 date) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)
    end

(* #8 *)
fun number_before_reaching_sum(sum: int, xs: int list) =
    if sum <= hd xs
    then 0
    else 1 + number_before_reaching_sum(sum - hd xs, tl xs)

(* #9 *)
fun what_month(day: int) = 
    let
        val days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
        1 + number_before_reaching_sum(day, days)
    end

(* #10 *)
fun month_range(d1: int, d2: int) = 
    if d1 > d2 
    then []
    else what_month(d1) :: month_range(d1+1, d2)

(* #11 *)
fun oldest(dates: (int*int*int) list) =
    if null dates
    then NONE
    else
        let 
            fun get_oldest(dates: (int*int*int) list, oldest: int*int*int) = 
                if null dates
                then oldest
                else
                    if is_older(hd dates, oldest)
                    then get_oldest(tl dates, hd dates)
                    else get_oldest(tl dates, oldest)
        in
            SOME(get_oldest(dates, hd dates))
        end