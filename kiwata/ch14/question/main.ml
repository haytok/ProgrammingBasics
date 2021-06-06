(* 演習問題は基本的に全て解いていく *)

(* 14.1 *)
let rec filter p lst = match lst with
    [] -> []
    | first :: rest ->
        if p first then first :: filter p rest
        else filter p rest;;

let is_mod value = value mod 2 = 0;;

let even lst = filter is_mod lst;;

(* テスト *) 
let test1 = even [] = [];;
let test2 = even [3] = [];;
let test3 = even [2] = [2];;
let test4 = even [2; 1; 6; 4; 7] = [2; 6; 4];;
let test5 = even [1; 2; 6; 4; 7] = [2; 6; 4];;

(* 14.2 *)
(* 学生ひとり分のデータ（名前、点数、成績）を表す型 *) 
type gakusei_t = { 
  namae : string;       (* 名前 *) 
  tensuu : int;         (* 点数 *) 
  seiseki : string;     (* 成績 *) 
};;
 
(* gakusei_t list 型のデータの例 *) 
let lst1 = [];;
let lst2 = [{namae = "asai"; tensuu = 70; seiseki = "B"}];;
let lst3 = [{namae = "asai"; tensuu = 70; seiseki = "B"}; 
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}];;
let lst4 = [{namae = "yoshida"; tensuu = 80; seiseki = "A"}; 
            {namae = "asai"; tensuu = 70; seiseki = "B"}; 
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}];;

let rec length lst = match lst with
    [] -> 0
    | first :: rest -> 1 + length rest;;

let is_A value = value.seiseki = "A";;

let count_A lst = length (filter is_A lst);;

(* テスト *) 
let test1 = count_A lst1 = 0;;
let test2 = count_A lst2 = 0;;
let test3 = count_A lst3 = 1;;
let test4 = count_A lst4 = 2;;

(* 14.3 *)
let rec fold_right f lst init = match lst with
    [] -> init
    | first :: rest ->
        f first (fold_right f rest init);;

let con first rest_result = first ^ rest_result;;
let concat lst = fold_right con lst "";; 

(* テスト *) 
let test1 = concat [] = "";;
let test2 = concat ["春"] = "春";;
let test3 = concat ["春"; "夏"; "秋"; "冬"] = "春夏秋冬";;

(* 14.4 *)
(* 学生ひとり分のデータ（名前、点数、成績）を表す型 *) 
type gakusei_t = { 
  namae : string;       (* 名前 *) 
  tensuu : int;         (* 点数 *) 
  seiseki : string;     (* 成績 *) 
};;

(* gakusei_t list 型のデータの例 *) 
let lst1 = [];;
let lst2 = [{namae = "asai"; tensuu = 70; seiseki = "B"}];;
let lst3 = [{namae = "asai"; tensuu = 70; seiseki = "B"}; 
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}];;
let lst4 = [{namae = "yoshida"; tensuu = 80; seiseki = "A"}; 
            {namae = "asai"; tensuu = 70; seiseki = "B"}; 
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}];;

let add_tokuten first rest_result = first.tensuu + rest_result;;
let gakusei_sum lst = fold_right add_tokuten lst 0;;

(* テスト *) 
let test1 = gakusei_sum lst1 = 0;;
let test2 = gakusei_sum lst2 = 70;;
let test3 = gakusei_sum lst3 = 155;;
let test4 = gakusei_sum lst4 = 235;;

(* 14.5 *)
let rec filter p lst = match lst with
    [] -> []
    | first :: rest ->
        if p first then first :: filter p rest
        else filter p rest;;

let even lst = let is_mod value = value mod 2 = 0 in
    filter is_mod lst;;

(* テスト *) 
let test1 = even [] = [];;
let test2 = even [3] = [];;
let test3 = even [2] = [2];;
let test4 = even [2; 1; 6; 4; 7] = [2; 6; 4];;
let test5 = even [1; 2; 6; 4; 7] = [2; 6; 4];;

type gakusei_t = { 
  namae : string;       (* 名前 *) 
  tensuu : int;         (* 点数 *) 
  seiseki : string;     (* 成績 *) 
};;
 
(* gakusei_t list 型のデータの例 *) 
let lst1 = [];;
let lst2 = [{namae = "asai"; tensuu = 70; seiseki = "B"}];;
let lst3 = [{namae = "asai"; tensuu = 70; seiseki = "B"}; 
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}];;
let lst4 = [{namae = "yoshida"; tensuu = 80; seiseki = "A"}; 
            {namae = "asai"; tensuu = 70; seiseki = "B"}; 
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}];;

let rec length lst = match lst with
    [] -> 0
    | first :: rest -> 1 + length rest;;

let count_A lst = let is_A value = value.seiseki = "A" in
    length (filter is_A lst);;

(* テスト *) 
let test1 = count_A lst1 = 0;;
let test2 = count_A lst2 = 0;;
let test3 = count_A lst3 = 1;;
let test4 = count_A lst4 = 2;;

let rec fold_right f lst init = match lst with
    [] -> init
    | first :: rest ->
        f first (fold_right f rest init);;

let concat lst = let con first rest_result = first ^ rest_result in
    fold_right con lst "";; 

(* テスト *) 
let test1 = concat [] = "";;
let test2 = concat ["春"] = "春";;
let test3 = concat ["春"; "夏"; "秋"; "冬"] = "春夏秋冬";;

(* 学生ひとり分のデータ（名前、点数、成績）を表す型 *) 
type gakusei_t = { 
  namae : string;       (* 名前 *) 
  tensuu : int;         (* 点数 *) 
  seiseki : string;     (* 成績 *) 
};;

(* gakusei_t list 型のデータの例 *) 
let lst1 = [];;
let lst2 = [{namae = "asai"; tensuu = 70; seiseki = "B"}];;
let lst3 = [{namae = "asai"; tensuu = 70; seiseki = "B"}; 
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}];;
let lst4 = [{namae = "yoshida"; tensuu = 80; seiseki = "A"}; 
            {namae = "asai"; tensuu = 70; seiseki = "B"}; 
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}];;

let gakusei_sum lst = let add_tokuten first rest_result = first.tensuu + rest_result in
    fold_right add_tokuten lst 0;;

(* テスト *) 
let test1 = gakusei_sum lst1 = 0;;
let test2 = gakusei_sum lst2 = 70;;
let test3 = gakusei_sum lst3 = 155;;
let test4 = gakusei_sum lst4 = 235;;

(* 14.6 *)
(* 学生ひとり分のデータ（名前、点数、成績）を表す型 *) 
type gakusei_t = { 
  namae : string;       (* 名前 *) 
  tensuu : int;         (* 点数 *) 
  seiseki : string;     (* 成績 *) 
};;
 
(* gakusei_t list 型のデータの例 *) 
let lst1 = [];;
let lst2 = [{namae = "asai"; tensuu = 70; seiseki = "B"}];;
let lst3 = [{namae = "asai"; tensuu = 70; seiseki = "B"}; 
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}];;
let lst4 = [{namae = "yoshida"; tensuu = 80; seiseki = "A"}; 
            {namae = "asai"; tensuu = 70; seiseki = "B"}; 
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}];;

let rec length lst = match lst with
    [] -> 0
    | first :: rest -> 1 + length rest;;

let count_A lst = let is_A value = value.seiseki = "A" in
    length (filter is_A lst);;

let rec filter p lst = match lst with
    [] -> []
    | first :: rest ->
        if p first then first :: filter p rest
        else filter p rest;;

let count lst s =
    let is_seiseki gakusei = gakusei.seiseki = s in
        length (filter is_seiseki lst);;

let count_A lst = count lst "A";;

(* テスト *) 
let test1 = count_A lst1 = 0;;
let test2 = count_A lst2 = 0;;
let test3 = count_A lst3 = 1;;
let test4 = count_A lst4 = 2;;
let test5 = count lst4 "B" = 1;;
let test6 = count lst4 "C" = 0;;

(* 14.7 *)
type eki_t = { 
  namae        : string;       (* 駅名（漢字） *) 
  saitan_kyori : float;        (* 最短距離 *) 
  temae_list   : string list;  (* 手前の駅名（漢字）のリスト *) 
};;

let rec get_ekikan_kyori eki_1 eki_2 lst = match lst with
    [] -> infinity
    | {kiten = kiten; shuten = shuten; keiyu = keiyu; kyori = kyori; jikan = jikan} :: rest ->
        if (eki_1 = kiten && eki_2 = shuten) || (eki_2 = kiten && eki_1 = shuten) then kyori
        else get_ekikan_kyori eki_1 eki_2 rest;;

let rec map f lst = match lst with
    [] -> []
    | first :: rest ->
        f first :: map f rest;;

(* 駅の例 *) 
let eki1 = {namae="池袋"; saitan_kyori = infinity; temae_list = []};;
let eki2 = {namae="新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]};;
let eki3 = {namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]};;
let eki4 = {namae="後楽園"; saitan_kyori = infinity; temae_list = []};;

let koushin p v = 
    let koushin1 p q = match (p, q) with
        ({namae = p_n; saitan_kyori = p_s; temae_list = p_t},
        {namae = q_n; saitan_kyori = q_s; temae_list = q_t}) ->
            let value = get_ekikan_kyori p_n q_n global_ekikan_list in
                if value = infinity then q
                else if p_s +. value < q_s then {namae = q_n; saitan_kyori = p_s +. value; temae_list = q_n :: p_t}
                else q in
                    let f x = koushin1 p x in
                    map f v;;

(* 駅の例 *) 
let eki1 = {namae="池袋"; saitan_kyori = infinity; temae_list = []};;
let eki2 = {namae="新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]};;
let eki3 = {namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]};;
let eki4 = {namae="後楽園"; saitan_kyori = infinity; temae_list = []};;
 
(* 駅リストの例 *) 
let lst = [eki1; eki2; eki3; eki4];;
 
(* テスト *) 
let test1 = koushin eki2 [] = [];;
let test2 = koushin eki2 lst = 
 [{namae="池袋"; saitan_kyori = 3.0; temae_list = ["池袋"; "新大塚"; "茗荷谷"]}; 
  eki2; eki3; eki4];;

(* 14.8 *)
fun x -> x * x - 1;;

(* 14.9 *)
type person_t = { 
  name : string;	(* 名前 *) 
  shincho : float;	(* 身長 *) 
  taiju : float;	(* 体重 *) 
  tsuki : int;		(* 誕生月 *) 
  hi : int;		(* 誕生日 *) 
  ketsueki : string;	(* 血液型 *) 
};;

fun data -> data.name;;

(* 14.10 *)
let rec filter p lst = match lst with
    [] -> []
    | first :: rest ->
        if p first then first :: filter p rest
        else filter p rest;;

let even lst = filter (fun value -> value mod 2 = 0) lst;;

(* テスト *) 
let test1 = even [] = [];;
let test2 = even [3] = [];;
let test3 = even [2] = [2];;
let test4 = even [2; 1; 6; 4; 7] = [2; 6; 4];;
let test5 = even [1; 2; 6; 4; 7] = [2; 6; 4];;

type gakusei_t = { 
  namae : string;       (* 名前 *) 
  tensuu : int;         (* 点数 *) 
  seiseki : string;     (* 成績 *) 
};;
 
(* gakusei_t list 型のデータの例 *) 
let lst1 = [];;
let lst2 = [{namae = "asai"; tensuu = 70; seiseki = "B"}];;
let lst3 = [{namae = "asai"; tensuu = 70; seiseki = "B"}; 
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}];;
let lst4 = [{namae = "yoshida"; tensuu = 80; seiseki = "A"}; 
            {namae = "asai"; tensuu = 70; seiseki = "B"}; 
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}];;

let rec length lst = match lst with
    [] -> 0
    | first :: rest -> 1 + length rest;;

let count_A lst = length (filter (fun value -> value.seiseki = "A") lst);;

(* テスト *) 
let test1 = count_A lst1 = 0;;
let test2 = count_A lst2 = 0;;
let test3 = count_A lst3 = 1;;
let test4 = count_A lst4 = 2;;

let rec fold_right f lst init = match lst with
    [] -> init
    | first :: rest ->
        f first (fold_right f rest init);;

let concat lst = fold_right (fun first rest_result -> first ^ rest_result) lst "";; 

(* テスト *) 
let test1 = concat [] = "";;
let test2 = concat ["春"] = "春";;
let test3 = concat ["春"; "夏"; "秋"; "冬"] = "春夏秋冬";;

(* 学生ひとり分のデータ（名前、点数、成績）を表す型 *) 
type gakusei_t = { 
  namae : string;       (* 名前 *) 
  tensuu : int;         (* 点数 *) 
  seiseki : string;     (* 成績 *) 
};;

(* gakusei_t list 型のデータの例 *) 
let lst1 = [];;
let lst2 = [{namae = "asai"; tensuu = 70; seiseki = "B"}];;
let lst3 = [{namae = "asai"; tensuu = 70; seiseki = "B"}; 
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}];;
let lst4 = [{namae = "yoshida"; tensuu = 80; seiseki = "A"}; 
            {namae = "asai"; tensuu = 70; seiseki = "B"}; 
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}];;

let gakusei_sum lst = fold_right (fun first rest_result -> first.tensuu + rest_result) lst 0;;

(* テスト *) 
let test1 = gakusei_sum lst1 = 0;;
let test2 = gakusei_sum lst2 = 70;;
let test3 = gakusei_sum lst3 = 155;;
let test4 = gakusei_sum lst4 = 235;;

(* 14.11 *)


(* 14.12 *)


(* 14.13 *)


(* 14.14 *)


(* 14.15 *)


(* 14.16 *)

