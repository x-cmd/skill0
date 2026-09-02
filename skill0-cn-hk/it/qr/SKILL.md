---
name: qr
description: |
  QR 碼生成 —— 終端顯示、PNG 輸出、純 shell 編碼。
  零門檻 —— 配合 x-cmd、Python qrcode 或任何 QR 庫使用。
  適用於 "qr"、"qrcode"、"barcode"、"encode"。

metadata:
  version: "0.1.0"
  category: "encoding"
  tags: "qr,qrcode,barcode,encode,terminal"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# qr — skill0

從文本或 URL 生成 QR 碼。終端顯示、PNG 輸出或純 shell 編碼。

## 快速上手

```bash
# 用 x-cmd
x qr "Hello World"                   # 終端 QR 碼
x qr "https://example.com"           # URL 轉 QR

# 不用 x-cmd —— 用 Python
pip install qrcode
python3 -c "import qrcode; qrcode.make('Hello').save('qr.png')"

# 或用在線 API
curl -s "https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=Hello" -o qr.png
```

## 可用形式

- 終端 —— 在終端顯示 QR
- PNG —— 生成 PNG 文件
- 純 shell —— 基於 AWK 的編碼（無依賴）

## 本 skill0 還在成長

從基礎開始，將補充：
- QR 編碼算法
- 糾錯級別
- WiFi QR 格式

## Related