---
name: tsv
description: |
  TSV veri işleme — görüntüle, filtrele, sekmeyle ayrılmış veriyi dönüştür.
  Sıfır engel — x-cmd, awk ya da Python ile kullan.
  "tsv", "tab-separated", "data", "conversion" için kullan.

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "tsv,data,tab,conversion,awk,csv"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "csv,ontology-database"
---


# tsv — skill0

TSV (Sekmeyle Ayrılmış Değerler) verilerini işle: görüntüle, filtrele, biçimler arasında dönüştür.

## Hızlı Başlangıç

```bash
# x-cmd ile
x tsv < data.tsv                   # TSV verisini göster
x tsv --csv < data.tsv             # CSV'ye dönüştür
x tsv awk '{print $1, $3}' < data.tsv  # AWK ile işle

# x-cmd'siz — AWK TSV'yi yerel olarak işler
awk -F'\t' '{print $1, $3}' data.tsv
# TSV'yi CSV'ye dönüştür
awk -F'\t' -v OFS=',' '{$1=$1; print}' data.tsv
# Satırları filtrele
awk -F'\t' '$3 > 100 {print}' data.tsv
```

## Neler Var

- `x tsv` — TSV verisini göster
- `x tsv --csv` — CSV'ye dönüştür
- `x tsv awk '{...}'` — AWK tarzı işleme

## Bağımsız Alternatifler

- AWK: `awk -F'\t' '{...}'` — yerel TSV desteği
- Python: `delimiter='\t'` ile `csv` modülü
- Miller: `mlr --tsv cat data.tsv`

## Bu skill0 büyüyor

Temel olanlarla başlıyor. Eklenecekler:
- Yaygın TSV kalıpları
- TSV↔CSV dönüştürme tarifleri
- Sütun manipülasyonu ipuçları

## İlgili

- [csv](../csv/SKILL.md) — kardeş sütunlu biçim aracı (CSV)
- [ontology-database](../ontology-database/SKILL.md) — ondb günlüğü TSV'dir