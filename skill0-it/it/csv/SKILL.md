---
name: csv
description: |
  Elaborazione dati CSV — visualizza, filtra, converti, unisci dati tabellari.
  Zero barriere — usala con x-cmd, Python o awk.
  Usala per "csv", "data", "table", "spreadsheet", "conversion".

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "csv,data,table,conversion,awk,tsv,json"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "tsv"
---


# csv — skill0

Elabora dati CSV: visualizza, filtra, converti, unisci. Funziona con qualsiasi sorgente di dati tabellari.

## Guida rapida

```bash
# Con x-cmd
x csv tab 1,3,6 < data.csv           # Mostra colonne specifiche
x csv awk '{print $1, $3}' < data.csv # Elabora con AWK
x csv tojson < data.csv               # Converti in JSON
x csv merge2 id file2.csv < file1.csv # Unisci per chiave

# Senza x-cmd — usa Python
python3 -c "
import csv, json, sys
reader = csv.DictReader(sys.stdin)
for row in reader:
    print(row['name'], row['value'])
" < data.csv

# Oppure usa Miller (mlr), xsv, csvkit
```

## Cosa c'è a disposizione

- `x csv tab <cols>` — Mostra le colonne selezionate
- `x csv awk '{...}'` — Elaborazione in stile AWK
- `x csv tojson` — Converti in JSON
- `x csv tojsonl` — Converti in JSON Lines
- `x csv totsv` — Converti in TSV
- `x csv merge2` — Unisci due CSV per chiave
- `x csv header` — Opera sulle intestazioni
- `x csv app` — Visualizzatore di tabelle interattivo

## Alternative standalone

- Python: modulo `csv`, `pandas`
- CLI: `mlr` (Miller), `xsv`, `csvcut`, `csvgrep`
- AWK: `awk -F, '{print $1}'`

## Questo skill0 cresce

Si parte dall'essenziale. Aggiungeremo:
- Schemi CSV comuni
- Ricette Python/awk
- Consigli sulla pulizia dei dati

## Related

- [tsv](../tsv/SKILL.md) — strumento fratello per un altro formato colonnare (TSV)