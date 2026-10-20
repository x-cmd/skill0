---
name: ccal
description: |
  Китайский региональный календарь с 调休, лунным календарём, 节气, 生肖, 黄历吉凶, системой 干支.
  Несколько способов доступа: `x ccal`, прямой скачивание архива или tsv.

metadata:
  version: "0.1.0"
  category: "calendar"
  tags: "calendar,lunar,chinese,solar-terms,holidays,almanac"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  x-cmd-mod: "ccal"
  datasource: "https://codeberg.org/x-cmd/ccal-data/releases/download/latest/ccal-data.tar.xz"
---

# ccal — skill0

调休 — правило, согласно которому выходные могут «одалживаться» для создания буднего выходного, либо будний день возвращается, когда праздник выпадает на выходной, — это ключевая особенность для китайских пользователей, планирующих свой график вокруг официального рабочего календаря.

## Быстрый старт с `x ccal`

```bash
# Показать всю информацию о датах в формате tsv. Столбцы TSV:
# Date   LunarDate   建除   WeekDay(周几)   Jieqi(节气)   Xiuxi(三个状态:休，工，无-非调休导致的假期或工作日)   Yi（宜）  Ji（忌）  Holiday
x ccal ls 2026
# Показать всю информацию о датах в формате tsv
x ccal ls 2026-07
# Конкретная дата в YAML
x ccal info 2026-05-31
# Получить каталог данных. Если он пуст, попробуйте `x ccal update`
x ccal datadir
```

`x ccal -h` для дополнительной информации.

Внимание: источник данных — https://codeberg.org/x-cmd/ccal-data/releases/download/latest/ccal-data.tar.xz

Для экономии места `x ccal` читает tar.xz с помощью команды tar без распаковки. Мы поощряем такой подход, но при необходимости более свободной обработки вы можете распаковать архив по запросу.
