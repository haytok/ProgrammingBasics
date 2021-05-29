# Log

- OCaml を書く際に生じた問題とその解決法をこのログに残す

## ダウンロードしてきたファイルが文字化けする。

- `nkf コマンド` でファイルの文字コードを確認する。文字コードが変なので、以下のコマンドでひとまず一つのファイルを変更した。

```bash
> nkf --guess source/sect04_6/kyuyo.ml 
EUC-JP (LF)

> cat source/sect04_6/kyuyo.ml | nkf -w
> cat source/sect04_6/kyuyo.ml | nkf -w --overwrite source/sect04_6/kyuyo.ml

> nkf -g source/sect04_6/kyuyo.ml 
UTF-8
```
