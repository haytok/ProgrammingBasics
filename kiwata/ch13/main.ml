(* 気になったプログラムだけ実行して行く *)
let rec map f lst = match lst with
    [] -> []
    | first :: rest ->
        f first :: map f rest;;
