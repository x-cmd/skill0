---
name: yfm
description: |
  YAML front matter (YFM) для любой markdown-статьи. По умолчанию x-cmd использует три поля верхнего
  уровня: `tags`, `description`, `memo`. Дефолт заимствует форму frontmatter из Agent Skills — см.
  <https://agentskills.io/specification>. Модуль yfm — вспомогательный: `x yfm ls / init / lint`.

metadata:
  related: "skill0-writer,ontology-database"
---


# yfm — skill0

## Применяй YFM

Используй YFM для любого markdown, который может просканировать агент, индекс или онтологический конвейер. **Соблюдай уже используемый диалект, если он есть** (Agent Skills, Obsidian, Jekyll, Hugo и т. д.) — дефолт x-cmd действует только когда никакого другого диалекта не задано.

## Дефолт x-cmd: три поля

```yaml
---
tags: [design, front-matter]
description: Одно предложение-резюме, по которому читатель решает, открывать ли этот файл.
memo:
  2026-07-31T14:30:00+08:00: Убраны aliases; третье поле переименовано в memo.
---

# Заголовок

Body...
```

- **`tags`** — список слагов верхнего уровня `[a-z0-9-]`. Потребитель: сборщик для онтологической индексации.
- **`description`** — строка верхнего уровня. Одно предложение. Это не поле `description:` из Agent Skills (оно требуется только в SKILL.md и регулируется `skill0-writer`).
- **`memo:`** — словарь верхнего уровня, журнал изменений файла. Ключи — метки времени ISO 8601 (`YYYY-MM-DDTHH:mm:ss±HH:mm`, локальное смещение автора); значения — краткие описания изменений. Сначала новые. Не указывай, если историю не стоит фиксировать.

### Область применения

- `<project>/.x-cmd/story/` — расширяется полем `issue:` — см. [usecase/story.md](usecase/story.md).
- Тела GitHub issue / PR — расширяются полями `repo:`, `number:` — см. [usecase/git-issue-pr-wiki-markdown-etc.md](usecase/git-issue-pr-wiki-markdown-etc.md).
- GitHub `README.md` — только поля по умолчанию.

## Модуль

Модуль yfm вспомогательный. Три команды:

- `x yfm ls [path]` — перечислить блоки YFM; по умолчанию текущий каталог
- `x yfm init [path]` — записать блок с дефолтом x-cmd в каждый markdown-файл под путём
- `x yfm lint [path]` — проверить, что каждый блок YFM — валидный YAML и соответствует заявленному диалекту

## Чтение чужого front matter

Сборщик принимает много разных диалектов. Спецификацию, из которой взят дефолт, смотри на <https://agentskills.io/specification>. По диалектам:

- [Agent Skills](usecase/agentskills.md) — `metadata:` это string→string; верхний уровень закрыт
- [Obsidian](usecase/obsidian.md) — `tags` / `aliases` / `cssclasses` зарезервированы
- [Jekyll](usecase/jekyll.md) — список или **пробел**-разделённый
- [Hugo](usecase/hugo.md) — возможен TOML; таксономия задаётся конфигом сайта