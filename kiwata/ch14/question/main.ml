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
type eki_t = { 
  namae        : string;       (* 駅名（漢字） *) 
  saitan_kyori : float;        (* 最短距離 *) 
  temae_list   : string list;  (* 手前の駅名（漢字）のリスト *) 
};;

type ekimei_t = { 
  kanji   : string; (* 漢字の駅名 *) 
  kana    : string; (* 読み *) 
  romaji  : string; (* ローマ字 *) 
  shozoku : string; (* 所属路線名 *) 
};;

let ekimei_list = [ 
    {kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="丸ノ内線"}; 
    {kanji="新大塚"; kana="しんおおつか"; romaji="shinotsuka"; shozoku="丸ノ内線"}; 
    {kanji="茗荷谷"; kana="みょうがだに"; romaji="myogadani"; shozoku="丸ノ内線"}; 
    {kanji="後楽園"; kana="こうらくえん"; romaji="korakuen"; shozoku="丸ノ内線"}; 
    {kanji="本郷三丁目"; kana="ほんごうさんちょうめ"; romaji="hongosanchome"; shozoku="丸ノ内線"}; 
    {kanji="御茶ノ水"; kana="おちゃのみず"; romaji="ochanomizu"; shozoku="丸ノ内線"} 
];;
(* 目的 : ekimei_t のリストを受け取ると、要素が eki_t 型のリストを返す *)
(* make_eki_list : ekimei_t list -> eki_t list *)
(* let rec make_eki_list lst = match lst with
    [] -> []
    | {kanji = kanji; kana = kana; romaji = romaji; shozoku = shozoku} :: rest ->
        {namae = kanji; saitan_kyori = infinity; temae_list = []} :: make_eki_list rest;; *)

let make_eki_list lst = map (fun item ->
    match item with {kanji = kanji; kana = kana; romaji = romaji; shozoku = shozoku} ->
        {namae = kanji; saitan_kyori = infinity; temae_list = []}
    )
    lst;; 

(* テスト *) 
let test1 = make_eki_list [] = [];;
let test2 = make_eki_list ekimei_list = [ 
    {namae="池袋"; saitan_kyori = infinity; temae_list = []}; 
    {namae="新大塚"; saitan_kyori = infinity; temae_list = []}; 
    {namae="茗荷谷"; saitan_kyori = infinity; temae_list = []}; 
    {namae="後楽園"; saitan_kyori = infinity; temae_list = []}; 
    {namae="本郷三丁目"; saitan_kyori = infinity; temae_list = []}; 
    {namae="御茶ノ水"; saitan_kyori = infinity; temae_list = []} 
];;

let eki_list = [ 
    {namae="池袋"; saitan_kyori = infinity; temae_list = []}; 
    {namae="新大塚"; saitan_kyori = infinity; temae_list = []}; 
    {namae="茗荷谷"; saitan_kyori = infinity; temae_list = []}; 
    {namae="後楽園"; saitan_kyori = infinity; temae_list = []}; 
    {namae="本郷三丁目"; saitan_kyori = infinity; temae_list = []}; 
    {namae="御茶ノ水"; saitan_kyori = infinity; temae_list = []} 
];;
(* 目的 : eki_t 型のリストと起点を表す漢字の文字列を受け取ると、起点のみ初期化された eki_t 型のリストを返す関数 *)

let shokika eki_lst kiten = map (
        fun item ->
            match item with {namae = namae; saitan_kyori = saitan_kyori; temae_list = temae_list} as first ->
                if namae = kiten then {namae = namae; saitan_kyori = 0.0; temae_list = [namae]} else first
    )
    eki_lst;;

(* テスト *) 
let test1 = shokika [] "茗荷谷" = [];;
let test2 = shokika eki_list "茗荷谷" = [ 
    {namae="池袋"; saitan_kyori = infinity; temae_list = []}; 
    {namae="新大塚"; saitan_kyori = infinity; temae_list = []}; 
    {namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]}; 
    {namae="後楽園"; saitan_kyori = infinity; temae_list = []}; 
    {namae="本郷三丁目"; saitan_kyori = infinity; temae_list = []}; 
    {namae="御茶ノ水"; saitan_kyori = infinity; temae_list = []} 
];;

(* 14.12 *)
(* 駅名リストの例 *) 
let ekimei_list = [ 
    {kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="丸ノ内線"}; 
    {kanji="新大塚"; kana="しんおおつか"; romaji="shinotsuka"; shozoku="丸ノ内線"}; 
    {kanji="茗荷谷"; kana="みょうがだに"; romaji="myogadani"; shozoku="丸ノ内線"}; 
    {kanji="後楽園"; kana="こうらくえん"; romaji="korakuen"; shozoku="丸ノ内線"}; 
    {kanji="本郷三丁目"; kana="ほんごうさんちょうめ"; romaji="hongosanchome"; shozoku="丸ノ内線"}; 
    {kanji="御茶ノ水"; kana="おちゃのみず"; romaji="ochanomizu"; shozoku="丸ノ内線"} 
];;

let make_initial_eki_list eki_lst kiten = map (
        fun item ->
            match item with {kanji = kanji; kana = kana; romaji = romaji; shozoku = shozoku} ->
                if kanji = kiten then {namae = kanji; saitan_kyori = 0.0; temae_list = [kanji]}
                else {namae = kanji; saitan_kyori = infinity; temae_list = []}
    )
    eki_lst;;

(* テスト *) 
let test1 = make_initial_eki_list [] "茗荷谷" = [];;
let test2 = make_initial_eki_list ekimei_list "茗荷谷" = [ 
    {namae="池袋"; saitan_kyori = infinity; temae_list = []}; 
    {namae="新大塚"; saitan_kyori = infinity; temae_list = []}; 
    {namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]}; 
    {namae="後楽園"; saitan_kyori = infinity; temae_list = []}; 
    {namae="本郷三丁目"; saitan_kyori = infinity; temae_list = []}; 
    {namae="御茶ノ水"; saitan_kyori = infinity; temae_list = []} 
];;

(* 14.13 *)
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

(* 根本的に構造を返る必要がある *)
let koushin p v = match p with
    {namae = p_n; saitan_kyori = p_s; temae_list = p_t} ->
        map (
            fun q -> match q with
                {namae = q_n; saitan_kyori = q_s; temae_list = q_t} ->
                    let value = get_ekikan_kyori p_n q_n global_ekikan_list in
                        if value = infinity then q
                        else if p_s +. value < q_s then {namae = q_n; saitan_kyori = p_s +. value; temae_list = q_n :: p_t}
                        else q
        ) v;;

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

(* 14.14 *)
let rec fold_right f lst init = match lst with
    [] -> init
    | first :: rest ->
        f first (fold_right f rest init);;

let concat lst = fold_right (^) lst "";; 

(* テスト *) 
let test1 = concat [] = "";;
let test2 = concat ["春"] = "春";;
let test3 = concat ["春"; "夏"; "秋"; "冬"] = "春夏秋冬";;

(* 14.15 *)
let rec enumerate n =
    if n = 0 then []
    else n :: enumerate (n - 1);;

let one_to_n n = fold_right (+) (enumerate n) 0;;

(* テスト *) 
let test1 = one_to_n 0 = 0;;
let test2 = one_to_n 1 = 1;;
let test3 = one_to_n 2 = 3;;
let test4 = one_to_n 10 = 55;;

(* 14.16 *)
let fac n = fold_right ( * ) (enumerate n) 1;;

(* テスト *) 
let test1 = fac 0 = 1;;
let test2 = fac 1 = 1;;
let test3 = fac 2 = 2;;
let test4 = fac 3 = 6;;
let test5 = fac 4 = 24;;
let test6 = fac 10 = 3628800;;
