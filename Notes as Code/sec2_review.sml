(* Section 2 Review *)

(* write a reverse list function that uses an accumulator *)
fun rev_a_list(xsi) = 
    let 
        fun rev_the_list(xlt, acm) = 
            case xlt of 
                [] => acm
                | x :: xs => rev_the_list(xs, x::acm)
    in
        rev_the_list(xsi, [])
    end

val lst1 = [1,2,3,4,5,6]
val lst2 = rev_a_list(lst1)