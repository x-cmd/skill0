---
name: qr
description: |
  QR-Code-Generierung — Terminal-Anzeige, PNG-Ausgabe, Kodierung in reinem Shell.
  Null Hürde — mit x-cmd, Python qrcode oder einer beliebigen QR-Bibliothek verwenden.
  Für "qr", "qrcode", "barcode", "kodieren".

metadata:
  version: "0.1.0"
  category: "encoding"
  tags: "qr,qrcode,barcode,encode,terminal"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# qr — skill0

QR-Codes aus Text oder URLs erzeugen. Terminal-Anzeige, PNG-Ausgabe oder Kodierung in reinem Shell.

## Schnellstart

```bash
# Mit x-cmd
x qr "Hello World"                   # QR-Code im Terminal
x qr "https://example.com"           # URL als QR

# Ohne x-cmd — Python verwenden
pip install qrcode
python3 -c "import qrcode; qrcode.make('Hello').save('qr.png')"

# Oder eine Online-API verwenden
curl -s "https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=Hello" -o qr.png
```

## Was verfügbar ist

- Terminal — QR im Terminal anzeigen
- PNG — PNG-Datei erzeugen
- Reines Shell — AWK-basierte Kodierung (keine Abhängigkeiten)

## Dieses skill0 wächst

Startet mit dem Wesentlichen. Hinzu kommen:
- QR-Kodierungsalgorithmen
- Fehlerkorrekturstufen
- WiFi-QR-Format

## Verwandt
