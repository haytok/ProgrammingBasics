(* 演習問題は基本的に全て解いていく *)

(* 7.1 *)
let goukei_to_heikin a b c d e =
    let total = a + b + c + d + e in
        total, total / 5;;

(* テスト *) 
let test1 = goukei_to_heikin 80 100 90 85 75 = (430, 86);;
let test2 = goukei_to_heikin 90 70 95 65 90 = (410, 82);;
let test3 = goukei_to_heikin 60 50 70 55 65 = (300, 60);;

(* 7.2 *)
let seiseki pair = match pair with
    (name, score) -> name ^ "さんの成績は " ^ score ^ " です。";;

(* テスト *) 
let test1 = seiseki ("浅井", "C") = "浅井さんの成績は C です。";;
let test2 = seiseki ("中村", "A") = "中村さんの成績は A です。";;
let test3 = seiseki ("出原", "B") = "出原さんの成績は B です。";;

(* 7.3 *)
let taisho_x pair = match pair with
    (x, y) -> (x, -. y);;

(* テスト *) 
let test1 = taisho_x (0.0, 0.0) = (0.0, 0.0);;
let test2 = taisho_x (2.3, 5.1) = (2.3, -5.1);;
let test3 = taisho_x (-3.8, -2.4) = (-3.8, 2.4);;

(* 7.4 *)
let chuten pair_1 pair_2 = match pair_1 with
    (x_1, y_1) -> match pair_2 with
        (x_2, y_2) -> ((x_1 +. x_2) /. 2.0, (y_1 +. y_2) /. 2.0);;

(* テスト *) 
let test1 = chuten (0.0, 0.0) (1.0, 2.0) = (0.5, 1.0);;
let test2 = chuten (2.3, 5.1) (7.6, 1.7) = (4.95, 3.4);;
let test3 = chuten (-3.8, -2.4) (3.4, -1.2) = (-0.2, -1.8);;
