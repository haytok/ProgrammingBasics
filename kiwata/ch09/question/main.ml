(* 演習問題は基本的に全て解いていく *)

(* 9.1 *)
let season = "春" :: "夏" :: "秋" :: "冬" :: [];;

(* 9.2 *)
type person_t = {
    name: string;
    shincho: float;
    taiju: float;
    tsuki: int;
    hi: int;
    ketsuekigata: string;
};;

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

let persons = person1 :: person2 :: person3 :: [];;

(* 9.3 *)
let season = ["春"; "夏"; "秋"; "冬"];;

let person = [person1; person2; person3];;

(* 9.4 *)


(* 9.5 *)


(* 9.6 *)


(* 9.7 *)


(* 9.8 *)


(* 9.9 *)


(* 9.10 *)

