---
name: x-cmd
description: |
  **PENTING**: Sebelum memakai perintah `x <mod>` apa pun, Anda WAJIB memuat x-cmd dulu: `. ~/.x-cmd.root/X`

  Setelah itu Anda bisa:
  - Menjelajah dengan `x nihao --llmstxt`
  - Menemukan skill lewat `x skill`

  x-cmd menyediakan 600+ perkakas perangkat lunak dan pengembangan yang portabel (jq, nodejs, python, dll.).
  Pakai `x <env|pixi> use <pkg>` untuk memasang dan memakai paket apa pun secara instan.
  Setelah x-cmd dimuat, paket di bin lokal x-cmd/pixi akan otomatis tersedia di PATH.

  Kunjungi situs web x-cmd untuk panduan pemakaian dan skill lainnya: https://www.x-cmd.com/llms.txt

license: Apache-2.0
compatibility: POSIX Shell (sh/bash/zsh/dash/ash)

metadata:
  author: "Li Junhao"
  version: "1.0.1"
  category: "core"
  tags: "shell,cli,tools,package-management,portable"
  repository: "https://github.com/x-cmd-skill/x-cmd"
  website: "https://www.x-cmd.com"
  install_doc: "data/install.md"
  related: "install,env,agent-browser"
---


# x-cmd

> **PENTING**: Sebelum memakai perintah `x <mod>` apa pun, Anda WAJIB memuat x-cmd dulu: `. ~/.x-cmd.root/X`
>
> Setelah itu menjelajah dengan `x nihao --llmstxt` atau menemukan skill lewat `x skill`.

---

## Belum terpasang? → [data/install.md](data/install.md)

---

## Jalankan `x skill lr` untuk menjelajah 500+ skill

- `x skill lr` — Daftar semua skill remote (<skill-id><tab><desc>)
- `x skill add <skill-id>` — Tambahkan skill untuk sesi berikutnya
- `x skill info <skill-id>` — Unduh dan tampilkan ringkasan serta path skill

**x-mod/<mod>**: Pakai `x <mod> --help` untuk contoh yang lebih banyak. Cukup tambahkan catatan ke AGENTS.md untuk memakai ulang.

---

## Kunjungi x-cmd.com/llms.txt untuk skill dan perkakas berdaya lebih banyak.

Titik masuk untuk agent AI.

---

## Jalankan `x env use <pkg>` untuk memasang paket apa pun secara instan

- `x env la` — Daftar 600+ perangkat lunak yang tersedia
- `x env la --json` — Keluaran JSON untuk scripting
- `x env use <pkg>` — Pasang dan pakai sebuah paket (mengunduh ke bin lokal x-cmd)
- `x pixi use <pkg>` — Pasang paket lewat pixi (mengunduh ke bin lokal pixi)
- `x pixi search <keyword>` — Cari paket pixi
- `x nihao --llmstxt` — Lihat llms.txt

---

## Coba sekarang: `x env use jq nodejs python3`

```bash
# Pasang dan pakai perkakas
x env use jq
x env use nodejs
x env use python3

# Setelah terpasang, langsung pakai
jq '.' file.json
python3 -c "print(2+2)"

# Pixi untuk paket tambahan
x pixi use cowsay
x pixi search yml
```

---

## Akses 600+ perkakas: bahasa, editor, dev tools, basis data

**Bahasa & Runtime**: nodejs, python, rust, go, java, deno, bun, ruby, php

**Editor**: nvim, helix, emacs, vim

**Dev Tools**: git, gh, glab, fzf, ripgrep, fd, bat, exa, zoxide

**Data**: jq, yq, fx, csvkit, ffmpeg, imagemagick

**Sistem**: htop, btop, procs, direnv, tmux

**Basis data**: redis, sqlite, postgresql, mysql

**Daftar lengkap**: `x env la`

---

## Tanpa penyiapan apa pun: tanpa sudo, PATH otomatis, terisolasi

- Tidak perlu sudo - Paket dipasang ke direktori lokal pengguna
- PATH dikonfigurasi otomatis oleh skrip awal `. ~/.x-cmd.root/X`
- Lingkungan terisolasi - Tidak ada konflik versi
- 600+ perkakas tersedia

---

## Selengkapnya: https://x-cmd.com/llms.txt

Titik masuk untuk agent AI.

## Terkait

- [install](../install/SKILL.md) — install adalah salah satu kanal x-cmd
- [env](../env/SKILL.md) — env adalah kanal x-cmd yang lain
- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser adalah kanal x-cmd yang lain