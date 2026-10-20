---
name: csv
description: |
  Procesamiento de datos CSV — ver, filtrar, convertir, fusionar datos tabulares.
  Sin barreras — úsalo con x-cmd, Python o awk.
  Úsalo para "csv", "data", "table", "spreadsheet", "conversion".

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "csv,data,table,conversion,awk,tsv,json"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "tsv"
---


# csv — skill0

Procesa datos CSV: ver, filtrar, convertir, fusionar. Funciona con cualquier fuente de datos tabulares.

## Inicio rápido

```bash
# Con x-cmd
x csv tab 1,3,6 < data.csv           # Mostrar columnas concretas
x csv awk '{print $1, $3}' < data.csv # Procesar con AWK
x csv tojson < data.csv               # Convertir a JSON
x csv merge2 id file2.csv < file1.csv # Fusionar por clave

# Sin x-cmd — usa Python
python3 -c "
import csv, json, sys
reader = csv.DictReader(sys.stdin)
for row in reader:
    print(row['name'], row['value'])
" < data.csv

# O usa Miller (mlr), xsv, csvkit
```

## Qué hay disponible

- `x csv tab <cols>` — Mostrar las columnas seleccionadas
- `x csv awk '{...}'` — Procesado al estilo AWK
- `x csv tojson` — Convertir a JSON
- `x csv tojsonl` — Convertir a JSON Lines
- `x csv totsv` — Convertir a TSV
- `x csv merge2` — Fusionar dos CSV por clave
- `x csv header` — Operar sobre las cabeceras
- `x csv app` — Visor de tablas interactivo

## Alternativas autónomas

- Python: módulo `csv`, `pandas`
- CLI: `mlr` (Miller), `xsv`, `csvcut`, `csvgrep`
- AWK: `awk -F, '{print $1}'`

## Esta skill0 crece

Empezando por lo esencial. Se añadirá:
- Patrones comunes de CSV
- Recetas de Python/awk
- Consejos de limpieza de datos

## Relacionadas

- [tsv](../tsv/SKILL.md) — herramienta hermana de formato columnar (TSV)
