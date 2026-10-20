---
name: qr
description: |
  Generazione di codici QR — visualizzazione nel terminale, output PNG, codifica in puro shell.
  Zero barriere — usala con x-cmd, Python qrcode o qualsiasi libreria QR.
  Usala per "qr", "qrcode", "barcode", "encode".

metadata:
  version: "0.1.0"
  category: "encoding"
  tags: "qr,qrcode,barcode,encode,terminal"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# qr — skill0

Genera codici QR da testo o URL. Visualizzazione nel terminale, output PNG o codifica in puro shell.

## Guida rapida

```bash
# Con x-cmd
x qr "Hello World"                   # Codice QR nel terminale
x qr "https://example.com"           # URL in QR

# Senza x-cmd — usa Python
pip install qrcode
python3 -c "import qrcode; qrcode.make('Hello').save('qr.png')"

# Oppure usa una API online
curl -s "https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=Hello" -o qr.png
```

## Cosa c'è a disposizione

- Terminale — Mostra il QR nel terminale
- PNG — Genera un file PNG
- Puro shell — Codifica basata su AWK (nessuna dipendenza)

## Questo skill0 cresce

Si parte dall'essenziale. Aggiungeremo:
- Algoritmi di codifica dei QR
- Livelli di correzione degli errori
- Formato QR per il WiFi

## Related