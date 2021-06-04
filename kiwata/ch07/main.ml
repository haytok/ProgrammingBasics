(* 気になったプログラムだけ実行して行く *)
(* 目的 : 二つの整数の組 pair を受け取り、その要素の和を返す *)
(* add int * int -> int *)
let add pair = match pair with
    (a, b) -> a + b;;

add (1, 2);;
