(* 気になったプログラムだけ実行して行く *)
(*  *)
(* 八百屋においてある野菜と値段のリストの例 *) 
let yaoya_list = [
    ("トマト", 300);
    ("たまねぎ", 200); 
    ("にんじん", 150);
    ("ほうれん草", 200)
];;

(* price : string -> (string * int) * list -> int option *)
let rec price item yaoya_list = match yaoya_list with
    (* この値を 0 にすると、野菜がタダなのか売り切れなのかの判別がつかない。 *)
    [] -> None
    | (yasai, nedan) :: rest ->
        if yasai = item then Some (nedan)
        else price item rest;;

(* テスト *) 
let test1 = price "トマト" yaoya_list = Some (300);;
let test2 = price "じゃがいも" yaoya_list = None;;

(*  *)
let yaoya_list = [
    ("トマト", 300);
    ("たまねぎ", 200); 
    ("にんじん", 150);
    ("ほうれん草", 200)
];;
(* 目的 : 野菜のリストと八百屋のリストを受け取ると、野菜のリストに入っている野菜を全部買った時の合計の値段を返す *)
(* 例外処理もどきの実装 *)
(* match hogehoge with fugafuga の hogehoge は for hoge in items における hoge のイメージ *)
let rec total_price yasai_list yaoya_list = match yasai_list with
    [] -> 0
    | first :: rest ->
        match price first yaoya_list with
            None -> total_price rest yaoya_list
            | Some (p) -> p + total_price rest yaoya_list;;

(* テスト *) 
let test1 = total_price ["トマト"; "にんじん"] yaoya_list = 450;;
let test2 = total_price ["じゃがいも"; "たまねぎ"; "にんじん"] yaoya_list = 350;;

(*  *)
(* total_price : string list -> (string * int) list -> int option *)
let rec total_price yasai_list yaoya_list = match yasai_list with
    [] -> Some (0)
    | first :: rest ->
        match price first yaoya_list with
            None -> None
            | Some (p) -> match total_price rest yaoya_list with
                None -> None
                | Some(q) -> Some (p + q);;

let total_price yasai_list yaoya_list =
    let rec hojo yasai_list yaoya_list = match yasai_list with
        [] -> Some (0)
        | first :: rest ->
            match price first yaoya_list with
                None -> None
                | Some (p) -> match hojo rest yaoya_list with
                    None -> None
                    | Some(q) -> Some (p + q) in
                        match hojo yasai_list yaoya_list with
                            None -> 0
                            | Some (p) -> p;;

(* テスト *) 
let test1 = total_price ["たまねぎ"; "にんじん"] yaoya_list = 350;;
let test2 = total_price ["たまねぎ"; "じゃがいも"; "にんじん"] yaoya_list = 0;;
let test3 = total_price ["トマト"; "にんじん"] yaoya_list = 450;;

(* 上記の例外処理を行って実装したプログラムを改良する *)
(* ほしい野菜がいつでも八百屋にあると仮定する *)
let rec price item yaoya_list = match yaoya_list with
    (* この値を 0 にすると、野菜がタダなのか売り切れなのかの判別がつかない。 *)
    [] -> 0
    | (yasai, nedan) :: rest ->
        if yasai = item then nedan
        else price item rest;;

let rec total_price yasai_list yaoya_list = match yasai_list with
    [] -> 0
    | first :: rest ->
        price first yaoya_list + total_price rest yaoya_list;;

(* raise を使用してエラーハンドリングを行う *)
exception Urikire;;

let rec price item yaoya_list = match yaoya_list with
    (* この値を 0 にすると、野菜がタダなのか売り切れなのかの判別がつかない。 *)
    [] -> raise Urikire
    | (yasai, nedan) :: rest ->
        if yasai = item then nedan
        else price item rest;;

let total_price yasai_list yaoya_list = 
    let rec hojo yasai_list = match yasai_list with
        [] -> 0
        | first :: rest ->
            price first yaoya_list + hojo rest in
                try
                    hojo yasai_list
                with Urikire -> 0;;

(* 八百屋においてある野菜と値段のリストの例 *) 
let yaoya_list = [("トマト", 300); ("たまねぎ", 200); 
                  ("にんじん", 150); ("ほうれん草", 200)];;
 
(* テスト *) 
let test1 = total_price ["たまねぎ"; "にんじん"] yaoya_list = 350;;
let test2 = total_price ["たまねぎ"; "じゃがいも"; "にんじん"] yaoya_list = 0;;
let test3 = total_price ["トマト"; "にんじん"] yaoya_list = 450;;

(*  *)
exception Zero;;

let times lst =
    let rec hojo lst = match lst with
        [] -> 1
        | first :: rest ->
            if first = 0 then raise Zero
            else first * hojo rest in
                try
                    hojo lst
                with
                    Zero -> 0;;

(* テスト *) 
let test1 = times [3; 1; 4] = 12;;
let test2 = times [0] = 0;;
let test3 = times [3; 1; 0; 4] = 0;;
let test4 = times [3; 2; 1; 0] = 0;;