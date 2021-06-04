(* 気になったプログラムだけ実行して行く *)
let f x = x * 3;;
f 5;;

(* 目的: 働いた時間を x に応じたアルバイト代を計算する *)
(* kyuuyo : int -> int *)
let jikyu = 950;;
let kihonkyu = 100;;
let kyuuyo x = jikyu * x + kihonkyu;;

kyuuyo 25;;

(* テスト *)
let test_1 = kyuuyo 25 = 23850;;
let test_2 = kyuuyo 28 = 26700;;
let test_3 = kyuuyo 31 = 29550;;
