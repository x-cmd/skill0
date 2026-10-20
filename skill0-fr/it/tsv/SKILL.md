---
name: tsv
description: |
  Traitement de données TSV — view, filter, convert des données tab-separated.
  Zéro barrière — à utiliser avec x-cmd, awk, ou Python.
  À utiliser pour « tsv », « tab-separated », « data », « conversion ».

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "tsv,data,tab,conversion,awk,csv"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "csv,ontology-database"
---


# tsv — skill0

Traiter des données TSV (Tab-Separated Values) : view, filter, convert entre formats.

## Démarrage rapide

```bash
# Avec x-cmd
x tsv < data.tsv                   # Afficher des données TSV
x tsv --csv < data.tsv             # Convertir en CSV
x tsv awk '{print $1, $3}' < data.tsv  # Traiter avec AWK

# Sans x-cmd — AWK gère le TSV nativement
awk -F'\t' '{print $1, $3}' data.tsv
# Convertir TSV en CSV
awk -F'\t' -v OFS=',' '{$1=$1; print}' data.tsv
# Filtrer les lignes
awk -F'\t' '$3 > 100 {print}' data.tsv
```

## Ce qui est disponible

- `x tsv` — Afficher des données TSV
- `x tsv --csv` — Convertir en CSV
- `x tsv awk '{...}'` — Traitement style AWK

## Alternatives standalone

- AWK : `awk -F'\t' '{...}'` — support TSV natif
- Python : module `csv` avec `delimiter='\t'`
- Miller : `mlr --tsv cat data.tsv`

## Ce skill0 grandit

Commence avec l'essentiel. Ajoutera :
- Motifs TSV courants
- Recettes de conversion TSV↔CSV
- Astuces de manipulation de colonnes

## Related

- [csv](../csv/SKILL.md) — outil sibling au format colonne (CSV)
- [ontology-database](../ontology-database/SKILL.md) — le journal ondb est en TSV
