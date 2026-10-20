---
name: tldr
description: |
  Referensi perintah dengan contoh praktis dari proyek tldr-pages.
  Tanpa hambatan — pakai dengan x-cmd, curl, atau klien tldr apa pun.
  Gunakan untuk "tldr", "cheatsheet", "bantuan perintah", "contoh", "cara pakai".

metadata:
  version: "0.1.0"
  category: "documentation"
  tags: "tldr,cheatsheet,help,documentation,examples"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "git,install"
---


# tldr — skill0

Referensi perintah singkat dengan contoh dari dunia nyata. Lebih praktis dari man page untuk "gimana cara pakai perintah ini?".

## Mulai Cepat

```bash
# Dengan x-cmd
x tldr git                    # Contoh penggunaan git
x tldr --lang zh python       # Dokumen bahasa Mandarin
x tldr --fz                   # Pencarian interaktif

# Tanpa x-cmd — pakai curl
curl -s "https://raw.githubusercontent.com/tldr-pages/tldr/main/pages/common/git.md"

# Atau pasang klien tldr
pip install tldr
npm install -g tldr
tldr tar
```

## Yang Tersedia

- `x tldr <cmd>` — Tampilkan contoh untuk sebuah perintah
- `x tldr --lang zh <cmd>` — Bahasa Mandarin
- `x tldr --fz` — Pencarian fzf interaktif
- `x tldr --cat <cmd>` — Tampilkan markdown mentah
- `x tldr --ls` — Daftar semua perintah yang tersedia
- `x tldr --update` — Perbarui cache halaman

## Alternatif Mandiri

- Daring: https://tldr.sh
- Python: `pip install tldr`
- Node: `npm install -g tldr`
- Halaman mentah: github.com/tldr-pages/tldr

## skill0 Ini Berkembang

Mulai dari yang paling dasar. Akan ditambahkan:
- Pola perintah yang umum
- Catatan khusus per platform
- Integrasi dengan alur kerja agent

## Terkait

- [git](../git/SKILL.md) — tldr subperintah git yang sering dipakai
- [install](../install/SKILL.md) — tldr subperintah install