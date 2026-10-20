---
name: qr
description: |
  Pembuatan kode QR — tampilan di terminal, keluaran PNG, enkodeksi murni shell.
  Tanpa hambatan — pakai dengan x-cmd, Python qrcode, atau library QR apa pun.
  Gunakan untuk "qr", "qrcode", "barcode", "enkode".

metadata:
  version: "0.1.0"
  category: "encoding"
  tags: "qr,qrcode,barcode,encode,terminal"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# qr — skill0

Buat kode QR dari teks atau URL. Tampilan di terminal, keluaran PNG, atau enkodeksi murni shell.

## Mulai Cepat

```bash
# Dengan x-cmd
x qr "Hello World"                   # Kode QR di terminal
x qr "https://example.com"           # URL jadi QR

# Tanpa x-cmd — pakai Python
pip install qrcode
python3 -c "import qrcode; qrcode.make('Hello').save('qr.png')"

# Atau pakai API daring
curl -s "https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=Hello" -o qr.png
```

## Yang Tersedia

- Terminal — Tampilkan QR di terminal
- PNG — Buat berkas PNG
- Murni shell — Enkodeksi berbasis AWK (tanpa dependensi)

## skill0 Ini Berkembang

Mulai dari yang paling dasar. Akan ditambahkan:
- Algoritma enkodeksi QR
- Tingkat koreksi galat
- Format QR WiFi

## Terkait