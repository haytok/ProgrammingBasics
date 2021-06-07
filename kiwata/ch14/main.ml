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

let rec enumerate n =
    if n = 0 then []
    else n :: enumerate (n - 1);;
(* enumerate 5;; *)
(* int list = [5; 4; 3; 2; 1] *)

let divisor n = filter (fun x -> n mod x = 0) (enumerate n);;
(* divisor 24;; *)
(* int list = [24; 12; 8; 6; 4; 3; 2; 1] *)

let perfect n = filter (fun x -> fold_right (+) (divisor x) 0 - x = x) (enumerate n);;
