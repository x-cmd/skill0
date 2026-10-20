---
name: csv
description: |
  Zpracování dat ve formátu CSV — zobrazení, filtrování, konverze, sloučení tabulkových dat.
  Bez jakýchkoli překážek — použijte s x-cmd, Pythonem nebo awk.
  Použijte pro "csv", "data", "table", "spreadsheet", "conversion".

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "csv,data,table,conversion,awk,tsv,json"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "tsv"
---


# csv — skill0

Zpracování dat ve formátu CSV: zobrazení, filtrování, konverze, sloučení. Funguje s jakýmkoli zdrojem tabulkových dat.

## Rychlý start

```bash
# S x-cmd
x csv tab 1,3,6 < data.csv           # Zobrazí vybrané sloupce
x csv awk '{print $1, $3}' < data.csv # Zpracuje pomocí AWK
x csv tojson < data.csv               # Převede na JSON
x csv merge2 id file2.csv < file1.csv # Sloučí podle klíče

# Bez x-cmd — použijte Python
python3 -c "
import csv, json, sys
reader = csv.DictReader(sys.stdin)
for row in reader:
    print(row['name'], row['value'])
" < data.csv

# Nebo použijte Miller (mlr), xsv, csvkit
```

## Co je k dispozici

- `x csv tab <cols>` — Zobrazí vybrané sloupce
- `x csv awk '{...}'` — Zpracování ve stylu AWK
- `x csv tojson` — Převede na JSON
- `x csv tojsonl` — Převede na JSON Lines
- `x csv totsv` — Převede na TSV
- `x csv merge2` — Sloučí dva CSV podle klíče
- `x csv header` — Práce se záhlavími
- `x csv app` — Interaktivní prohlížeč tabulek

## Samostatné alternativy

- Python: modul `csv`, `pandas`
- CLI: `mlr` (Miller), `xsv`, `csvcut`, `csvgrep`
- AWK: `awk -F, '{print $1}'`

## Tento skill0 poroste

Začínáme základními věcmi. Bude přidáno:
- Běžné CSV vzory
- Recepty v Pythonu/awk
- Tipy na čištění dat

## Související

- [tsv](../tsv/SKILL.md) — sibling nástroj pro sloupcové formáty (TSV)
