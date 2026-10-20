---
name: tsv
description: |
  Обработка TSV-данных — просмотр, фильтрация, преобразование данных с табуляцией в качестве разделителя.
  Нулевой порог входа — используйте с x-cmd, awk или Python.
  Применяйте для «tsv», «tab-separated», «data», «conversion».

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "tsv,data,tab,conversion,awk,csv"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "csv,ontology-database"
---


# tsv — skill0

Обработка данных TSV (Tab-Separated Values): просмотр, фильтрация, преобразование между форматами.

## Быстрый старт

```bash
# С x-cmd
x tsv < data.tsv                   # Отобразить TSV-данные
x tsv --csv < data.tsv             # Преобразовать в CSV
x tsv awk '{print $1, $3}' < data.tsv  # Обработка через AWK

# Без x-cmd — AWK изначально поддерживает TSV
awk -F'\t' '{print $1, $3}' data.tsv
# Преобразовать TSV в CSV
awk -F'\t' -v OFS=',' '{$1=$1; print}' data.tsv
# Фильтрация строк
awk -F'\t' '$3 > 100 {print}' data.tsv
```

## Что доступно

- `x tsv` — Отобразить TSV-данные
- `x tsv --csv` — Преобразовать в CSV
- `x tsv awk '{...}'` — Обработка в стиле AWK

## Автономные альтернативы

- AWK: `awk -F'\t' '{...}'` — встроенная поддержка TSV
- Python: модуль `csv` с `delimiter='\t'`
- Miller: `mlr --tsv cat data.tsv`

## Этот skill0 растёт

Начинаем с основ. Будет добавлено:
- Частые шаблоны TSV
- Рецепты преобразования TSV↔CSV
- Советы по работе со столбцами

## Связанное

- [csv](../csv/SKILL.md) — родственный инструмент столбцового формата (CSV)
- [ontology-database](../ontology-database/SKILL.md) — лог ondb хранится в TSV
