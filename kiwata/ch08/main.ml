(* 気になったプログラムだけ実行して行く *)
type gakusei_t = {
    name: string;
    tennsuu: int;
    seiseki: string;
};;

type value = {name = "Fujiyoshi"; tennsuu = 90; seiseki = "seiseki"};;

let tuchi gakusei = match gakusei with
    {name = n; tennsuu = t; seiseki = s} ->
        n ^ "さんの成績は" ^ string_of_int t ^ "点で、成績は" ^ s ^ "です。";;

tuchi {name = "Fujiyoshi"; tennsuu = 90; seiseki = "B"};;
