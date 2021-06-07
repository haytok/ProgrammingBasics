(* 演習問題は基本的に全て解いていく *)

(* 15.1 *)
(* quick_sort [1;1;1;1;1];; *)
(* int list = [1] *)
(* 上述のように配列の値が全て同じの時は、まとめられる。 *)
let rec quick_sort lst =
    let take n lst p = filter (fun x -> p x n) lst in
    let take_less n lst = take n lst (<) in
    let take_greater n lst = take n lst (>) in
    let take_equal n lst = take n lst (=) in
        match lst with
            [] -> []
            | first :: rest ->
                quick_sort (take_less first rest)
                @ take_equal first lst
                @ quick_sort (take_greater first rest);;

(* テスト *) 
let test1 = quick_sort [] = [];;
let test2 = quick_sort [1] = [1];;
let test3 = quick_sort [1; 2] = [1; 2];;
let test4 = quick_sort [2; 1] = [1; 2];;
let test5 = quick_sort [5; 4; 9; 8; 2; 3] = [2; 3; 4; 5; 8; 9];;
let test6 = quick_sort [1; 1] = [1; 1];;

(* 15.2 *)
let rec gcd m n =
    if n = 0 then m
    else gcd n (m mod n);;

(* テスト *) 
let test1 = gcd 7 5 = 1;;
let test2 = gcd 30 18 = 6;;
let test3 = gcd 36 24 = 12;;

(* 15.3 *)
let rec filter p lst = match lst with
    [] -> []
    | first :: rest ->
        if p first then first :: filter p rest
        else filter p rest;;

(* 目的 : 2 以上 n 以下の自然数のリストを受け取ると、2 以上 n 以下の素数のリストを返す *)
let rec sieve lst = match lst with
    [] -> []
    | first :: rest ->
        first :: sieve (filter (fun x -> x mod first <> 0) rest);;

(* テスト *) 
let test1 = sieve [2; 3; 4; 5; 6; 7; 8; 9; 10] = [2; 3; 5; 7];;

let rec create_data n =
    if n = 1 then []
    else (create_data (n - 1)) @ [n];;

let prime n = sieve (create_data n);;

(* テスト *) 
let test3 = prime 10 = [2; 3; 5; 7];;

(* 15.4 *)
(* 駅の例 *) 
let eki1 = {namae="池袋"; saitan_kyori = infinity; temae_list = []};;
let eki2 = {namae="新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]};;
let eki3 = {namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]};;
let eki4 = {namae="後楽園"; saitan_kyori = infinity; temae_list = []};;
 
(* 駅リストの例 *) 
let lst = [eki1; eki2; eki3; eki4];;

(* 目的 : eki_t のリストを受け取ると、最短距離最小の駅と最短距離最小の駅以外から成るリストの組を返す *)
(* saitan_wo_bunri : eki_t list -> eki_t * eki_t list *)
let rec saitan_wo_bunri eki_list = match eki_list with
    [] -> ({namae = ""; saitan_kyori = infinity; temae_list = []}, [])
    | first :: rest ->
        let (p, v) = saitan_wo_bunri rest in
            if first.saitan_kyori < p.saitan_kyori then (first, rest)
            else (p, first :: v);;

(* テスト *) 
let test = saitan_wo_bunri lst = (eki3, [eki1; eki2; eki4]);;

(* 15.5 *)
let rec fold_right f lst init = match lst with
    [] -> init
    | first :: rest ->
        f first (fold_right f rest init);;

let saitan_wo_bunri eki_list = match eki_list with
    [] -> ({namae = ""; saitan_kyori = infinity; temae_list = []}, [])
    | first :: rest ->
        fold_right (
            (* fold_right が第一引数として受け取る f について考えると良い *)
            (* f は first と fold_right の返り値を受け取ることを念頭に置いておく *)
            fun first (p, v) ->
                if first.saitan_kyori < p.saitan_kyori then (first, p :: v)
                else (p, first :: v)
        ) rest (first, []);;

(* 駅の例 *) 
let eki1 = {namae="池袋"; saitan_kyori = infinity; temae_list = []};;
let eki2 = {namae="新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]};;
let eki3 = {namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]};;
let eki4 = {namae="後楽園"; saitan_kyori = infinity; temae_list = []};;

(* 駅リストの例 *) 
let lst = [eki1; eki2; eki3; eki4];;

(* テスト *) 
let test = saitan_wo_bunri lst = (eki3, [eki2; eki1; eki4]);;
