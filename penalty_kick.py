#!/usr/bin/python3
# SPDX-FileCopyrightText: 2024 Sei Takahashi <seitaka_0716_poke@yahoo.com>
# SPDX-License-Identifier: BSD-3-Clause

import sys
import random

def take_penalty(player_number, player_choice):
    directions = ["left", "right"]
    goalie_choice = random.choice(directions)

    # 入力されたシュート方向を確認
    if player_choice not in directions:
        print(f"無効な選択です！「left」また「right」を選んでください。")
        return False

    print(f"{player_choice}にシュート！")

    if player_choice == goalie_choice:
        print("失敗！キーパーがセーブしました！")
        return False
    else:
        print("ゴール！")
        return True

def main():
    # コマンドライン引数のチェック
    if len(sys.argv) < 3:
        print("エラー: シュート回数とシュート方向（leftまたはright）を指定してください。")
        sys.exit(1)

    try:
        total_shots = int(sys.argv[1])  # コマンドライン引数からシュート回数を取得
        if total_shots <= 0:
            raise ValueError
    except ValueError:
        print("エラー: シュート回数は正の整数で入力してください。")
        sys.exit(1)

    directions = sys.argv[2:]  # 2番目以降の引数をシュート方向として取得

    print(f"PK戦スタート！ {total_shots} 回のシュートに挑戦します！")

    goals = 0
    for i in range(1, total_shots + 1):
        if i <= len(directions):
            player_choice = directions[i - 1]
        else:
            print("エラー: 指定したシュート回数より少ないシュート方向が入力されました。")
            sys.exit(1)

        if take_penalty(i, player_choice):
            goals += 1

    print("\n--- 試合結果 ---")
    print(f"{total_shots} 本中 {goals} ゴールを決めました！")

if __name__ == "__main__":
    main()

