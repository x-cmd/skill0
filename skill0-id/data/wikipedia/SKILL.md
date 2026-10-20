---
name: wikipedia
description: |
  Cari dan baca Wikipedia lewat x wkp — MediaWiki API, tanpa API key,
  tanpa perlu instalasi; kueri, ekstrak, suggest, dan rute DDG dalam satu modul.
  Muat untuk wiki, wikipedia, mencari entri Ensiklopedia, ringkasan artikel.

metadata:
  version: "0.1.0"
  category: "reference"
  tags: "wikipedia,wiki,encyclopedia,reference,lookup"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  x-cmd-mod: "wkp"
  upstream: "https://en.wikipedia.org/w/api.php"
---

# wikipedia — skill0

Keluaran berupa ekstrak teks biasa (sekitar paragraf pertama + infobox). Kata kerja pada subcommand menentukan bentuk hasilnya — `hop` untuk cari-lalu-ringkas, `extract` untuk judul yang sudah dikenal, `search` untuk kandidat, `suggest` untuk saran koreksi. Situs bawaan adalah Wikipedia bahasa Inggris; `--lang` / `--api-url` mengalihkan ke wiki lain.

## Mulai Cepat dengan `x wkp`

```bash
x wkp hop Python                      # cari + ekstrak hasil pertama sekaligus
x wkp extract OpenAI                  # ringkasan halaman yang sudah dikenal
x wkp search "Linux kernel"           # daftar kandidat saat judulnya belum pasti
x wkp suggest pythen                  # saran koreksi sebelum melakukan pencarian
```

`x wkp -h` untuk semua flag dan subcommand.

## Data dan alat terkait

Upstream: `https://en.wikipedia.org/w/api.php` — MediaWiki action API. Proyek saudara (Wikidata, Wiktionary, Commons) bisa diakses dengan cara yang sama; arahkan `--api-url` ke subdomain yang sesuai.

Untuk pertanyaan yang melangkah satu tingkat lebih jauh daripada ringkasan wikitext:
- `x wkp : <query>` / `x wkp ddgo <query>` — modul `x wkp` yang sama, dialihkan lewat indeks Wikipedia milik DuckDuckGo (menangani kueri yang ambigu atau bahasa sehari-hari lebih baik daripada pencarian judul)
- `x ddgo <query>` — pencarian web umum, berguna saat Wikipedia tidak punya artikel tapi topik tersebut ada di web terbuka
- Lihat skill [knowledge](../knowledge/SKILL.md) untuk perangkat riset yang lebih luas: `x hn` / `x rfc` / `x se`
- `x wkp open <page>` — kembali ke browser saat Anda benar-benar membutuhkan halaman yang sudah dirender (infobox, tabel, gambar)