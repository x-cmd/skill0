---
name: tsv
description: |
  Przetwarzanie danych TSV — podgląd, filtrowanie, konwersja danych rozdzielonych tabulatorami.
  Bez barier — użyj z x-cmd, awk lub Pythonem.
  Użyj dla "tsv", "tab-separated", "data", "conversion".

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "tsv,data,tab,conversion,awk,csv"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "csv,ontology-database"
---


# tsv — skill0

Przetwarzaj dane TSV (Tab-Separated Values): oglądaj, filtruj, konwertuj między formatami.

## Szybki start

```bash
# Z x-cmd
x tsv < data.tsv                   # Wyświetl dane TSV
x tsv --csv < data.tsv             # Konwertuj na CSV
x tsv awk '{print $1, $3}' < data.tsv  # Przetwórz za pomocą AWK

# Bez x-cmd — AWK obsługuje TSV natywnie
awk -F'\t' '{print $1, $3}' data.tsv
# Konwertuj TSV na CSV
awk -F'\t' -v OFS=',' '{$1=$1; print}' data.tsv
# Filtruj wiersze
awk -F'\t' '$3 > 100 {print}' data.tsv
```

## Co jest dostępne

- `x tsv` — wyświetl dane TSV
- `x tsv --csv` — konwertuj na CSV
- `x tsv awk '{...}'` — przetwarzanie w stylu AWK

## Alternatywy samodzielne

- AWK: `awk -F'\t' '{...}'` — natywna obsługa TSV
- Python: moduł `csv` z `delimiter='\t'`
- Miller: `mlr --tsv cat data.tsv`

## Ta umiejętność skill0 rośnie

Zaczyna od podstaw. Planowane dodatki:
- Typowe wzorce TSV
- Receptury na konwersję TSV↔CSV
- Wskazówki do manipulacji kolumnami

## Powiązane

- [csv](../csv/SKILL.md) — siostrzane narzędzie do formatu kolumnowego (CSV)
- [ontology-database](../ontology-database/SKILL.md) — log ondb jest w formacie TSV