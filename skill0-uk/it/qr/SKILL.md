---
name: qr
description: |
  Генерація QR-кодів — вивід у терміналі, PNG-файл, кодування чистим shell.
  Нульовий бар'єр — працює з x-cmd, Python qrcode або будь-якою QR-бібліотекою.
  Використовувати для "qr", "qrcode", "barcode", "encode".

metadata:
  version: "0.1.0"
  category: "encoding"
  tags: "qr,qrcode,barcode,encode,terminal"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# qr — skill0

Генеруйте QR-коди з тексту або URL. Вивід у терміналі, PNG-файл або кодування чистим shell.

## Швидкий старт

```bash
# З x-cmd
x qr "Hello World"                   # QR-код у терміналі
x qr "https://example.com"           # URL у QR-код

# Без x-cmd — скористайтеся Python
pip install qrcode
python3 -c "import qrcode; qrcode.make('Hello').save('qr.png')"

# Або скористайтеся онлайн-API
curl -s "https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=Hello" -o qr.png
```

## Що доступно

- Термінал — показати QR-код у терміналі
- PNG — згенерувати PNG-файл
- Чистий shell — кодування на основі AWK (без залежностей)

## Цей skill0 ще зростає

Починаємо з основного. Далі додамо:
- алгоритми кодування QR
- рівні корекції помилок
- формат QR для WiFi

## Related