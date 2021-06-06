(* 気になったプログラムだけ実行して行く *)
let rec map f lst = match lst with
    [] -> []
    | first :: rest ->
        f first :: map f rest;;

let rec sum lst = match lst with
    [] -> 0
    | first :: rest -> first + sum rest;;

let rec length lst = match lst with
    [] -> 0
    | first :: rest -> 1 + length rest;;

let rec append list_1 list_2 = match list_1 with
    [] -> list_2
    | first :: rest -> first :: append rest list_2;;

(* 目的 :  *)
(* fold_right は何を返す関数なのかを考えると、f の引数の意味を定義できる *)
(* それは、つまり fold_right の目的を考えることと同義である *)
let rec fold_right f lst init = match lst with
    [] -> init
    | first :: rest ->
        f first (fold_right f rest init);;

let inc first rest_result = first + rest_result;;
let sum lst = fold_right inc lst 0;;

let add_one first rest_result = 1 + rest_result;;
let length lst = fold_right add_one lst 0;;

let cons first rest_result = first :: rest_result;;
let append list_1 list_2 = fold_right cons list_1 list_2;;
