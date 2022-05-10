(* Tests for Assignment 1 made by me *)

(* #1 Tests *)
val d1 = (2022, 5, 28)
val d2 = (2023, 3, 21)
val d3 = (1981, 12, 7)

val io1 = is_older(d1, d2) (* true *)
val io2 = is_older(d2, d3) (* false *)
val io3 = is_older(d3, d1) (* true *)

(* #2 Tests *)
val d4 = (2021, 5, 8)
val d5 = (2029, 6, 15)
val dl1 = [d1, d2, d3, d4, d5]
val nim1 = number_in_month(dl1, 5) (* 2 *)
val nim2 = number_in_month(dl1, 7) (* 0 *)
val nim3 = number_in_month(dl1, 12) (* 1 *)

(* #3 Tests *)
val nims1 = number_in_months(dl1, [3, 5, 6]) (* 4 *)
val nims2 = number_in_months(dl1, [12, 3]) (* 2 *)