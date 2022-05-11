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
val test_dim1 = dates_in_month(dl1, 5) = [(2022,5,28),(2021,5,8)]
val test_dim2 = dates_in_month(dl1, 9) = []

(* #5 Tests *)
val test_dims1 = dates_in_months(dl1, [3, 6]) = [(2023,3,21),(2029,6,15)]
val test_dims2 = dates_in_months(dl1, [5]) = [(2022,5,28),(2021,5,8)]

(* #6 Tests *)
val test_gn1 = get_nth(sl1, 3) = "Erika"
val test_gn2 = get_nth(sl1, 5) = "Rebecca"