(* Review for fold and currying *)

val double = List.map (fn x => x * 2)
val removeZeros = List.filter (fn x => x <> 0)

val maxVal = List.foldl (fn (a, b) => if a > b then a else b) ~1
fun minVal xs = List.foldl (fn (a, b) => if a < b then a else b) 999999 xs