#!/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Sei Takahashi <seitaka_0716_poke@yahoo.com>
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

out=$(echo 3 right right right | ./penalty_kick)
[ $? -eq 0 ] || ng "$LINENO"
echo "$out" | grep -q "3 本中 [0-3] ゴールを決めました！" || ng "$LINENO"

out=$(echo 3 left right left | ./penalty_kick)
[ $? -eq 0 ] || ng "$LINENO"
echo "$out" | grep -q "3 本中 [0-3] ゴールを決めました！" || ng "$LINENO"

out=$(echo 3 left left left | ./penalty_kick)
[ $? -eq 0 ] || ng "$LINENO"
echo "$out" | grep -q "3 本中 [0-3] ゴールを決めました！" || ng "$LINENO"

out=$(echo 1 right | ./penalty_kick)
[ $? -eq 0 ] || ng "$LINENO"
echo "$out" | grep -q "1 本中 [0-1] ゴールを決めました！" || ng "$LINENO"

out=$(echo 2 123 left | ./penalty_kick)
[ $? -ne 0 ] || ng "$LINENO"
echo "$out" | grep -q "無効な選択です。rightかleftを入力してください" || ng "$LINENO"

out=$(echo -3 left left right | ./penalty_kick)
[ $? -ne 0 ] || ng "$LINENO"
echo "$out" | grep -q "エラー: シュート回数は正の整数で入力してください。" || ng "$LINENO"

out=$(echo 10 left left left left left left left left left left | ./penalty_kick)
[ $? -eq 0 ] || ng "$LINENO"
echo "$out" | grep -q "10 本中 [0-9] ゴールを決めました！" || ng "$LINENO"

out=$(echo 11 left left left left left left left left left left left | ./penalty_kick)
[ $? -eq 0 ] || ng "$LINENO"
echo "$out" | grep -q "11 本中 [0-9] ゴールを決めました！" || ng "$LINENO"

out=$(echo 100 left right  left right left right left right left right left right left right left right left right left right left right  left right left right left right left right left right left right left right left right left right left right  left right left right left right left right left right left right left right left right left right left right  left right left right left right left right left right left right left right left right left right left right  left right left right left right left right left right left right left right left right left right | ./penalty_kick)
[ $? -eq 0 ] || ng "$LINENO"
echo "$out" | grep -q "100 本中 [0-9]\+ ゴールを決めました！" || ng "$LINENO"

out=$(echo | ./penalty_kick)
[ $? -ne 0 ] || ng "$LINENO"
echo "$out" | grep -q "エラー: 入力が不足しています。シュート回数と方向を指定してください。" || ng "$LINENO"

# 入力が負の数
out=$(echo -1 right | ./penalty_kick)
[ $? -ne 0 ] || ng "$LINENO"
echo "$out" | grep -q "エラー: シュート回数は正の整数で入力してください。" || ng "$LINENO"

# 無効な文字列入力
out=$(echo 2 abc def | ./penalty_kick)
[ $? -ne 0 ] || ng "$LINENO"
echo "$out" | grep -q "無効な選択です。rightかleftを入力してください" || ng "$LINENO"

# 空白のみの入力
out=$(echo "   " | ./penalty_kick)
[ $? -ne 0 ] || ng "$LINENO"
echo "$out" | grep -q "エラー: 入力が不足しています。シュート回数と方向を指定してください。" || ng "$LINENO"

out=$(echo 1000 $(printf "left %.0s" {1..1000}) | ./penalty_kick)
[ $? -eq 0 ] || ng "$LINENO"
echo "$out" | grep -q "1000 本中 [0-9]\+ ゴールを決めました！" || ng "$LINENO"

out=$(echo 3 up down left | ./penalty_kick)
[ $? -ne 0 ] || ng "$LINENO"
echo "$out" | grep -q "無効な選択です。rightかleftを入力してください" || ng "$LINENO"


[ "$res" -eq 0 ] && echo "OK"
exit $res

