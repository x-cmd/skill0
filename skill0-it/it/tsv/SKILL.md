---
name: tsv
description: |
  Elaborazione dati TSV — visualizza, filtra, converti dati separati da tabulazione.
  Zero barriere — usala con x-cmd, awk o Python.
  Usala per "tsv", "tab-separated", "data", "conversion".

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "tsv,data,tab,conversion,awk,csv"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "csv,ontology-database"
---


# tsv — skill0

Elabora dati TSV (Tab-Separated Values): visualizza, filtra, converti tra formati.

## Guida rapida

```bash
# Con x-cmd
x tsv < data.tsv                   # Mostra i dati TSV
x tsv --csv < data.tsv             # Converti in CSV
x tsv awk '{print $1, $3}' < data.tsv  # Elabora con AWK

# Senza x-cmd — AWK gestisce nativamente il TSV
awk -F'\t' '{print $1, $3}' data.tsv
# Converti TSV in CSV
awk -F'\t' -v OFS=',' '{$1=$1; print}' data.tsv
# Filtra le righe
awk -F'\t' '$3 > 100 {print}' data.tsv
```

## Cosa c'è a disposizione

- `x tsv` — Mostra i dati TSV
- `x tsv --csv` — Converti in CSV
- `x tsv awk '{...}'` — Elaborazione in stile AWK

## Alternative standalone

- AWK: `awk -F'\t' '{...}'` — supporto TSV nativo
- Python: modulo `csv` con `delimiter='\t'`
- Miller: `mlr --tsv cat data.tsv`

## Questo skill0 cresce

Si parte dall'essenziale. Aggiungeremo:
- Schemi TSV comuni
- Ricette di conversione TSV↔CSV
- Consigli sulla manipolazione delle colonne

## Related

- [csv](../csv/SKILL.md) — strumento fratello per un altro formato colonnare (CSV)
- [ontology-database](../ontology-database/SKILL.md) — il log di ondb è TSV