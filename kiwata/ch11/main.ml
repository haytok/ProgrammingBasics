(* 気になったプログラムだけ実行して行く *)
(* 目的 : 受け取った整数までの階乗を計算して返す *)
(* fac : int -> int *)
let rec fac value =
    if value = 0 then 1
    else value * (fac (value - 1));;

(* テスト *) 
let test1 = fac 0 = 1;;
let test2 = fac 1 = 1;;
let test3 = fac 2 = 2;;
let test4 = fac 3 = 6;;
let test5 = fac 4 = 24;;
let test6 = fac 10 = 3628800;;

(* 目的　: 受け取った二つの整数をから階乗を計算して返す *)
(* poewr : int -> int -> int *)
let rec power m n =
    if n = 0 then 1
    else m * (power m (n - 1));;

(* テスト *) 
let test1 = power 3 0 = 1;;
let test2 = power 3 1 = 3;;
let test3 = power 3 2 = 9;;
let test4 = power 3 3 = 27;;
