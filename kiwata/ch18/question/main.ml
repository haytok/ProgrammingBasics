(* 演習問題は基本的に全て解いていく *)

(* 18.1 *)
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
let lst1 = [person1; person2; person3];;
let lst2 = [person3; person2; person1];;

(* 目的 : 要素が person_t 型のリストを受け取ると、最初に血液型が A 型の人の要素を返す *)
(* first_A : person_t list -> person_t option *)
let rec first_A lst = match lst with
    [] -> None
    | first :: rest ->
        if first.ketsueki = "A" then Some (first)
        else first_A rest;;

(* テスト *) 
let test1 = first_A [] = None;;
let test2 = first_A lst1 = Some (person1);;
let test3 = first_A lst2 = Some (person1);;

(* 18.2 *)
let yaoya_list = [
    ("トマト", 300);
    ("たまねぎ", 200); 
    ("にんじん", 150);
    ("ほうれん草", 200)
];;

let rec price item yaoya_list = match yaoya_list with
    (* この値を 0 にすると、野菜がタダなのか売り切れなのかの判別がつかない。 *)
    [] -> None
    | (yasai, nedan) :: rest ->
        if yasai = item then Some (nedan)
        else price item rest;;

let rec count_urikire_yasai yasai_list yaoya_list = match yasai_list with
    [] -> 0
    | first :: rest ->
        match price first yaoya_list with
            None -> 1 + count_urikire_yasai rest yaoya_list
            | Some (p) -> count_urikire_yasai rest yaoya_list;;

(* テスト *) 
let test1 = count_urikire_yasai ["たまねぎ"; "にんじん"] yaoya_list = 0;;
let test2 = count_urikire_yasai ["たまねぎ"; "じゃがいも"; "にんじん"] yaoya_list = 1;;
let test3 = count_urikire_yasai ["しいたけ"; "なす"; "にんじん"] yaoya_list = 2;;

(* 18.3 *)
let rec assoc ekimei0 lst = match lst with
    [] -> raise Not_found
    | (ekimei, kyori) :: rest ->
        if ekimei = ekimei0 then kyori else assoc ekimei0 rest;;

(* テスト *)
let test1 = assoc "後楽園" [];;
let test2 = assoc "後楽園" [("新大塚", 1.2); ("後楽園", 1.8)] = 1.8;;
let test3 = assoc "池袋" [("新大塚", 1.2); ("後楽園", 1.8)];;

(* 18.4 *)
(* 駅に関する問題なのでパス *)

(* 18.5 *)
(* 駅に関する問題なのでパス *)

(* 18.6 *)
(* 駅に関する問題なのでパス *)

(* 18.7 *)
(* 駅に関する問題なのでパス *)
