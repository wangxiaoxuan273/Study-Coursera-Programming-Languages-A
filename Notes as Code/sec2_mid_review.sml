(* Section 2 Mid-section Review *)

(* Write some datatypes *)
datatype Gas_Giant = Jupiter | Saturn | Uranus | Neptune
datatype Rock = Mercury | Venus | Earth | Mars

(* Can I create a planet type that is either a gas giant or rock? *)
(* Yes but I don't think this is good style lol *)
datatype Planet = A_Gas_Giant of Gas_Giant | A_Rock of Rock

(* Write some case expressions *)
fun is_Mars planet =
    case planet of
    A_Gas_Giant(plt) => false
      | A_Rock(plt) => (plt = Mars)

(* So basically you have to CALL the constructor :) *)
val v1 = is_Mars (A_Rock(Earth))
val v2 = is_Mars (A_Rock(Mars))
val v3 = is_Mars (A_Gas_Giant(Jupiter))