---
name: cve
description: |
  Cari catatan CVE lewat x cve — di-cache, tanpa API key, TSV xz harian.
  Muat untuk cve, id kerentanan, kev, epss, nvd, cvelist, atau advisory keamanan.

metadata:
  version: "0.1.0"
  category: "security"
  tags: "cve,vulnerability,nvd,kev,epss,cvelist"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  x-cmd-mod: "cve"
  datasource: "https://github.com/x-cmd/cve/releases/download/data/"
  upstream: "https://github.com/CVEProject/cvelistV5"
---

# cve — skill0

TSV terkompresi xz per tahun; tahun berjalan dan tahun sebelumnya disegarkan otomatis (TTL 1 jam), sedangkan tahun yang lebih lama tetap beku selama 180 hari. Setelah hari pertama secara online, `x cve` tetap berfungsi offline tanpa batas waktu.

## Mulai Cepat dengan `x cve`

```bash
x cve info CVE-2024-0001      # cari berdasarkan id (singkat: x cve 2024-0001)
x cve year 2024               # stream per tahun, TSV ramah pipeline
x cve detail CVE-2024-0001    # catatan upstream lengkap (produk, CWE, referensi, ADP)
```

`x cve -h` untuk semua flag, subcommand, dan bentuk singkat.

## Data dan alat terkait

TSV xz harian diterbitkan di `github.com/x-cmd/cve/releases/download/data/` (skema terdokumentasi di halaman rilis). Catatan yang di-cache hanyalah proyeksi tipis — untuk pertanyaan yang melangkah satu tingkat lebih jauh:

- `x shodan cve CVE-X` — skor EPSS, keanggotaan KEV, artikel eksploitasi, advisory vendor
- `x kev ls` — katalog CISA KEV (daftar yang sudah dieksploitasi, tabel lengkap)
- `x osv` — kueri tingkat versi per paket ("apakah versi saya rentan"); menerima id `osv-*` dan `cve-*`
- `x cve detail` — JSON mentah `CVEProject/cvelistV5` (upstream kanonik, diambil sesuai permintaan)