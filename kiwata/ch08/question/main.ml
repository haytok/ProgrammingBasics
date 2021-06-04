(* 演習問題は基本的に全て解いていく *)

(* 8.1 *)
type book_t = {
    title: string;
    author: string;
    publisher: string;
    price: int;
    isbn: string;
};;

(* 8.2 *)
type okozukai_t = {
    name: string;
    price: int;
    place: string;
    date: string;
};;

let item_1 = {
    name = "低レベルプログラミング";
    price = 1000;
    place = "梅田";
    date = "2021/0605";
};;

(* 8.3 *)
type person_t = {
    name: string;
    shincho: float;
    taiju: float;
    tsuki: int;
    hi: int;
    ketsuekigata: string;
};;

(* 8.4 *)
let ketsueki_hyoji data = match data with
    {
        name = n;
        shincho = s;
        taiju = tai;
        tsuki = tsuki;
        hi = hi;
        ketsuekigata = k;
    } -> n ^ "さんの血液型は " ^ k ^ " 型です";;

(* テスト *)
let person1 = 
  {name = "浅井"; 
   shincho = 1.72; 
   taiju = 58.5; 
   tsuki = 9; 
   hi = 17; 
   ketsuekigata = "A" 
};;
 
let person2 = { 
  name = "宮原"; 
  shincho = 1.63; 
  taiju = 55.0; 
  tsuki = 6; 
  hi = 30; 
  ketsuekigata = "B" 
};;
 
let person3 = { 
  name = "中村"; 
  shincho = 1.68; 
  taiju = 63.0; 
  tsuki = 6; 
  hi = 6; 
  ketsuekigata = "O" 
};;

let test1 = ketsueki_hyoji person1 = "浅井さんの血液型は A 型です";;
let test2 = ketsueki_hyoji person2 = "宮原さんの血液型は B 型です";;
let test3 = ketsueki_hyoji person3 = "中村さんの血液型は O 型です";;

(* 8.5 *)
type ekimei_t = {
    kanji: string;
    kana: string;
    romaji: string;
    shozoku: string;
};;

(* 8.6 *)
let hyoji data = match data with
    {
        kanji = k;
        kana = a;
        romaji = r;
        shozoku = s;
    } -> s ^ "、" ^ k ^ "（" ^ a ^ "）" ;;

(* テスト *)
let ekimei1 = {kanji="茗荷谷"; kana="みょうがだに"; 
	       romaji="myogadani"; shozoku="丸ノ内線"} 
let ekimei2 = {kanji="渋谷"; kana="しぶや"; 
	       romaji="shibuya"; shozoku="銀座線"} 
let ekimei3 = {kanji="大手町"; kana="おおてまち"; 
	       romaji="otemachi"; shozoku="千代田線"} 

let test1 = hyoji ekimei1 = "丸ノ内線、茗荷谷（みょうがだに）";;
let test2 = hyoji ekimei2 = "銀座線、渋谷（しぶや）";;
let test3 = hyoji ekimei3 = "千代田線、大手町（おおてまち）";;

(* 8.7 *)
type ekikan_t = {
    kiten: string;
    shuten: string;
    keiyu: string;
    kyori: float;
    jkan: int;
};;
