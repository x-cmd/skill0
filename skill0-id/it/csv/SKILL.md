---
name: csv
description: |
  Pemrosesan data CSV — lihat, filter, konversi, gabungkan data tabel.
  Tanpa hambatan — pakai dengan x-cmd, Python, atau awk.
  Gunakan untuk "csv", "data", "tabel", "spreadsheet", "konversi".

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "csv,data,table,conversion,awk,tsv,json"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "tsv"
---


# csv — skill0

Proses data CSV: lihat, filter, konversi, gabungkan. Cocok untuk sumber data tabel apa pun.

## Mulai Cepat

```bash
# Dengan x-cmd
x csv tab 1,3,6 < data.csv           # Tampilkan kolom tertentu
x csv awk '{print $1, $3}' < data.csv # Proses dengan AWK
x csv tojson < data.csv               # Konversi ke JSON
x csv merge2 id file2.csv < file1.csv # Gabungkan berdasarkan kunci

# Tanpa x-cmd — pakai Python
python3 -c "
import csv, json, sys
reader = csv.DictReader(sys.stdin)
for row in reader:
    print(row['name'], row['value'])
" < data.csv

# Atau pakai Miller (mlr), xsv, csvkit
```

## Yang Tersedia

- `x csv tab <cols>` — Tampilkan kolom yang dipilih
- `x csv awk '{...}'` — Pemrosesan bergaya AWK
- `x csv tojson` — Konversi ke JSON
- `x csv tojsonl` — Konversi ke JSON Lines
- `x csv totsv` — Konversi ke TSV
- `x csv merge2` — Gabungkan dua CSV berdasarkan kunci
- `x csv header` — Bekerja pada header
- `x csv app` — Penampil tabel interaktif

## Alternatif Mandiri

- Python: modul `csv`, `pandas`
- CLI: `mlr` (Miller), `xsv`, `csvcut`, `csvgrep`
- AWK: `awk -F, '{print $1}'`

## skill0 Ini Berkembang

Mulai dari yang paling dasar. Akan ditambahkan:
- Pola CSV yang umum
- Resep Python/awk
- Tips pembersihan data

## Terkait

- [tsv](../tsv/SKILL.md) — tool format kolom sekelasnya (TSV)