---
name: qr
description: |
  Geração de QR code — exibição no terminal, saída PNG, codificação em shell puro.
  Zero barreira — use com x-cmd, qrcode do Python ou qualquer biblioteca de QR.
  Use para "qr", "qrcode", "barcode", "encode".

metadata:
  version: "0.1.0"
  category: "encoding"
  tags: "qr,qrcode,barcode,encode,terminal"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# qr — skill0

Gere QR codes a partir de texto ou URLs. Exibição no terminal, saída PNG ou codificação em shell puro.

## Início rápido

```bash
# Com x-cmd
x qr "Hello World"                   # QR code no terminal
x qr "https://example.com"           # URL em QR

# Sem x-cmd — use Python
pip install qrcode
python3 -c "import qrcode; qrcode.make('Hello').save('qr.png')"

# Ou use uma API online
curl -s "https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=Hello" -o qr.png
```

## O que está disponível

- Terminal — Exibe o QR no terminal
- PNG — Gera um arquivo PNG
- Shell puro — Codificação baseada em AWK (sem dependências)

## Este skill0 cresce

Começando pelo essencial. Vamos adicionar:
- Algoritmos de codificação de QR
- Níveis de correção de erro
- Formato de QR para WiFi

## Relacionados