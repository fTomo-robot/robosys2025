#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Tomotaka Fujiwara
# SPDX-License-Identifier: BSD-3-Clause


# 失敗時にスクリプトを終了
set -e

# 実行するPythonスクリプトのパス
UNIT_SCRIPT="./unit_conversion"

# 正常なテストケース
# 入力: 0.03uF

# 期待される出力 (2バイト文字不使用)
EXPECTED_OUTPUT="3e-17GF
3e-14MF
3e-11kF
3e-08F
3e-05mF
0.03uF
30nF
30000pF
[3e-08F]"

echo "--- Running Simple Test: 0.03uF Conversion ---"

# コマンドを実行し、結果を変数に格納
ACTUAL_OUTPUT=$(echo "0.03uF" | $UNIT_SCRIPT)

# 期待値と実行結果を比較
if [ "$ACTUAL_OUTPUT" = "$EXPECTED_OUTPUT" ]; then
    echo "SUCCESS: Basic conversion test passed."
else
    echo "--- ERROR: Basic conversion test failed. ---"
    echo "Expected Output (9 lines):"
    echo "$EXPECTED_OUTPUT"
    echo "Actual Output (9 lines):"
    echo "$ACTUAL_OUTPUT"
    exit 1 # 失敗したらテスト全体を終了
fi

# エラー処理テスト (2バイト文字チェック)

echo "--- Running Error Check: Ensure no 2-byte characters in output ---"

# 不正な入力（単位なし）を実行し、標準エラー出力を確認
# プログラムはエラーメッセージを標準エラー出力に出力し、標準出力には何も出力しないはず
if ! echo "InvalidValue" | $UNIT_SCRIPT 2> error.log ; then

    # 標準エラー出力ファイルが存在し、内容が空ではないか確認
    if [ -s error.log ]; then

        # 標準エラー出力ファイルに2バイト文字（日本語）が含まれていないか確認
        # LC_ALL=C でバイト単位の比較を強制
        if grep -P '[\x80-\xFF]' error.log; then
            echo "--- ERROR: Test failed. 2-byte (non-ASCII) characters detected in error.log ---"
            cat error.log
            exit 1
        else
            echo "SUCCESS: Error message test passed. Output is ASCII."
        fi

    else
        echo "--- ERROR: Error message test failed. Standard error output is empty. ---"
        exit 1
    fi

else
    echo "--- ERROR: Error check failed. Expected command to fail (non-zero exit code), but it succeeded. ---"
    exit 1
fi

echo "All simplified tests passed successfully!"
