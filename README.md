# PKコマンド
![test](https://github.com/seichandesu0716/robosys2024/actions/workflows/test.yml/badge.svg)
![license](https://img.shields.io/badge/license-BSD--3--Clause-green?style=flat)

サッカーのPKを行うプログラム

# 使い方
**リポジトリをクローン**
~~~
git clone https://github.com/seichandesu0716/robosys2024
~~~
**リポジトリの移動**
~~~
cd tmp/robosys2024
~~~
**実行方法**
~~~
$ echo [方向] | ./penalty_kick
~~~
方向には（右, 左, 右上, 左上, 真ん中,左下,右下）の7つを入力してください。
それ以外の文字は枠外と表示されます。

**実行例**
~~~
$ echo 真ん中 | ./penalty_kick
シュート方法は 真ん中 です。
キーパーの動き: 左
パネンカを蹴った。ゴール！
--- PK戦終了 ---
~~~
~~~
$ echo 右上 | ./penalty_kick
シュート方法は 右上 です。
キーパーの動き: 右
ゴール！隅にシュートを打った！
--- PK戦終了 ---
~~~
~~~
$ echo hfjis | ./penalty_kick
シュート方法は hfjis です。
キーパーの動き: 右上
枠外だ
--- PK戦終了 ---
~~~

# テスト環境
Ubuntu20.04.6 LTS　on Windows
# 必要なソフトウェア
・Python
 (テスト済みバージョン:3.7~3.10)

# 参考資料
random関数について・・・https://beginner-engineers.com/random-usage/ 

バッジの作成・・・https://shields.io/badges

READMEについて・・・https://qiita.com/Canard_engineer_c_cpp/items/81ce4e53881138dbf37f

ソフトウェアのテスト・・・https://ryuichiueda.github.io/slides_marp/robosys2024/lesson6.html

Githubでのテスト・・・https://ryuichiueda.github.io/slides_marp/robosys2024/lesson7.html#1
# ライセンスと著作物
・このソフトウェアパッケージは、3条項BSDライセンスの下、再頒布および使用が許可されます

・このパッケージコードの一部は、（CC-BY-SA4.0by Ryuichi Ueda）のものを、本人の許可を得て自身の著作としたものです
　https://github.com/ryuichiueda/my_slides/tree/master/robosys_2024

・© 2024 Sei Takahashi
