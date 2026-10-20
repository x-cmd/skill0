---
name: qr
description: |
  Generowanie kodów QR — wyświetlanie w terminalu, wyjście PNG, kodowanie w czystym shellu.
  Bez barier — użyj z x-cmd, Pythona qrcode lub dowolnej biblioteki QR.
  Użyj dla "qr", "qrcode", "barcode", "encode".

metadata:
  version: "0.1.0"
  category: "encoding"
  tags: "qr,qrcode,barcode,encode,terminal"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# qr — skill0

Generuj kody QR z tekstu lub adresów URL. Wyświetlanie w terminalu, wyjście PNG lub kodowanie w czystym shellu.

## Szybki start

```bash
# Z x-cmd
x qr "Hello World"                   # Kod QR w terminalu
x qr "https://example.com"           # URL do kodu QR

# Bez x-cmd — użyj Pythona
pip install qrcode
python3 -c "import qrcode; qrcode.make('Hello').save('qr.png')"

# Lub skorzystaj z API online
curl -s "https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=Hello" -o qr.png
```

## Co jest dostępne

- Terminal — wyświetl kod QR w terminalu
- PNG — wygeneruj plik PNG
- Czysty shell — kodowanie oparte na AWK (bez zależności)

## Ta umiejętność skill0 rośnie

Zaczyna od podstaw. Planowane dodatki:
- Algorytmy kodowania QR
- Poziomy korekcji błędów
- Format QR dla Wi-Fi

## Powiązane