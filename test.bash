#!/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Sei Takahashi <seitaka_0716_poke@yahoo.com>
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

out=$(echo "右" | ./penalty_kick)
echo "$out" | grep -q "キーパーがボールをはじいた" || echo "$out" | grep -q "ゴール！素晴らしいシュート！" || ng "$LINENO"

out=$(echo "左" | ./penalty_kick)
echo "$out" | grep -q "キーパーがボールをはじいた" || echo "$out" | grep -q "ゴール！素晴らしいシュート！" || ng "$LINENO"

out=$(echo "右上" | ./penalty_kick)
echo "$out" | grep -q "ポストに直撃した" || echo "$out" | grep -q "ゴール！隅にシュートを打った！" || ng "$LINENO"

out=$(echo "真ん中" | ./penalty_kick)
echo "$out" | grep -q  "キーパーは一歩も動かなかった" || echo "$out" | grep -q  "パネンカを蹴った。ゴール！" || ng "$LINENO"

out=$(echo "右下" | ./penalty_kick)
echo "$out" | grep -q "ポストに直撃した" || echo "$out" | grep -q "ゴール！隅にシュートを打った！" || ng "$LINENO"

out=$(echo "左下" | ./penalty_kick)
echo "$out" | grep -q "ポストに直撃した" || echo "$out" | grep -q "ゴール！隅にシュートを打った！" || ng "$LINENO"

out=$(echo "左上" | ./penalty_kick)
echo "$out" | grep -q "ポストに直撃した" || echo "$out" | grep -q "ゴール！隅にシュートを打った！" || ng "$LINENO"

out=$(echo "right" | ./penalty_kick)
echo "$out" | grep -q "枠外だ" || ng "$LINENO"

out=$(echo "ひだりうえ" | ./penalty_kick)
echo "$out" | grep -q "枠外だ" || ng "$LINENO"

out=$(echo "#$'" | ./penalty_kick)
echo "$out" | grep -q "枠外だ" || ng "$LINENO"

out=$(echo "　" | ./penalty_kick)
echo "$out" | grep -q "枠外だ" || ng "$LINENO"

out=$(echo "SDF" | ./penalty_kick)
echo "$out" | grep -q "枠外だ" || ng "$LINENO"

out=$(echo "345" | ./penalty_kick)
echo "$out" | grep -q "枠外だ" || ng "$LINENO"

[ "$res" -eq 0 ] && echo "OK"
exit $res
