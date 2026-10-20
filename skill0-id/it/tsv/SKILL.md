---
name: tsv
description: |
  Pemrosesan data TSV — lihat, filter, konversi data yang dipisah tab.
  Tanpa hambatan — pakai dengan x-cmd, awk, atau Python.
  Gunakan untuk "tsv", "tab-separated", "data", "konversi".

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "tsv,data,tab,conversion,awk,csv"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "csv,ontology-database"
---


# tsv — skill0

Proses data TSV (Tab-Separated Values): lihat, filter, konversi antar format.

## Mulai Cepat

```bash
# Dengan x-cmd
x tsv < data.tsv                   # Tampilkan data TSV
x tsv --csv < data.tsv             # Konversi ke CSV
x tsv awk '{print $1, $3}' < data.tsv  # Proses dengan AWK

# Tanpa x-cmd — AWK menangani TSV secara bawaan
awk -F'\t' '{print $1, $3}' data.tsv
# Konversi TSV ke CSV
awk -F'\t' -v OFS=',' '{$1=$1; print}' data.tsv
# Filter baris
awk -F'\t' '$3 > 100 {print}' data.tsv
```

## Yang Tersedia

- `x tsv` — Tampilkan data TSV
- `x tsv --csv` — Konversi ke CSV
- `x tsv awk '{...}'` — Pemrosesan bergaya AWK

## Alternatif Mandiri

- AWK: `awk -F'\t' '{...}'` — dukungan TSV bawaan
- Python: modul `csv` dengan `delimiter='\t'`
- Miller: `mlr --tsv cat data.tsv`

## skill0 Ini Berkembang

Mulai dari yang paling dasar. Akan ditambahkan:
- Pola TSV yang umum
- Resep konversi TSV↔CSV
- Tips pengolahan kolom

## Terkait

- [csv](../csv/SKILL.md) — tool format kolom sekelasnya (CSV)
- [ontology-database](../ontology-database/SKILL.md) — log ondb berupa TSV