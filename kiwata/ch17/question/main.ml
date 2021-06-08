(* 演習問題は基本的に全て解いていく *)

(* 17.1 *)
type nengou_t =
    Meiji of int
    | Taisho of int
    | Showa of int
    | Heisei of int

let to_seireki n = match n with
    Meiji (n) -> n + 1867
    | Taisho (n) -> n + 1911
    | Showa (n) -> n + 1925
    | Heisei (n) -> n + 1988;;

let nenrei tanjo gennzai = to_seireki (gennzai) - to_seireki (tanjo);;

(* テスト *) 
let test1 = nenrei (Showa (42)) (Heisei (18)) = 39;;
let test2 = nenrei (Heisei (11)) (Heisei (18)) = 7;;
let test3 = nenrei (Meiji (41)) (Heisei (17)) = 97;;

(* 17.2 *)
type year_t =
    January of int
    | February of int
    | March of int
    | April of int
    | May of int
    | June of int
    | July of int
    | August of int
    | September of int
    | October of int
    | November of int;;

(* 17.3 *)
type seiza_t = Capricorus
             | Aquarius
             | Pisces
             | Aries
             | Taurus
             | Gemini
             | Cancer
             | Leo
             | Virgo
             | Libra
             | Scorpius
             | Sagittarius;;

(* 17.4 *)
(* 星座の計算はパス *)

(* 17.5 *)
(* 木の例 *) 
let tree1 = Empty;;
let tree2 = Leaf (3);;
let tree3 = Node (tree1, 4, tree2);;
let tree4 = Node (tree2, 5, tree3);;

(* 目的 : tree_t 型の木を受け取ると、節や葉に入っている値を全て倍にした気を返す *)
let rec tree_double tree = match tree with
    Empty -> Empty
    | Leaf (n) -> Leaf (2 * n)
    | Node (t1, n, t2) -> Node (tree_double t1, n * 2, tree_double t2);;

(* テスト *) 
let test1 = tree_double tree1 = Empty;;
let test2 = tree_double tree2 = Leaf (6);;
let test3 = tree_double tree3 = Node (Empty, 8, Leaf (6));;
let test4 = tree_double tree4 = Node (Leaf (6), 10, Node (Empty, 8, Leaf (6)));;

(* 17.6 *)
let rec tree_map f tree = match tree with
    Empty -> Empty
    | Leaf (n) -> Leaf (f n)
    | Node (t1, n, t2) -> Node (tree_map f t1, f n, tree_map f t2);;

(* テスト *) 
let test1 = tree_map (fun x -> x) tree1 = Empty;;
let test2 = tree_map (fun x -> x + 1) tree2 = Leaf (4);;
let test3 = tree_map (fun x -> x * 3) tree3 = Node (Empty, 12, Leaf (9));;
let test4 = tree_map (fun x -> x * 2) tree4 
	    = Node (Leaf (6), 10, Node (Empty, 8, Leaf (6)));;

(* 17.7 *)
let rec tree_length tree = match tree with
    Empty -> 0
    | Leaf (n) -> 1
    | Node (t1, n, t2) -> tree_length t1 + 1 + tree_length t2;;

(* テスト *) 
let test1 = tree_length tree1 = 0;;
let test2 = tree_length tree2 = 1;;
let test3 = tree_length tree3 = 2;;
let test4 = tree_length tree4 = 4;;

(* 17.8 *)
(* 目的 : tree_t 型の木を受け取ると、木の深さを返す *)
let rec tree_depth tree = match tree with
    Empty -> 0
    | Leaf (n) -> 0
    | Node (t1, n, t2) -> 1 + max (tree_depth t1) (tree_depth t2);;

(* テスト *) 
let test1 = tree_depth tree1 = 0;;
let test2 = tree_depth tree2 = 0;;
let test3 = tree_depth tree3 = 1;;
let test4 = tree_depth tree4 = 2;;

(* 17.9 *)
type 'a tree_t =
    Empty
    | Leaf of 'a
    | Node of ('a tree_t * 'a * 'a tree_t);;

(* 木の例 *) 
let tree1 = Empty;;
let tree2 = Leaf (3);;
let tree3 = Node (tree1, 4, tree2);;
let tree4 = Node (tree2, 5, tree3);;

let rec sum_tree tree = match tree with
    Empty -> 0
    | Leaf (n) -> n
    | Node (t1, n, t2) -> sum_tree (t1) + n + sum_tree (t2);;

(* テスト *) 
let test1 = sum_tree tree1 = 0;;
let test2 = sum_tree tree2 = 3;;
let test3 = sum_tree tree3 = 7;;
let test4 = sum_tree tree4 = 15;;

(* 17.10 *)
type ekikan_tree_t =
    Empty
    | Node of ekikan_tree_t * string * (string * float) list * ekikan_tree_t;;

(* 17.11 *)
let rec assoc ekimei0 lst = match lst with
    [] -> infinity
    | (ekimei, kyori) :: rest ->
        if ekimei = ekimei0 then kyori else assoc ekimei0 rest;;

(* テスト *) 
let test1 = assoc "後楽園" [] = infinity;;
let test2 = assoc "後楽園" [("新大塚", 1.2); ("後楽園", 1.8)] = 1.8;;
let test3 = assoc "池袋" [("新大塚", 1.2); ("後楽園", 1.8)] = infinity;;

(* 17.12 *)
(* 駅間の情報を格納するレコード型 *) 
type ekikan_t = { 
  kiten  : string; (* 起点 *) 
  shuten : string; (* 終点 *) 
  keiyu  : string; (* 経由路線名 *) 
  kyori  : float;  (* 距離 *) 
  jikan  : int;    (* 所要時間 *) 
};;

let rec insert1 ekikan_tree kiten shuten kyori = match ekikan_tree with
    Empty -> Node (Empty, kiten, [(shuten, kyori)] , Empty)
    | Node (left, ekimei, lst, right) ->
        if kiten < ekimei then Node (insert1 left kiten shuten kyori, ekimei, lst, right)
        else if kiten > ekimei then Node (left, ekimei, lst, insert1 right kiten shuten kyori)
        else Node (left, ekimei, (shuten, kyori) :: lst, right);;

let insert_ekikan ekikan_tree ekikan = match ekikan with
    {kiten = kiten; shuten = shuten; keiyu = keiyu; kyori = kyori; jikan = jikan} ->
        insert1 (insert1 ekikan_tree shuten kiten kyori) kiten shuten kyori;;

(* 駅間の例 *) 
let ekikan1 = 
  {kiten="池袋"; shuten="新大塚"; keiyu="丸ノ内線"; kyori=1.8; jikan=3} 
let ekikan2 = 
  {kiten="新大塚"; shuten="茗荷谷"; keiyu="丸ノ内線"; kyori=1.2; jikan=2};;
let ekikan3 = 
  {kiten="茗荷谷"; shuten="後楽園"; keiyu="丸ノ内線"; kyori=1.8; jikan=2};;
 
(* テスト *) 
let tree1 = insert_ekikan Empty ekikan1;;
let test1 = tree1 = 
  Node (Empty, "新大塚", [("池袋", 1.8)], 
	Node (Empty, "池袋", [("新大塚", 1.8)], Empty));;
let tree2 = insert_ekikan tree1 ekikan2;;
let test2 = tree2 = 
  Node (Empty, "新大塚", [("茗荷谷", 1.2); ("池袋", 1.8)], 
	Node (Empty, "池袋", [("新大塚", 1.8)], 
	      Node (Empty, "茗荷谷", [("新大塚", 1.2)], Empty)));;
let tree3 = insert_ekikan tree2 ekikan3;;
let test3 = tree3 = 
  Node (Node (Empty, "後楽園", [("茗荷谷", 1.8)], Empty), 
	"新大塚", [("茗荷谷", 1.2); ("池袋", 1.8)], 
        Node (Empty, 
	      "池袋", [("新大塚", 1.8)], 
	      Node (Empty, 
		    "茗荷谷", [("後楽園", 1.8); ("新大塚", 1.2)], 
		    Empty)));;

(* 17.13 *)
let rec fold_right f lst init = match lst with
    [] -> init
    | first :: rest ->
        f first (fold_right f rest init);;

let inserts_ekikan ekikan_tree ekikan_list =
    fold_right (fun ekikan tree -> insert_ekikan tree ekikan) ekikan_list ekikan_tree;;

(* テスト *) 
let test1 = inserts_ekikan Empty [ekikan1; ekikan2; ekikan3] = 
  Node (Node (Empty, "後楽園", [("茗荷谷", 1.8)], Empty), 
	"新大塚", [("茗荷谷", 1.2); ("池袋", 1.8)], 
        Node (Empty, 
	      "池袋", [("新大塚", 1.8)], 
	      Node (Empty, 
		    "茗荷谷", [("後楽園", 1.8); ("新大塚", 1.2)], 
		    Empty)));;

(* 17.14 *)
let rec get_ekikan_kyori eki1 eki2 tree = match tree with
    Empty -> infinity
    | Node (left, k, lst, right) ->
        if eki1 < k then get_ekikan_kyori eki1 eki2 left
        else if eki1 > k then get_ekikan_kyori eki1 eki2 right
        else assoc eki2 lst;;

(* テスト *) 
let global_ekikan_tree = inserts_ekikan Empty global_ekikan_list;;
let test1 = get_ekikan_kyori "茗荷谷" "新大塚" global_ekikan_tree = 1.2;;
let test2 = get_ekikan_kyori "茗荷谷" "池袋" global_ekikan_tree = infinity;;
let test3 = get_ekikan_kyori "東京" "大手町" global_ekikan_tree = 0.6;;

(* 17.15 *)
(* パス *)

(* 17.16 *)
(* パス *)

(* 17.17 *)
(* パス *)
