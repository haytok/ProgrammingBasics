(* 演習問題は基本的に全て解いていく *)

(* 16.1 *)
let sum_list lst =
    let rec hojo lst total0 = match lst with
        [] -> []
        | first :: rest ->
            (first + total0) :: hojo rest (first + total0)
                in hojo lst 0;;

(* テスト *) 
let test1 = sum_list [] = [];;
let test2 = sum_list [1; 2; 3] = [1; 3; 6];;
let test3 = sum_list [3; 2; 1; 4] = [3; 5; 6; 10];;

(* 16.2 *)
(* 目的 :  *)
(* fold_right は何を返す関数なのかを考えると、f の引数の意味を定義できる *)
(* それは、つまり fold_right の目的を考えることと同義である *)
let rec fold_right f lst init = match lst with
    [] -> init
    | first :: rest ->
        f first (fold_right f rest init);;

let rec fold_left f init lst = match lst with
    [] -> init
    | first :: rest ->
        fold_left f (f init first) rest;;

(* テスト *) 
let test1 = fold_left (-) 0 [] = 0;;
let test2 = fold_left (-) 10 [4; 1; 3] = 2;;
let test3 = fold_left (fun lst a -> a :: lst) [] [1; 2; 3; 4] = [4; 3; 2; 1];;

(* 16.3 *)
(* 駅の例 *) 
let eki1 = {namae="池袋"; saitan_kyori = infinity; temae_list = []};;
let eki2 = {namae="新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]};;
let eki3 = {namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]};;
let eki4 = {namae="後楽園"; saitan_kyori = infinity; temae_list = []};;

(* 駅リストの例 *) 
let lst = [eki1; eki2; eki3; eki4];;

(* もともとは、global_ekikan_list の変数はグローバル変数を指すようになっていた *)
let koushin p v global_ekikan_list = 
    let koushin1 p q = match (p, q) with
        ({namae = p_n; saitan_kyori = p_s; temae_list = p_t},
        {namae = q_n; saitan_kyori = q_s; temae_list = q_t}) ->
            let value = get_ekikan_kyori p_n q_n global_ekikan_list in
                if value = infinity then q
                else if p_s +. value < q_s then {namae = q_n; saitan_kyori = p_s +. value; temae_list = q_n :: p_t}
                else q in
                    let f x = koushin1 p x in
                    map f v;;

(* テスト *) 
let test1 = koushin eki2 [] global_ekikan_list = [];;
let test2 = koushin eki2 lst global_ekikan_list = 
 [{namae="池袋"; saitan_kyori = 3.0; temae_list = ["池袋"; "新大塚"; "茗荷谷"]}; 
  eki2; eki3; eki4];;

(* 16.4 *)
(* 駅の例 *) 
let eki1 = {namae="池袋"; saitan_kyori = infinity; temae_list = []};;
let eki2 = {namae="新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]};;
let eki3 = {namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]};;
let eki4 = {namae="後楽園"; saitan_kyori = infinity; temae_list = []};;

(* 駅リストの例 *) 
let lst = [eki1; eki2; eki3; eki4];;

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

(* ダイクストラのアルゴリズム *)
(* 未確定のリストを受け取ると、最短距離最小の点を分離し、その点に接続されている点を更新する *)
(* という処理を未確定の点がなくなるまで行う *)
(* dijkstra_main : eki_t list -> ekikan_t list -> eki_t list *)
let rec dijkstra_main eki_list ekikan_list = match eki_list with
    [] -> []
    | first :: rest ->
        let (saitan, nokori) = saitan_wo_bunri eki_list in
            let eki_list2 = koushin saitan nokori ekikan_list in
                saitan:: dijkstra_main eki_list2 ekikan_list;;

(* テスト *) 
let test1 = dijkstra_main [] global_ekikan_list = [];;
let test2 = dijkstra_main lst global_ekikan_list = 
  [{namae = "茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]}; 
   {namae = "新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]}; 
   {namae = "後楽園"; saitan_kyori = 1.8; temae_list = ["後楽園"; "茗荷谷"]}; 
   {namae = "池袋"; saitan_kyori = 3.; temae_list = ["池袋"; "新大塚"; "茗荷谷"]}];;

(* 16.5 *)
let global_ekimei_list = [ 
    {kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"}; 
    {kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"}; 
    {kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"}; 
    {kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="千代田線"}; 
    {kanji="乃木坂"; kana="のぎざか"; romaji="nogizaka"; shozoku="千代田線"}; 
    {kanji="赤坂"; kana="あかさか"; romaji="akasaka"; shozoku="千代田線"}; 
    {kanji="国会議事堂前"; kana="こっかいぎじどうまえ"; romaji="kokkaigijidoumae"; shozoku="千代田線"}; 
    {kanji="霞ヶ関"; kana="かすみがせき"; romaji="kasumigaseki"; shozoku="千代田線"}; 
    {kanji="日比谷"; kana="ひびや"; romaji="hibiya"; shozoku="千代田線"}; 
    {kanji="二重橋前"; kana="にじゅうばしまえ"; romaji="nijuubasimae"; shozoku="千代田線"}; 
    {kanji="大手町"; kana="おおてまち"; romaji="otemachi"; shozoku="千代田線"}; 
    {kanji="新御茶ノ水"; kana="しんおちゃのみず"; romaji="shin-ochanomizu"; shozoku="千代田線"}; 
    {kanji="湯島"; kana="ゆしま"; romaji="yushima"; shozoku="千代田線"}; 
    {kanji="根津"; kana="ねづ"; romaji="nedu"; shozoku="千代田線"}; 
    {kanji="千駄木"; kana="せんだぎ"; romaji="sendagi"; shozoku="千代田線"}; 
    {kanji="西日暮里"; kana="にしにっぽり"; romaji="nishinippori"; shozoku="千代田線"}; 
    {kanji="町屋"; kana="まちや"; romaji="machiya"; shozoku="千代田線"}; 
    {kanji="北千住"; kana="きたせんじゅ"; romaji="kitasenjyu"; shozoku="千代田線"}; 
    {kanji="綾瀬"; kana="あやせ"; romaji="ayase"; shozoku="千代田線"}; 
    {kanji="北綾瀬"; kana="きたあやせ"; romaji="kitaayase"; shozoku="千代田線"}; 
    {kanji="浅草"; kana="あさくさ"; romaji="asakusa"; shozoku="銀座線"}; 
    {kanji="田原町"; kana="たわらまち"; romaji="tawaramachi"; shozoku="銀座線"}; 
    {kanji="稲荷町"; kana="いなりちょう"; romaji="inaricho"; shozoku="銀座線"}; 
    {kanji="上野"; kana="うえの"; romaji="ueno"; shozoku="銀座線"}; 
    {kanji="上野広小路"; kana="うえのひろこうじ"; romaji="uenohirokoji"; shozoku="銀座線"}; 
    {kanji="末広町"; kana="すえひろちょう"; romaji="suehirocho"; shozoku="銀座線"}; 
    {kanji="神田"; kana="かんだ"; romaji="kanda"; shozoku="銀座線"}; 
    {kanji="三越前"; kana="みつこしまえ"; romaji="mitsukoshimae"; shozoku="銀座線"}; 
    {kanji="日本橋"; kana="にほんばし"; romaji="nihonbashi"; shozoku="銀座線"}; 
    {kanji="京橋"; kana="きょうばし"; romaji="kyobashi"; shozoku="銀座線"}; 
    {kanji="銀座"; kana="ぎんざ"; romaji="ginza"; shozoku="銀座線"}; 
    {kanji="新橋"; kana="しんばし"; romaji="shinbashi"; shozoku="銀座線"}; 
    {kanji="虎ノ門"; kana="とらのもん"; romaji="toranomon"; shozoku="銀座線"}; 
    {kanji="溜池山王"; kana="ためいけさんのう"; romaji="tameikesannou"; shozoku="銀座線"}; 
    {kanji="赤坂見附"; kana="あかさかみつけ"; romaji="akasakamitsuke"; shozoku="銀座線"}; 
    {kanji="青山一丁目"; kana="あおやまいっちょうめ"; romaji="aoyamaicchome"; shozoku="銀座線"}; 
    {kanji="外苑前"; kana="がいえんまえ"; romaji="gaienmae"; shozoku="銀座線"}; 
    {kanji="表参道"; kana="おもてさんどう"; romaji="omotesando"; shozoku="銀座線"}; 
    {kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="銀座線"}; 
    {kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="半蔵門線"}; 
    {kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="半蔵門線"}; 
    {kanji="青山一丁目"; kana="あおやまいっちょうめ"; romaji="aoyama-itchome"; shozoku="半蔵門線"}; 
    {kanji="永田町"; kana="ながたちょう"; romaji="nagatacho"; shozoku="半蔵門線"}; 
    {kanji="半蔵門"; kana="はんぞうもん"; romaji="hanzomon"; shozoku="半蔵門線"}; 
    {kanji="九段下"; kana="くだんした"; romaji="kudanshita"; shozoku="半蔵門線"}; 
    {kanji="神保町"; kana="じんぼうちょう"; romaji="jinbocho"; shozoku="半蔵門線"}; 
    {kanji="大手町"; kana="おおてまち"; romaji="otemachi"; shozoku="半蔵門線"}; 
    {kanji="三越前"; kana="みつこしまえ"; romaji="mitsukoshimae"; shozoku="半蔵門線"}; 
    {kanji="水天宮前"; kana="すいてんぐうまえ"; romaji="suitengumae"; shozoku="半蔵門線"}; 
    {kanji="清澄白河"; kana="きよすみしらかわ"; romaji="kiyosumi-shirakawa"; shozoku="半蔵門線"}; 
    {kanji="住吉"; kana="すみよし"; romaji="sumiyoshi"; shozoku="半蔵門線"}; 
    {kanji="錦糸町"; kana="きんしちょう"; romaji="kinshicho"; shozoku="半蔵門線"}; 
    {kanji="押上"; kana="おしあげ"; romaji="oshiage"; shozoku="半蔵門線"}; 
    {kanji="中目黒"; kana="なかめぐろ"; romaji="nakameguro"; shozoku="日比谷線"}; 
    {kanji="恵比寿"; kana="えびす"; romaji="ebisu"; shozoku="日比谷線"}; 
    {kanji="広尾"; kana="ひろお"; romaji="hiro"; shozoku="日比谷線"}; 
    {kanji="六本木"; kana="ろっぽんぎ"; romaji="roppongi"; shozoku="日比谷線"}; 
    {kanji="神谷町"; kana="かみやちょう"; romaji="kamiyacho"; shozoku="日比谷線"}; 
    {kanji="霞ヶ関"; kana="かすみがせき"; romaji="kasumigaseki"; shozoku="日比谷線"}; 
    {kanji="日比谷"; kana="ひびや"; romaji="hibiya"; shozoku="日比谷線"}; 
    {kanji="銀座"; kana="ぎんざ"; romaji="ginza"; shozoku="日比谷線"}; 
    {kanji="東銀座"; kana="ひがしぎんざ"; romaji="higashiginza"; shozoku="日比谷線"}; 
    {kanji="築地"; kana="つきじ"; romaji="tsukiji"; shozoku="日比谷線"}; 
    {kanji="八丁堀"; kana="はっちょうぼり"; romaji="hacchobori"; shozoku="日比谷線"}; 
    {kanji="茅場町"; kana="かやばちょう"; romaji="kayabacho"; shozoku="日比谷線"}; 
    {kanji="人形町"; kana="にんぎょうちょう"; romaji="ningyomachi"; shozoku="日比谷線"}; 
    {kanji="小伝馬町"; kana="こでんまちょう"; romaji="kodemmacho"; shozoku="日比谷線"}; 
    {kanji="秋葉原"; kana="あきはばら"; romaji="akihabara"; shozoku="日比谷線"}; 
    {kanji="仲御徒町"; kana="なかおかちまち"; romaji="nakaokachimachi"; shozoku="日比谷線"}; 
    {kanji="上野"; kana="うえの"; romaji="ueno"; shozoku="日比谷線"}; 
    {kanji="入谷"; kana="いりや"; romaji="iriya"; shozoku="日比谷線"}; 
    {kanji="三ノ輪"; kana="みのわ"; romaji="minowa"; shozoku="日比谷線"}; 
    {kanji="南千住"; kana="みなみせんじゅ"; romaji="minamisenju"; shozoku="日比谷線"}; 
    {kanji="北千住"; kana="きたせんじゅ"; romaji="kitasenju"; shozoku="日比谷線"}; 
    {kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="丸ノ内線"}; 
    {kanji="新大塚"; kana="しんおおつか"; romaji="shinotsuka"; shozoku="丸ノ内線"}; 
    {kanji="茗荷谷"; kana="みょうがだに"; romaji="myogadani"; shozoku="丸ノ内線"}; 
    {kanji="後楽園"; kana="こうらくえん"; romaji="korakuen"; shozoku="丸ノ内線"}; 
    {kanji="本郷三丁目"; kana="ほんごうさんちょうめ"; romaji="hongosanchome"; shozoku="丸ノ内線"}; 
    {kanji="御茶ノ水"; kana="おちゃのみず"; romaji="ochanomizu"; shozoku="丸ノ内線"}; 
    {kanji="淡路町"; kana="あわじちょう"; romaji="awajicho"; shozoku="丸ノ内線"}; 
    {kanji="大手町"; kana="おおてまち"; romaji="otemachi"; shozoku="丸ノ内線"}; 
    {kanji="東京"; kana="とうきょう"; romaji="tokyo"; shozoku="丸ノ内線"}; 
    {kanji="銀座"; kana="ぎんざ"; romaji="ginza"; shozoku="丸ノ内線"}; 
    {kanji="霞ヶ関"; kana="かすみがせき"; romaji="kasumigaseki"; shozoku="丸ノ内線"}; 
    {kanji="国会議事堂前"; kana="こっかいぎじどうまえ"; romaji="kokkaigijidomae"; shozoku="丸ノ内線"}; 
    {kanji="赤坂見附"; kana="あかさかみつけ"; romaji="akasakamitsuke"; shozoku="丸ノ内線"}; 
    {kanji="四ツ谷"; kana="よつや"; romaji="yotsuya"; shozoku="丸ノ内線"}; 
    {kanji="四谷三丁目"; kana="よつやさんちょうめ"; romaji="yotsuyasanchome"; shozoku="丸ノ内線"}; 
    {kanji="新宿御苑前"; kana="しんじゅくぎょえんまえ"; romaji="shinjuku-gyoemmae"; shozoku="丸ノ内線"}; 
    {kanji="新宿三丁目"; kana="しんじゅくさんちょうめ"; romaji="shinjuku-sanchome"; shozoku="丸ノ内線"}; 
    {kanji="新宿"; kana="しんじゅく"; romaji="shinjuku"; shozoku="丸ノ内線"}; 
    {kanji="西新宿"; kana="にししんじゅく"; romaji="nishi-shinjuku"; shozoku="丸ノ内線"}; 
    {kanji="中野坂上"; kana="なかのさかうえ"; romaji="nakano-sakaue"; shozoku="丸ノ内線"}; 
    {kanji="新中野"; kana="しんなかの"; romaji="shin-nakano"; shozoku="丸ノ内線"}; 
    {kanji="東高円寺"; kana="ひがしこうえんじ"; romaji="higashi-koenji"; shozoku="丸ノ内線"}; 
    {kanji="新高円寺"; kana="しんこうえんじ"; romaji="shin-koenji"; shozoku="丸ノ内線"}; 
    {kanji="南阿佐ヶ谷"; kana="みなみあさがや"; romaji="minami-asagaya"; shozoku="丸ノ内線"}; 
    {kanji="荻窪"; kana="おぎくぼ"; romaji="ogikubo"; shozoku="丸ノ内線"}; 
    {kanji="中野新橋"; kana="なかのしんばし"; romaji="nakano-shimbashi"; shozoku="丸ノ内線"}; 
    {kanji="中野富士見町"; kana="なかのふじみちょう"; romaji="nakano-fujimicho"; shozoku="丸ノ内線"}; 
    {kanji="方南町"; kana="ほうなんちょう"; romaji="honancho"; shozoku="丸ノ内線"}; 
    {kanji="四ツ谷"; kana="よつや"; romaji="yotsuya"; shozoku="南北線"}; 
    {kanji="永田町"; kana="ながたちょう"; romaji="nagatacho"; shozoku="南北線"}; 
    {kanji="溜池山王"; kana="ためいけさんのう"; romaji="tameikesanno"; shozoku="南北線"}; 
    {kanji="六本木一丁目"; kana="ろっぽんぎいっちょうめ"; romaji="roppongiitchome"; shozoku="南北線"}; 
    {kanji="麻布十番"; kana="あざぶじゅうばん"; romaji="azabujuban"; shozoku="南北線"}; 
    {kanji="白金高輪"; kana="しろかねたかなわ"; romaji="shirokanetakanawa"; shozoku="南北線"}; 
    {kanji="白金台"; kana="しろかねだい"; romaji="shirokanedai"; shozoku="南北線"}; 
    {kanji="目黒"; kana="めぐろ"; romaji="meguro"; shozoku="南北線"}; 
    {kanji="市ヶ谷"; kana="いちがや"; romaji="ichigaya"; shozoku="南北線"}; 
    {kanji="飯田橋"; kana="いいだばし"; romaji="idabashi"; shozoku="南北線"}; 
    {kanji="後楽園"; kana="こうらくえん"; romaji="korakuen"; shozoku="南北線"}; 
    {kanji="東大前"; kana="とうだいまえ"; romaji="todaimae"; shozoku="南北線"}; 
    {kanji="本駒込"; kana="ほんこまごめ"; romaji="honkomagome"; shozoku="南北線"}; 
    {kanji="駒込"; kana="こまごめ"; romaji="komagome"; shozoku="南北線"}; 
    {kanji="西ヶ原"; kana="にしがはら"; romaji="nishigahara"; shozoku="南北線"}; 
    {kanji="王子"; kana="おうじ"; romaji="oji"; shozoku="南北線"}; 
    {kanji="王子神谷"; kana="おうじかみや"; romaji="ojikamiya"; shozoku="南北線"}; 
    {kanji="志茂"; kana="しも"; romaji="shimo"; shozoku="南北線"}; 
    {kanji="赤羽岩淵"; kana="あかばねいわぶち"; romaji="akabaneiwabuchi"; shozoku="南北線"}; 
    {kanji="西船橋"; kana="にしふなばし"; romaji="nishi-funabashi"; shozoku="東西線"}; 
    {kanji="原木中山"; kana="ばらきなかやま"; romaji="baraki-nakayama"; shozoku="東西線"}; 
    {kanji="妙典"; kana="みょうでん"; romaji="myoden"; shozoku="東西線"}; 
    {kanji="行徳"; kana="ぎょうとく"; romaji="gyotoku"; shozoku="東西線"}; 
    {kanji="南行徳"; kana="みなみぎょうとく"; romaji="minami-gyotoku"; shozoku="東西線"}; 
    {kanji="浦安"; kana="うらやす"; romaji="urayasu"; shozoku="東西線"}; 
    {kanji="葛西"; kana="かさい"; romaji="kasai"; shozoku="東西線"}; 
    {kanji="西葛西"; kana="にしかさい"; romaji="nishi-kasai"; shozoku="東西線"}; 
    {kanji="南砂町"; kana="みなみすなまち"; romaji="minami-sunamachi"; shozoku="東西線"}; 
    {kanji="東陽町"; kana="とうようちょう"; romaji="touyoucho"; shozoku="東西線"}; 
    {kanji="木場"; kana="きば"; romaji="kiba"; shozoku="東西線"}; 
    {kanji="門前仲町"; kana="もんぜんなかちょう"; romaji="monzen-nakacho"; shozoku="東西線"}; 
    {kanji="茅場町"; kana="かやばちょう"; romaji="kayabacho"; shozoku="東西線"}; 
    {kanji="日本橋"; kana="にほんばし"; romaji="nihonbashi"; shozoku="東西線"}; 
    {kanji="大手町"; kana="おおてまち"; romaji="otemachi"; shozoku="東西線"}; 
    {kanji="竹橋"; kana="たけばし"; romaji="takebashi"; shozoku="東西線"}; 
    {kanji="九段下"; kana="くだんした"; romaji="kudanshita"; shozoku="東西線"}; 
    {kanji="飯田橋"; kana="いいだばし"; romaji="iidabashi"; shozoku="東西線"}; 
    {kanji="神楽坂"; kana="かぐらざか"; romaji="kagurazaka"; shozoku="東西線"}; 
    {kanji="早稲田"; kana="わせだ"; romaji="waseda"; shozoku="東西線"}; 
    {kanji="高田馬場"; kana="たかだのばば"; romaji="takadanobaba"; shozoku="東西線"}; 
    {kanji="落合"; kana="おちあい"; romaji="ochiai"; shozoku="東西線"}; 
    {kanji="中野"; kana="なかの"; romaji="nakano"; shozoku="東西線"}; 
    {romaji="shinkiba"; kana="しんきば"; kanji="新木場"; shozoku="有楽町線"}; 
    {romaji="tatsumi"; kana="たつみ"; kanji="辰巳"; shozoku="有楽町線"}; 
    {romaji="toyosu"; kana="とよす"; kanji="豊洲"; shozoku="有楽町線"}; 
    {romaji="tsukishima"; kana="つきしま"; kanji="月島"; shozoku="有楽町線"}; 
    {romaji="shintomityou"; kana="しんとみちょう"; kanji="新富町"; shozoku="有楽町線"}; 
    {romaji="ginzaittyoume"; kana="ぎんざいっちょうめ"; kanji="銀座一丁目"; shozoku="有楽町線"}; 
    {romaji="yuurakutyou"; kana="ゆうらくちょう"; kanji="有楽町"; shozoku="有楽町線"}; 
    {romaji="sakuradamon"; kana="さくらだもん"; kanji="桜田門"; shozoku="有楽町線"}; 
    {romaji="nagatacho"; kana="ながたちょう"; kanji="永田町"; shozoku="有楽町線"}; 
    {romaji="koujimachi"; kana="こうじまち"; kanji="麹町"; shozoku="有楽町線"}; 
    {romaji="ichigaya"; kana="いちがや"; kanji="市ヶ谷"; shozoku="有楽町線"}; 
    {romaji="iidabashi"; kana="いいだばし"; kanji="飯田橋"; shozoku="有楽町線"}; 
    {kanji="江戸川橋"; kana="えどがわばし"; romaji="edogawabasi"; shozoku="有楽町線"}; 
    {kanji="護国寺"; kana="ごこくじ"; romaji="gokokuji"; shozoku="有楽町線"}; 
    {kanji="東池袋"; kana="ひがしいけぶくろ"; romaji="higasiikebukuro"; shozoku="有楽町線"}; 
    {kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="有楽町線"}; 
    {kanji="要町"; kana="かなめちょう"; romaji="kanametyou"; shozoku="有楽町線"}; 
    {kanji="千川"; kana="せんかわ"; romaji="senkawa"; shozoku="有楽町線"}; 
    {kanji="小竹向原"; kana="こたけむかいはら"; romaji="kotakemukaihara"; shozoku="有楽町線"}; 
    {kanji="氷川台"; kana="ひかわだい"; romaji="hikawadai"; shozoku="有楽町線"}; 
    {kanji="平和台"; kana="へいわだい"; romaji="heiwadai"; shozoku="有楽町線"}; 
    {kanji="営団赤塚"; kana="えいだんあかつか"; romaji="eidanakakuka"; shozoku="有楽町線"}; 
    {kanji="営団成増"; kana="えいだんなります"; romaji="eidannarimasu"; shozoku="有楽町線"}; 
    {kanji="和光市"; kana="わこうし"; romaji="wakousi"; shozoku="有楽町線"}; 
];;

let rec romaji_to_kanji r_0 lst = match lst with
    [] -> ""
    | {kanji = k; kana = kana; romaji = romaji; shozoku = shozoku} :: rest ->
        if romaji = r_0 then k
        else romaji_to_kanji r_0 rest;;

let make_initial_eki_list eki_lst kiten = map (
        fun item ->
            match item with {kanji = kanji; kana = kana; romaji = romaji; shozoku = shozoku} ->
                if kanji = kiten then {namae = kanji; saitan_kyori = 0.0; temae_list = [kanji]}
                else {namae = kanji; saitan_kyori = infinity; temae_list = []}
    )
    eki_lst;;

let rec find eki_list2 romaji_shuten = match eki_list2 with
    [] -> {namae = ""; saitan_kyori = infinity; temae_list = []} 
    | first :: rest ->
        if first.namae = romaji_shuten then first else find rest romaji_shuten;;

let dijkstra romaji_kiten romaji_shuten =
    let kanji_kiten = romaji_to_kanji romaji_kiten global_ekimei_list in
    let kanji_shuten = romaji_to_kanji romaji_shuten global_ekimei_list in
    let eki_list = make_initial_eki_list global_ekimei_list kanji_kiten in
    let eki_list2 = dijkstra_main eki_list global_ekikan_list in
    find eki_list2 kanji_shuten;;

(* テスト *) 
let test1 = dijkstra "shibuya" "gokokuji" = 
  {namae = "護国寺"; saitan_kyori = 9.8; 
   temae_list = 
     ["護国寺"; "江戸川橋"; "飯田橋"; "市ヶ谷"; "麹町"; "永田町"; 
      "青山一丁目"; "表参道"; "渋谷"]};;
let test2 = dijkstra "myogadani" "meguro" = 
  {namae = "目黒"; saitan_kyori = 12.7000000000000028; 
   temae_list = 
     ["目黒"; "白金台"; "白金高輪"; "麻布十番"; "六本木一丁目"; "溜池山王"; 
      "永田町"; "麹町"; "市ヶ谷"; "飯田橋"; "後楽園"; "茗荷谷"]};;
