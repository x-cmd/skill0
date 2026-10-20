---
name: csv
description: |
  CSV-Datenverarbeitung — ansehen, filtern, konvertieren, tabellarische Daten zusammenführen.
  Null Hürde — mit x-cmd, Python oder awk verwenden.
  Für "csv", "Daten", "Tabelle", "Tabellekalkulation", "Konvertierung".

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "csv,data,table,conversion,awk,tsv,json"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "tsv"
---


# csv — skill0

CSV-Daten verarbeiten: ansehen, filtern, konvertieren, zusammenführen. Funktioniert mit jeder tabellarischen Datenquelle.

## Schnellstart

```bash
# Mit x-cmd
x csv tab 1,3,6 < data.csv           # Bestimmte Spalten anzeigen
x csv awk '{print $1, $3}' < data.csv # Mit AWK verarbeiten
x csv tojson < data.csv               # In JSON konvertieren
x csv merge2 id file2.csv < file1.csv # Nach Schlüssel zusammenführen

# Ohne x-cmd — Python verwenden
python3 -c "
import csv, json, sys
reader = csv.DictReader(sys.stdin)
for row in reader:
    print(row['name'], row['value'])
" < data.csv

# Oder Miller (mlr), xsv, csvkit verwenden
```

## Was verfügbar ist

- `x csv tab <cols>` — ausgewählte Spalten anzeigen
- `x csv awk '{...}'` — Verarbeitung im AWK-Stil
- `x csv tojson` — in JSON konvertieren
- `x csv tojsonl` — in JSON Lines konvertieren
- `x csv totsv` — in TSV konvertieren
- `x csv merge2` — zwei CSVs nach Schlüssel zusammenführen
- `x csv header` — mit Kopfzeilen arbeiten
- `x csv app` — interaktiver Tabellenbetrachter

## Eigenständige Alternativen

- Python: `csv`-Modul, `pandas`
- CLI: `mlr` (Miller), `xsv`, `csvcut`, `csvgrep`
- AWK: `awk -F, '{print $1}'`

## Dieses skill0 wächst

Startet mit dem Wesentlichen. Hinzu kommen:
- Häufige CSV-Muster
- Python-/awk-Rezepte
- Tipps zur Datenbereinigung

## Verwandt

- [tsv](../tsv/SKILL.md) — verwandtes Werkzeug für Spaltenformate (TSV)
