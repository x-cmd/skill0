---
name: qr
description: |
  Generación de códigos QR — visualización en terminal, salida PNG, codificación en shell puro.
  Sin barreras — úsalo con x-cmd, el qrcode de Python, o cualquier librería QR.
  Úsalo para "qr", "qrcode", "barcode", "encode".

metadata:
  version: "0.1.0"
  category: "encoding"
  tags: "qr,qrcode,barcode,encode,terminal"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# qr — skill0

Genera códigos QR a partir de texto o URLs. Visualización en terminal, salida PNG, o codificación en shell puro.

## Inicio rápido

```bash
# Con x-cmd
x qr "Hello World"                   # Código QR en la terminal
x qr "https://example.com"           # URL a QR

# Sin x-cmd — usa Python
pip install qrcode
python3 -c "import qrcode; qrcode.make('Hello').save('qr.png')"

# O usa una API en línea
curl -s "https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=Hello" -o qr.png
```

## Qué hay disponible

- Terminal — Mostrar el QR en la terminal
- PNG — Generar un archivo PNG
- Shell puro — codificación basada en AWK (sin dependencias)

## Esta skill0 crece

Empezando por lo esencial. Se añadirá:
- Algoritmos de codificación QR
- Niveles de corrección de errores
- Formato QR de WiFi

## Relacionadas

