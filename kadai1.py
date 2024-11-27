#!/usr/bin/python3
# SPDX-FileCopyrightText: 2024 Sei Takahashi <seitaka_0716_poke@yahoo.com>
# SPDX-License-Identifier: BSD-3-Clause

import sys
import random

def take_penalty(player_number):
<<<<<<< HEAD

    directions = ["left", "right"]
    goalie_choice = random.choice(directions)
=======
    
    directions = ["left", "right"]
    goalie_choice = random.choice(directions)

>>>>>>> ef2fdffda645539465d492ff27b2840a8decbdd3
    while True:
        player_choice = input(f"シュートの方向を選んでください（left/right）: ").strip()
        if player_choice in directions:
            break
        print("無効な選択です！「left」また「right」を選んでください。")
<<<<<<< HEAD
        print(f"{player_choice}にシュート！")
=======

    print(f"{player_choice}にシュート！")
>>>>>>> ef2fdffda645539465d492ff27b2840a8decbdd3

    if player_choice == goalie_choice:
        print("失敗！キーパーがセーブしました！")
        return False
    else:
        print("ゴール！")
        return True

def main():
    print("PK戦スタート！")

    while True:
        try:
            total_shots = int(input("シュート回数を入力してください: ").strip())
            if total_shots > 0:
                break
            else:
                print("エラー: シュート回数は正の整数で入力してください。")
        except ValueError:
            print("エラー: シュート回数は正の整数で入力してください。")
<<<<<<< HEAD
=======

>>>>>>> ef2fdffda645539465d492ff27b2840a8decbdd3
    print(f" {total_shots} 回のシュートに挑戦します！")

    goals = 0
    for i in range(1, total_shots + 1):
        if take_penalty(i):
            goals += 1

    print("\n--- 試合結果 ---")
    print(f"{total_shots} 本中 {goals} ゴールを決めました！")

if __name__ == "__main__":
    main()
