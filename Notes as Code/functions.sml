val x = 7

(* This works only for positive integers *)
fun pow(x: int, y: int) = 
    if y=0
    then 1
    else x * pow(x, y-1)

fun cube(x: int) = 
    pow(x, 3)

val sixtyfour = cube(4)

val fortytwo = pow(6, 2) + 6

(* Lecture: functions, informally *)