(* 気になったプログラムだけ実行して行く *)

(* 目的 : 受け取った lst の各要素の先頭に n を付け加える *)
(* prefix : int  -> int list list -> int list list *)
let rec add_to_each n lst = match lst with
    [] -> []
    | first :: rest ->
        (n :: first) :: (add_to_each n rest);;

(* テスト *) 
let test1 = add_to_each 1 [] = [];;
let test2 = add_to_each 1 [[2]] = [[1; 2]];;
let test3 = add_to_each 1 [[2]; [2; 3]] = [[1; 2]; [1; 2; 3]];;
let test4 = add_to_each 1 [[2]; [2; 3]; [2; 3; 4]]
                          = [[1; 2]; [1; 2; 3]; [1; 2; 3; 4]];;

(* 目的 : 受け取った lst の接頭辞のリストを求める *)
(* prefix : int list -> int list list *)
let rec prefix lst = match lst with
    [] -> []
    | first :: rest -> (first :: []) :: add_to_each first (prefix rest);;

(* テスト *) 
let test5 = prefix [] = [];;
let test6 = prefix [1] = [[1]];;
let test7 = prefix [1; 2] = [[1]; [1; 2]];;
let test8 = prefix [1; 2; 3; 4] 
                   = [[1]; [1; 2]; [1; 2; 3]; [1; 2; 3; 4]];;

(* 10.2 *)
(* 目的 : 受け取ったリストから、最小値を返す *)
(* minimum : int list -> int *)
let max_int = 100;;
let rec minimum lst = match lst with
    [] -> max_int
    | first :: rest ->
        let value = minimum rest in
            if first < value then first else value;;

(* テスト *) 
let test1 = minimum [3] = 3;;
let test2 = minimum [1; 2] = 1;;
let test3 = minimum [3; 2] = 2;;
let test4 = minimum [3; 2; 6; 4; 1; 8] = 1;;


(* 10.4 *)
type gakusei_t = { 
  namae : string;       (* 名前 *) 
  tensuu : int;         (* 点数 *) 
  seiseki : string;     (* 成績 *) 
} 
 
(* 学生のデータの例 *) 
let gakusei1 = {namae="nakamura"; tensuu=90; seiseki="A"};;
let gakusei2 = {namae="miyahara"; tensuu=80; seiseki="A"};;
let gakusei3 = {namae="sato"; tensuu=75; seiseki="B"};;
let gakusei4 = {namae="idehara"; tensuu=70; seiseki="B"};;
let gakusei5 = {namae="tsubata"; tensuu=65; seiseki="C"};;
let gakusei6 = {namae="asai"; tensuu=60; seiseki="C"};;
 
(* 学生のリストの例 *) 
let lst1 = [];;
let lst2 = [gakusei2];;
let lst3 = [gakusei3; gakusei4];;
let lst4 = [gakusei4; gakusei5; gakusei1];;
let lst5 = [gakusei4; gakusei1; gakusei6; gakusei5; gakusei2; gakusei3];;

(* 目的 *)
(* shukei : gakusei_t list -> int * int * int * int *)
let rec shukei lst = match lst with
    [] -> (0, 0, 0, 0)
    | {namae = n; tensuu = t; seiseki = s} :: rest ->
        let (a, b, c, d) =  shukei rest in
            if s = "A" then (a + 1, b, c, d)
            else if s = "B" then (a, b + 1, c, d)
            else if s = "C" then (a, b, c + 1, d)
            else if s = "D" then (a, b, c, d + 1);;

(* テスト *) 
let test1 = shukei lst1 = (0, 0, 0, 0);;
let test2 = shukei lst2 = (1, 0, 0, 0);;
let test3 = shukei lst3 = (0, 2, 0, 0);;
let test4 = shukei lst4 = (1, 1, 1, 0);;
let test5 = shukei lst5 = (2, 2, 2, 0);;
