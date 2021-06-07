(* 気になったプログラムだけ実行して行く *)
type distance_t = {
    kyori: float;
    total: float;
};;

let total_distance lst =
    let rec hojo lst total0 = match lst with
            [] -> []
            | first :: rest ->
                let tmp = first.total +. total0 in
                    {kyori = first.kyori; total = tmp} :: hojo rest tmp in
                        hojo lst 0.0;;

(* テスト *) 
let test = total_distance [{kyori = 0.3; total = 0.}; 
			   {kyori = 0.9; total = 0.}; 
			   {kyori = 1.4; total = 0.}; 
			   {kyori = 0.8; total = 0.}] 
	   = [{kyori = 0.3; total = 0.3}; 
	      {kyori = 0.9; total = 1.2}; 
	      {kyori = 1.4; total = 2.6}; 
	      {kyori = 0.8; total = 3.4}];;

(*  *)
(* 目的 : lst の逆順のリスト result を返す *)
let reverse lst =
    let rec rev lst result = match lst with
        [] -> result
        | first :: rest ->
            rev rest (first :: result) in
                rev lst [];;

(* テスト *) 
let test1 = reverse [] = [];;
let test2 = reverse [1] = [1];;
let test3 = reverse [1; 2; 3; 4; 5] = [5; 4; 3; 2; 1];;