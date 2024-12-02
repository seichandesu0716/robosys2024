#!/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Sei Takahashi <seitaka_0716_poke@yahoo.com>
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

# シュート方向が「右」の場合のテスト
out=$(echo "右" | ./penalty_kick)
echo "$out" | grep -q "キーパーに止められた！" || echo "$out" | grep -q "ゴール！" || ng "$LINENO"

# シュート方向が「左」の場合のテスト
out=$(echo "左" | ./penalty_kick)
echo "$out" | grep -q "キーパーに止められた！" || echo "$out" | grep -q "ゴール！" || ng "$LINENO"

# シュート方向が「右上」の場合のテスト
out=$(echo "右上" | ./penalty_kick)
echo "$out" | grep -q "キーパーに止められた！" || echo "$out" | grep -q "ゴール！" || ng "$LINENO"

# シュート方向が「真ん中」の場合のテスト
out=$(echo "真ん中" | ./penalty_kick)
echo "$out" | grep -q "キーパーに止められた！" || echo "$out" | grep -q "ゴール！" || ng "$LINENO"

out=$(echo "右下" | ./penalty_kick)
echo "$out" | grep -q "キーパーに止められた！" || echo "$out" | grep -q "ゴール！" || ng "$LINENO"

out=$(echo "左下" | ./penalty_kick)
echo "$out" | grep -q "キーパーに止められた！" || echo "$out" | grep -q "ゴール！" || ng "$LINENO"

[ "$res" -eq 0 ] && echo "OK"
exit $res
