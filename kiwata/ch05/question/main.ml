(* 演習問題は基本的に全て解いていく *)

(* 5.1 *)
let a = if 2 < 1 then 3 else 4;;
(* val a : int = 4 *)
let b = if "true" then 3.14 else 2.72;;
(* Error: This expression has type string but an expression was expected of type
         bool *)
let c = if "a" = "b" then false else true;;
(* val c : bool = true *)
let d = if true < false then 1 else "2";;
(* Error: This expression has type string but an expression was expected of type
         int *)
let e = if not (3 = 4) then 1 < 2 else 1 > 2;;
(* val e : bool = true *)

(* 5.2 *)
let jikan time = if time < 12 then "午前" else "午後";;

(* テスト *) 
let test1 = jikan 0 = "午前";;
let test2 = jikan 3 = "午前";;
let test3 = jikan 12 = "午後";;
let test4 = jikan 15 = "午後";;
let test5 = jikan 21 = "午後";;

(* 5.3 *)
(* pass *)

(* 5.4 *)
let hambetsusiki a b c = b *. b -. 4.0 *. a *. c;;

(* テスト *) 
let test1 = hambetsusiki 1.0 5.0 4.0 = 9.0;;
let test2 = hambetsusiki 2.0 (-4.0) 2.0 = 0.0;; 
let test3 = hambetsusiki 1.0 2.0 4.0 = -12.0;;

(* 5.5 *)
let kai_no_kosuu a b c =
    let value = hambetsusiki a b c in
        if value > 0.0 then 2
            else if value = 0.0 then 1
                else 0;;

(* テスト *) 
let test1 = kai_no_kosuu 1.0 5.0 4.0 = 2;;
let test2 = kai_no_kosuu 2.0 (-4.0) 2.0 = 1;;
let test3 = kai_no_kosuu 1.0 2.0 4.0 = 0;;

(* 5.6 *)
let kyosuukai a b c =
    let value = hambetsusiki a b c in
        if value < 0.0 then true else false;;

(* テスト *) 
let test1 = kyosuukai 1.0 5.0 4.0 = false;;
let test2 = kyosuukai 2.0 (-4.0) 2.0 = false;; 
let test3 = kyosuukai 1.0 2.0 4.0 = true;;

(* 5.7 *)
let bmi shincho taiju = taiju /. (shincho *. shincho);;
let taikei shincho taiju =
    let value = bmi shincho taiju in
        if value < 18.5 then "やせ"
            else if 18.5 <= value && value < 25.0 then "標準"
                else if 25.0 <= value  && value < 30.0 then "肥満"
                    else "高度肥満";;

(* テスト *) 
let test1 = taikei 1.13 20.0 = "やせ";;
let test2 = taikei 1.63 57.0 = "標準";;
let test3 = taikei 1.71 56.0 = "標準" ;;
