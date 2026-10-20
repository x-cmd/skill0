---
name: csv
description: |
  Обробка даних CSV — перегляд, фільтрація, конвертація, об'єднання табличних даних.
  Нульовий поріг входу — використовуйте з x-cmd, Python або awk.
  Для "csv", "data", "table", "spreadsheet", "conversion".

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "csv,data,table,conversion,awk,tsv,json"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "tsv"
---


# csv — skill0

Обробляйте дані CSV: переглядайте, фільтруйте, конвертуйте, об'єднуйте. Працює з будь-яким джерелом табличних даних.

## Швидкий старт

```bash
# З x-cmd
x csv tab 1,3,6 < data.csv           # Показати конкретні стовпці
x csv awk '{print $1, $3}' < data.csv # Обробити через AWK
x csv tojson < data.csv               # Конвертувати в JSON
x csv merge2 id file2.csv < file1.csv # Об'єднати за ключем

# Без x-cmd — використайте Python
python3 -c "
import csv, json, sys
reader = csv.DictReader(sys.stdin)
for row in reader:
    print(row['name'], row['value'])
" < data.csv

# Або скористайтеся Miller (mlr), xsv, csvkit
```

## Що доступно

- `x csv tab <cols>` — показати вибрані стовпці
- `x csv awk '{...}'` — обробка в стилі AWK
- `x csv tojson` — конвертувати в JSON
- `x csv tojsonl` — конвертувати в JSON Lines
- `x csv totsv` — конвертувати в TSV
- `x csv merge2` — об'єднати два CSV за ключем
- `x csv header` — операції над заголовком
- `x csv app` — інтерактивний переглядач таблиць

## Окремі альтернативи

- Python: модуль `csv`, `pandas`
- CLI: `mlr` (Miller), `xsv`, `csvcut`, `csvgrep`
- AWK: `awk -F, '{print $1}'`

## Цей skill0 ще росте

Починаємо з основ. Додамо:
- Поширені CSV-патерни
- Рецепти на Python/awk
- Поради з очищення даних

## Related

- [tsv](../tsv/SKILL.md) — сестринський інструмент для колонкового формату (TSV)
