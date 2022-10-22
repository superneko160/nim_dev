# Compile and Run: nim c -r hogehoge.nim
import unicode

let str = "日本語"

echo len(str)  # バイト列の長さが返る
echo runeLen(str)  # 文字列の長さが返る

echo ""

# 普通にforを適用した場合、バイト列に対する反復操作に
for c in str:
    echo $c.int

echo ""

# 各文字に対する反復操作はunicodeモジュールのutf8を利用
for c in str.utf8:
    echo c