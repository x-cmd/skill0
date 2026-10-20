---
name: qr
description: |
  Generare de coduri QR — afișare în terminal, ieșire PNG, codare în shell pur.
  Fără bariere — folosește cu x-cmd, Python qrcode sau orice bibliotecă QR.
  Folosește pentru "qr", "qrcode", "barcode", "encode".

metadata:
  version: "0.1.0"
  category: "encoding"
  tags: "qr,qrcode,barcode,encode,terminal"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# qr — skill0

Generează coduri QR din text sau URL-uri. Afișare în terminal, ieșire PNG sau codare în shell pur.

## Quick Start

```bash
# With x-cmd
x qr "Hello World"                   # Terminal QR code
x qr "https://example.com"           # URL to QR

# Without x-cmd — use Python
pip install qrcode
python3 -c "import qrcode; qrcode.make('Hello').save('qr.png')"

# Or use online API
curl -s "https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=Hello" -o qr.png
```

## Ce e disponibil

- Terminal — Afișează QR-ul în terminal
- PNG — Generează un fișier PNG
- Shell pur — Codare bazată pe AWK (fără dependințe)

## Acest skill0 crește

Pornim de la esențial. Vom adăuga:
- Algoritmi de codare QR
- Niveluri de corecție a erorilor
- Formatul QR pentru WiFi

## Related