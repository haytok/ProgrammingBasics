(* 気になったプログラムだけ実行して行く *)
type team_t = Red | White;;

let team_string team = match team with
    Red -> "赤組"
    | White -> "白組";;

let test1 = team_string Red = "赤組";;

type nengou_t =
    Meiji of int
    | Taisho of int
    | Shouwa of int
    | Heisei of int

let to_seireki n = match n with
    Meiji (n) -> n + 1867
    | Taisho (n) -> n + 1911
    | Shouwa (n) -> n + 1925
    | Heisei (n) -> n + 1988;;

let test2 = to_seireki (Meiji (42)) = 1909;;

type tree_t =
    Empty
    | Leaf of int
    | Node of tree_t * int * tree_t;;

(* 木の下側のデータから作成していく *)
let tree_1 = Empty;;
let tree_2 = Leaf (3);;
let tree_3 = Node (tree_1, 4, tree_2);;
let tree_4 = Node (tree_2, 5, tree_3);;

let rec sum_tree tree = match tree with
    Empty -> 0
    | Leaf (n) -> n
    | Node (t1, n, t2) -> sum_tree (t1) + n + sum_tree (t2);;

(* テスト *) 
let test1 = sum_tree tree_1 = 0;;
let test2 = sum_tree tree_2 = 3;;
let test3 = sum_tree tree_3 = 7;;
let test4 = sum_tree tree_4 = 15;;

(* ２分探索木の例 *) 
let tree1 = Empty;;
let tree2 = Leaf (3);;
let tree3 = Node (Leaf (1), 2, Leaf (3));;
let tree4 = Node (Empty, 7, Leaf (9));;
let tree5 = Node (tree3, 6, tree4);;

let rec search tree data = match tree with
    Empty -> false
    | Leaf (n) -> data = n
    | Node (t1, n, t2) -> 
        if data = n then true
        else if data < n then search t1 data
        else search t2 data;;

(* テスト *) 
let test1 = search tree1 3 = false;;
let test2 = search tree2 3 = true;;
let test3 = search tree2 4 = false;;
let test4 = search tree5 6 = true;;
let test5 = search tree5 2 = true;;
let test6 = search tree5 1 = true;;
let test7 = search tree5 4 = false;;
let test8 = search tree5 7 = true;;
let test9 = search tree5 8 = false;;

let rec insert_tree tree data = match tree with
    Empty -> Leaf (data)
    | Leaf (n) -> 
        if data < n then Node (Leaf (data), n, Empty) 
        else Node (Empty, n, Leaf (data))
    | Node (t1, n, t2) ->
        if data < n then Node ((insert_tree t1 data), n, t2)
        else Node (t1, n, (insert_tree t2 data));;

(* テスト *) 
let test1 = insert_tree Empty 3 = Leaf (3);;
let test2 = insert_tree (Leaf (3)) 2 = Node (Leaf (2), 3, Empty);;
let test3 = insert_tree (Leaf (3)) 3 = Leaf (3);;
let test4 = insert_tree (Leaf (3)) 4 = Node (Empty, 3, Leaf (4));;
let test5 = insert_tree tree5 4 = 
            Node (Node (Leaf (1), 2, Node (Empty, 3, Leaf (4))), 
                  6, 
                  Node (Empty, 7, Leaf (9)));;

(* バリアント型と多相型 *)
type 'a tree_t =
    Empty
    | Leaf of 'a
    | Node of ('a tree_t * 'a * 'a tree_t);;

(* 上述の tree_t 型を拡張する *)
type ('a, 'b) tree_t =
    Empty
    | Leaf of 'a * 'b
    | Node of (('a, 'b) tree_t * 'a * 'b * ('a, 'b) tree_t);;
