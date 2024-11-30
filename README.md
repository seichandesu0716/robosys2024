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
$ echo [シュート回数] [方向]... | ./penalty_kick
~~~
０より大きい数字を「シュート回数」に入力し、「方向」にはシュート回数分の方向を入力する。

「シュート回数」には０より大きい数字を入力し、「方向」はrightかleftを入力する。

**実行例**
~~~
$ echo 1 left | ./penalty_kick
PK戦スタート！ 1 回のシュートに挑戦します！
leftにシュート！
ゴール！

--- 試合結果 ---
1 本中 1 ゴールを決めました！
~~~
~~~
$echo 3 right left right | ./penalty_kick
PK戦スタート！ 3 回のシュートに挑戦します！
rightにシュート！
ゴール！
leftにシュート！
失敗！キーパーがセーブしました！
rightにシュート！
失敗！キーパーがセーブしました！

--- 試合結果 ---
3 本中 1 ゴールを決めました！
~~~

# テスト環境
Ubuntu20.04.6 LTS
# ソフトウェア
・Python
 (テスト済みバージョン:3.7~3.10)

# 参考資料
random関数について・・・https://beginner-engineers.com/random-usage/ 

バッジの作成・・・https://shields.io/badges

標準入力・・・https://ryuichiueda.github.io/slides_marp/robosys2024/lesson3.html#1

ソフトウェアのテスト・・・https://ryuichiueda.github.io/slides_marp/robosys2024/lesson6.html

Githubでのテスト・・・https://ryuichiueda.github.io/slides_marp/robosys2024/lesson7.html#1
# ライセンス
・このソフトウェアパッケージは、３条項BSDライセンスの下、再頒布および使用が許可されます

・このパッケージコードの一部は、（CC-BY-SA4.0by Ryuichi Ueda）のものを、本人の許可を得て自身の著作としたものです
　https://github.com/ryuichiueda/my_slides/tree/master/robosys_2024

・© 2024 Sei Takahashi
