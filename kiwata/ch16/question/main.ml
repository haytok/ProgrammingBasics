(* 演習問題は基本的に全て解いていく *)

(* 16.1 *)
let sum_list lst =
    let rec hojo lst total0 = match lst with
        [] -> []
        | first :: rest ->
            (first + total0) :: hojo rest (first + total0)
                in hojo lst 0;;

(* テスト *) 
let test1 = sum_list [] = [];;
let test2 = sum_list [1; 2; 3] = [1; 3; 6];;
let test3 = sum_list [3; 2; 1; 4] = [3; 5; 6; 10];;

(* 16.2 *)
(* 目的 :  *)
(* fold_right は何を返す関数なのかを考えると、f の引数の意味を定義できる *)
(* それは、つまり fold_right の目的を考えることと同義である *)
let rec fold_right f lst init = match lst with
    [] -> init
    | first :: rest ->
        f first (fold_right f rest init);;

let fold_left f init lst = match lst with
    [] -> init
    | first :: rest ->
        fold_left f (f init first) rest;;

(* テスト *) 
let test1 = fold_left (-) 0 [] = 0;;
let test2 = fold_left (-) 10 [4; 1; 3] = 2;;
let test3 = fold_left (fun lst a -> a :: lst) [] [1; 2; 3; 4] = [4; 3; 2; 1];;

(* 16.3 *)


(* 16.4 *)


(* 16.5 *)

