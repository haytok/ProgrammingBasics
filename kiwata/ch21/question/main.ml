(* 演習問題は基本的に全て解いていく *)

(* 21.1 *)
(* メトロネットワークに関する問題なのでパス *)

(* 21.2 *)
let rec filter p lst = match lst with
    [] -> []
    | first :: rest ->
        if p first then first :: filter p rest
        else filter p rest;;

let rec print_list lst = match lst with
    [] -> []
    | first :: rest ->
        (print_string (string_of_int first); print_string " ");
        print_list rest;;

(* テスト *)
print_list [0;1;2;3;4;5];;

(* 目的 : 2 以上 n 以下の自然数のリストを受け取ると、2 以上 n 以下の素数のリストを返す *)
let rec sieve lst =
    (
        print_int (List.length lst);
        print_newline ();
    );
    match lst with
        [] -> []
        | first :: rest ->
            first :: sieve (filter (fun x -> x mod first <> 0) rest);;

(* テスト *) 
let test1 = sieve [2; 3; 4; 5; 6; 7; 8; 9; 10] = [2; 3; 5; 7];;

(* 21.3 *)
(* メトロネットワークに関する問題なのでパス *)
