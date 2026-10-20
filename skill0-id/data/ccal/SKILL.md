---
name: ccal
description: |
  Kalender untuk wilayah Tiongkok dengan hari kerja bergeser, kalender lunar, 24 istilah musim, zodiac, ramalan almanak, serta penanggalan Heavenly Stems/Earthly Branches.
  Beberapa mode akses: `x ccal`, unduhan arsip langsung, atau tsv.

metadata:
  version: "0.1.0"
  category: "calendar"
  tags: "calendar,lunar,chinese,solar-terms,holidays,almanac"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  x-cmd-mod: "ccal"
  datasource: "https://codeberg.org/x-cmd/ccal-data/releases/download/latest/ccal-data.tar.xz"
---

# ccal — skill0

Hari kerja bergeser — aturan bahwa akhir pekan bisa dipinjam untuk menjadikan hari kerja sebagai hari libur, atau dibalik menjadi hari kerja ketika hari libur jatuh pada akhir pekan — adalah fitur utama bagi pengguna Tiongkok yang merencanakan acara di sekitar kalender kerja resmi.

## Mulai Cepat dengan `x ccal`

```bash
# Tampilkan semua info tanggal dalam bentuk tsv. Kolom TSV sebagai berikut:
# Date   LunarDate   建除   WeekDay(周几)   Jieqi(节气)   Xiuxi(三个状态:休，工，无-非调休导致的假期或工作日)   Yi（宜）  Ji（忌）  Holiday
x ccal ls 2026
# Tampilkan semua info tanggal dalam bentuk tsv
x ccal ls 2026-07
# Tanggal tertentu dalam YAML
x ccal info 2026-05-31
# Ambil direktori data. Jika kosong, coba `x ccal update`
x ccal datadir
```

`x ccal -h` untuk informasi lebih lanjut.

Catatan: sumber datanya adalah https://codeberg.org/x-cmd/ccal-data/releases/download/latest/ccal-data.tar.xz

Untuk menghemat ruang, `x ccal` menjelajahi arsip tar.xz memakai perintah tar tanpa mengekstraknya. Kami mendorong metode ini, tetapi jika Anda membutuhkan pemrosesan yang lebih bebas, Anda boleh mengekstraknya sesuai kebutuhan.