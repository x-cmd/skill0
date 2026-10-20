---
name: qr
description: |
  Tạo mã QR — hiển thị trong terminal, xuất PNG, mã hóa thuần shell.
  Không rào cản — dùng với x-cmd, Python qrcode hoặc bất kỳ thư viện QR nào.
  Dùng cho "qr", "qrcode", "barcode", "encode".

metadata:
  version: "0.1.0"
  category: "encoding"
  tags: "qr,qrcode,barcode,encode,terminal"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# qr — skill0

Tạo mã QR từ văn bản hoặc URL. Hiển thị trong terminal, xuất PNG, hoặc mã hóa thuần shell.

## Bắt đầu nhanh

```bash
# Với x-cmd
x qr "Hello World"                   # Mã QR trên terminal
x qr "https://example.com"           # URL thành QR

# Không dùng x-cmd — dùng Python
pip install qrcode
python3 -c "import qrcode; qrcode.make('Hello').save('qr.png')"

# Hoặc dùng API trực tuyến
curl -s "https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=Hello" -o qr.png
```

## Có sẵn những gì

- Terminal — Hiển thị QR trong terminal
- PNG — Sinh tệp PNG
- Thuần shell — Mã hóa dựa trên AWK (không phụ thuộc)

## skill0 này sẽ tiếp tục lớn lên

Bắt đầu từ phần cốt lõi. Sẽ bổ sung:
- Thuật toán mã hóa QR
- Mức sửa lỗi
- Định dạng QR WiFi

## Related
