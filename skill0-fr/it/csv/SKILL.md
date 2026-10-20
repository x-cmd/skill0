---
name: csv
description: |
  Traitement de données CSV — view, filter, convert, merge des données tabulaires.
  Zéro barrière — à utiliser avec x-cmd, Python, ou awk.
  À utiliser pour « csv », « data », « table », « spreadsheet », « conversion ».

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "csv,data,table,conversion,awk,tsv,json"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "tsv"
---


# csv — skill0

Traiter des données CSV : view, filter, convert, merge. Fonctionne avec toute source de données tabulaires.

## Démarrage rapide

```bash
# Avec x-cmd
x csv tab 1,3,6 < data.csv           # Afficher des colonnes spécifiques
x csv awk '{print $1, $3}' < data.csv # Traiter avec AWK
x csv tojson < data.csv               # Convertir en JSON
x csv merge2 id file2.csv < file1.csv # Merger par clé

# Sans x-cmd — utilisez Python
python3 -c "
import csv, json, sys
reader = csv.DictReader(sys.stdin)
for row in reader:
    print(row['name'], row['value'])
" < data.csv

# Ou utilisez Miller (mlr), xsv, csvkit
```

## Ce qui est disponible

- `x csv tab <cols>` — Afficher les colonnes sélectionnées
- `x csv awk '{...}'` — Traitement style AWK
- `x csv tojson` — Convertir en JSON
- `x csv tojsonl` — Convertir en JSON Lines
- `x csv totsv` — Convertir en TSV
- `x csv merge2` — Merger deux CSV par clé
- `x csv header` — Opérer sur les en-têtes
- `x csv app` — Viewer de table interactif

## Alternatives standalone

- Python : module `csv`, `pandas`
- CLI : `mlr` (Miller), `xsv`, `csvcut`, `csvgrep`
- AWK : `awk -F, '{print $1}'`

## Ce skill0 grandit

Commence avec l'essentiel. Ajoutera :
- Motifs CSV courants
- Recettes Python/awk
- Astuces de nettoyage de données

## Related

- [tsv](../tsv/SKILL.md) — outil sibling au format colonne (TSV)
