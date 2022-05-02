(* This is a comment. This is our first program. *)

val x = 34;
(* static environment: x : int *)
(* dynamic environment: x --> 34 *)

val y = 17;
(* static environment: x : int, y : int *)
(* dynamic environment: x --> 34, y --> 17 *)

val abs_of_y = if y < 0 then 0 - y else y;
(* dynamic environment: ... *)

val abs_of_y_using_func = abs y;

(* Lecture 1.1 ML Variable Bindings and Expressions *)