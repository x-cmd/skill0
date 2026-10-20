---
name: meme
description: |
  Buat gambar meme dengan menimpa teks di atas template.
  Tanpa hambatan — jalan dengan Python + Pillow, tanpa framework.
  Template diambil sesuai kebutuhan dari repo data awesome-meme.
  Gunakan untuk "meme", "pembuat meme", "teks di atas gambar", "distracted boyfriend", "image macro".

metadata:
  version: "0.1.0"
  category: "image"
  tags: "meme,image,text-overlay,pillow,imagemagick"
  repository: "https://github.com/edwinjhlee/awesome-meme"
  type: "skill0"
  related: "agent-browser"
---


# meme — skill0

Buat gambar meme. Lebih dari 30 template. Tanpa hambatan.

Sebuah agen AI membaca berkas ini dan langsung tahu cara membuat meme. Tidak perlu x-cmd.

## Mulai Cepat

```bash
# Pasang dependensi
pip install pillow pyyaml

# Buat sebuah meme (template diunduh otomatis dari GitHub)
python3 scripts/meme_render.py distracted-boyfriend "ZIG" "ME" "RUST"
```

## Contoh Lainnya

```bash
python3 scripts/meme_render.py this-is-fine "ERROR LOG" "THIS IS FINE"
python3 scripts/meme_render.py drake-hotline-bling "Write tests" "Ship it"
python3 scripts/meme_render.py expanding-brain "Copy paste" "Google it" "Read docs" "Ask AI"
```

## Opsi

| Opsi | Nilai | Bawaan | Keterangan |
|--------|--------|---------|-------------|
| `--backend` | pillow, magick | pillow | Backend untuk merender |
| `--layout` | chest-label, above-head, bottom-label | (bawaan spec) | Preset penempatan teks |
| `--output` | path berkas | meme_output.jpg | Path berkas keluaran |

## Pemilihan font

- Inggris / Latin — Impact (bawaan)
- Tionghoa / CJK — PingFang (macOS) / Noto Sans CJK (Linux)
- Campuran — Masing-masing slot dideteksi otomatis secara terpisah

Impact tidak memiliki glif CJK — teks Tionghoa akan jadi tak terlihat. Perender mendeteksi CJK secara otomatis dan kembali ke font sistem. Di Linux: `apt install fonts-noto-cjk`.

## Shell Murni (tanpa Python)

```bash
bash scripts/meme_render.sh distracted-boyfriend "ZIG" "ME" "RUST"
```

## Tingkatkan dengan x-cmd

Jika Anda sudah memasang x-cmd:

```bash
eval "$(curl https://get.x-cmd.com)"
x meme distracted-boyfriend "ZIG" "ME" "RUST"
```

Hasil sama, integrasi lebih rapi dengan ekosistem x-cmd.

## Sumber Data

Template berada di [awesome-meme](https://github.com/edwinjhlee/awesome-meme). Perender mengambil spec dan gambar dari GitHub sesuai kebutuhan.

## Dokumentasi

- [references/INSTALL.md](references/INSTALL.md) — Dependensi (Pillow, ImageMagick, font)
- [references/PILLOW.md](references/PILLOW.md) — Rincian backend Pillow
- [references/IMAGE_MAGICK.md](references/IMAGE_MAGICK.md) — Rincian backend ImageMagick
- [references/GUIDELINES.md](references/GUIDELINES.md) — Panduan penggunaan untuk agen AI

## Terkait

- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser bisa merender/menghasilkan gambar meme