---
name: qr
description: |
  Генерация QR-кодов — отображение в терминале, вывод в PNG, чисто shell-кодирование.
  Нулевой порог входа — используйте с x-cmd, Python qrcode или любой QR-библиотекой.
  Применяйте для «qr», «qrcode», «barcode», «encode».

metadata:
  version: "0.1.0"
  category: "encoding"
  tags: "qr,qrcode,barcode,encode,terminal"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# qr — skill0

Генерация QR-кодов из текста или URL. Отображение в терминале, вывод в PNG или чисто shell-кодирование.

## Быстрый старт

```bash
# С x-cmd
x qr "Hello World"                   # QR-код в терминале
x qr "https://example.com"           # URL в QR

# Без x-cmd — используйте Python
pip install qrcode
python3 -c "import qrcode; qrcode.make('Hello').save('qr.png')"

# Или через онлайн-API
curl -s "https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=Hello" -o qr.png
```

## Что доступно

- Терминал — отобразить QR в терминале
- PNG — сгенерировать PNG-файл
- Чистый shell — кодирование на основе AWK (без зависимостей)

## Этот skill0 растёт

Начинаем с основ. Будет добавлено:
- Алгоритмы кодирования QR
- Уровни коррекции ошибок
- Формат QR для WiFi

## Связанное

