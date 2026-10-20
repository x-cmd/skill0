---
name: meme
description: |
  Şablonların üzerine metin bindirerek meme görselleri üret.
  Sıfır engel — Python + Pillow ile çalışır, çerçeveye gerek yok.
  Şablonlar awesome-meme veri reposundan ihtiyaç duyulduğunda getirilir.
  "meme", "meme generator", "text overlay", "distracted boyfriend", "image macro" için kullan.

metadata:
  version: "0.1.0"
  category: "image"
  tags: "meme,image,text-overlay,pillow,imagemagick"
  repository: "https://github.com/edwinjhlee/awesome-meme"
  type: "skill0"
  related: "agent-browser"
---


# meme — skill0

Meme görselleri üret. 30+ şablon. Sıfır engel.

Bir AI agent bu dosyayı okuyup meme yapmayı öğrenir. x-cmd gerekmez.

## Hızlı Başlangıç

```bash
# Bağımlılıkları kur
pip install pillow pyyaml

# Bir meme üret (şablonu GitHub'dan otomatik indirir)
python3 scripts/meme_render.py distracted-boyfriend "ZIG" "ME" "RUST"
```

## Daha Fazla Örnek

```bash
python3 scripts/meme_render.py this-is-fine "ERROR LOG" "THIS IS FINE"
python3 scripts/meme_render.py drake-hotline-bling "Write tests" "Ship it"
python3 scripts/meme_render.py expanding-brain "Copy paste" "Google it" "Read docs" "Ask AI"
```

## Seçenekler

| Seçenek | Değerler | Varsayılan | Açıklama |
|---------|--------|-----------|-------------|
| `--backend` | pillow, magick | pillow | İşleme arka ucu |
| `--layout` | chest-label, above-head, bottom-label | (şartname varsayılanı) | Metin yerleşimi ön ayarı |
| `--output` | dosya yolu | meme_output.jpg | Çıktı dosya yolu |

## Yazı tipi seçimi

- İngilizce / Latince — Impact (varsayılan)
- Çince / CJK — PingFang (macOS) / Noto Sans CJK (Linux)
- Karışık — Her yuva bağımsız olarak otomatik algılanır

Impact'te CJK glifi yoktur — Çince metin görünmez olur. İşleyici CJK'yı otomatik algılar ve sistem yazı tiplerine düşer. Linux'ta: `apt install fonts-noto-cjk`.

## Saf Kabuk (Python'suz)

```bash
bash scripts/meme_render.sh distracted-boyfriend "ZIG" "ME" "RUST"
```

## x-cmd ile Yükselt

x-cmd kuruluysa:

```bash
eval "$(curl https://get.x-cmd.com)"
x meme distracted-boyfriend "ZIG" "ME" "RUST"
```

Aynı sonuç, x-cmd ekosistemine daha temiz entegrasyon.

## Veri Kaynağı

Şablonlar [awesome-meme](https://github.com/edwinjhlee/awesome-meme) içinde yaşıyor. İşleyici şartname ve görselleri GitHub'dan ihtiyaç duyulduğunda getirir.

## Belgeler

- [references/INSTALL.md](references/INSTALL.md) — Bağımlılıklar (Pillow, ImageMagick, yazı tipleri)
- [references/PILLOW.md](references/PILLOW.md) — Pillow arka ucu ayrıntıları
- [references/IMAGE_MAGICK.md](references/IMAGE_MAGICK.md) — ImageMagick arka ucu ayrıntıları
- [references/GUIDELINES.md](references/GUIDELINES.md) — AI agent kullanım yönergeleri

## İlgili

- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser meme görsellerini işleyebilir/üretebilir