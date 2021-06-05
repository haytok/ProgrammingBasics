(* 演習問題は基本的に全て解いていく *)

(* 10.1 *)
(* 目的 : あらかじめ昇順に並んでいる整数のリスト lst と整数 n を受け取ると、lst の昇順となる位置に n を挿入する *)
(* insert : int list -> int ->int list *)
let rec insert lst n = match lst with
    [] -> n :: []
    | first :: rest ->
        if first < n then first :: (insert rest n) else n :: lst;;

(* テスト *) 
let test1 = insert [] 3 = [3];;
let test2 = insert [1] 3 = [1; 3];;
let test3 = insert [3] 1 = [1; 3];;
let test4 = insert [1; 3; 4; 7; 8] 5 = [1; 3; 4; 5; 7; 8];;

(* 10.2 *)
(* 目的 : 整数のリストを受け取ると、昇順に整列したリストを返す *)
(* ins_sort : int list -> int list *)
let rec ins_sort lst = match lst with
    [] -> []
    | first :: rest -> insert (ins_sort rest) first;;

(* テスト *) 
let test1 = ins_sort [] = [];;
let test2 = ins_sort [1] = [1];;
let test3 = ins_sort [3; 1] = [1; 3];; 
let test4 = ins_sort [1; 3] = [1; 3];;
let test5 = ins_sort [5; 3; 8; 1; 7; 4] = [1; 3; 4; 5; 7; 8];;

(* 10.3 *)
type gakusei_t = {
    name: string;
    tennsuu: int;
    seiseki: string;
};;

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
let lst4 = [gakusei4; gakusei3];;
let lst5 = [gakusei4; gakusei1; gakusei6; gakusei5; gakusei2; gakusei3];;

(* 目的 : tensuu フィールドで昇順になったリスト lst に学生の成績のデータ gakusei を挿入する *)
let rec gakusei_insert lst gakusei = match lst with
    [] -> gakusei :: []
    | {namae = n; tensuu = t; seiseki = s} as first :: rest ->
        match gakusei with
            {namae = ng; tensuu = tg; seiseki = sg} as gakusei ->
                if t > tg then gakusei :: lst (* データをｓ挿入する *)
                else first :: (gakusei_insert rest gakusei);;

(* テスト *) 
let test1 = gakusei_insert [] gakusei2 = [gakusei2];;
let test2 = gakusei_insert [gakusei4] gakusei3 = [gakusei4; gakusei3];; 
let test3 = gakusei_insert [gakusei3] gakusei4 = [gakusei4; gakusei3];;
let test4 = gakusei_insert [gakusei6; gakusei5; gakusei3; gakusei2; gakusei1] 
			   gakusei4 
	    = [gakusei6; gakusei5; gakusei4; gakusei3; gakusei2; gakusei1];;

(* 目的 : gakusei_t 型のリストを受け取ると、それを tensuu フィールドの順に整列したリストを返す *)
(* gakusei_ins_sort : gakusei_t list -> gakusei_t list *)
let rec gakusei_ins_sort lst = match lst with
    [] -> []
    | first :: rest -> gakusei_insert (gakusei_ins_sort rest) first;;

(* テスト *) 
let test5 = gakusei_ins_sort lst1 = [];;
let test6 = gakusei_ins_sort lst2 = [gakusei2];;
let test7 = gakusei_ins_sort lst3 = [gakusei4; gakusei3];;
let test8 = gakusei_ins_sort lst4 = [gakusei4; gakusei3];;
let test9 = gakusei_ins_sort lst5 
	    = [gakusei6; gakusei5; gakusei4; gakusei3; gakusei2; gakusei1];;

(* 10.4 *)
type person_t = { 
  name : string;	(* 名前 *) 
  shincho : float;	(* 身長 *) 
  taiju : float;	(* 体重 *) 
  tsuki : int;		(* 誕生月 *) 
  hi : int;		(* 誕生日 *) 
  ketsueki : string;	(* 血液型 *) 
};;
 
let person1 = 
  {name = "asai"; 
   shincho = 1.72; 
   taiju = 58.5; 
   tsuki = 9; 
   hi = 17; 
   ketsueki = "A" 
};;
 
let person2 = { 
  name = "miyahara"; 
  shincho = 1.63; 
  taiju = 55.0; 
  tsuki = 6; 
  hi = 30; 
  ketsueki = "B" 
};;
 
let person3 = { 
  name = "nakamura"; 
  shincho = 1.68; 
  taiju = 63.0; 
  tsuki = 6; 
  hi = 6; 
  ketsueki = "O" 
};;

(* person_t 型のリストの例 *) 
let lst1 = [];;
let lst2 = [person1];;
let lst3 = [person1; person2];;
let lst4 = [person2; person1];;
let lst5 = [person3; person1; person2];;

(* 目的 : name フィールドで昇順になったリスト lst に person_t 型のデータ を挿入する *)
(* person_insert : person_t list -> person_t -> person_t list *)
let rec person_insert lst person = match lst with
    [] -> person :: []
    | {name = n; shincho = s; taiju = ta; tsuki = ts; hi = h ;ketsueki = k} as first :: rest ->
        match person with
            {name = np; shincho = sp; taiju = tap; tsuki = tsp; hi = hp ;ketsueki = kp} ->
                if n < np then first :: (person_insert rest person)
                else person :: lst;;

(* テスト *) 
let test1 = person_insert [] person1 = [person1];;
let test2 = person_insert [person2] person1 = [person2; person1];;
let test3 = person_insert [person1] person2 = [person2; person1];;
let test4 = person_insert [person1; person2] person3 
	    = [person1; person2; person3];;

(* 目的 : person_t 型のリストを受け取ると、それを name フィールドの順に整列したリストを返す *)
(* person_ins_sort : person_t list -> person_t list *)
let rec person_ins_sort lst = match lst with
    [] -> []
    | first :: rest ->
        person_insert (person_ins_sort rest) first;;

(* テスト *) 
let test5 = person_ins_sort lst1 = [];;
let test6 = person_ins_sort lst2 = [person1];;
let test7 = person_ins_sort lst3 = [person2; person1];;
let test8 = person_ins_sort lst4 = [person2; person1];;
let test9 = person_ins_sort lst5 = [person2; person1; person3];;

(* 10.5 *)
type gakusei_t = {
    namae: string;
    tensuu: int;
    seiseki: string;
};;

(* 学生のデータの例 *) 
let gakusei1 = {namae="nakamura"; tensuu=90; seiseki="A"};;
let gakusei2 = {namae="miyahara"; tensuu=80; seiseki="A"};;
let gakusei3 = {namae="sato"; tensuu=75; seiseki="B"};;
let gakusei4 = {namae="idehara"; tensuu=70; seiseki="B"};;
let gakusei5 = {namae="tsubata"; tensuu=65; seiseki="C"};;
let gakusei6 = {namae="asai"; tensuu=60; seiseki="C"};;
 
(* 学生のリストの例 *) 
let lst1 = [gakusei2];;
let lst2 = [gakusei3; gakusei4];;
let lst3 = [gakusei4; gakusei3];;
let lst4 = [gakusei4; gakusei1; gakusei6; gakusei5; gakusei2; gakusei3];;

(* 目的 : gakusei_t の要素からなるリストから、最高点を取った学生のレコードを返す関数 *)
(* gakusei_max : gakusei_t list -> gakusei_t *)
let rec gakusei_max lst = match lst with
    [] -> {namae = ""; tensuu = -1; seiseki = ""}
    | first :: rest ->
        match first with
            {namae = n; tensuu = t; seiseki = s} ->
                let value = gakusei_max rest in
                    if t > value.tensuu then first
                    else value;;

(* テスト *) 
let test1 = gakusei_max lst1 = gakusei2;;
let test2 = gakusei_max lst2 = gakusei3;;
let test3 = gakusei_max lst3 = gakusei3;;
let test4 = gakusei_max lst4 = gakusei1;;

(* 10.6 *)
(* 10.5 と同じ *)

(* 10.7 *)
type person_t = { 
  name : string;	(* 名前 *) 
  shincho : float;	(* 身長 *) 
  taiju : float;	(* 体重 *) 
  tsuki : int;		(* 誕生月 *) 
  hi : int;		(* 誕生日 *) 
  ketsueki : string;	(* 血液型 *) 
};;
 
let person1 = 
  {name = "浅井"; 
   shincho = 1.72; 
   taiju = 58.5; 
   tsuki = 9; 
   hi = 17; 
   ketsueki = "A" 
};;
 
let person2 = { 
  name = "宮原"; 
  shincho = 1.63; 
  taiju = 55.0; 
  tsuki = 6; 
  hi = 30; 
  ketsueki = "B" 
};;
 
let person3 = { 
  name = "中村"; 
  shincho = 1.68; 
  taiju = 63.0; 
  tsuki = 6; 
  hi = 6; 
  ketsueki = "O" 
};;

(* person_t list 型のデータの例 *) 
let lst1 = [];;
let lst2 = [person1];;
let lst3 = [person2];;
let lst4 = [person1; person2; person3];;
let lst5 = [person2; person1; person1];;

(* 目的 : person_t 型のリストをから、各血液型の人が何人いるかを組みにして返す *)
(* ketsueki_shukei : person_t list -> int * int * int * int *)
let rec ketsueki_shukei lst = match lst with
    [] -> (0, 0, 0, 0)
    | {name = n; shincho = s; taiju = ta; tsuki = ts; hi = h; ketsueki = k} :: rest ->
        let (a, b, c, d) = ketsueki_shukei rest in
            if k = "A" then (a + 1, b, c, d)
            else if k = "O" then (a, b + 1, c, d)
            else if k = "B" then (a, b, c + 1, d)
            else (a, b, c, d + 1);;

(* テスト *) 
let test1 = ketsueki_shukei lst1 = (0, 0, 0, 0);;
let test2 = ketsueki_shukei lst2 = (1, 0, 0, 0);;
let test3 = ketsueki_shukei lst3 = (0, 0, 1, 0);;
let test4 = ketsueki_shukei lst4 = (1, 1, 1, 0);;
let test5 = ketsueki_shukei lst5 = (2, 0, 1, 0);;

(* 10.8 *)
(* person_t list 型のデータの例 *) 
let lst1 = [person1];;
let lst2 = [person2];;
let lst3 = [person1; person2; person3];;
let lst4 = [person2; person1; person1];;

(* 目的 : 要素の型が person_t であるリストから、血液型のうち最も人数の多い血液型を返す *)
(* saita_ketsueki : person_t list -> string *)
let saita_ketsueki lst =
    let (a, o, b, ab) = ketsueki_shukei lst in
        let value = max (max a o) (max b ab) in
            if value = a then "A"
            else if value = o then "O"
            else if value = b then "B"
            else "AB";;

(* テスト *) 
let test1 = saita_ketsueki lst1 = "A";;
let test2 = saita_ketsueki lst2 = "B";;
let test3 = saita_ketsueki lst3 = "A";;
  (* 同点のときは A, O, B, AB の順に見つかったものが返されてしまう *) 
let test4 = saita_ketsueki lst4 = "A";;

(* 10.9 *)


(* 10.10 *)


(* 10.11 *)


(* 10.12 *)

