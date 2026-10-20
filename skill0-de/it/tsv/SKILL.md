---
name: tsv
description: |
  TSV-Datenverarbeitung — tabulatorgetrennte Daten ansehen, filtern, konvertieren.
  Null Hürde — mit x-cmd, awk oder Python verwenden.
  Für "tsv", "tabulatorgetrennt", "Daten", "Konvertierung".

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "tsv,data,tab,conversion,awk,csv"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "csv,ontology-database"
---


# tsv — skill0

TSV-Daten (Tab-Separated Values) verarbeiten: ansehen, filtern, zwischen Formaten konvertieren.

## Schnellstart

```bash
# Mit x-cmd
x tsv < data.tsv                   # TSV-Daten anzeigen
x tsv --csv < data.tsv             # In CSV konvertieren
x tsv awk '{print $1, $3}' < data.tsv  # Mit AWK verarbeiten

# Ohne x-cmd — AWK verarbeitet TSV nativ
awk -F'\t' '{print $1, $3}' data.tsv
# TSV in CSV konvertieren
awk -F'\t' -v OFS=',' '{$1=$1; print}' data.tsv
# Zeilen filtern
awk -F'\t' '$3 > 100 {print}' data.tsv
```

## Was verfügbar ist

- `x tsv` — TSV-Daten anzeigen
- `x tsv --csv` — in CSV konvertieren
- `x tsv awk '{...}'` — Verarbeitung im AWK-Stil

## Eigenständige Alternativen

- AWK: `awk -F'\t' '{...}'` — native TSV-Unterstützung
- Python: `csv`-Modul mit `delimiter='\t'`
- Miller: `mlr --tsv cat data.tsv`

## Dieses skill0 wächst

Startet mit dem Wesentlichen. Hinzu kommen:
- Häufige TSV-Muster
- TSV↔CSV-Konvertierungsrezepte
- Tipps zur Spaltenmanipulation

## Verwandt

- [csv](../csv/SKILL.md) — verwandtes Werkzeug für Spaltenformate (CSV)
- [ontology-database](../ontology-database/SKILL.md) — das ondb-Log ist TSV
