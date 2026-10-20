---
name: ontology-database
description: Типізований граф знань на основі TSV-логу з додаванням записів — CRUD сутностей, спрямовані зв'язки, валідація схем, багатопрохідне міркування. CLI через `x ondb`, протокол читається з AWK/Python/JS/SQLite.
metadata:
  related: "yfm,rule"
---


# Ontology Database (ondb)

Типізований граф знань: усе є **entity** (id + type + properties), з'єднаними **спрямованими зв'язками** (from → rel → to). Усі зміни додають рядки TSV — ніколи не перезаписують. TSV-лог І Є базою даних.

## Формат TSV-логу (протокол)

```
add     <type>  <id>  <epoch_ms>  key1  val1  key2  val2       # створити entity
set     <id>  <epoch_ms>  key  val                             # оновити властивість
rm      <id>  <epoch_ms>                                       # видалити entity
link    <from>  <rel>  <to>  <epoch_ms>  [key1  val1 ...]     # створити зв'язок
unlink  <from>  <rel>  <to>  <epoch_ms>                        # видалити зв'язок
# розділено табами; екранування: \t → tab, \n → newline, \\ → backslash
# properties — це парні key/val, що чергуються (кожна пара займає окреме поле tab)
```

Це читає будь-яка мова. AWK читає потоково, Python — словниками, SQLite матеріалізує. **Лог є джерелом істини.**

## Використання CLI

```
x ondb add --type Person --name Alice                            # автоматичний UUID
x ondb add --type Task --name "Fix bug" --id t1 priority=high status=open
x ondb get --id t1 --json                                       # деталі entity
x ondb set --id t1 status=done                                  # оновити властивість
x ondb rm --id t1                                               # видалити

x ondb link --from proj_001 --rel has_task --to t1              # створити зв'язок
x ondb link --from t1 --rel blocks --to t2                      # з link-властивостями: -- status=hard
x ondb linked --id proj_001 --rel has_task                      # вихідні зв'язки
x ondb linked --id t1 --direction incoming                      # вхідні (хто вказує НА нього)
x ondb related --id proj_001 --rel has_task --json              # повна entity з іншого боку

x ondb ls --type Task                                           # список за типом
x ondb query --type Task --where status=open --json             # фільтр за властивостями
```

`linked` = метадані зв'язку. `related` = повна entity з іншого боку. Скористайтеся `--dir <path>` / `-d <path>`, щоб вказати каталог даних (→ `path/ondb.tsv`).

## Схема та валідація

```
x ondb schema add "type:Task:required:title,status"
x ondb schema add "type:Task:enum:status:open,in_progress,done,blocked"
x ondb schema add "relation:blocks:from_types:Task"
x ondb schema add "relation:blocks:acyclic:1"
x ondb validate                          # перевіряє required, enum, висячі посилання, cardinality, цикли
```

Директиви: `type:Name:{required|forbidden|enum|datetime|ref}:...`, `relation:Rel:{from_types|to_types|cardinality|acyclic}:...`. Валідація відокремлена від запису.

## Принципи архітектури

- **Лог — це джерело** — TSV-лог авторитетний; SQLite лише матеріалізований подання
- **Лише додавання** — `set`, `rm`, `unlink` додають рядки; наявні рядки ніколи не змінюються
- **Кілька екземплярів** — по одному ondb на піддомен (типово); об'єднуйте лише для крос-доменних ланцюжків
- **Type = Concept** — те саме ім'я type завжди означає те саме поняття
- **Валідація на вимогу** — під час запису перевірки схеми немає; запускайте `validate` після пакетних змін

## Бекенди

| Бекенд | Коли | |
|---|---|---|
| **AWK** (типово) | < 2k сутностей | нуль залежностей, потокова обробка |
| Python | середній обсяг | багаті структури даних |
| JS/Bun | вебзастосунки | нативний JSON |
| SQLite | > 5k сутностей | автоматично генерується з TSV-логу |

## Структура каталогу

```
<datadir>/ONDB.DESC.txt    # Обов'язково. Ідентифікує екземпляр ondb
<datadir>/ondb.tsv         # Лог лише для додавання
<datadir>/schema.tsv       # Необов'язково. Обмеження
<datadir>/ondb.db          # Необов'язково. Матеріалізоване подання SQLite
```

## Детальніше

- `x ondb --help` — довідник CLI
- `x ondb libpath {awk,py,js}` — шляхи до бібліотек для власних запитів
- [ondb SKILL.md](../../../ondb/SKILL.md) — повна документація (сценарії, інтеграція, власні запити, налаштування SQLite WAL)

## Related

- [yfm](../yfm/SKILL.md) — `metadata:` у yfm є рекомендованою поверхнею для завантаження
- [rule](../rule/SKILL.md) — правила валідації схеми живуть у фреймворку rule