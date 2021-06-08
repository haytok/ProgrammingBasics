# Log

- OCaml を書く際に生じた問題とその解決法をこのログに残す

## ダウンロードしてきたファイルが文字化けする

- `nkf コマンド` でファイルの文字コードを確認する。文字コードが変なので、以下のコマンドでひとまず一つのファイルを変更した。

```bash
> nkf --guess source/sect04_6/kyuyo.ml 
EUC-JP (LF)

> cat source/sect04_6/kyuyo.ml | nkf -w
> cat source/sect04_6/kyuyo.ml | nkf -w --overwrite source/sect04_6/kyuyo.ml

> nkf -g source/sect04_6/kyuyo.ml 
UTF-8
```

### 参考

- [nkfで文字コードを調べて一括で変換する](https://uuutee.net/shell/convert-encoding-with-nkf/)

## nkf コマンドと Python を使用してダウンロードしてきたファイルのエンコードを変更する

### 背景・問題

- 前節のプロセスを用いて、ダウンロードしてきたファイルの文字エンコードを全て変更し、文字化けを直す

### 解決方法 (プロセス)

- Python の標準ライブラリの `subprocess` で愚直に `nkf` コマンドを実行する。

### 参考

- [Python3 でファイルの文字コードを変換する](https://qiita.com/nskydiving/items/c900c27042bcd11517ee)
- [encode.py](https://github.com/dilmnqvovpnmlib/ProgrammingBasics/blob/main/log/encode.py)

## untracked file を削除する

### 解決方法 (プロセス)

- `git clean -f` を実行する。

### 参考

- [untracked fileを削除するためにはgit cleanを使う](https://qiita.com/tmyn470/items/c8359e4ec92d1f462bdf#git-clean)

## Ocaml のインタープリタでコマンドの履歴を遡れるように設定する

### 背景・問題

- Ocaml のインタープリタを起動し、上矢印キーなどを押した時に、エスケープシーケンスが表示され、コマンドの履歴を遡ることができない問題が生じていた。

### 目的

- これは不便なので、インタープリタからコマンドを遡れるような設定を行った。

### 解決方法 (プロセス)

- `rlwrap` というライブラリをインストールし、`ocaml コマンド` に `rlwrap ocaml` のエリアスを張り、コマンドの履歴を遡れるようにした。

- まず、`rlwrap` をインストールするコマンドを Dockerfile に追加した。`sudo apk add rlwrap` ではインストールできないので、[Docker Alpine linux package masked](https://stackoverflow.com/questions/40246688/docker-alpine-linux-package-masked) を参考にパッケージ名に適切なバージョンを指定してインストールを行った。

```bash
bash-5.1$ sudo apk add rlwrap
ERROR: unable to select packages:
  rlwrap-0.45.1-r0:
    masked in: @testing
    satisfies: world[rlwrap]

bash-5.1$ sudo apk add rlwrap@testing
(1/1) Installing rlwrap@testing (0.45.1-r0)
Executing busybox-1.32.1-r6.trigger
OK: 333 MiB in 83 packages
```

- Dockerfile でエリアスを定義する方法は、以前コンテナ内のターミナルに色を付けた時のプログラム ([hk-41 backend dev Dockerfile](https://github.com/dilmnqvovpnmlib/hk-41/blob/045dbd2e36d4500795e03f172b011b40ef32fe54/backend/docker/dev/Dockerfile#L31)) を参考にした。

### 原因

- GNU readline とのライセンスの関係でコマンドの履歴を遡ることができない。

### 参考

- [ocaml インタプリタでコマンドの履歴を利用する](https://inohiro.hatenablog.com/entry/20111025/1319517953)
- [お気楽 OCaml プログラミング入門](http://www.nct9.ne.jp/m_hiroi/func/ocaml01.html)
- [Docker Alpine linux package masked](https://stackoverflow.com/questions/40246688/docker-alpine-linux-package-masked)
- [hk-41 backend dev Dockerfile](https://github.com/dilmnqvovpnmlib/hk-41/blob/045dbd2e36d4500795e03f172b011b40ef32fe54/backend/docker/dev/Dockerfile#L31)

## セットアップスクリプトの作成

- `pytnon setup.py <章の番号> <章で取り扱う問題の個数>` でその章で必要なプログラムの雛形を作成することができる。

- `echo コマンド` で改行を出力するには、`-e` オプションをつける。この場合、デフォルトの改行も出力されるので 2 個の改行が表示されることになる。しかし、`-n` オプションをつけると、1 つしか表示されない。

### 参考

- [Linux echoコマンドで改行出力](https://qiita.com/fault/items/11e45d4bce233f493b95)
- [setup.py](https://github.com/dilmnqvovpnmlib/ProgrammingBasics/blob/main/log/setup.py)

## Ocaml に関するメモ

- ベキ乗は (`**`) は実数にのみに実装されているので、演算子の後ろにピリオドは必要ない。
- 値の比較には、`==` ではなく `=` を用いる。
- Ocaml の変数名は小文字から始まらなければならない。
- 関数の型について
  - 例えば以下のような関数 g があったとする。
  - let g x y = x * x + y * y - 4;;
  - これは、A -> B -> C で表される型である。
  - 関数の型は右に結合するので、A -> (B -> C) と言う意味である。
  - つまり、一つ目の引数として A と言う型の値を受け取り、二つ目の引数として B と言う型の引数を受け取ったら、結果として C と言う型の値を返すような関数の型を表す。
- 関数定義に対するデザインレシピ
  - 目的
    - 作成する関数が何をするものなのかを考える。何を受け取り、何を返すのかを考え、関数の型を決定する。これをもとに関数の出だし、ヘッダを作成する。
  - 例 (テストケース)
    - 関数の動きをより明確かつ具体的にするために、作成する関数に望まれる入出力の例を作成する。そして、それを実行可能なテストプログラムにする。
  - 本体
    - 関数の本体を作成する。目的のところでは、関数が何をするのかを考えましたが、ここではそれをどうやって実現するかを考えます。
  - テスト
    - 確かに望む動作をしているか、上で作ったテストプログラムを使って確認します。望む動作をしていなかったら、原因をこのデザインレシピに沿って考え、誤りを訂正する。
- Ocaml には、組という配列もどきの概念が存在する。
- Ocaml では、組に限らず複数のデータからできているデータの中身を取り出すにはパターンマッチを使用する。
- 入力データの型が定まるとそこから必然的に決まってくる関数本体の形のことをテンプレートと呼ぶ。
- 10.1 の接頭辞のリストを求める関数の実装が面白かった。
  - prefix rest は受け取った rest の接頭辞のリストを求めることである。
  - この入力から出力を想定し、辻褄を合わせる。
- 関数型言語では、関数や整数や実数と同じように普通の値として関数に渡すことができる。さらに関数を結果として返すこともできる。このことを `関数が first-class の値である` という言い方をする。
- map のように関数を引数として受け取る関数のことを高階関数と呼ぶ。

- 一般的に定義する `let add x y = x + y;;` は prefix 関数と呼ぶ。
- 一方で、+ のような演算子は infix 関数と呼ぶ。
- infix 関数を prefix 関数に変換することができ、例えば `(+) x y;;` である。

- 構造にしたがった再帰の場合は、引数 lst がリストなので、それに応じた match 文を用意しました。
- 一般の再帰の場合には、ここで自明に答えが出るケースとそうでないケースの場合分けを行う。つまり、ここで自明に答えが出るケースがどういう場合なのかを特定する必要があります。
- 配列動詞の結合には @ を使用する。
- not equal は `<>` と記述する。

- どれか一つの方を表す時には、バリアント型を使用する。
- バリアント型の選択肢である構成子には、引数を持たせることができる。
- 自己参照しているデータを扱うときには、一つ注意しないといけないことがあった。それは、必ず自己参照していないケースがあるかを確認することである。
- 
