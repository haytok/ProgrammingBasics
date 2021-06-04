(* 演習問題は基本的に全て解いていく *)

(* 6.1 *)
let square x = x *. x;;
square 3. ;;

let pi = 3.14;;
let circle r = 2. *. pi *. r;;
circle 2.;;

let tv bangumi youbi =
    bangumi ^ "は" ^ youbi ^ "に放映です。";;
tv "ポケモン" "木曜日";;
