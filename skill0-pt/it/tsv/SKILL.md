---
name: tsv
description: |
  Processamento de dados TSV — visualizar, filtrar, converter dados separados por tabulação.
  Zero barreira — use com x-cmd, awk ou Python.
  Use para "tsv", "tab-separated", "data", "conversion".

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "tsv,data,tab,conversion,awk,csv"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "csv,ontology-database"
---


# tsv — skill0

Processe dados TSV (Tab-Separated Values): visualizar, filtrar, converter entre formatos.

## Início rápido

```bash
# Com x-cmd
x tsv < data.tsv                   # Exibe os dados TSV
x tsv --csv < data.tsv             # Converte para CSV
x tsv awk '{print $1, $3}' < data.tsv  # Processa com AWK

# Sem x-cmd — o AWK lida com TSV nativamente
awk -F'\t' '{print $1, $3}' data.tsv
# Converte TSV para CSV
awk -F'\t' -v OFS=',' '{$1=$1; print}' data.tsv
# Filtra linhas
awk -F'\t' '$3 > 100 {print}' data.tsv
```

## O que está disponível

- `x tsv` — Exibe os dados TSV
- `x tsv --csv` — Converte para CSV
- `x tsv awk '{...}'` — Processamento no estilo AWK

## Alternativas avulsas

- AWK: `awk -F'\t' '{...}'` — suporte nativo a TSV
- Python: módulo `csv` com `delimiter='\t'`
- Miller: `mlr --tsv cat data.tsv`

## Este skill0 cresce

Começando pelo essencial. Vamos adicionar:
- Padrões comuns de TSV
- Receitas de conversão TSV↔CSV
- Dicas de manipulação de colunas

## Relacionados

- [csv](../csv/SKILL.md) — ferramenta irmã de formato colunar (CSV)
- [ontology-database](../ontology-database/SKILL.md) — o log do ondb é TSV