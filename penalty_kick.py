#!/usr/bin/python3
# SPDX-FileCopyrightText: 2024 Sei Takahashi <seitaka_0716_poke@yahoo.com>
# SPDX-License-Identifier: BSD-3-Clause

import sys
import random

def take_penalty(player_number, directions):
    goalie_choice = random.choice(directions)

    # 入力方向の確認
    if len(sys.argv) < player_number + 2:
        print("エラー: 指定したシュート回数より少ないシュート方向が入力されました。")
        sys.exit(1)

    player_choice = sys.argv[player_number + 1].strip()

    if player_choice not in directions:
        print("無効な選択です！「left」また「right」を選んでください。")
        sys.exit(1)

    print(f"{player_choice}にシュート！")

    if player_choice == goalie_choice:
        print("失敗！キーパーがセーブしました！")
        return False
    else:
        print("ゴール！")
        return True

def main():
    # シュート回数を取得
    try:
        total_shots = int(sys.argv[1])
        if total_shots <= 0:
            print("エラー: シュート回数は正の整数で入力してください。")
            sys.exit(1)
    except ValueError:
        print("エラー: シュート回数は正の整数で入力してください。")
        sys.exit(1)

    directions = ["left", "right"]
    goals = 0

    # シュート方向が足りない場合はエラーを出力
    if len(sys.argv) < total_shots + 2:
        print("エラー: 指定したシュート回数より少ないシュート方向が入力されました。")
        sys.exit(1)

    print(f"PK戦スタート！ {total_shots} 回のシュートに挑戦します！")

    for i in range(1, total_shots + 1):
        if take_penalty(i, directions):
            goals += 1

    print("\n--- 試合結果 ---")
    print(f"{total_shots} 本中 {goals} ゴールを決めました！")

if __name__ == "__main__":
    main()

