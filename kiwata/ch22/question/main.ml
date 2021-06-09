(* 演習問題は基本的に全て解いていく *)

(* 22.1 *)
let count = ref (-1);;
let gensym s =
    (
        count := !count + 1;
        s ^ (string_of_int !count)
    );;

(* テスト *) 
let test1 = gensym "a" = "a0";;
let test2 = gensym "a" = "a1";;
let test3 = gensym "x" = "x2";;

(* 22.2 *)
let fib_array lst =
    let len = Array.length lst in
        if len > 0 then lst.(0) <- 0;
        if len > 1 then lst.(1) <- 1;
        for i = 2 to len - 1 do
            lst.(i) <- lst.(i - 1) + lst.(i - 2);
        done;
        lst;;

(* テスト *) 
let test = fib_array [|0; 0; 0; 0; 0; 0; 0; 0; 0; 0|] 
	   = [|0; 1; 1; 2; 3; 5; 8; 13; 21; 34|];;
