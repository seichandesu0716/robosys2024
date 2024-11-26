#!/usr/bin/python3
# SPDX-FileCopyrightText: 2024 Sei Takahashi <seitaka_0716_poke@yahoo.com>
# SPDX-License-Identifier: BSD-3-Clause

import sys
import random

def take_penalty(player_number):
    """
    プレイヤーのシュート方向を取得し、結果を判定します。
    
    Parameters:
        player_number (int): 現在のプレイヤー番号。
    
    Returns:
        bool: シュートがゴールした場合は True、失敗した場合は False。
    """
    directions = ["left", "right"]
    goalie_choice = random.choice(directions)

    while True:
        player_choice = input(f" プレイヤー{player_number}番、シュートの方向を選んでください（left/right）: ").strip()
        if player_choice in directions:
            break
        print("無効な選択です！「left」また「right」を選んでください。")

    print(f"{player_choice}にシュート！")

    if player_choice == goalie_choice:
        print("失敗！キーパーがセーブしました！")
        return False
    else:
        print("ゴール！")
        return True

def main():
    """
    PK戦を開始します。プレイヤーは指定された回数だけシュートを試みます。
    """
    print("PK戦スタート！")

    # シュート回数の入力
    while True:
        try:
            total_shots = int(input("シュート回数を入力してください: ").strip())
            if total_shots > 0:
                break
            else:
                print("エラー: シュート回数は正の整数で入力してください。")
        except ValueError:
            print("エラー: シュート回数は正の整数で入力してください。")

    print(f" {total_shots} 回のシュートに挑戦します！")

    # シュートの結果を記録
    goals = 0
    for i in range(1, total_shots + 1):
        if take_penalty(i):
            goals += 1

    # 試合結果を表示
    print("\n--- 試合結果 ---")
    print(f"{total_shots} 本中 {goals} ゴールを決めました！")

if __name__ == "__main__":
    main()
