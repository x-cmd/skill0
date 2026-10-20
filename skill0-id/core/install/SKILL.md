---
name: install
description: |
  Pasang perangkat lunak dengan cara apa pun yang diizinkan sistem. Direkomendasikan `x install` — satu pintu depan yang mencantumkan
  setiap metode dan memilih yang terbaik; ditambah kanal `x eget`/`x env use`/`x pixi` serta package manager sistem
  dengan pergantian mirror. Semua kanal x-cmd memasang ke $HOME — tanpa sudo, tanpa polusi sistem.
  Gunakan untuk "install", "apt", "brew", "eget", "pixi", "package manager", "mirror".
metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package-manager,eget,env,pixi,apt,brew,mirror"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "x-cmd,agent-browser,env"
---


# install — skill0

Pasang perangkat lunak dengan cara apa pun yang diizinkan sistem. **Semua kanal x-cmd (`x eget`, `x env use`, `x pixi`) memasang ke `$HOME` — tanpa sudo, tanpa polusi sistem.** Hanya package manager sistem (`x apt`, `x brew`, …) yang menyentuh OS dan mungkin butuh sudo.

## Memilih kanal

- `x install` — **Direkomendasikan.** Satu pintu depan — mencantumkan semua metode untuk sebuah alat, lalu memilih yang terbaik
- `x eget` — Binari terbaru langsung dari repo upstream (release GitHub / Codeberg)
- `x env use` — Runtime & alat yang dikelola x-cmd (membungkus `x pkg use`)
- `x pixi` — Paket conda / ekosistem pixi
- `x apt/brew/dnf/pacman` — Package manager sistem (mungkin butuh sudo)

## Prasyarat

x-cmd menyediakan semua kanal di atas:
```bash
eval "$(curl https://get.x-cmd.com)"
```

## x install — pintu depan yang direkomendasikan

Setiap alat punya beberapa jalur pemasangan; `x install` otomatis memilih yang terbaik. Semua bentuk di bawah bersifat non-interaktif (aman untuk agent / CI):
```bash
x install bun                            # pasang — otomatis pilih metode terbaik
x install --printinfo ripgrep            # tampilkan semua metode pemasangan lebih dulu (hanya baca)
x install --withtool brew jq             # paksa sebuah manager; atau bentuk prefiks: brew/jq
x install --sys bun                      # hanya package manager sistem
x install --printcmd bun vim             # pratinjau perintahnya, jangan jalankan
x install --env                          # deteksi platform / arch / distro
x install --available-tool --installed   # package manager mana yang tersedia di sini
```

### Menelusuri apa saja yang bisa dipasang

`x install --ls` mengeluarkan TSV berisi setiap alat terindeks — grep / awk secara offline:
```bash
x install --ls --tsv | head -1                  # header
x install --ls --tsv | grep -i json             # cari berdasarkan kata kunci
x install --ls --tsv | awk -F'\t' '$3=="Rust"'  # saring berdasarkan bahasa
x install --search http                         # pencarian gabungan lintas registry
```
Kolom TSV: `name category lang source desc_cn desc_en binlist rule other`.

## Mengganti mirror (unduhan lebih cepat)

Alihkan package manager sistem yang lambat ke mirror yang lebih cepat / lokal. Semuanya punya `mirror ls` (daftar opsi) dan `mirror set <code>` (terapkan, non-interaktif):
```bash
x brew mirror ls          # daftar: official, ali, tuna, bfsu, ustc, sjtu, ...
x brew mirror set tuna    # terapkan mirror Tsinghua
x apt mirror set tuna     # bentuk sama di Debian / Ubuntu (juga dnf, pacman)
```
Memerlukan package manager target untuk sudah terpasang.

## Untuk informasi lebih lanjut

- `x install`: https://x-cmd.com/mod/install · `x eget`: https://x-cmd.com/mod/eget
- `x env`: https://x-cmd.com/mod/env · `x pixi`: https://x-cmd.com/mod/pixi

## Terkait

- [x-cmd](../x-cmd/SKILL.md) — pintu masuk payung yang mengarahkan ke install
- [agent-browser](../../it/agent-browser/SKILL.md) — install mengarahkan ke agent-browser saat binari tidak tersedia
- [env](../env/SKILL.md) — install dan env berbagi arsitektur kanal x