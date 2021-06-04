(* 気になったプログラムだけ実行して行く *)
let test value = match value with
    [] -> 0
    | first :: rest -> first;;

let values = 1 :: 2 :: 3 :: [];;
(* 1 が返ってくる *)
test values;;

let rec contain_zero values = match values with
    [] -> false
    | first :: rest -> if first = 0 then true else contain_zero rest;;

(* テスト *) 
let test1 = contain_zero [] = false;;
let test2 = contain_zero [0; 2] = true;;
let test3 = contain_zero [1; 2] = false;;
let test4 = contain_zero [1; 2; 3; 0; 5; 6; 7] = true;;
let test5 = contain_zero [1; 2; 3; 4; 5; 6; 7] = false;;
