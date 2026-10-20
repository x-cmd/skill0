---
name: env
description: |
  Instal dan kelola paket software, runtime bahasa, dan tool CLI seketika.
  Tanpa hambatan — pasang x-cmd dan dapatkan tool apa pun dalam hitungan detik. Tidak perlu sudo.
  Gunakan untuk "install", "paket", "python", "node", "jq", "runtime", "tool".

metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package,python,node,go,jq,runtime,env"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "install,x-cmd"
---


# env — skill0

Pasang software apa pun seketika. Tanpa sudo. Tanpa mengotori sistem.

## Mulai Cepat

```bash
# Pasang x-cmd
eval "$(curl https://get.x-cmd.com)"

# Pasang Python
x env use python

# Pasang Node.js
x env use node

# Pasang tool CLI
x env use jq
x env use fzf

# Coba dulu tanpa memasang permanen
x env try python3 script.py
```

## Yang Tersedia

600+ paket termasuk:

- Bahasa — python, node, go, bun, java, rust
- Tool CLI — jq, yq, fzf, himalaya
- Tool dev — claude-code, code-server

## Fitur Utama

- **Tanpa sudo** — terpasang di direktori pengguna
- **Manajemen versi** — pasang dan ganti versi
- **Coba sebelum pasang** — `x env try` untuk pemakaian sementara
- **Pembersihan** — `x env clean` menghapus paket yang tidak terpakai

## skill0 Ini Berkembang

Mulai dari yang paling dasar. Akan ditambahkan:
- Pola instalasi yang umum
- Tips penguncian versi
- Panduan setup proyek multibahasa

## Pengalaman Lengkap

`x env --help` untuk semua opsi setelah memasang x-cmd.

## Terkait

- [install](../install/SKILL.md) — x env use adalah salah satu kanal install
- [x-cmd](../x-cmd/SKILL.md) — titik masuk utama untuk env