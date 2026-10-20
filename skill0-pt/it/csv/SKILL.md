---
name: csv
description: |
  Processamento de dados CSV — visualizar, filtrar, converter, mesclar dados tabulares.
  Zero barreira — use com x-cmd, Python ou awk.
  Use para "csv", "data", "table", "spreadsheet", "conversion".

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "csv,data,table,conversion,awk,tsv,json"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "tsv"
---


# csv — skill0

Processe dados CSV: visualizar, filtrar, converter, mesclar. Funciona com qualquer fonte de dados tabular.

## Início rápido

```bash
# Com x-cmd
x csv tab 1,3,6 < data.csv           # Mostra colunas específicas
x csv awk '{print $1, $3}' < data.csv # Processa com AWK
x csv tojson < data.csv               # Converte para JSON
x csv merge2 id file2.csv < file1.csv # Mescla por chave

# Sem x-cmd — use Python
python3 -c "
import csv, json, sys
reader = csv.DictReader(sys.stdin)
for row in reader:
    print(row['name'], row['value'])
" < data.csv

# Ou use Miller (mlr), xsv, csvkit
```

## O que está disponível

- `x csv tab <cols>` — Exibe as colunas selecionadas
- `x csv awk '{...}'` — Processamento no estilo AWK
- `x csv tojson` — Converte para JSON
- `x csv tojsonl` — Converte para JSON Lines
- `x csv totsv` — Converte para TSV
- `x csv merge2` — Mescla dois CSVs por chave
- `x csv header` — Opera sobre os cabeçalhos
- `x csv app` — Visualizador de tabela interativo

## Alternativas avulsas

- Python: módulo `csv`, `pandas`
- CLI: `mlr` (Miller), `xsv`, `csvcut`, `csvgrep`
- AWK: `awk -F, '{print $1}'`

## Este skill0 cresce

Começando pelo essencial. Vamos adicionar:
- Padrões comuns de CSV
- Receitas de Python/awk
- Dicas de limpeza de dados

## Relacionados

- [tsv](../tsv/SKILL.md) — ferramenta irmã de formato colunar (TSV)