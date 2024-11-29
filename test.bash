#!/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Sei Takahashi <seitaka_0716_poke@yahoo.com>
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

# Test 1: 正常な入力で3回のシュート（すべて "left" を選択）
out=$(printf "3\nleft\nleft\nleft\n" | ./kadai1)
[ $? -eq 0 ] || ng "$LINENO"
echo "$out" | grep -qE "3 本中 [0-3] ゴールを決めました！" || ng "$LINENO"

# Test 2: 無効なシュート回数を入力（0を入力）
out=$(printf "0\n" | ./kadai1)
[ $? -ne 0 ] || ng "$LINENO"
echo "$out" | grep -q "エラー: シュート回数は正の整数で入力してください。" || ng "$LINENO"

# Test 3: 不正なシュート方向を入力（"up" を入力）
out=$(printf "1\nup\nleft\n" | ./kadai1)
[ $? -eq 0 ] || ng "$LINENO"
echo "$out" | grep -q "無効な選択です！「left」また「right」を選んでください。" || ng "$LINENO"
echo "$out" | grep -qE "1 本中 [0-1] ゴールを決めました！" || ng "$LINENO"

# Test 4: 空の入力を送信
out=$(printf "\n" | ./kadai1)
[ $? -ne 0 ] || ng "$LINENO"
echo "$out" | grep -q "エラー: シュート回数は正の整数で入力してください。" || ng "$LINENO"

# Test 5: シュート回数1回で"right"を選択
out=$(printf "1\nright\n" | ./kadai1)
[ $? -eq 0 ] || ng "$LINENO"
echo "$out" | grep -qE "1 本中 [0-1] ゴールを決めました！" || ng "$LINENO"

out=$(printf "2\nright\n0\n" | ./kadai1)
[ $? -eq 0 ] || ng "$LINENO"
echo "$out" | grep -q "無効な選択です！「left」また「right」を選んでください。" || ng "$LINENO"
echo "$out" | grep -qE "1 本中 [0-2] ゴールを決めました！" || ng "$LINENO"



[ "$res" -eq 0 ] && echo "OK"
exit $res

