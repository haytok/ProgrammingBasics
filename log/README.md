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

## Ocaml に関するメモ

- ベキ乗は (`**`) は実数にのみに実装されているので、演算子の後ろにピリオドは必要ない。
- 値の比較には、`==` ではなく `=` を用いる。
