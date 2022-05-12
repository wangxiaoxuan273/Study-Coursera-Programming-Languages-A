(* Tests for Assignment 1 made by me *)

val d1 = (2022, 5, 28)
val d2 = (2023, 3, 21)
val d3 = (1981, 12, 7)
val d4 = (2021, 5, 8)
val d5 = (2029, 6, 15)
val dl1 = [d1, d2, d3, d4, d5]

val s1 = "Anna"
val s2 = "Lucila"
val s3 = "Erika"
val s4 = "Amber"
val s5 = "Rebecca"
val sl1 = [s1, s2, s3, s4, s5]

val il1 = [1, 3, 5, 7, 9, 11]
val il2 = [1, 4, 9, 16, 25]

(* #1 Tests *)
val test_io1 = is_older(d1, d2)
val test_io2 = not (is_older(d2, d3))
val test_io3 = is_older(d3, d1)

(* #2 Tests *)
val test_nim1 = number_in_month(dl1, 5) = 2
val test_nim2 = number_in_month(dl1, 7) = 0
val test_nim3 = number_in_month(dl1, 12) = 1

(* #3 Tests *)
val test_nims1 = number_in_months(dl1, [3, 5, 6]) = 4
val test_nims2 = number_in_months(dl1, [12, 3]) = 2

(* #4 Tests *)
val test_dim1 = dates_in_month(dl1, 5) = [(2022, 5, 28),(2021, 5, 8)]
val test_dim2 = dates_in_month(dl1, 9) = []

(* #5 Tests *)
val test_dims1 = dates_in_months(dl1, [3, 6]) = [(2023, 3, 21),(2029, 6, 15)]
val test_dims2 = dates_in_months(dl1, [5]) = [(2022, 5, 28),(2021, 5, 8)]

(* #6 Tests *)
val test_gn1 = get_nth(sl1, 3) = "Erika"
val test_gn2 = get_nth(sl1, 5) = "Rebecca"

(* #7 Tests *)
val test_dts1 = date_to_string(d3) = "December 7, 1981"
val test_dts2 = date_to_string(d5) = "June 15, 2029"

(* #8 Tests *)
val test_nbrs1 = number_before_reaching_sum(24, il1) = 4
val test_nbrs2 = number_before_reaching_sum(15, il2) = 3

(* #9 Tests *)
val test_wm1 = what_month(35) = 2
val test_wm2 = what_month(251) = 9

(* #10 Tests *)
val test_mr1 = month_range(58, 63) = [2, 2, 3, 3, 3, 3]
val test_mr2 = month_range(270, 274) = [9, 9, 9, 9, 10]

(* #11 Tests *)
val test_o1 = oldest([(2019, 12, 24),(2019, 3, 3),(2019, 4, 18)]) = SOME (2019, 3, 3)
val test_o2 = oldest(dl1) = SOME (1981, 12, 7)