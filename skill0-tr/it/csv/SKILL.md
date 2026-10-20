---
name: csv
description: |
  CSV veri işleme — görüntüle, filtrele, dönüştür, sekürel verileri birleştir.
  Sıfır engel — x-cmd, Python ya da awk ile kullan.
  "csv", "data", "table", "spreadsheet", "conversion" için kullan.

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "csv,data,table,conversion,awk,tsv,json"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "tsv"
---


# csv — skill0

CSV verilerini işle: görüntüle, filtrele, dönüştür, birleştir. Her türlü sekürel veri kaynağıyla çalışır.

## Hızlı Başlangıç

```bash
# x-cmd ile
x csv tab 1,3,6 < data.csv           # Belirli sütunları göster
x csv awk '{print $1, $3}' < data.csv # AWK ile işle
x csv tojson < data.csv               # JSON'a dönüştür
x csv merge2 id file2.csv < file1.csv # Anahtara göre birleştir

# x-cmd'siz — Python kullan
python3 -c "
import csv, json, sys
reader = csv.DictReader(sys.stdin)
for row in reader:
    print(row['name'], row['value'])
" < data.csv

# Ya da Miller (mlr), xsv, csvkit kullan
```

## Neler Var

- `x csv tab <sütunlar>` — Seçili sütunları göster
- `x csv awk '{...}'` — AWK tarzı işleme
- `x csv tojson` — JSON'a dönüştür
- `x csv tojsonl` — JSON Lines'a dönüştür
- `x csv totsv` — TSV'ye dönüştür
- `x csv merge2` — İki CSV'yi anahtara göre birleştir
- `x csv header` — Başlıklar üzerinde işlem yap
- `x csv app` — Etkileşimli tablo görüntüleyici

## Bağımsız Alternatifler

- Python: `csv` modülü, `pandas`
- CLI: `mlr` (Miller), `xsv`, `csvcut`, `csvgrep`
- AWK: `awk -F, '{print $1}'`

## Bu skill0 büyüyor

Temel olanlarla başlıyor. Eklenecekler:
- Yaygın CSV kalıpları
- Python/awk tarifleri
- Veri temizleme ipuçları

## İlgili

- [tsv](../tsv/SKILL.md) — kardeş sütunlu biçim aracı (TSV)