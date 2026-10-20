---
name: yfm
description: |
  YAML front matter (YFM) pro libovolný markdown článek. Výchozí podoba x-cmd má tři polí na nejvyšší úrovni: `tags`, `description`, `memo`. Výchozí podoba si půjčuje tvar frontmatteru Agent Skills — viz <https://agentskills.io/specification>. Modul yfm je pomocník: `x yfm ls / init / lint`.

metadata:
  related: "skill0-writer,ontology-database"
---


# yfm — skill0

## Používejte YFM

Používejte YFM pro každý markdown, který může prohledávat agent, index nebo ontologická pipeline. **Řiďte se již používaným dialektem, pokud nějaký už v repu je** (Agent Skills, Obsidian, Jekyll, Hugo atd.) — výchozí podoba x-cmd platí jen tehdy, když není vládnoucí žádný jiný dialekt.

## Výchozí podoba x-cmd: tři pole

```yaml
---
tags: [design, front-matter]
description: Jednosentencové shrnutí, podle kterého čtenář rozhodne, zda tento soubor otevře.
memo:
  2026-07-31T14:30:00+08:00: Omezeno aliasy; třetí pole přejmenováno na memo.
---

# Title

Body...
```

- **`tags`** — seznam slugů na nejvyšší úrovni `[a-z0-9-]`. Spotřebitel: collector pro ontologické indexování.
- **`description`** — řetězec na nejvyšší úrovni. Jedna věta. Ne to `description:` ze specifikace Agent Skills (to je požadavek pouze pro SKILL.md, spravuje ho `skill0-writer`).
- **`memo:`** — mapa na nejvyšší úrovni, revizní log souboru. Klíče jsou časová razítka ISO 8601 (`YYYY-MM-DDTHH:mm:ss±HH:mm`, místní posun autora); hodnoty jsou krátké popisy změn. Nejnovější nahoře. Vynechte, pokud není co zaznamenat.

### Oblast použití

- `<project>/.x-cmd/story/` — rozšiřuje o `issue:` — viz [usecase/story.md](usecase/story.md).
- Těla GitHub issue / PR — rozšiřuje o `repo:`, `number:` — viz [usecase/git-issue-pr-wiki-markdown-etc.md](usecase/git-issue-pr-wiki-markdown-etc.md).
- GitHub `README.md` — pouze výchozí pole.

## Modul

Modul yfm je pomocník. Tři příkazy:

- `x yfm ls [path]` — vypíše YFM bloky; výchozí je aktuální adresář
- `x yfm init [path]` — zapíše blok ve výchozí podobě x-cmd do každého markdown souboru pod danou cestou
- `x yfm lint [path]` — ověří, že každý YFM blok je platné YAML a řídí se dialektem, který deklaruje

## Čtení cizího front matter

Collector přijímá mnoho dialektů. Ohledně specifikace, ze které výchozí podoba čerpá, viz <https://agentskills.io/specification>. Po jednotlivých dialektech:

- [Agent Skills](usecase/agentskills.md) — `metadata:` je řetězec→řetězec; nejvyšší úroveň je uzavřená
- [Obsidian](usecase/obsidian.md) — `tags` / `aliases` / `cssclasses` jsou rezervované
- [Jekyll](usecase/jekyll.md) — seznam nebo oddělení **mezerou**
- [Hugo](usecase/hugo.md) — možný TOML; taxonomie nastavená webu
