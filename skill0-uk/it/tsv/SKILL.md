---
name: tsv
description: |
  Обробка даних TSV — перегляд, фільтрація, конвертація даних із табуляцією як роздільником.
  Нульовий бар'єр — працює з x-cmd, awk або Python.
  Використовувати для "tsv", "tab-separated", "data", "conversion".

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "tsv,data,tab,conversion,awk,csv"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "csv,ontology-database"
---


# tsv — skill0

Обробляйте дані TSV (Tab-Separated Values): переглядайте, фільтруйте, конвертуйте між форматами.

## Швидкий старт

```bash
# З x-cmd
x tsv < data.tsv                   # Показати дані TSV
x tsv --csv < data.tsv             # Конвертувати у CSV
x tsv awk '{print $1, $3}' < data.tsv  # Обробити через AWK

# Без x-cmd — AWK підтримує TSV нативно
awk -F'\t' '{print $1, $3}' data.tsv
# Конвертувати TSV у CSV
awk -F'\t' -v OFS=',' '{$1=$1; print}' data.tsv
# Фільтрувати рядки
awk -F'\t' '$3 > 100 {print}' data.tsv
```

## Доступні команди

- `x tsv` — показати дані TSV
- `x tsv --csv` — конвертувати у CSV
- `x tsv awk '{...}'` — обробка у стилі AWK

## Окремі альтернативи

- AWK: `awk -F'\t' '{...}'` — нативна підтримка TSV
- Python: модуль `csv` з `delimiter='\t'`
- Miller: `mlr --tsv cat data.tsv`

## Цей skill0 ще зростає

Починаємо з основного. Далі додамо:
- типові шаблони для TSV
- рецепти конвертації TSV↔CSV
- поради з маніпуляцією стовпцями

## Related

- [csv](../csv/SKILL.md) — «сестринський» інструмент для табличних форматів (CSV)
- [ontology-database](../ontology-database/SKILL.md) — журнал ondb має формат TSV