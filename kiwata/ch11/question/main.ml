(* 演習問題は基本的に全て解いていく *)

(* 11.1 *)
(* 目的 : 0 から受け取った整数の二乗までの和を計算して返す *)
(* sum_of_square : int -> int *)
let rec sum_of_square value =
    if value = 0 then 0
    else value * value + sum_of_square(value - 1);;

(* テスト *) 
let test1 = sum_of_square 0 = 0;;
let test2 = sum_of_square 1 = 1;;
let test3 = sum_of_square 2 = 5;;
let test4 = sum_of_square 3 = 14;;
let test5 = sum_of_square 4 = 30;;

(* 11.2 *)
(* 目的 : 漸化式で定義された値を返す *)
(* a : int -> int *)
let rec a n =
    if n = 0 then 3
    else 2 * a(n - 1) - 1;;

(* テスト *) 
let test1 = a 0 = 3;;
let test2 = a 1 = 5;;
let test3 = a 2 = 9;;
let test4 = a 3 = 17;;
let test5 = a 4 = 33;;
