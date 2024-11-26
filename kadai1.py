#!/usr/bin/python3
# SPDX-FileCopyrightText: 2024 Sei Takahashi <seitaka_0716_poke@yahoo.com>
# SPDX-License-Identifier: BSD-3-Clause

import sys
import random

def take_penalty(player_number):
    directions = ["left", "right"]
    goalie_choice = random.choice(directions)
    player_choice = input(f" プレイヤー{player_number}番、シュートの方向を選んでください（left/right）: ").strip()

    if player_choice not in directions:
        print("無効な選択です！「left」また「right」を選んでください。")
        sys.exit("エラー: 不正な入力のため、試合を終了します。")

    print(f"{player_choice}にシュート！")

    if player_choice == goalie_choice:
        print("失敗！キーパーがセーブしました！")
        return False
    else:
        print("ゴール！")
        return True

def main():
    print("PK戦スタート！")

    try:
        total_shots = int(input("シュート回数を入力してください: ").strip())
        if total_shots <= 0:
            raise ValueError
    except ValueError:
        sys.exit("エラー: シュート回数は正の整数で入力してください。")

    print(f" {total_shots} 回のシュートに挑戦します！")

    goals = 0
    for i in range(1, total_shots + 1):
        if take_penalty(i):
            goals += 1

    print("\n--- 試合結果 ---")
    print(f"{total_shots} 本中 {goals} ゴールを決めました！")

if __name__ == "__main__":
    main()

