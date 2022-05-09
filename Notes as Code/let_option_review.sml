(* Review for Let expression and Options *)

(* #1: count-up *)
fun count_up(x: int) = 
    let fun count_from(from: int) = 
        if from = x
        then [x]
        else from :: count_from(from+1)
    in
        count_from(1)
    end

val n = 6;
val cu1 = count_up(6)

(* #2: max_in_list *)
fun max_in_list(xs: int list) =
    if null xs
    then NONE
    else 
        let fun max_nonempty(xs: int list) = 
            if null (tl xs)
            then hd xs
            else 
                let val max_in_rest = max_nonempty(tl xs)
                in 
                    if hd xs > max_in_rest
                    then hd xs
                    else max_in_rest
                end
        in
            SOME (max_nonempty(xs))
        end

val l1 = [3, 7, 2, 4, 4, 1, 6]
val m1 = max_in_list(l1)
val m2 = max_in_list([])