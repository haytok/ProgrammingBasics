(* 気になったプログラムだけ実行して行く *)
let rec filter p lst = match lst with
    [] -> []
    | first :: rest ->
        if p first then first :: filter p rest
        else filter p rest;;

(fun x -> x + 1) 5;;

let rec fold_right f lst init = match lst with
    [] -> init
    | first :: rest ->
        f first (fold_right f rest init);;

let sum lst = fold_right (fun first rest_result -> first + rest_result) lst 0;;

let length lst = fold_right (fun first rest_result -> 1 + rest_result) lst 0;;

let append list_1 list_2 = fold_right (fun first rest_result -> first :: rest_result) list_1 list_2;;
