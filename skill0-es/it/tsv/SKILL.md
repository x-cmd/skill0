---
name: tsv
description: |
  Procesamiento de datos TSV — ver, filtrar, convertir datos separados por tabuladores.
  Sin barreras — úsalo con x-cmd, awk o Python.
  Úsalo para "tsv", "tab-separated", "data", "conversion".

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "tsv,data,tab,conversion,awk,csv"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "csv,ontology-database"
---


# tsv — skill0

Procesa datos TSV (Tab-Separated Values): ver, filtrar, convertir entre formatos.

## Inicio rápido

```bash
# Con x-cmd
x tsv < data.tsv                   # Mostrar datos TSV
x tsv --csv < data.tsv             # Convertir a CSV
x tsv awk '{print $1, $3}' < data.tsv  # Procesar con AWK

# Sin x-cmd — AWK maneja TSV de forma nativa
awk -F'	' '{print $1, $3}' data.tsv
# Convertir TSV a CSV
awk -F'	' -v OFS=',' '{$1=$1; print}' data.tsv
# Filtrar filas
awk -F'	' '$3 > 100 {print}' data.tsv
```

## Qué hay disponible

- `x tsv` — Mostrar datos TSV
- `x tsv --csv` — Convertir a CSV
- `x tsv awk '{...}'` — Procesado al estilo AWK

## Alternativas autónomas

- AWK: `awk -F'	' '{...}'` — soporte nativo de TSV
- Python: módulo `csv` con `delimiter='	'`
- Miller: `mlr --tsv cat data.tsv`

## Esta skill0 crece

Empezando por lo esencial. Se añadirá:
- Patrones comunes de TSV
- Recetas de conversión TSV↔CSV
- Consejos de manipulación de columnas

## Relacionadas

- [csv](../csv/SKILL.md) — herramienta hermana de formato columnar (CSV)
- [ontology-database](../ontology-database/SKILL.md) — el log de ondb es TSV
