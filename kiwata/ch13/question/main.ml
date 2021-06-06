(* 演習問題は基本的に全て解いていく *)

(* 13.1 *)
(* 人に関する情報を格納するレコード *) 
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
let lst = [person1; person2; person3];;

(* 目的 : person_t 型のリストを受け取ると、その中から指定された血液型の人の数を返す *)
(* count_ketsueki : person_t list -> string -> int *)
let rec count_ketsueki lst k = match lst with
    [] -> 0
    | first :: rest ->
        let value = count_ketsueki rest k in
            if first.ketsueki = k then 1 + value
            else value;;

(* テスト *) 
let test1 = count_ketsueki [] "A" = 0;;
let test2 = count_ketsueki lst "A" = 1;;
let test3 = count_ketsueki lst "O" = 1;;
let test4 = count_ketsueki lst "B" = 1;;
let test5 = count_ketsueki lst "AB" = 0;;

(* 13.2 *)
let take_name lst = match lst with
    {name = n; shincho = s; taiju = t; tsuki = ts; hi = h; ketsueki = k} -> n;;

let rec map f lst = match lst with
    [] -> []
    | first :: rest ->
        f first :: map f rest;;

(* 目的 : 要素が person_t 型のリストを受け取ると、その中に出てくる人に名前のリストを返す関数 *)
(* person_name : person_t list -> string list *)
let rec person_name lst = map take_name lst;;

(* テスト *) 
let test4 = person_name [] = [];;
let test5 = person_name lst = ["浅井"; "宮原"; "中村"];;

(* 13.3 *)
let one x = x + 1;;
let two x y = x;;
let three x y = y
let four x f = f x;;
let five f g x = g (f x);;

(* 13.4 *)
let times2 x = x * 2;;
let add3 y = y + 3;;
(* 目的 : 関数を二つ受け取ると、合成した関数を返す *)
(* compose : (int -> int) -> (int -> int) -> int -> int *)
let compose f g =
    let h x = f (g x) in h;;

(* テスト *) 
let test = (compose times2 add3) 4 = 14;;

(* 13.5 *)
(* teice : ('a -> 'a) -> 'a -> 'a *)
(* pass *)

(* 13.6 *)
(* 駅の例 *) 
let eki1 = {namae="池袋"; saitan_kyori = infinity; temae_list = []};;
let eki2 = {namae="新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]};;
let eki3 = {namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]};;
let eki4 = {namae="後楽園"; saitan_kyori = infinity; temae_list = []};;

(* 目的 : 漢字の駅名を二つと駅間リストを受け取ると、駅間距離を返す *)
(* global_ekikan_list : string -> string ->  *)
let rec get_ekikan_kyori eki_1 eki_2 lst = match lst with
    [] -> infinity
    | {kiten = kiten; shuten = shuten; keiyu = keiyu; kyori = kyori; jikan = jikan} :: rest ->
        if (eki_1 = kiten && eki_2 = shuten) || (eki_2 = kiten && eki_1 = shuten) then kyori
        else get_ekikan_kyori eki_1 eki_2 rest;;

(* 目的 : 直前に確定した駅 p と未確定の駅 q を受け取ると、二つの駅が直接繋がっているかを確認し、繋がっていれば q の最短距離と手前リストを必要に応じて更新する。 *)
(* koushin1 : eki_t -> eki_t -> eki_t *)
let koushin1 p q = match (p, q) with
    ({namae = p_n; saitan_kyori = p_s; temae_list = p_t},
    {namae = q_n; saitan_kyori = q_s; temae_list = q_t}) ->
        let value = get_ekikan_kyori p_n q_n global_ekikan_list in
            if value = infinity then q
            else if p_s +. value < q_s then {namae = q_n; saitan_kyori = p_s +. value; temae_list = q_n :: p_t}
            else q;;

(* テスト *) 
let test1 = koushin1 eki3 eki1 = eki1;;
let test2 = koushin1 eki3 eki2 = eki2;;
let test3 = koushin1 eki3 eki3 = eki3;;
let test4 = koushin1 eki3 eki4 = 
	{namae="後楽園"; saitan_kyori = 1.8; temae_list = ["後楽園"; "茗荷谷"]};;
let test5 = koushin1 eki2 eki1 = 
	{namae="池袋"; saitan_kyori = 3.0; temae_list = ["池袋"; "新大塚"; "茗荷谷"]};;
let test6 = koushin1 eki2 eki2 = eki2;;
let test7 = koushin1 eki2 eki3 = eki3;;
let test8 = koushin1 eki2 eki4 = eki4;;

(* 13.7 *)
(* 目的 : 直前に確定した駅 p を未確定の駅リスト v を受け取ると、必要な更新処理を行った後の未確定の駅リストを返す *)
(* koushin : eki_t -> eki_t list -> eki_t list *)
let koushin p v = 
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
