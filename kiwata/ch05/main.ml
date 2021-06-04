(* 気になったプログラムだけ実行して行く *)
let jikyu = 950;;
let kihonkyu = 100;;
let yugu_jikyu = 980;;
let kyuyo x =
    if x < 30 then kihonkyu + x * jikyu
    else kihonkyu + x * yugu_jikyu;;
let kyuyo x =
    kihonkyu + (if x < 30 then x * jikyu else x * yugu_jikyu);;

(* テスト *) 
let test1 = kyuyo 25 = 23850;;
let test2 = kyuyo 28 = 26700;;
let test3 = kyuyo 31 = 30480;;
