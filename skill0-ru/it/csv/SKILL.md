---
name: csv
description: |
  Обработка CSV-данных — просмотр, фильтрация, преобразование, объединение табличных данных.
  Нулевой порог входа — используйте с x-cmd, Python или awk.
  Применяйте для «csv», «data», «table», «spreadsheet», «conversion».

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "csv,data,table,conversion,awk,tsv,json"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "tsv"
---


# csv — skill0

Обработка CSV-данных: просмотр, фильтрация, преобразование, объединение. Работает с любым табличным источником данных.

## Быстрый старт

```bash
# С x-cmd
x csv tab 1,3,6 < data.csv           # Показать указанные столбцы
x csv awk '{print $1, $3}' < data.csv # Обработка через AWK
x csv tojson < data.csv               # Преобразовать в JSON
x csv merge2 id file2.csv < file1.csv # Слить по ключу

# Без x-cmd — используйте Python
python3 -c "
import csv, json, sys
reader = csv.DictReader(sys.stdin)
for row in reader:
    print(row['name'], row['value'])
" < data.csv

# Или используйте Miller (mlr), xsv, csvkit
```

## Что доступно

- `x csv tab <cols>` — Показать выбранные столбцы
- `x csv awk '{...}'` — Обработка в стиле AWK
- `x csv tojson` — Преобразовать в JSON
- `x csv tojsonl` — Преобразовать в JSON Lines
- `x csv totsv` — Преобразовать в TSV
- `x csv merge2` — Слить два CSV по ключу
- `x csv header` — Операции над заголовками
- `x csv app` — Интерактивный просмотрщик таблиц

## Автономные альтернативы

- Python: модуль `csv`, `pandas`
- CLI: `mlr` (Miller), `xsv`, `csvcut`, `csvgrep`
- AWK: `awk -F, '{print $1}'`

## Этот skill0 растёт

Начинаем с основ. Будет добавлено:
- Частые шаблоны CSV
- Рецепты Python/awk
- Советы по очистке данных

## Связанное

- [tsv](../tsv/SKILL.md) — родственный инструмент столбцового формата (TSV)
