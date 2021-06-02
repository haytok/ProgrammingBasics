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
