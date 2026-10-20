---
name: yfm
description: |
  YAML front matter (YFM) для будь-якої статті markdown. Типове налаштування x-cmd — це три поля верхнього рівня: `tags`, `description`, `memo`. За замовчуванням тут запозичено форму frontmatter з Agent Skills — див. <https://agentskills.io/specification>. Модуль yfm є помічником: `x yfm ls / init / lint`.

metadata:
  related: "skill0-writer,ontology-database"
---


# yfm — skill0

## Застосовуйте YFM

Використовуйте YFM для будь-якого markdown, який може сканувати agent, індекс чи ontology pipeline. **Якщо вже використовується якийсь діалект — дотримуйтесь його** (Agent Skills, Obsidian, Jekyll, Hugo тощо) — типове налаштування x-cmd діє лише тоді, коли жоден інший діалект не має сили.

## Типове налаштування x-cmd: три поля

```yaml
---
tags: [design, front-matter]
description: Одне речення-резюме, за яким читач вирішує, чи варто відкривати цей файл.
memo:
  2026-07-31T14:30:00+08:00: Прибрано aliases; третє поле перейменовано на memo.
---

# Заголовок

Текст...
```

- **`tags`** — перелік slug верхнього рівня `[a-z0-9-]`. Споживач: collector для онтологічного індексування.
- **`description`** — рядок верхнього рівня. Одне речення. Це не `description:` з Agent Skills (воно стосується лише SKILL.md і регулюється `skill0-writer`).
- **`memo:`** — map верхнього рівня, журнал ревізій файлу. Ключі — мітки часу ISO 8601 (`YYYY-MM-DDTHH:mm:ss±HH:mm`, локальне зміщення автора); значення — короткі описи змін. Новіші спершу. Пропускайте, коли історію немає сенсу фіксувати.

### Де застосовується

- `<project>/.x-cmd/story/` — розширюється полем `issue:` — див. [usecase/story.md](usecase/story.md).
- Тіло GitHub issue / PR — розширюється полями `repo:`, `number:` — див. [usecase/git-issue-pr-wiki-markdown-etc.md](usecase/git-issue-pr-wiki-markdown-etc.md).
- GitHub `README.md` — лише типові поля.

## Модуль

Модуль yfm є помічником. Три команди:

- `x yfm ls [path]` — перелік YFM блоків; за замовчуванням поточний каталог
- `x yfm init [path]` — записати типовий для x-cmd блок у кожен markdown-файл у каталозі
- `x yfm lint [path]` — перевірити, що кожен YFM блок є коректним YAML і дотримується задекларованого діалекту

## Читання стороннього front matter

Collector поглинає різні діалекти. Специфікацію, з якої за замовчуванням запозичено, див. <https://agentskills.io/specification>. По діалектах:

- [Agent Skills](usecase/agentskills.md) — `metadata:` типу string→string; верхній рівень закритий
- [Obsidian](usecase/obsidian.md) — `tags` / `aliases` / `cssclasses` зарезервовані
- [Jekyll](usecase/jekyll.md) — перелік або розділення **пробілом**
- [Hugo](usecase/hugo.md) — можливий TOML; таксономія налаштовується сайтом