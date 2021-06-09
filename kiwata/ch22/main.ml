(* 気になったプログラムだけ実行して行く *)
(* 参照型のデータを定義する *)
let count = ref 0;;
let rec fib n =
    (
        count := !count + 1;
        if n < 2 then n else fib (n - 1) + fib (n - 2)
    );;

let test_1 = fib 8 = 21;;

let a = [|0; 1; 2; 3; 4; 5|];;
Array.get a 0;;
a.(0);;

Array.set a 0 1;;
a.(0) <- 2;;
