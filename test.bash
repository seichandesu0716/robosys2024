#!/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Sei Takahashi <seitaka_0716_poke@yahoo.com>
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

# Test 1: 正常な入力で3回のシュート（"left" "right" "left" を選択）
out=$(./penalty_kick.py 3 left right left)
[ $? -eq 0 ] || ng "$LINENO"
echo "$out" | grep -q "3 本中 [0-3] ゴールを決めました！" || ng "$LINENO"

# Test 2: 無効なシュート回数（0を入力）
out=$(./penalty_kick.py 0 right left)
[ $? -ne 0 ] || ng "$LINENO"
echo "$out" | grep -q "エラー: シュート回数は正の整数で入力してください。" || ng "$LINENO"

# Test 3: 不正なシュート方向（"up" を入力）
out=$(./penalty_kick.py 1 up)
[ $? -ne 0 ] || ng "$LINENO"
echo "$out" | grep -q "無効な選択です！「left」また「right」を選んでください。" || ng "$LINENO"

# Test 4: 指定したシュート回数より少ないシュート方向が入力されるケース
out=$(./penalty_kick.py 2 left)
[ $? -ne 0 ] || ng "$LINENO"
echo "$out" | grep -q "エラー: 指定したシュート回数より少ないシュート方向が入力されました。" || ng "$LINENO"

# Test 5: 正常な入力で1回のシュート（"right" を選択）
out=$(./penalty_kick.py 1 right)
[ $? -eq 0 ] || ng "$LINENO"
echo "$out" | grep -q "1 本中 [0-1] ゴールを決めました！" || ng "$LINENO"

[ "$res" -eq 0 ] && echo "OK"
exit $res

