---
name: qr
description: |
  QR コード生成 —— ターミナル表示、PNG 出力、純 shell エンコード。
  ゼロバリア —— x-cmd、Python qrcode、他の QR ライブラリのいずれからでも使える。
  "qr"、"qrcode"、"barcode"、"encode" に適用。

metadata:
  version: "0.1.0"
  category: "encoding"
  tags: "qr,qrcode,barcode,encode,terminal"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# qr — skill0

テキストや URL から QR コードを生成する。ターミナル表示、PNG 出力、純 shell エンコードに対応。

## クイックスタート

```bash
# x-cmd を使う
x qr "Hello World"                   # ターミナルの QR コード
x qr "https://example.com"           # URL を QR にする

# x-cmd なし —— Python を使う
pip install qrcode
python3 -c "import qrcode; qrcode.make('Hello').save('qr.png')"

# あるいはオンライン API を使う
curl -s "https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=Hello" -o qr.png
```

## 使える形

- ターミナル —— QR をターミナルに表示
- PNG —— PNG ファイルを生成
- 純 shell —— AWK ベースのエンコード（依存なし）

## この skill0 は成長中

まず最低限から。追加予定:
- QR エンコードのアルゴリズム
- 誤り訂正レベル
- WiFi QR のフォーマット

## Related

