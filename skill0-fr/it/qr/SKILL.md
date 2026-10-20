---
name: qr
description: |
  Génération de QR codes — affichage terminal, sortie PNG, encodage en shell pur.
  Zéro barrière — à utiliser avec x-cmd, Python qrcode, ou n'importe quelle lib QR.
  À utiliser pour « qr », « qrcode », « barcode », « encode ».

metadata:
  version: "0.1.0"
  category: "encoding"
  tags: "qr,qrcode,barcode,encode,terminal"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# qr — skill0

Générer des QR codes à partir de texte ou d'URLs. Affichage terminal, sortie PNG, ou encodage en shell pur.

## Démarrage rapide

```bash
# Avec x-cmd
x qr "Hello World"                   # QR code dans le terminal
x qr "https://example.com"           # URL en QR

# Sans x-cmd — utilisez Python
pip install qrcode
python3 -c "import qrcode; qrcode.make('Hello').save('qr.png')"

# Ou utilisez l'API en ligne
curl -s "https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=Hello" -o qr.png
```

## Ce qui est disponible

- Terminal — Afficher le QR dans le terminal
- PNG — Générer un fichier PNG
- Shell pur — Encodage basé AWK (sans deps)

## Ce skill0 grandit

Commence avec l'essentiel. Ajoutera :
- Algorithmes d'encodage QR
- Niveaux de correction d'erreur
- Format QR WiFi

## Related

