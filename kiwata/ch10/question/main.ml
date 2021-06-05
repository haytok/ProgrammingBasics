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
(* 目的 : 二つの配列を受け取って、長さが等しいかを判定する *)
(* equal_length : 'a list -> 'a list -> bool *)
let rec equal_length item_1 item_2 = match (item_1, item_2) with
    ([], []) -> true
    | (first_1 :: rest_1, []) -> false
    | ([], first_2 :: rest_2) -> false
    | (first_1 :: rest_1, first_2 :: rest_2) -> equal_length rest_1 rest_2;;

(* テスト *) 
let test1 = equal_length [] [] = true;;
let test2 = equal_length [] [1; 2] = false;;
let test3 = equal_length [1; 2] [] = false;;
let test4 = equal_length [1; 3] [2; 4] = true;;
let test5 = equal_length ["a"; "b"; "c"; "d"] [1; 3] = false;;
let test6 = equal_length ["a"; "b"; "c"; "d"] [1; 3; 2; 4] = true;;

(* 10.10 *)
type ekimei_t = { 
  kanji   : string; (* 漢字の駅名 *) 
  kana    : string; (* 読み *) 
  romaji  : string; (* ローマ字 *) 
  shozoku : string; (* 所属路線名 *) 
};;

(* 目的 : ローマ字の駅名と駅名リストを受け取って、その駅名の漢字表記を返す *)
(* romaji_to_kanji : string -> ekimei_t list -> string *)
let rec romaji_to_kanji r_0 lst = match lst with
    [] -> ""
    | {kanji = k; kana = kana; romaji = romaji; shozoku = shozoku} :: rest ->
        if romaji = r_0 then k
        else romaji_to_kanji r_0 rest;;

(* テスト *) 
let test1 = romaji_to_kanji "myogadani" global_ekimei_list = "茗荷谷";;
let test2 = romaji_to_kanji "shibuya" global_ekimei_list = "渋谷";;
let test3 = romaji_to_kanji "otemachi" global_ekimei_list = "大手町";;

(* 10.11 *)
type ekikan_t = { 
  kiten  : string; (* 起点 *) 
  shuten : string; (* 終点 *) 
  keiyu  : string; (* 経由路線名 *) 
  kyori  : float;  (* 距離 *) 
  jikan  : int;    (* 所要時間 *) 
};;
 
let global_ekikan_list = [ 
    {kiten="代々木上原"; shuten="代々木公園"; keiyu="千代田線"; kyori=1.0; jikan=2}; 
    {kiten="代々木公園"; shuten="明治神宮前"; keiyu="千代田線"; kyori=1.2; jikan=2}; 
    {kiten="明治神宮前"; shuten="表参道"; keiyu="千代田線"; kyori=0.9; jikan=2}; 
    {kiten="表参道"; shuten="乃木坂"; keiyu="千代田線"; kyori=1.4; jikan=3}; 
    {kiten="乃木坂"; shuten="赤坂"; keiyu="千代田線"; kyori=1.1; jikan=2}; 
    {kiten="赤坂"; shuten="国会議事堂前"; keiyu="千代田線"; kyori=0.8; jikan=1}; 
    {kiten="国会議事堂前"; shuten="霞ヶ関"; keiyu="千代田線"; kyori=0.7; jikan=1}; 
    {kiten="霞ヶ関"; shuten="日比谷"; keiyu="千代田線"; kyori=1.2; jikan=2}; 
    {kiten="日比谷"; shuten="二重橋前"; keiyu="千代田線"; kyori=0.7; jikan=1}; 
    {kiten="二重橋前"; shuten="大手町"; keiyu="千代田線"; kyori=0.7; jikan=1}; 
    {kiten="大手町"; shuten="新御茶ノ水"; keiyu="千代田線"; kyori=1.3; jikan=2}; 
    {kiten="新御茶ノ水"; shuten="湯島"; keiyu="千代田線"; kyori=1.2; jikan=2}; 
    {kiten="湯島"; shuten="根津"; keiyu="千代田線"; kyori=1.2; jikan=2}; 
    {kiten="根津"; shuten="千駄木"; keiyu="千代田線"; kyori=1.0; jikan=2}; 
    {kiten="千駄木"; shuten="西日暮里"; keiyu="千代田線"; kyori=0.9; jikan=1}; 
    {kiten="西日暮里"; shuten="町屋"; keiyu="千代田線"; kyori=1.7; jikan=2}; 
    {kiten="町屋"; shuten="北千住"; keiyu="千代田線"; kyori=2.6; jikan=3}; 
    {kiten="北千住"; shuten="綾瀬"; keiyu="千代田線"; kyori=2.5; jikan=3}; 
    {kiten="綾瀬"; shuten="北綾瀬"; keiyu="千代田線"; kyori=2.1; jikan=4}; 
    {kiten="浅草"; shuten="田原町"; keiyu="銀座線"; kyori=0.8; jikan=2}; 
    {kiten="田原町"; shuten="稲荷町"; keiyu="銀座線"; kyori=0.7; jikan=1}; 
    {kiten="稲荷町"; shuten="上野"; keiyu="銀座線"; kyori=0.7; jikan=2}; 
    {kiten="上野"; shuten="上野広小路"; keiyu="銀座線"; kyori=0.5; jikan=2}; 
    {kiten="上野広小路"; shuten="末広町"; keiyu="銀座線"; kyori=0.6; jikan=1}; 
    {kiten="末広町"; shuten="神田"; keiyu="銀座線"; kyori=1.1; jikan=2}; 
    {kiten="神田"; shuten="三越前"; keiyu="銀座線"; kyori=0.7; jikan=1}; 
    {kiten="三越前"; shuten="日本橋"; keiyu="銀座線"; kyori=0.6; jikan=2}; 
    {kiten="日本橋"; shuten="京橋"; keiyu="銀座線"; kyori=0.7; jikan=2}; 
    {kiten="京橋"; shuten="銀座"; keiyu="銀座線"; kyori=0.7; jikan=1}; 
    {kiten="銀座"; shuten="新橋"; keiyu="銀座線"; kyori=0.9; jikan=2}; 
    {kiten="新橋"; shuten="虎ノ門"; keiyu="銀座線"; kyori=0.8; jikan=2}; 
    {kiten="虎ノ門"; shuten="溜池山王"; keiyu="銀座線"; kyori=0.6; jikan=2}; 
    {kiten="溜池山王"; shuten="赤坂見附"; keiyu="銀座線"; kyori=0.9; jikan=2}; 
    {kiten="赤坂見附"; shuten="青山一丁目"; keiyu="銀座線"; kyori=1.3; jikan=2}; 
    {kiten="青山一丁目"; shuten="外苑前"; keiyu="銀座線"; kyori=0.7; jikan=2}; 
    {kiten="外苑前"; shuten="表参道"; keiyu="銀座線"; kyori=0.7; jikan=1}; 
    {kiten="表参道"; shuten="渋谷"; keiyu="銀座線"; kyori=1.3; jikan=1}; 
    {kiten="渋谷"; shuten="表参道"; keiyu="半蔵門線"; kyori=1.3; jikan=2}; 
    {kiten="表参道"; shuten="青山一丁目"; keiyu="半蔵門線"; kyori=1.4; jikan=2}; 
    {kiten="青山一丁目"; shuten="永田町"; keiyu="半蔵門線"; kyori=1.3; jikan=2}; 
    {kiten="永田町"; shuten="半蔵門"; keiyu="半蔵門線"; kyori=1.0; jikan=2}; 
    {kiten="半蔵門"; shuten="九段下"; keiyu="半蔵門線"; kyori=1.6; jikan=2}; 
    {kiten="九段下"; shuten="神保町"; keiyu="半蔵門線"; kyori=0.4; jikan=1}; 
    {kiten="神保町"; shuten="大手町"; keiyu="半蔵門線"; kyori=1.7; jikan=3}; 
    {kiten="大手町"; shuten="三越前"; keiyu="半蔵門線"; kyori=0.7; jikan=1}; 
    {kiten="三越前"; shuten="水天宮前"; keiyu="半蔵門線"; kyori=1.3; jikan=2}; 
    {kiten="水天宮前"; shuten="清澄白河"; keiyu="半蔵門線"; kyori=1.7; jikan=3}; 
    {kiten="清澄白河"; shuten="住吉"; keiyu="半蔵門線"; kyori=1.9; jikan=3}; 
    {kiten="住吉"; shuten="錦糸町"; keiyu="半蔵門線"; kyori=1.; jikan=2}; 
    {kiten="錦糸町"; shuten="押上"; keiyu="半蔵門線"; kyori=1.4; jikan=2}; 
    {kiten="中目黒"; shuten="恵比寿"; keiyu="日比谷線"; kyori=1.; jikan=2}; 
    {kiten="恵比寿"; shuten="広尾"; keiyu="日比谷線"; kyori=1.5; jikan=3}; 
    {kiten="広尾"; shuten="六本木"; keiyu="日比谷線"; kyori=1.7; jikan=3}; 
    {kiten="六本木"; shuten="神谷町"; keiyu="日比谷線"; kyori=1.5; jikan=3}; 
    {kiten="神谷町"; shuten="霞ヶ関"; keiyu="日比谷線"; kyori=1.3; jikan=2}; 
    {kiten="霞ヶ関"; shuten="日比谷"; keiyu="日比谷線"; kyori=1.2; jikan=2}; 
    {kiten="日比谷"; shuten="銀座"; keiyu="日比谷線"; kyori=0.4; jikan=1}; 
    {kiten="銀座"; shuten="東銀座"; keiyu="日比谷線"; kyori=0.4; jikan=1}; 
    {kiten="東銀座"; shuten="築地"; keiyu="日比谷線"; kyori=0.6; jikan=2}; 
    {kiten="築地"; shuten="八丁堀"; keiyu="日比谷線"; kyori=1.; jikan=2}; 
    {kiten="八丁堀"; shuten="茅場町"; keiyu="日比谷線"; kyori=0.5; jikan=1}; 
    {kiten="茅場町"; shuten="人形町"; keiyu="日比谷線"; kyori=0.9; jikan=2}; 
    {kiten="人形町"; shuten="小伝馬町"; keiyu="日比谷線"; kyori=0.6; jikan=1}; 
    {kiten="小伝馬町"; shuten="秋葉原"; keiyu="日比谷線"; kyori=0.9; jikan=2}; 
    {kiten="秋葉原"; shuten="仲御徒町"; keiyu="日比谷線"; kyori=1.; jikan=1}; 
    {kiten="仲御徒町"; shuten="上野"; keiyu="日比谷線"; kyori=0.5; jikan=1}; 
    {kiten="上野"; shuten="入谷"; keiyu="日比谷線"; kyori=1.2; jikan=2}; 
    {kiten="入谷"; shuten="三ノ輪"; keiyu="日比谷線"; kyori=1.2; jikan=2}; 
    {kiten="三ノ輪"; shuten="南千住"; keiyu="日比谷線"; kyori=0.8; jikan=2}; 
    {kiten="南千住"; shuten="北千住"; keiyu="日比谷線"; kyori=1.8; jikan=3}; 
    {kiten="池袋"; shuten="新大塚"; keiyu="丸ノ内線"; kyori=1.8; jikan=3}; 
    {kiten="新大塚"; shuten="茗荷谷"; keiyu="丸ノ内線"; kyori=1.2; jikan=2}; 
    {kiten="茗荷谷"; shuten="後楽園"; keiyu="丸ノ内線"; kyori=1.8; jikan=2}; 
    {kiten="後楽園"; shuten="本郷三丁目"; keiyu="丸ノ内線"; kyori=0.8; jikan=1}; 
    {kiten="本郷三丁目"; shuten="御茶ノ水"; keiyu="丸ノ内線"; kyori=0.8; jikan=1}; 
    {kiten="御茶ノ水"; shuten="淡路町"; keiyu="丸ノ内線"; kyori=0.8; jikan=1}; 
    {kiten="淡路町"; shuten="大手町"; keiyu="丸ノ内線"; kyori=0.9; jikan=2}; 
    {kiten="大手町"; shuten="東京"; keiyu="丸ノ内線"; kyori=0.6; jikan=1}; 
    {kiten="東京"; shuten="銀座"; keiyu="丸ノ内線"; kyori=1.1; jikan=2}; 
    {kiten="銀座"; shuten="霞ヶ関"; keiyu="丸ノ内線"; kyori=1.0; jikan=2}; 
    {kiten="霞ヶ関"; shuten="国会議事堂前"; keiyu="丸ノ内線"; kyori=0.7; jikan=1}; 
    {kiten="国会議事堂前"; shuten="赤坂見附"; keiyu="丸ノ内線"; kyori=0.9; jikan=2}; 
    {kiten="赤坂見附"; shuten="四ツ谷"; keiyu="丸ノ内線"; kyori=1.3; jikan=2}; 
    {kiten="四ツ谷"; shuten="四谷三丁目"; keiyu="丸ノ内線"; kyori=1.0; jikan=2}; 
    {kiten="四谷三丁目"; shuten="新宿御苑前"; keiyu="丸ノ内線"; kyori=0.9; jikan=1}; 
    {kiten="新宿御苑前"; shuten="新宿三丁目"; keiyu="丸ノ内線"; kyori=0.7; jikan=1}; 
    {kiten="新宿三丁目"; shuten="新宿"; keiyu="丸ノ内線"; kyori=0.3; jikan=1}; 
    {kiten="新宿"; shuten="西新宿"; keiyu="丸ノ内線"; kyori=0.8; jikan=1}; 
    {kiten="西新宿"; shuten="中野坂上"; keiyu="丸ノ内線"; kyori=1.1; jikan=2}; 
    {kiten="中野坂上"; shuten="新中野"; keiyu="丸ノ内線"; kyori=1.1; jikan=2}; 
    {kiten="新中野"; shuten="東高円寺"; keiyu="丸ノ内線"; kyori=1.0; jikan=1}; 
    {kiten="東高円寺"; shuten="新高円寺"; keiyu="丸ノ内線"; kyori=0.9; jikan=1}; 
    {kiten="新高円寺"; shuten="南阿佐ヶ谷"; keiyu="丸ノ内線"; kyori=1.2; jikan=2}; 
    {kiten="南阿佐ヶ谷"; shuten="荻窪"; keiyu="丸ノ内線"; kyori=1.5; jikan=2}; 
    {kiten="中野坂上"; shuten="中野新橋"; keiyu="丸ノ内線"; kyori=1.3; jikan=2}; 
    {kiten="中野新橋"; shuten="中野富士見町"; keiyu="丸ノ内線"; kyori=0.6; jikan=1}; 
    {kiten="中野富士見町"; shuten="方南町"; keiyu="丸ノ内線"; kyori=1.3; jikan=2}; 
    {kiten="市ヶ谷"; shuten="四ツ谷"; keiyu="南北線"; kyori=1.0; jikan=2}; 
    {kiten="四ツ谷"; shuten="永田町"; keiyu="南北線"; kyori=1.3; jikan=3}; 
    {kiten="永田町"; shuten="溜池山王"; keiyu="南北線"; kyori=0.9; jikan=1}; 
    {kiten="溜池山王"; shuten="六本木一丁目"; keiyu="南北線"; kyori=0.9; jikan=2}; 
    {kiten="六本木一丁目"; shuten="麻布十番"; keiyu="南北線"; kyori=1.2; jikan=2}; 
    {kiten="麻布十番"; shuten="白金高輪"; keiyu="南北線"; kyori=1.3; jikan=2}; 
    {kiten="白金高輪"; shuten="白金台"; keiyu="南北線"; kyori=1.0; jikan=2}; 
    {kiten="白金台"; shuten="目黒"; keiyu="南北線"; kyori=1.3; jikan=2}; 
    {kiten="市ヶ谷"; shuten="飯田橋"; keiyu="南北線"; kyori=1.1 ; jikan=2}; 
    {kiten="飯田橋"; shuten="後楽園"; keiyu="南北線"; kyori=1.4 ; jikan=2}; 
    {kiten="後楽園"; shuten="東大前"; keiyu="南北線"; kyori=1.3 ; jikan=3}; 
    {kiten="東大前"; shuten="本駒込"; keiyu="南北線"; kyori=0.9 ; jikan=2}; 
    {kiten="本駒込"; shuten="駒込"; keiyu="南北線"; kyori=1.4; jikan=2}; 
    {kiten="駒込"; shuten="西ヶ原"; keiyu="南北線"; kyori=1.4; jikan=2}; 
    {kiten="西ヶ原"; shuten="王子"; keiyu="南北線"; kyori=1.0; jikan=2}; 
    {kiten="王子"; shuten="王子神谷"; keiyu="南北線"; kyori=1.2; jikan=2}; 
    {kiten="王子神谷"; shuten="志茂"; keiyu="南北線"; kyori=1.6; jikan=3}; 
    {kiten="志茂"; shuten="赤羽岩淵"; keiyu="南北線"; kyori=1.1; jikan=2}; 
    {kiten="西船橋" ; shuten="原木中山"; keiyu="東西線"; kyori=1.9; jikan=3}; 
    {kiten="原木中山"; shuten="妙典"; keiyu="東西線"; kyori=2.1 ; jikan=2}; 
    {kiten="妙典"; shuten="行徳"; keiyu="東西線"; kyori=1.3 ; jikan=2}; 
    {kiten="行徳"; shuten="南行徳"; keiyu="東西線"; kyori=1.5 ; jikan=2}; 
    {kiten="南行徳"; shuten="浦安" ; keiyu="東西線"; kyori=1.2 ; jikan=2}; 
    {kiten="浦安" ; shuten="葛西"; keiyu="東西線"; kyori=1.9 ; jikan=2}; 
    {kiten="葛西"; shuten="西葛西"; keiyu="東西線"; kyori=1.2 ; jikan=2}; 
    {kiten="西葛西"; shuten="南砂町"; keiyu="東西線"; kyori=2.7 ; jikan=2}; 
    {kiten="南砂町"; shuten="東陽町"; keiyu="東西線"; kyori=1.2 ; jikan=2}; 
    {kiten="東陽町"; shuten="木場" ; keiyu="東西線"; kyori=0.9 ; jikan=1}; 
    {kiten="木場"; shuten="門前仲町"; keiyu="東西線"; kyori=1.1 ; jikan=1}; 
    {kiten="門前仲町"; shuten="茅場町"; keiyu="東西線"; kyori=1.8 ; jikan=2}; 
    {kiten="茅場町"; shuten="日本橋"; keiyu="東西線"; kyori=0.5 ; jikan=1}; 
    {kiten="日本橋"; shuten="大手町"; keiyu="東西線"; kyori=0.8 ; jikan=1}; 
    {kiten="大手町"; shuten="竹橋"; keiyu="東西線"; kyori=1.0; jikan=2}; 
    {kiten="竹橋"; shuten="九段下"; keiyu="東西線"; kyori=1.0; jikan=1}; 
    {kiten="九段下"; shuten="飯田橋"; keiyu="東西線"; kyori=0.7; jikan=1}; 
    {kiten="飯田橋"; shuten="神楽坂"; keiyu="東西線"; kyori=1.2; jikan=2}; 
    {kiten="神楽坂"; shuten="早稲田"; keiyu="東西線"; kyori=1.2; jikan=2}; 
    {kiten="早稲田"; shuten="高田馬場"; keiyu="東西線"; kyori=1.7; jikan=3}; 
    {kiten="高田馬場"; shuten="落合"; keiyu="東西線"; kyori=1.9; jikan=3}; 
    {kiten="落合"; shuten="中野"; keiyu="東西線"; kyori=2.0; jikan=3}; 
    {kiten="新木場"; shuten="辰巳"; keiyu="有楽町線"; kyori=1.5; jikan=2}; 
    {kiten="辰巳"; shuten="豊洲"; keiyu="有楽町線"; kyori=1.7; jikan=2}; 
    {kiten="豊洲"; shuten="月島"; keiyu="有楽町線"; kyori=1.4; jikan=2}; 
    {kiten="月島"; shuten="新富町"; keiyu="有楽町線"; kyori=1.3; jikan=2}; 
    {kiten="新富町"; shuten="銀座一丁目"; keiyu="有楽町線"; kyori=0.7; jikan=1}; 
    {kiten="銀座一丁目"; shuten="有楽町"; keiyu="有楽町線"; kyori=0.5; jikan=1}; 
    {kiten="有楽町"; shuten="桜田門"; keiyu="有楽町線"; kyori=1.0; jikan=1}; 
    {kiten="桜田門"; shuten="永田町"; keiyu="有楽町線"; kyori=0.9; jikan=2}; 
    {kiten="永田町"; shuten="麹町"; keiyu="有楽町線"; kyori=0.9; jikan=1}; 
    {kiten="麹町"; shuten="市ヶ谷"; keiyu="有楽町線"; kyori=0.9; jikan=1}; 
    {kiten="市ヶ谷"; shuten="飯田橋"; keiyu="有楽町線"; kyori=1.1; jikan=2}; 
    {kiten="飯田橋"; shuten="江戸川橋"; keiyu="有楽町線"; kyori=1.6; jikan=3}; 
    {kiten="江戸川橋"; shuten="護国寺"; keiyu="有楽町線"; kyori=1.3; jikan=2}; 
    {kiten="護国寺"; shuten="東池袋"; keiyu="有楽町線"; kyori=1.1; jikan=2}; 
    {kiten="東池袋"; shuten="池袋"; keiyu="有楽町線"; kyori=2.0; jikan=2}; 
    {kiten="池袋"; shuten="要町"; keiyu="有楽町線"; kyori=1.2; jikan=2}; 
    {kiten="要町"; shuten="千川"; keiyu="有楽町線"; kyori=1.0; jikan=1}; 
    {kiten="千川"; shuten="小竹向原"; keiyu="有楽町線"; kyori=1.0; jikan=2}; 
    {kiten="小竹向原"; shuten="氷川台"; keiyu="有楽町線"; kyori=1.5; jikan=2}; 
    {kiten="氷川台"; shuten="平和台"; keiyu="有楽町線"; kyori=1.4; jikan=2}; 
    {kiten="平和台"; shuten="営団赤塚"; keiyu="有楽町線"; kyori=1.8; jikan=2}; 
    {kiten="営団赤塚"; shuten="営団成増"; keiyu="有楽町線"; kyori=1.5; jikan=2}; 
    {kiten="営団成増"; shuten="和光市"; keiyu="有楽町線"; kyori=2.1; jikan=3}; 
];;

(* 目的 : 漢字の駅名を二つと駅間リストを受け取ると、駅間距離を返す *)
(* global_ekikan_list : string -> string ->  *)
let rec get_ekikan_kyori eki_1 eki_2 lst = match lst with
    [] -> infinity
    | {kiten = kiten; shuten = shuten; keiyu = keiyu; kyori = kyori; jikan = jikan} :: rest ->
        if (eki_1 = kiten && eki_2 = shuten) || (eki_2 = kiten && eki_1 = shuten) then kyori
        else get_ekikan_kyori eki_1 eki_2 rest;;

(* テスト *) 
let test1 = get_ekikan_kyori "茗荷谷" "新大塚" global_ekikan_list = 1.2;;
let test2 = get_ekikan_kyori "茗荷谷" "池袋" global_ekikan_list = infinity;;
let test3 = get_ekikan_kyori "東京" "大手町" global_ekikan_list = 0.6;;

(* 10.12 *)
(* 目的 : 駅名のローマ字を二つ受け取って、その情報に応じた文字列を出力する *)
(* kyori_wo_hyoji : string -> string -> string *)
let kyori_wo_hyoji eki_1 eki_2 = 
    let eki_1_kanji = romaji_to_kanji eki_1 global_ekimei_list in
        if eki_1_kanji = "" then eki_1 ^ " という駅は存在しません"
        else let eki_2_kanji = romaji_to_kanji eki_2 global_ekimei_list in
            if eki_2_kanji = "" then eki_2 ^ " という駅は存在しません"
            else let kyori = get_ekikan_kyori eki_1_kanji eki_2_kanji global_ekikan_list in
                if kyori = infinity then eki_1_kanji ^ "と" ^ eki_2_kanji ^ "はつながっていません"
                else eki_1_kanji ^ "から" ^ eki_2_kanji ^ "までは " ^ string_of_float kyori ^ " キロです";;

(* テスト *) 
let test1 = kyori_wo_hyoji "myougadani" "shinotsuka" 
	    = "myougadani という駅は存在しません";;
let test1 = kyori_wo_hyoji "myogadani" "shinotsuka" 
	    = "茗荷谷から新大塚までは 1.2 キロです";;
let test1 = kyori_wo_hyoji "myogadani" "ikebukuro" 
	    = "茗荷谷と池袋はつながっていません";;
let test1 = kyori_wo_hyoji "tokyo" "ootemachi" 
	    = "ootemachi という駅は存在しません";;
let test1 = kyori_wo_hyoji "tokyo" "otemachi" 
	    = "東京から大手町までは 0.6 キロです";;
