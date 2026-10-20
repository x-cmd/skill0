---
name: qr
description: |
  Generování QR kódů — zobrazení v terminálu, výstup do PNG, kódování čistým shellem.
  Bez jakýchkoli překážek — použijte s x-cmd, Python qrcode nebo libovolnou QR knihovnou.
  Použijte pro "qr", "qrcode", "barcode", "encode".

metadata:
  version: "0.1.0"
  category: "encoding"
  tags: "qr,qrcode,barcode,encode,terminal"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# qr — skill0

Generujte QR kódy z textu nebo URL. Zobrazení v terminálu, výstup do PNG nebo kódování čistým shellem.

## Rýchlý start

```bash
# S x-cmd
x qr "Hello World"                   # QR kód v terminálu
x qr "https://example.com"           # URL do QR

# Bez x-cmd — použijte Python
pip install qrcode
python3 -c "import qrcode; qrcode.make('Hello').save('qr.png')"

# Nebo použijte online API
curl -s "https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=Hello" -o qr.png
```

## Co je k dispozici

- Terminál — Zobrazí QR v terminálu
- PNG — Vygeneruje soubor PNG
- Čistý shell — Kódování založené na AWK (bez závislostí)

## Tento skill0 poroste

Začínáme základními věcmi. Bude přidáno:
- Algoritmy kódování QR
- Úrovně korekce chyb
- Formát QR pro WiFi

## Související
