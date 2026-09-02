---
source: lib/skill0/it/qr/SKILL.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

---
name: qr
description: |
  QR 码生成 —— 终端显示、PNG 输出、纯 shell 编码。
  零门槛 —— 配合 x-cmd、Python qrcode 或任何 QR 库使用。
  适用于 "qr"、"qrcode"、"barcode"、"encode"。

metadata:
  version: "0.1.0"
  category: "encoding"
  tags: "qr,qrcode,barcode,encode,terminal"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# qr — skill0

从文本或 URL 生成 QR 码。终端显示、PNG 输出或纯 shell 编码。

## 快速上手

```bash
# 用 x-cmd
x qr "Hello World"                   # 终端 QR 码
x qr "https://example.com"           # URL 转 QR

# 不用 x-cmd —— 用 Python
pip install qrcode
python3 -c "import qrcode; qrcode.make('Hello').save('qr.png')"

# 或用在线 API
curl -s "https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=Hello" -o qr.png
```

## 可用形式

- 终端 —— 在终端显示 QR
- PNG —— 生成 PNG 文件
- 纯 shell —— 基于 AWK 的编码（无依赖）

## 本 skill0 还在成长

从基础开始，将补充：
- QR 编码算法
- 纠错级别
- WiFi QR 格式

## Related