---
name: tsv
description: |
  Procesarea datelor TSV — vizualizează, filtrează, convertește date separate prin tab.
  Fără bariere — folosește cu x-cmd, awk sau Python.
  Folosește pentru "tsv", "tab-separated", "data", "conversion".

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "tsv,data,tab,conversion,awk,csv"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "csv,ontology-database"
---


# tsv — skill0

Procesează date TSV (Tab-Separated Values): vizualizează, filtrează, convertește între formate.

## Quick Start

```bash
# With x-cmd
x tsv < data.tsv                   # Display TSV data
x tsv --csv < data.tsv             # Convert to CSV
x tsv awk '{print $1, $3}' < data.tsv  # Process with AWK

# Without x-cmd — AWK handles TSV natively
awk -F'\t' '{print $1, $3}' data.tsv
# Convert TSV to CSV
awk -F'\t' -v OFS=',' '{$1=$1; print}' data.tsv
# Filter rows
awk -F'\t' '$3 > 100 {print}' data.tsv
```

## Ce e disponibil

- `x tsv` — Afișează datele TSV
- `x tsv --csv` — Convertește în CSV
- `x tsv awk '{...}'` — Procesare în stil AWK

## Alternative standalone

- AWK: `awk -F'\t' '{...}'` — suport nativ pentru TSV
- Python: modulul `csv` cu `delimiter='\t'`
- Miller: `mlr --tsv cat data.tsv`

## Acest skill0 crește

Pornim de la esențial. Vom adăuga:
- Tipare uzuale pentru TSV
- Rețete de conversie TSV↔CSV
- Sfaturi de manipulare a coloanelor

## Related

- [csv](../csv/SKILL.md) — unealta frate în format columnar (CSV)
- [ontology-database](../ontology-database/SKILL.md) — log-ul ondb e TSV