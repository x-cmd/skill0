---
name: csv
description: |
  Procesarea datelor CSV — vizualizează, filtrează, convertește, unește date tabulare.
  Fără bariere — folosește cu x-cmd, Python sau awk.
  Folosește pentru "csv", "data", "table", "spreadsheet", "conversion".

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "csv,data,table,conversion,awk,tsv,json"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "tsv"
---


# csv — skill0

Procesează date CSV: vizualizează, filtrează, convertește, unește. Funcționează cu orice sursă de date tabulare.

## Quick Start

```bash
# With x-cmd
x csv tab 1,3,6 < data.csv           # Show specific columns
x csv awk '{print $1, $3}' < data.csv # Process with AWK
x csv tojson < data.csv               # Convert to JSON
x csv merge2 id file2.csv < file1.csv # Merge by key

# Without x-cmd — use Python
python3 -c "
import csv, json, sys
reader = csv.DictReader(sys.stdin)
for row in reader:
    print(row['name'], row['value'])
" < data.csv

# Or use Miller (mlr), xsv, csvkit
```

## Ce e disponibil

- `x csv tab <cols>` — Afișează coloanele selectate
- `x csv awk '{...}'` — Procesare în stil AWK
- `x csv tojson` — Convertește în JSON
- `x csv tojsonl` — Convertește în JSON Lines
- `x csv totsv` — Convertește în TSV
- `x csv merge2` — Unește două CSV-uri după cheie
- `x csv header` — Operații pe anteturi
- `x csv app` — Vizualizator interactiv de tabel

## Alternative standalone

- Python: modulul `csv`, `pandas`
- CLI: `mlr` (Miller), `xsv`, `csvcut`, `csvgrep`
- AWK: `awk -F, '{print $1}'`

## Acest skill0 crește

Pornim de la esențial. Vom adăuga:
- Tipare uzuale pentru CSV
- Rețete Python/awk
- Sfaturi de curățare a datelor

## Related

- [tsv](../tsv/SKILL.md) — unealta frate în format columnar (TSV)