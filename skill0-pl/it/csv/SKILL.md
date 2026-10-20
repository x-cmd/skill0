---
name: csv
description: |
  Przetwarzanie danych CSV — podgląd, filtrowanie, konwersja, scalanie danych tabelarycznych.
  Bez barier — użyj z x-cmd, Pythonem lub awk.
  Użyj dla "csv", "data", "table", "spreadsheet", "conversion".

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "csv,data,table,conversion,awk,tsv,json"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "tsv"
---


# csv — skill0

Przetwarzaj dane CSV: oglądaj, filtruj, konwertuj, scalaj. Działa z dowolnym źródłem danych tabelarycznych.

## Szybki start

```bash
# Z x-cmd
x csv tab 1,3,6 < data.csv           # Pokaż wybrane kolumny
x csv awk '{print $1, $3}' < data.csv # Przetwórz za pomocą AWK
x csv tojson < data.csv               # Konwertuj na JSON
x csv merge2 id file2.csv < file1.csv # Scal według klucza

# Bez x-cmd — użyj Pythona
python3 -c "
import csv, json, sys
reader = csv.DictReader(sys.stdin)
for row in reader:
    print(row['name'], row['value'])
" < data.csv

# Albo użyj Millera (mlr), xsv, csvkit
```

## Co jest dostępne

- `x csv tab <cols>` — wyświetl wybrane kolumny
- `x csv awk '{...}'` — przetwarzanie w stylu AWK
- `x csv tojson` — konwertuj na JSON
- `x csv tojsonl` — konwertuj na JSON Lines
- `x csv totsv` — konwertuj na TSV
- `x csv merge2` — scal dwa pliki CSV według klucza
- `x csv header` — operuj na nagłówkach
- `x csv app` — interaktywna przeglądarka tabel

## Alternatywy samodzielne

- Python: moduł `csv`, `pandas`
- CLI: `mlr` (Miller), `xsv`, `csvcut`, `csvgrep`
- AWK: `awk -F, '{print $1}'`

## Ta umiejętność skill0 rośnie

Zaczyna od podstaw. Planowane dodatki:
- Typowe wzorce CSV
- Receptury w Pythonie i awk
- Wskazówki do czyszczenia danych

## Powiązane

- [tsv](../tsv/SKILL.md) — siostrzane narzędzie do formatu kolumnowego (TSV)