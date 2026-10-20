---
name: qr
description: |
  QR kod üretimi — terminalde gösterim, PNG çıktı, saf kabuk kodlama.
  Sıfır engel — x-cmd, Python qrcode ya da herhangi bir QR kütüphanesiyle kullan.
  "qr", "qrcode", "barcode", "encode" için kullan.

metadata:
  version: "0.1.0"
  category: "encoding"
  tags: "qr,qrcode,barcode,encode,terminal"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# qr — skill0

Metin ya da URL'lerden QR kod üret. Terminalde gösterim, PNG çıktı veya saf kabuk kodlama.

## Hızlı Başlangıç

```bash
# x-cmd ile
x qr "Hello World"                   # Terminal QR kodu
x qr "https://example.com"           # URL'den QR

# x-cmd'siz — Python kullan
pip install qrcode
python3 -c "import qrcode; qrcode.make('Hello').save('qr.png')"

# Ya da çevrimiçi API kullan
curl -s "https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=Hello" -o qr.png
```

## Neler Var

- Terminal — QR'ı terminalde göster
- PNG — PNG dosyası üret
- Saf kabuk — AWK tabanlı kodlama (bağımlılık yok)

## Bu skill0 büyüyor

Temel olanlarla başlıyor. Eklenecekler:
- QR kodlama algoritmaları
- Hata düzeltme düzeyleri
- WiFi QR biçimi

## İlgili