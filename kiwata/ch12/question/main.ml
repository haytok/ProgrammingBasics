(* 演習問題は基本的に全て解いていく *)

(* 12.1 *)
type eki_t = {
    namae: string;
    saitan_kyori: float;
    temae_list: string list;
};;

(* 12.2 *)
let ekimei_list = [ 
    {kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="丸ノ内線"}; 
    {kanji="新大塚"; kana="しんおおつか"; romaji="shinotsuka"; shozoku="丸ノ内線"}; 
    {kanji="茗荷谷"; kana="みょうがだに"; romaji="myogadani"; shozoku="丸ノ内線"}; 
    {kanji="後楽園"; kana="こうらくえん"; romaji="korakuen"; shozoku="丸ノ内線"}; 
    {kanji="本郷三丁目"; kana="ほんごうさんちょうめ"; romaji="hongosanchome"; shozoku="丸ノ内線"}; 
    {kanji="御茶ノ水"; kana="おちゃのみず"; romaji="ochanomizu"; shozoku="丸ノ内線"} 
];;
(* 目的 : ekimei_t のリストを受け取ると、要素が eki_t 型のリストを返す *)
(* make_eki_list : ekimei_t list -> eki_t list *)
let rec make_eki_list lst = match lst with
    [] -> []
    | {kanji = kanji; kana = kana; romaji = romaji; shozoku = shozoku} :: rest ->
        {namae = kanji; saitan_kyori = infinity; temae_list = []} :: make_eki_list rest;;

(* テスト *) 
let test1 = make_eki_list [] = [];;
let test2 = make_eki_list ekimei_list = [ 
    {namae="池袋"; saitan_kyori = infinity; temae_list = []}; 
    {namae="新大塚"; saitan_kyori = infinity; temae_list = []}; 
    {namae="茗荷谷"; saitan_kyori = infinity; temae_list = []}; 
    {namae="後楽園"; saitan_kyori = infinity; temae_list = []}; 
    {namae="本郷三丁目"; saitan_kyori = infinity; temae_list = []}; 
    {namae="御茶ノ水"; saitan_kyori = infinity; temae_list = []} 
];;

(* 12.3 *)
let eki_list = [ 
    {namae="池袋"; saitan_kyori = infinity; temae_list = []}; 
    {namae="新大塚"; saitan_kyori = infinity; temae_list = []}; 
    {namae="茗荷谷"; saitan_kyori = infinity; temae_list = []}; 
    {namae="後楽園"; saitan_kyori = infinity; temae_list = []}; 
    {namae="本郷三丁目"; saitan_kyori = infinity; temae_list = []}; 
    {namae="御茶ノ水"; saitan_kyori = infinity; temae_list = []} 
];;
(* 目的 : eki_t 型のリストと起点を表す漢字の文字列を受け取ると、起点のみ初期化された eki_t 型のリストを返す関数 *)
(* shokika : eki_t list -> string -> eki_t list *)
let rec shokika eki_lst kiten = match eki_lst with
    [] -> []
    | ({namae = namae; saitan_kyori = saitan_kyori; temae_list = temae_list} as first) :: rest ->
        if namae = kiten then {namae = namae; saitan_kyori = 0.0; temae_list = [namae]} :: (shokika rest kiten)
        else first :: (shokika rest kiten);;

(* テスト *) 
let test1 = shokika [] "茗荷谷" = [];;
let test2 = shokika eki_list "茗荷谷" = [ 
    {namae="池袋"; saitan_kyori = infinity; temae_list = []}; 
    {namae="新大塚"; saitan_kyori = infinity; temae_list = []}; 
    {namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]}; 
    {namae="後楽園"; saitan_kyori = infinity; temae_list = []}; 
    {namae="本郷三丁目"; saitan_kyori = infinity; temae_list = []}; 
    {namae="御茶ノ水"; saitan_kyori = infinity; temae_list = []} 
];;

(* 12.4 *)
let ekimei_list = [ 
    {kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="丸ノ内線"}; 
    {kanji="新大塚"; kana="しんおおつか"; romaji="shinotsuka"; shozoku="丸ノ内線"}; 
    {kanji="茗荷谷"; kana="みょうがだに"; romaji="myogadani"; shozoku="丸ノ内線"}; 
    {kanji="後楽園"; kana="こうらくえん"; romaji="korakuen"; shozoku="丸ノ内線"}; 
    {kanji="本郷三丁目"; kana="ほんごうさんちょうめ"; romaji="hongosanchome"; shozoku="丸ノ内線"}; 
    {kanji="御茶ノ水"; kana="おちゃのみず"; romaji="ochanomizu"; shozoku="丸ノ内線"} 
];;

(* 目的 : ひらがな順に整列している ekimet_t 型のリストを受け取ると、ひらがな順に整列した ekimei_t 型のリストを返す *)
(* ekimei_insert : ekimei_t list -> ekimei_t list *)
let rec ekimei_insert lst data = match lst with
    [] -> data :: []
    | {kanji = kanji; kana = kana; romaji = r; shozoku = s} as first :: rest ->
        let value = ekimei_insert rest data in
            if kana < data.kana then first :: value
            else if kana = data.kana then value
            else data :: lst;;

(* テスト *) 
let test1 = ekimei_insert [] {kanji="茗荷谷"; kana="みょうがだに"; romaji="myogadani"; shozoku="丸ノ内線"} 
	    = [{kanji="茗荷谷"; kana="みょうがだに"; romaji="myogadani"; shozoku="丸ノ内線"}];;
let test2 = ekimei_insert [ 
	{kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="丸ノ内線"}; 
	{kanji="御茶ノ水"; kana="おちゃのみず"; romaji="ochanomizu"; shozoku="丸ノ内線"}; 
	{kanji="新大塚"; kana="しんおおつか"; romaji="shinotsuka"; shozoku="丸ノ内線"}; 
	{kanji="本郷三丁目"; kana="ほんごうさんちょうめ"; romaji="hongosanchome"; shozoku="丸ノ内線"}; 
	{kanji="茗荷谷"; kana="みょうがだに"; romaji="myogadani"; shozoku="丸ノ内線"} 
	] 
	{kanji="後楽園"; kana="こうらくえん"; romaji="korakuen"; shozoku="丸ノ内線"} 
= [ 
{kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="丸ノ内線"}; 
{kanji="御茶ノ水"; kana="おちゃのみず"; romaji="ochanomizu"; shozoku="丸ノ内線"}; 
{kanji="後楽園"; kana="こうらくえん"; romaji="korakuen"; shozoku="丸ノ内線"}; 
{kanji="新大塚"; kana="しんおおつか"; romaji="shinotsuka"; shozoku="丸ノ内線"}; 
{kanji="本郷三丁目"; kana="ほんごうさんちょうめ"; romaji="hongosanchome"; shozoku="丸ノ内線"}; 
{kanji="茗荷谷"; kana="みょうがだに"; romaji="myogadani"; shozoku="丸ノ内線"} 
];;

(* 目的 : ekimei_t 型のリストを受け取ると、ひらがな順でソートを行い、駅の重複を取り除いた ekimei_t 型のリストを返す *)
(* seiretsu : ekimei_t list -> ekimei_t list *)
let rec seiretsu lst = match lst with
    [] -> []
    | first :: rest ->
        ekimei_insert (seiretsu rest) first ;;

(* テスト *) 
let test3 = seiretsu [] = [];;
let test4 = seiretsu ekimei_list = [ 
    {kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="丸ノ内線"}; 
    {kanji="御茶ノ水"; kana="おちゃのみず"; romaji="ochanomizu"; shozoku="丸ノ内線"}; 
    {kanji="後楽園"; kana="こうらくえん"; romaji="korakuen"; shozoku="丸ノ内線"}; 
    {kanji="新大塚"; kana="しんおおつか"; romaji="shinotsuka"; shozoku="丸ノ内線"}; 
    {kanji="本郷三丁目"; kana="ほんごうさんちょうめ"; romaji="hongosanchome"; shozoku="丸ノ内線"}; 
    {kanji="茗荷谷"; kana="みょうがだに"; romaji="myogadani"; shozoku="丸ノ内線"} 
];;
