---
name: tsv
description: |
  Zpracování dat ve formátu TSV — zobrazení, filtrování, konverze dat oddělených tabulátorem.
  Bez jakýchkoli překážek — použijte s x-cmd, awk nebo Pythonem.
  Použijte pro "tsv", "tab-separated", "data", "conversion".

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "tsv,data,tab,conversion,awk,csv"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "csv,ontology-database"
---


# tsv — skill0

Zpracování dat ve formátu TSV (Tab-Separated Values): zobrazení, filtrování, konverze mezi formáty.

## Rýchlý start

```bash
# S x-cmd
x tsv < data.tsv                   # Zobrazí data ve formátu TSV
x tsv --csv < data.tsv             # Převede na CSV
x tsv awk '{print $1, $3}' < data.tsv  # Zpracuje pomocí AWK

# Bez x-cmd — AWK zvládá TSV nativně
awk -F'\t' '{print $1, $3}' data.tsv
# Převod TSV na CSV
awk -F'\t' -v OFS=',' '{$1=$1; print}' data.tsv
# Filtrování řádků
awk -F'\t' '$3 > 100 {print}' data.tsv
```

## Co je k dispozici

- `x tsv` — Zobrazí data ve formátu TSV
- `x tsv --csv` — Převede na CSV
- `x tsv awk '{...}'` — Zpracování ve stylu AWK

## Samostatné alternativy

- AWK: `awk -F'\t' '{...}'` — nativní podpora TSV
- Python: modul `csv` s `delimiter='\t'`
- Miller: `mlr --tsv cat data.tsv`

## Tento skill0 poroste

Začínáme základními věcmi. Bude přidáno:
- Běžné TSV vzory
- Recepty na konverzi TSV↔CSV
- Tipy na práci se sloupci

## Související

- [csv](../csv/SKILL.md) — sibling nástroj pro sloupcové formáty (CSV)
- [ontology-database](../ontology-database/SKILL.md) — ondb log je ve formátu TSV
