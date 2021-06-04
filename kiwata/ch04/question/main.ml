(* 演習問題は基本的に全て解いていく *)

(* 4.1 *)
let start_jikyuu = 850;;
let pass_time = 1;;
let time = 50;;

let baito_kyuuyo pass_time time = (start_jikyuu + 100 * pass_time) * time;;

baito_kyuuyo pass_time time;;

(* 4.2 *)
let jikoshokai name = name ^ "さん、こんにちは！";;

let name = "藤吉";;
jikoshokai name;;

(* 4.3 *)
(* let hyojun_taiju shincho = shincho *. shincho *. 22.0 *)

let shincho = 1.7;;
(* hyojun_taiju shincho;; *)

(* 4.4 *)
(* let bmi shincho taiju = taiju /. (shincho *. shincho);; *)

let taiju = 57.0;;
(* bmi shincho taiju;; *)

(* 4.5 *)
(*
val baito_kyuuyo : int -> int -> int = <fun>
val jikoshokai : string -> string = <fun>
val hyojun_taiju : float -> float = <fun>
val bmi : float -> flaot -> flaot = <fun>
*)

(* 4.6 *)
(* 目的: 鶴の数 x に応じた鶴の足の数を計算する *)
(* tsuru_no_ashi : int -> int *)
let tsuru_no_ashi x = x * 2;;

(* テスト *)
let test_1 = tsuru_no_ashi 25 = 50;;
let test_2 = tsuru_no_ashi 28 = 56;;
let test_3 = tsuru_no_ashi 31 = 61;;

(* 4.7 *)
(* 目的: 鶴の数 x と亀の数 y に応じた足の数の合計を計算する *)
(* tsurukame_no_ashi : int -> int -> int *)
let tsurukame_no_ashi tsuru kame = tsuru * 2 + kame * 4;;

(* テスト *)
let test_4 = tsurukame_no_ashi 2 5 = 24;;
let test_5 = tsurukame_no_ashi 2 8 = 36;;
let test_6 = tsurukame_no_ashi 3 1 = 11;;

(* 4.8 *)
(* 目的: 鶴と亀の合計数 total と足の合計数 ashi に応じた足の数の合計を計算する *)
(* tsurukame : int -> int -> int *)
let tsurukame total ashi = (4 * total - ashi) / 2;;

(* テスト *)
let test1 = tsurukame 0 0 = 0;;
let test2 = tsurukame 5 12 = 4;;
let test3 = tsurukame 12 34 = 7;;
