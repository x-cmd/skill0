---
name: ontology-database
description: Типизированный граф знаний на основе append-only TSV-журнала — CRUD сущностей, направленные отношения, валидация схемы, многошаговые запросы. CLI через `x ondb`, протокол читается AWK/Python/JS/SQLite.
metadata:
  related: "yfm,rule"
---


# Ontology Database (ondb)

Типизированный граф знаний: всё является **сущностью** (id + type + свойства), соединённой **направленными отношениями** (from → rel → to). Все мутации дописывают строки в TSV — никогда не перезаписывают. TSV-журнал И ЕСТЬ база данных.

## Формат TSV-журнала (протокол)

```
add     <type>  <id>  <epoch_ms>  key1  val1  key2  val2       # создать сущность
set     <id>  <epoch_ms>  key  val                             # обновить свойство
rm      <id>  <epoch_ms>                                       # удалить сущность
link    <from>  <rel>  <to>  <epoch_ms>  [key1  val1 ...]      # создать отношение
unlink  <from>  <rel>  <to>  <epoch_ms>                        # удалить отношение
# разделитель — табуляция; экранирование: \t → таб, \n → перенос строки, \\ → обратный слэш
# свойства — чередующиеся пары key/val (каждая пара — отдельное поле через таб)
```

Читается любым языком. AWK обрабатывает потоково, Python — словарями, SQLite материализует. **Журнал — источник истины.**

## Использование CLI

```
x ondb add --type Person --name Alice                            # UUID генерируется автоматически
x ondb add --type Task --name "Fix bug" --id t1 priority=high status=open
x ondb get --id t1 --json                                       # подробности сущности
x ondb set --id t1 status=done                                  # обновить свойство
x ondb rm --id t1                                               # удалить

x ondb link --from proj_001 --rel has_task --to t1              # создать отношение
x ondb link --from t1 --rel blocks --to t2                      # со свойствами связи: -- status=hard
x ondb linked --id proj_001 --rel has_task                      # исходящие отношения
x ondb linked --id t1 --direction incoming                      # входящие (кто ссылается на сущность)
x ondb related --id proj_001 --rel has_task --json              # полные сведения о сущности на другом конце

x ondb ls --type Task                                           # список по типу
x ondb query --type Task --where status=open --json             # фильтр по свойствам
```

`linked` — метаданные отношения. `related` — полная сущность на другом конце. Каталог данных задаётся `--dir <path>` / `-d <path>` (→ `path/ondb.tsv`).

## Схема и валидация

```
x ondb schema add "type:Task:required:title,status"
x ondb schema add "type:Task:enum:status:open,in_progress,done,blocked"
x ondb schema add "relation:blocks:from_types:Task"
x ondb schema add "relation:blocks:acyclic:1"
x ondb validate                          # проверяет required, enum, висячие ссылки, кардинальность, циклы
```

Директивы: `type:Name:{required|forbidden|enum|datetime|ref}:...`, `relation:Rel:{from_types|to_types|cardinality|acyclic}:...`. Валидация отделена от записи.

## Архитектурные принципы

- **Журнал — источник** — TSV-журнал авторитетен; SQLite лишь материализованное представление
- **Append-only** — `set`, `rm`, `unlink` дописывают строки; существующие строки не изменяются
- **Несколько экземпляров** — отдельный ondb на каждый поддомен (по умолчанию); объединяйте только для меж доменных связей
- **Type = Concept** — одноимённый type всегда означает одно и то же понятие
- **Валидация по требованию** — проверка схемы при записи не выполняется; запускайте `validate` после пакетных правок

## Бэкенды

| Бэкенд | Когда | |
|---|---|---|
| **AWK** (по умолчанию) | < 2k сущностей | нулевые зависимости, потоковая обработка |
| Python | среднее | богатые структуры данных |
| JS/Bun | веб-приложения | нативный JSON |
| SQLite | > 5k сущностей | автоматически генерируется из TSV-журнала |

## Структура каталога

```
<datadir>/ONDB.DESC.txt    # обязательно. Идентифицирует экземпляр ondb
<datadir>/ondb.tsv         # Append-only журнал
<datadir>/schema.tsv       # необязательно. Ограничения
<datadir>/ondb.db          # необязательно. Материализованное представление SQLite
```

## Дополнительные сведения

- `x ondb --help` — справка по CLI
- `x ondb libpath {awk,py,js}` — пути к библиотекам для пользовательских запросов
- [ondb SKILL.md](../../../ondb/SKILL.md) — полная документация (сценарии, интеграции, пользовательские запросы, конфигурация SQLite WAL)

## Связанное

- [yfm](../yfm/SKILL.md) — `metadata:` из yfm — рекомендуемая фасадная плоскость для записи
- [rule](../rule/SKILL.md) — правила валидации схемы живут во фреймворке rule
