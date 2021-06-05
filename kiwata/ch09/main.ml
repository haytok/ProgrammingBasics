(* 気になったプログラムだけ実行して行く *)
let test value = match value with
    [] -> 0
    | first :: rest -> first;;

let values = 1 :: 2 :: 3 :: [];;
(* 1 が返ってくる *)
test values;;

(* 目的 : 受け取ったリスト values に 0 が含まれているかを調べる *)
(* contain_zero : int list -> bool *)
let rec contain_zero values = match values with
    [] -> false
    | first :: rest -> if first = 0 then true else contain_zero rest;;

(* テスト *) 
let test1 = contain_zero [] = false;;
let test2 = contain_zero [0; 2] = true;;
let test3 = contain_zero [1; 2] = false;;
let test4 = contain_zero [1; 2; 3; 0; 5; 6; 7] = true;;
let test5 = contain_zero [1; 2; 3; 4; 5; 6; 7] = false;;

(* 目的 : 受け取った lst の各要素の和を求める *)
(* sum : int list -> int *)
let rec sum lst = match lst with
    [] -> 0
    | first :: rest -> first + sum rest;;

(* テスト *) 
let test1 = sum [] = 0;;
let test2 = sum [2] = 2;;
let test3 = sum [1; 3] = 4;;
let test4 = sum [1; 2; 3; 4; 5; 6; 7; 8; 9; 10] = 55;;

let test = 1 :: 2 :: 3 :: [];;
List.length test;; (* 配列の長さの 3 が返ってくる *)

(* 9.6 *)
type gakusei_t = {
    namae: string;
    tensuu: int;
    seiseki: string;
};;

let lst1 = [];;
let lst2 = [{namae = "asai"; tensuu = 70; seiseki = "B"}];;
let lst3 = [{namae = "asai"; tensuu = 70; seiseki = "B"}; 
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}];;
let lst4 = [{namae = "yoshida"; tensuu = 80; seiseki = "A"}; 
            {namae = "asai"; tensuu = 70; seiseki = "B"}; 
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}];;

(* 目的 : 学生リスト lst のうち、成績が A の人の人数を返す。 *)
(* count_A : gakusei_t list -> int *)
let rec count_A lst = match lst with
    [] -> 0
    | first :: rest ->
        (match first with
            {namae = n; tensuu = t; seiseki = s} ->
                let count = count_A rest in if s = "A" then 1 + count else count);;

let rec count_A lst = match lst with
    [] -> 0
    | {namae = n; tensuu = t; seiseki = s} :: rest ->
        let count = count_A rest in if s = "A" then 1 + count else count);;

(* テスト *) 
let test1 = count_A lst1 = 0;;
let test2 = count_A lst2 = 0;;
let test3 = count_A lst3 = 1;;
let test4 = count_A lst4 = 2;;
